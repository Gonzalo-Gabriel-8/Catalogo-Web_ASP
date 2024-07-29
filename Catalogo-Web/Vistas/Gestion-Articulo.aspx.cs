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
                MarcaNegocio Marca_negocio = new MarcaNegocio();
                dgv_Marcas.DataSource = Marca_negocio.listaMarca();
                dgv_Marcas.DataBind();
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
        protected void btn_Agregar_Marcas_Click(object sender, EventArgs e)
        {
            MarcaNegocio negocio = new MarcaNegocio();
            Marca nuevaMarca = new Marca();
            nuevaMarca.Descripcion = txtAgregarMarca.Text;
            negocio.AgregarMarca(nuevaMarca);
            Response.Redirect("../Vistas-Gestion_Marcas/Gestion-Marcas.aspx", false);
        }

        protected void dgv_Marcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Id = dgv_Marcas.SelectedDataKey.Value.ToString();
            Response.Redirect("../Vistas-Gestion_Marcas/Formulario_Marcas.aspx?Id=" + Id);
        }

    }
}

    