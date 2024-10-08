﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Acceso_Datos
{
    public static class Validacion
    {
        public static bool validaTextoVacio(object control)
        {
            if (control is TextBox texto)
            {
                if (!string.IsNullOrEmpty(texto.Text)) 
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

            return false;
        }
    }
}
