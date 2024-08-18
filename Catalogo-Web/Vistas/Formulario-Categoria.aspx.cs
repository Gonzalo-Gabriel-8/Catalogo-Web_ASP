using Acceso_Datos;
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
    public partial class Formulario_Categoria : System.Web.UI.Page
    {
        public bool CategoriaID = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Seguridad.IsAdmin(Session["usuario"]))
            {
                Session.Add("error", "Se requiere permisos de admin para acceder a esta pantalla");
                Response.Redirect("../Vistas/Error.aspx", false);
            }
            string Id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
            if (Id != "" && !IsPostBack)
            {
                CategoriaID = true;
                CategoriaNegocio negocio = new CategoriaNegocio();
                Categoria categoria = negocio.listaCategoria(Id)[0];
                Session.Add("CategoriaSelecionada", categoria);
                lblId.Text = Id;
                lblDescripcion.Text = categoria.Descripcion;
                lblEliminar.Text = categoria.Descripcion;
            }
        }
        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Categoria categoria = new Categoria();
                CategoriaNegocio negocio = new CategoriaNegocio();
                if (Request.QueryString["id"] != null)
                {
                    categoria.Descripcion = txtEditarCategoria.Text;
                    categoria.Id = int.Parse(lblId.Text);
                    negocio.ModificarMarca(categoria);
                    Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
                }
                else
                {
                    categoria.Descripcion = txtNuevaCategoria.Text;
                    negocio.AgregarCategoria(categoria);
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
                CategoriaNegocio negocio = new CategoriaNegocio();
                negocio.EliminarCategoria(int.Parse(lblId.Text));
                Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("../Vistas/Error.aspx", ex.ToString());
            }
        }
    }
}