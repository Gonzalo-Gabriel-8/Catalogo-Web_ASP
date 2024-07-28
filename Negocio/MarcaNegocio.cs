using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Acceso_Datos;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> listaMarca()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Marca> marcas = new List<Marca>();
            try
            {
                datos.SetearConsulta("select id, descripcion from MARCAS");
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Marca marca = new Marca();
                    marca.Id = (int)datos.Lector["id"];
                    marca.Descripcion = (string)datos.Lector["descripcion"];
                    marcas.Add(marca);
                }
                return marcas;
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
        public void AgregarMarca(Marca nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into MARCAS values (@Descripcion)");
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
    }
}
