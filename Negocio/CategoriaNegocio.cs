using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Acceso_Datos;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> listaCategoria(string id = "")
        {
            AccesoDatos datos = new AccesoDatos();
            List<Categoria> categoria = new List<Categoria>();
            try
            {
                string consulta = "Select Id, Descripcion FROM CATEGORIAS ";

                if (id != "")
                {
                    consulta += "WHERE Id = @Id";
                    datos.SetearConsulta(consulta);
                    datos.SetearParametros("@Id", id);
                }
                else
                {
                    datos.SetearConsulta(consulta);
                }
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Categoria categorias = new Categoria();
                    categorias.Id = (int)datos.Lector["id"];
                    categorias.Descripcion = (string)datos.Lector["descripcion"];
                    categoria.Add(categorias);
                }
                return categoria;
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


        public void AgregarCategoria(Categoria nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into CATEGORIAS (Descripcion) values (@Descripcion)");
                datos.SetearParametros("@Descripcion", nuevo.Descripcion);
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

        public void ModificarMarca(Categoria modificado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("update CATEGORIAS set Descripcion= @descripcion where Id= @Id");
                datos.SetearParametros("@descripcion", modificado.Descripcion);
                datos.SetearParametros("@id", modificado.Id);
                datos.EjecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                datos.CerrarConexion();
            }
        }

        public void EliminarCategoria(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.SetearConsulta("delete from CATEGORIAS where id = @id");
                datos.SetearParametros("@id", id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}
