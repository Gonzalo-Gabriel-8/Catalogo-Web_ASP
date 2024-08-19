using Acceso_Datos;
using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo_Web.User_Control.Gestiones_Productos
{
    public partial class Filtro_Avanzado : System.Web.UI.UserControl
    {

        public bool desplegar { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.IsAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de Admin para ingresar aca");
                Response.Redirect("../Vistas/Error.aspx", false);
            }
            if (!IsPostBack)
            {
                ArticuloNegocio Articulo_negocio = new ArticuloNegocio();
                Session.Add("ListaArticulo", Articulo_negocio.ListaArticulo());
                dgvArticulo.DataSource = Session["ListaArticulo"];
                dgvArticulo.DataBind();
            }
        }
        protected void txtBusquedaRapida_TextChanged(object sender, EventArgs e)
        {
            List<Articulo> lista = (List<Articulo>)Session["ListaArticulo"];
            List<Articulo> listaRapida = lista.FindAll(x => x.Nombre.ToUpper().Contains(txtBusquedaRapida.Text.ToUpper()));
            dgvArticulo.DataSource = listaRapida;
            dgvArticulo.DataBind();
        }
        protected void dgvArticulo_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            ArticuloNegocio negocio = new ArticuloNegocio();
            dgvArticulo.PageIndex = e.NewPageIndex;
            dgvArticulo.DataSource = negocio.ListaArticulo();
            dgvArticulo.DataBind();
        }
        protected void dgvArticulo_SelectedIndexChanged(object sender, EventArgs e)
        {
            string Id = dgvArticulo.SelectedDataKey.Value.ToString();
            Response.Redirect("../Vistas/Formulario-Articulo.aspx?Id=" + Id);
        }
        protected void ckbFiltroAvanzado_CheckedChanged(object sender, EventArgs e)
        {
            desplegar = ckbFiltroAvanzado.Checked;
            txtBusquedaRapida.Enabled = !desplegar;
        }
        protected void ddlCampo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                ddlCriterio.Items.Clear();
                string campo = ddlCampos.Text;
                switch (campo)
                {
                    case "Nombre":
                        ddlCriterio.Items.Add("Contiene");
                        ddlCriterio.Items.Add("Comienza con");
                        ddlCriterio.Items.Add("Termina con");
                        break;
                    case "Marca":
                        ddlCriterio.Items.Add("Contiene");
                        ddlCriterio.Items.Add("Comienza con");
                        ddlCriterio.Items.Add("Termina con");
                        break;
                    case "Categoria":
                        ddlCriterio.Items.Add("Contiene");
                        ddlCriterio.Items.Add("Comienza con");
                        ddlCriterio.Items.Add("Termina con");
                        break;
                    default:
                        break;

                }
            }
            catch (Exception ex)
            {

                Session.Add("Debes completar los campos", ex.ToString());
            }

        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {

                Page.Validate();
                if (!Page.IsValid)
                    return;
                ArticuloNegocio negocio = new ArticuloNegocio();
                dgvArticulo.DataSource = negocio.filtrar(ddlCampos.SelectedIndex.ToString(),
                    ddlCriterio.SelectedItem.ToString(),
                    txtFiltroAvanzado.Text,
                    ddlEstado.SelectedItem.ToString());
                dgvArticulo.DataBind();
            }
            catch (Exception ex)
            {

                Session.Add("Error", ex);
            }
        }

        protected void BtnLimpiar_Click(object sender, EventArgs e)
        {
            ddlCampos.Items.Clear();
            ddlCriterio.Items.Clear();
            ddlEstado.Items.Clear();
            txtFiltroAvanzado.Text = "";
            Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
              
        }
    }
}