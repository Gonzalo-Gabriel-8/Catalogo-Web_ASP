﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Acceso_Datos;
using Dominio;
using Negocio;

namespace Catalogo_Web.Vistas
{
    public partial class ListaCatalogo : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.IsAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de Admin para ingresar aca");
                Response.Redirect("../Vistas/Error.aspx", false);
            }
        }
    }




}







