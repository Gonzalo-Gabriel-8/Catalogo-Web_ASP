using Acceso_Datos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo_Web.Vistas
{
    public partial class Error : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Seguridad.sessionActiva(Session["usuario"]))
            {
                if (!Seguridad.IsAdmin(Session["usuario"]))
                {
                    lblError.Text = Session["error"].ToString();
                    boton.Visible = false;
                }
                else
                {
                    lblError.Text = Session["usuario"].ToString();
                    boton.Visible = false;
                }

            }
            if (Page is Detalle)
            {
                lblError.Text = Session["error"].ToString();
                boton.Visible = true;
            }
            else
                lblError.Text = Session["error"].ToString();

        }
    }
}