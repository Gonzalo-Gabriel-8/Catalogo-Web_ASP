﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Articulo
    {
        public int Id { get; set; }
        public string Codigo { get; set; }
        public string Nombre { get; set; }
        public string Descripcion { get; set; }
        public decimal Precio { get; set; }
        public string ImagenUrl { get; set; }
        public Categoria categoria { get; set; }
        public Marca marca { get; set; }
        public string PrecioCadena
        {
            get { return ObtenerPrecio(); }
        }
        private string ObtenerPrecio()
        {
            if (Precio >= 0)
            {
                return Precio.ToString("Disponible");
            }
            else
            {
                return Precio.ToString("No disponible");
            }

        }




    }

    
}
