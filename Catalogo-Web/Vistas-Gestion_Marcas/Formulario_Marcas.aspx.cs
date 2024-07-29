using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo_Web.Vistas_Gestion_Marcas
{
    public partial class Formulario_Marcas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MarcaNegocio negocio = new MarcaNegocio();
                Marca marca = new Marca();
                txtId.Enabled = false;
                txtMarcaVeja.Enabled = false;
                string id = Request.QueryString["Id"] != null ? Request.QueryString["Id"].ToString() : "";
                if (id != null && !IsPostBack)
                {
                    txtId.Text = id;
                    txtMarcaVeja.Text = marca.Descripcion;
                }
                
               
                
                
            }
        }

        protected void Aceptar_Click(object sender, EventArgs e)
        {
            try
            {
                
                if (Request.QueryString["Id"] != null)
                {
                    MarcaNegocio negocio = new MarcaNegocio();
                    Marca marca = new Marca();
                    marca.Descripcion = txtMarcaNueva.Text;
                    Response.Redirect("../Vistas-Gestion_Marcas/Gestion-Marcas.aspx", false);


                }
            }
            catch (Exception ex)
            {

                throw ex;
            }


        }
    }
}