using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace Catalogo_Web.Vistas
{
    public partial class ListaCatalogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ArticuloNegocio Articulo_negocio = new ArticuloNegocio();
                dgvArticulo.DataSource = Articulo_negocio.ListaArticulo();
                dgvArticulo.DataBind();
            }
        }

        protected void dgvArticulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Id = dgvArticulo.SelectedDataKey.Value.ToString();
            Response.Redirect("../Vistas/Formulario.aspx?Id=" + Id);
        }

        protected void dgvArticulo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            dgvArticulo.PageIndex = e.NewPageIndex;
            dgvArticulo.DataSource = negocio.ListaArticulo();
            dgvArticulo.DataBind();
        }
        //-------------------------------- ESTILOS PARA LA PAGINACION -------------------------------
        protected void dgvArticulo_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Agregar clases de Bootstrap a cada fila
                e.Row.CssClass = "table-row";
            }
            else if (e.Row.RowType == DataControlRowType.Header)
            {
                // Agregar clases de Bootstrap al encabezado
                e.Row.CssClass = "table-header";
            }
            else if (e.Row.RowType == DataControlRowType.Pager)
            {
                // Estilizar el paginador
                e.Row.CssClass = "table-pager";
            }
        }

    }
}