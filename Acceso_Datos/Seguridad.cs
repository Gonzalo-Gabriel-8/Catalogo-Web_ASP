using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using Microsoft.Ajax.Utilities;

namespace Acceso_Datos
{
    public static class Seguridad
    {
        public static bool sessionActiva(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            if (usuario != null && usuario.Id != 0)
                    return true;
            else return false;
        }
        public static bool IsAdmin(object user)
        {
            Usuario usuario = user != null ? (Usuario)user : null;
            return  usuario!= null ? usuario.Admin : false;
        }
    }
        
}
