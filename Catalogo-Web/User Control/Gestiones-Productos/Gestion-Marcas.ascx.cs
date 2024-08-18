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
    public partial class Gestion_Marcas : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.IsAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
                Response.Redirect("../Vistas/Error.aspx", false);
            }
            MarcaNegocio Marca_negocio = new MarcaNegocio();
            Session.Add("ListadoMarcas", Marca_negocio.listaMarca());
            dgv_Marcas.DataSource = Session["ListadoMarcas"];
            dgv_Marcas.DataBind();
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
            List<Marca> lista = (List<Marca>)Session["ListadoMarcas"];
            List<Marca> listaRapida = lista.FindAll(x => x.Descripcion.ToUpper().Contains(txtBusquedaRapida_Marcas.Text.ToUpper()));
            dgv_Marcas.DataSource = listaRapida;
            dgv_Marcas.DataBind();
        }
       
    }
}