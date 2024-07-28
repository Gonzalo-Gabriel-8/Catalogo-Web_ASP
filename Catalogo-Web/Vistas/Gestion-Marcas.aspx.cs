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
    public partial class Gestion_Marcas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MarcaNegocio Marca_negocio = new MarcaNegocio();
                dgv_Marcas.DataSource = Marca_negocio.listaMarca();
                dgv_Marcas.DataBind();
            }
        }
        protected void btn_Agregar_Marcas_Click(object sender, EventArgs e)
        {
            MarcaNegocio negocio = new MarcaNegocio();
            Marca nuevaMarca = new Marca();
            nuevaMarca.Descripcion = txtNuevaMarca.Text;
            negocio.AgregarMarca(nuevaMarca);
            Response.Redirect("../Vistas/Gestion-Marcas.aspx", false);
        }
    }
}