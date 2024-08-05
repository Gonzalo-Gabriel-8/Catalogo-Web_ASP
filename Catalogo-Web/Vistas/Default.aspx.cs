using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Catalogo_Web;

namespace Catalogo_Web.Vistas
{
    public partial class Default : System.Web.UI.Page
    {
        public bool carrucel = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                carrucel = true;
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("Listado", negocio.listar());
                List<Articulo> lista = (List<Articulo>)Session["Listado"];
                List<Articulo> filtrada = lista.Where(x => x.Precio > 0).ToList();
                Session["Listado"] = filtrada;
                RepeaterCarrusel.DataSource= filtrada;
                RepeaterCarrusel.DataBind();
                repRepetidor.DataSource = filtrada;
                repRepetidor.DataBind();             

            }


        }


    }
}