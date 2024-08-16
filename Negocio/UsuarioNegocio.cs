using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Negocio;
using Dominio;
using Acceso_Datos;
using System.Security.Cryptography.X509Certificates;
using WebGrease.Css.Ast;

namespace Negocio
{
    public class UsuarioNegocio
    {
        public int nuevoUsuario(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into USERS (email, pass, nombre, apellido) output inserted.Id values (@email, @pass, @nombre, @apellido)");
                datos.SetearParametros("@email", usuario.Email);
                datos.SetearParametros("@pass", usuario.Pass);
                datos.SetearParametros("@nombre", usuario.Nombre);
                datos.SetearParametros("@apellido", usuario.Apellido);                
                return datos.EjecutarAccionScalar();
            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }
        public bool Loguin(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("Select id, email, urlImagenPerfil, pass, admin, nombre, apellido from USERS Where  email=@email AND  pass=@pass");
                datos.SetearParametros("@email", usuario.Email);
                datos.SetearParametros("@pass", usuario.Pass);                
                datos.EjecutarLectura();
                if (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["id"];
                    usuario.Admin = (bool)datos.Lector["admin"];
                    usuario.Nombre = datos.Lector["nombre"].ToString();
                    usuario.Apellido = datos.Lector["apellido"].ToString();
                    usuario.Pass = datos.Lector["pass"].ToString();
                    if (!(datos.Lector["urlImagenPerfil"] is DBNull))
                    usuario.UrlImagenPerfil=(string)datos.Lector["urlImagenPerfil"];
                    return true;
                }
                return false;
            }

            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }

        }

        public void Actualizar(Usuario usuario)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                
                datos.SetearConsulta("Update USERS set urlImagenPerfil= @imagen, nombre= @nombre, apellido= @apellido, pass=@pass Where Id= @id");
                datos.SetearParametros("@imagen",(object) usuario.UrlImagenPerfil ?? DBNull.Value);
                datos.SetearParametros("@nombre", usuario.Nombre );
                datos.SetearParametros("@apellido", usuario.Apellido);
                datos.SetearParametros("@pass", usuario.Pass);
                datos.SetearParametros("@id", usuario.Id);
                datos.EjecutarAccion();

            }
            catch (Exception ex)
            {

                throw ex;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void EliminarUsuario(int Id)
        {
            AccesoDatos datos = new AccesoDatos();
            datos.SetearConsulta("delete from USERS where id = @id");
            datos.SetearParametros("@id", Id);
            datos.EjecutarAccion();
        }
    }

}

