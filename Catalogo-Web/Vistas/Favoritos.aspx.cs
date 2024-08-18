using Acceso_Datos;
using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo_Web.Vistas
{
    public partial class Favoritos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Seguridad.sessionActiva(Session["usuario"]))
                {
                    FavoritoNegocio favoritos = new FavoritoNegocio();
                    repRepetidor.DataSource = favoritos.Listado(((Usuario)Session["usuario"]).Id);
                    repRepetidor.DataBind();
                }
                else
                {
                    Session.Add("error", "Debes estar registrado para ingresar");
                    Response.Redirect("../Vistas/Error.aspx", false);
                }
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            
                Button btnEliminar = (Button)sender;

                FavoritoNegocio negocio = new FavoritoNegocio();
                int IdUsuario = ((Usuario)Session["usuario"]).Id;
                RepeaterItem item = (RepeaterItem)btnEliminar.NamingContainer;
                HiddenField IdArticulo = (HiddenField)item.FindControl("IdArticulo");
                int idArticulo = int.Parse(IdArticulo.Value);
                negocio.EliminarFavorito(IdUsuario, idArticulo);
                Response.Redirect("../Vistas/Favoritos.aspx", false);           

        }
    }
}