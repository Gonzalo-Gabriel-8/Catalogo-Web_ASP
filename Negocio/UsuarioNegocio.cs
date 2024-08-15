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
                datos.SetearConsulta("insert into USERS (email, pass) output inserted.Id values (@email, @pass)");
                datos.SetearParametros("@email", usuario.Email);
                datos.SetearParametros("@pass", usuario.Pass);
                //datos.SetearParametros("@nombre", usuario.Nombre);
                //datos.SetearParametros("@apellido", usuario.Apellido);
                //datos.SetearParametros("@urlImagenPerfil", usuario.UrlImagenPerfil);
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
                datos.SetearConsulta("Select id, email, urlImagenPerfil, pass, admin from USERS Where  email=@email AND  pass=@pass");
                datos.SetearParametros("@email", usuario.Email);
                datos.SetearParametros("@pass", usuario.Pass);                
                datos.EjecutarLectura();
                if (datos.Lector.Read())
                {
                    usuario.Id = (int)datos.Lector["id"];
                    usuario.Admin = (bool)datos.Lector["admin"];
                    if (!(datos.Lector["urlImagenPerfil"] is DBNull));
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
                
                datos.SetearConsulta("Update USERS set urlImagenPerfil = @imagen, nombre= @nombre, apellido=@apellido Where Id= @id");
                datos.SetearParametros("@imagen", usuario.UrlImagenPerfil);
                datos.SetearParametros("@nombre", usuario.Nombre );
                datos.SetearParametros("@apellido", usuario.Apellido);
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
    }

}

