using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Acceso_Datos
{
    public class AccesoDatos
    {
        private SqlConnection conexion;
        private SqlCommand comando;
        private SqlDataReader lector;

        public SqlDataReader Lector
        {
            get { return lector; }
        }

        public AccesoDatos()
        {
            conexion = new SqlConnection("server=DESKTOP-A95RF6B; database=CATALOGO_WEB_DB; integrated security=true");
            comando = new SqlCommand();
        }


        public void SetearConsulta(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }


        public void EjecutarLectura()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                lector = comando.ExecuteReader();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        public void EjecutarAccion()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
      
        public int EjecutarAccionScalar()
        {
            comando.Connection = conexion;
            try
            {
                conexion.Open();
                return int.Parse(comando.ExecuteScalar().ToString());
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
        public void SetearParametros(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }
        public void CerrarConexion()
        {
            if (lector != null)
            {
                lector.Close();

                conexion.Close();
            }

        }
        /*_____________________________________________________________________________________________*/
        public string leerConsulta()
        {
            string consulta = "select A.Id, Codigo, Nombre, A.Descripcion, C.Descripcion AS Categoria, M.Descripcion as Marca, ImagenUrl, Precio from ARTICULOS A, CATEGORIAS C, MARCAS M where A.IdMarca = M.id and A.IdCategoria = C.Id ";
            return consulta;
        }

        public string Agregar()
        {
            string agregarArticulo = "insert into ARTICULOS (Codigo, Nombre, Descripcion, IdMarca, IdCategoria, ImagenUrl, Precio) values (@Codigo, @Nombre, @Descripcion, @IdMarca, @IdCategoria, @ImagenUrl, @Precio)";
            return agregarArticulo;
        }
        public string Modificar()
        {
            string modificar = " update ARTICULOS set Codigo= @cod, Nombre= @nombre, Descripcion= @descripcion, IdMarca= @IdMarca, IdCategoria = @IdCategoria, ImagenUrl = @imagenUrl, Precio = @precio where Id = @Id";
            return modificar;
        }

    }
}
