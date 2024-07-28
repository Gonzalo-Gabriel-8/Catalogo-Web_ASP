using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo_Web.Vistas
{
    public partial class Gestion_Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CategoriaNegocio Categoria_negocio = new CategoriaNegocio();
                dgv_Categorias.DataSource = Categoria_negocio.listaCategoria();
                dgv_Categorias.DataBind();
            }
        }
        protected void btn_Agregar_Categoria_Click(object sender, EventArgs e)
        {

        }
    }
}