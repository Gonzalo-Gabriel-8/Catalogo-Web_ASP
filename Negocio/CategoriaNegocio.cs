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
        public List<Categoria> listaCategoria()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Categoria> categorias = new List<Categoria>();
            try
            {
                datos.SetearConsulta("select id, descripcion from CATEGORIAS");
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Categoria categoria = new Categoria();
                    categoria.Id = (int)datos.Lector["id"];
                    categoria.Descripcion = (string)datos.Lector["descripcion"];
                    categorias.Add(categoria);
                }
                return categorias;
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
