﻿using System;
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
        public List<Marca> listaMarca(string id = "")
        {
            AccesoDatos datos = new AccesoDatos();
            List<Marca> marcas = new List<Marca>();
            try
            {
                string consulta = "Select Id, Descripcion FROM MARCAS ";

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
                datos.SetearConsulta("insert into MARCAS (Descripcion) values (@Descripcion)");
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

        public void ModificarMarca(Marca modificado)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.SetearConsulta("update MARCAS set Descripcion= @descripcion where Id= @Id");
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
        public void EliminarMarca(int id)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();
                datos.SetearConsulta("delete from MARCAS where id = @id");
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