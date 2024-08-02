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
    public partial class Formulario_Marca : System.Web.UI.Page
    {
        public bool eliminacion = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                string Id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                if (Id != "" && !IsPostBack)
                {
                    eliminacion = true;
                    MarcaNegocio negocio = new MarcaNegocio();
                    Marca marca = negocio.listaMarca()[0];
                    Session.Add("marcaSelecionada", marca);
                    lblId.Text = Id;
                    lblDescripcion.Text = marca.Descripcion;
                    lblEliminar.Text = marca.Descripcion;
                }
            }
            catch (Exception ex)
            {

                Session.Add("../Vistas/Error.aspx", ex.ToString());
            }

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Marca marca = new Marca();
                MarcaNegocio negocio = new MarcaNegocio();
                marca.Descripcion = txtEditar.Text;
                if (Request.QueryString["id"] != null)
                {
                    negocio.ModificarMarca(marca);
                    Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
                }
                else
                {
                    negocio.AgregarMarca(marca);
                    Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
                }                 
                               
            }
            catch (Exception ex)
            {

                Session.Add("../Vistas/Error.aspx", ex.ToString());
            }

        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {               
                MarcaNegocio negocio = new MarcaNegocio();
                negocio.EliminarMarca(int.Parse(lblId.Text));
                Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("../Vistas/Error.aspx", ex.ToString());
            }

        }
    }
}