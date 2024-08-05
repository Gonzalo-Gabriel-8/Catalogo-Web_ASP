using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Catalogo_Web;
using Catalogo_Web.Vistas;
using Dominio;
using Negocio;

namespace Catalogo_Web
{
    public partial class Master_Gonza : System.Web.UI.MasterPage
    {
        public bool txtBusqueda = false;
        public bool repCarrucel = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page is Default || Page is Detalle)
            {
                
                txtBusqueda = true;
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("Listado", negocio.listar());
                List<Articulo> lista = (List<Articulo>)Session["Listado"];
                List<Articulo> filtrada = lista.Where(x => x.Precio > 0).ToList();
                Session["Listado"] = filtrada;
                repRepetidor.DataSource = Session["Listado"];
                repRepetidor.DataBind();
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {

        }

        protected void busqueda_TextChanged(object sender, EventArgs e)
        {
            if (busqueda.Text != "")
            {
                repCarrucel = true;
                List<Articulo> lista = (List<Articulo>)Session["Listado"];
                List<Articulo> listado = lista.FindAll(x => x.Nombre.ToUpper().Contains(busqueda.Text.ToUpper()) ||
                    x.Descripcion.ToUpper().Contains(busqueda.Text.ToUpper()) ||
                    x.marca.Descripcion.ToUpper().Contains(busqueda.Text.ToUpper()) ||
                    x.Codigo.ToUpper().Contains(busqueda.Text.ToUpper()));

                repRepetidor.DataSource = listado;
                repRepetidor.DataBind();
            }

        }
    }
}