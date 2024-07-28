using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Acceso_Datos;
using System.Data.SqlClient;
using System.Collections;
using System.Xml.Linq;

namespace Negocio
{
    public class ArticuloNegocio
    {

        public List<Articulo> ListaArticulo()
        {
            AccesoDatos datos = new AccesoDatos();
            List<Articulo> lista = new List<Articulo>();
            try
            {
                datos.SetearConsulta(datos.leerConsulta());
                datos.EjecutarLectura();
                while (datos.Lector.Read())
                {
                    Articulo articulo = new Articulo();
                    articulo.Id = (int)datos.Lector["id"];
                    articulo.Codigo = (string)datos.Lector["codigo"];
                    articulo.Nombre = (string)datos.Lector["nombre"];
                    articulo.Descripcion = (string)datos.Lector["descripcion"];
                    articulo.marca = new Marca();
                    articulo.marca.Descripcion = (string)datos.Lector["Marca"];
                    articulo.categoria = new Categoria();
                    articulo.categoria.Descripcion = (string)datos.Lector["Categoria"];
                    articulo.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    articulo.Precio = (decimal)datos.Lector["Precio"];

                    lista.Add(articulo);
                }
                return lista;
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


        public void AgregarArticulo(Articulo nuevo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta(datos.Agregar());
                datos.SetearParametros("@Codigo", nuevo.Codigo);
                datos.SetearParametros("@Nombre", nuevo.Nombre);
                datos.SetearParametros("@Descripcion", nuevo.Descripcion);
                datos.SetearParametros("@IdMarca", nuevo.marca.Id);
                datos.SetearParametros("@IdCategoria", nuevo.categoria.Id);
                datos.SetearParametros("@ImagenUrl", nuevo.ImagenUrl);
                datos.SetearParametros("@Precio", nuevo.Precio);
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
        public void ModificarArticulo(Articulo mod)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta(datos.Modificar());
                datos.SetearParametros("@cod", mod.Codigo);
                datos.SetearParametros("@nombre", mod.Nombre);
                datos.SetearParametros("@descripcion", mod.Descripcion);
                datos.SetearParametros("@IdMarca", mod.marca.Id);
                datos.SetearParametros("IdCategoria", mod.categoria.Id);
                datos.SetearParametros("@imagenUrl", mod.ImagenUrl);
                datos.SetearParametros("@precio", mod.Precio);
                datos.SetearParametros("@Id", mod.Id);
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
        public void EliminarArticulo(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.SetearConsulta("delete from ARTICULOS where id = @id");
                datos.SetearParametros("@id", id);
                datos.EjecutarAccion();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        /*___________________________________________________________________________________________________________________________*/
        public List<Articulo> listar(string id = "")
        {
            List<Articulo> lista = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();

            try
            {
                string consulta = datos.leerConsulta();
                if (id != "")
                {
                    consulta += " and A.Id = @Id";
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
                    Articulo articulo = new Articulo();
                    articulo.Id = (int)datos.Lector["Id"];
                    articulo.Codigo = (string)datos.Lector["Codigo"];
                    articulo.Nombre = (string)datos.Lector["Nombre"];
                    articulo.Descripcion = (string)datos.Lector["Descripcion"];
                    articulo.marca = new Marca();
                    articulo.marca.Descripcion = (string)datos.Lector["Marca"];
                    articulo.categoria = new Categoria();
                    articulo.categoria.Descripcion = (string)datos.Lector["Categoria"];
                    articulo.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    articulo.Precio = (decimal)datos.Lector["Precio"];

                    lista.Add(articulo);
                }

                return lista;
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
