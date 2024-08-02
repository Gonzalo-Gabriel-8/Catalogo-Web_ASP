using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
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
                MarcaNegocio Marca_negocio = new MarcaNegocio();
                CategoriaNegocio Categoria_negocio = new CategoriaNegocio();

                dgv_Marcas.DataSource = Marca_negocio.listaMarca();
                dgv_Marcas.DataBind();
                dgvCategoria.DataSource = Categoria_negocio.listaCategoria();
                dgvCategoria.DataBind();
            }
        }
        protected void dgv_Marcas_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Id = dgv_Marcas.SelectedDataKey.Value.ToString();
            Response.Redirect("../Vistas/Formulario-Marca.aspx?Id=" + Id);
        }

        protected void dgv_Marcas_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            MarcaNegocio negocio = new MarcaNegocio();
            dgv_Marcas.PageIndex = e.NewPageIndex;
            dgv_Marcas.DataSource = negocio.listaMarca();
            dgv_Marcas.DataBind();
        }

        protected void txtBusquedaRapida_Marcas_TextChanged(object sender, EventArgs e)
        {

        }
    }




}







