using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Catalogo_Web.Vistas;
 

namespace Catalogo_Web.Vistas
{
    public partial class Formulario : System.Web.UI.Page
    {
        public bool botonEliminar = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            
           
            txtId.Enabled = false;
            try
            {
                if (!IsPostBack)
                {
                    CategoriaNegocio categoria = new CategoriaNegocio();
                    ddlCategoria.DataSource = categoria.listaCategoria();
                    ddlCategoria.DataValueField = "id";
                    ddlCategoria.DataTextField = "descripcion";
                    ddlCategoria.DataBind();

                    MarcaNegocio marca = new MarcaNegocio();
                    ddlMarca.DataSource = marca.listaMarca();
                    ddlMarca.DataValueField = "id";
                    ddlMarca.DataTextField = "descripcion";
                    ddlMarca.DataBind();
                }
                string Id = Request.QueryString["Id"] != null ? Request.QueryString["Id"].ToString() : "";
                if (Id != "" && !IsPostBack)
                {
                    botonEliminar = true;
                    ArticuloNegocio negocio = new ArticuloNegocio();
                    Articulo articuloSeleccionado = negocio.listar(Id)[0];
                    Session.Add("articuloSeleccionado", articuloSeleccionado);

                    txtId.Text = Id;
                    txtCodigo.Text = articuloSeleccionado.Codigo;
                    txtNombre.Text = articuloSeleccionado.Nombre;
                    txtDescripcion.Text = articuloSeleccionado.Descripcion;
                    txtPrecio.Text = articuloSeleccionado.Precio.ToString();
                    txtUrlImagen.Text = articuloSeleccionado.ImagenUrl;
                    ddlCategoria.SelectedValue = articuloSeleccionado.categoria.Id.ToString();
                    ddlMarca.SelectedValue = articuloSeleccionado.marca.Id.ToString();
                    txtUrlImagen_TextChanged(sender, e);

                }
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("../Vistas/Error.aspx", false);
            }

        }
       
        protected void txtUrlImagen_TextChanged(object sender, EventArgs e)
        {
            imgArticulo.ImageUrl = txtUrlImagen.Text;
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Articulo articulo = new Articulo();
                ArticuloNegocio negocio = new ArticuloNegocio();

                articulo.Codigo = txtCodigo.Text;
                articulo.Nombre = txtNombre.Text;
                articulo.Descripcion = txtDescripcion.Text;
                articulo.Precio = decimal.Parse(txtPrecio.Text);
                articulo.ImagenUrl = txtUrlImagen.Text;
                articulo.categoria = new Categoria();
                articulo.categoria.Id = int.Parse(ddlCategoria.SelectedValue);
                articulo.marca = new Marca();
                articulo.marca.Id = int.Parse(ddlMarca.SelectedValue);
                if (Request.QueryString["Id"] != null)
                {
                    articulo.Id = int.Parse(txtId.Text);
                    negocio.ModificarArticulo(articulo);
                    Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);


                }
                else
                {
                               
                    negocio.AgregarArticulo(articulo);
                    Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
                }

            }
            catch (Exception ex)
            {
                Session.Add("../Vistas/Error.aspx", ex.ToString());
                Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
            }
        }

        protected void btn_Eliminar_Click(object sender, EventArgs e)
        {
            try
            {
                
                ArticuloNegocio negocio= new ArticuloNegocio();
                negocio.EliminarArticulo(int.Parse(txtId.Text));
                Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("../Vistas/Error.aspx", ex.ToString());
                Response.Redirect("../Vistas/Gestiones-Productos.aspx", false);
            }
        }
    }
}