using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Acceso_Datos;
using Dominio;


namespace Negocio
{
    public class FavoritoNegocio
    {
        public void InsertarFavoritos(int IdUsuario, int IdArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("insert into FAVORITOS (IdArticulo, IdUser) values (@IdArticulo, @IdUsuario)");
                datos.SetearParametros("@IdUsuario", IdUsuario);
                datos.SetearParametros("@IdArticulo", IdArticulo);
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

        public void EliminarFavorito(int idUsuario, int idArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("DELETE FROM favoritos WHERE idUser = @idUsuario AND idArticulo = @idArticulo");
                datos.SetearParametros("@idUsuario", idUsuario);
                datos.SetearParametros("@idArticulo", idArticulo);
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

        public List<Articulo> Listado(int idUsuario)
        {
            List<Articulo> listaFavoritos = new List<Articulo>();
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("SELECT a.Id, a.nombre, a.precio, a.descripcion, a.ImagenUrl FROM favoritos f INNER JOIN articulos a ON f.idArticulo = a.id WHERE f.IdUser = @idUsuario");
                datos.SetearParametros("@idUsuario", idUsuario);
                datos.EjecutarLectura();

                while (datos.Lector.Read())
                {
                    Articulo articulo = new Articulo();
                    articulo.Id = (int)datos.Lector["Id"];
                    articulo.Nombre = (string)datos.Lector["nombre"];
                    articulo.Precio = (decimal)datos.Lector["Precio"];
                    articulo.Descripcion = (string)datos.Lector["Descripcion"];
                    articulo.ImagenUrl = (string)datos.Lector["ImagenUrl"];
                    listaFavoritos.Add(articulo);
                }  
                return listaFavoritos;
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

        public bool ConsultarFavoritos(int IdUsuario, int IdArticulo)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("SELECT COUNT(*) FROM favoritos WHERE idUser = @idUsuario AND idArticulo = @idArticulo");
                datos.SetearParametros("@idUsuario", IdUsuario);
                datos.SetearParametros("@idArticulo", IdArticulo);
                datos.EjecutarLectura();
                if (datos.Lector.Read() && (int)datos.Lector[0] > 0)
                {
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
    }
}

