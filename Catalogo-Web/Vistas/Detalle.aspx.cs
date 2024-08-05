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
    public partial class Detalle : System.Web.UI.Page
    { public bool detalle=false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                detalle=true;
                string Id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                ArticuloNegocio negocio= new ArticuloNegocio();
                Articulo articulo = negocio.listar(Id)[0];
                Session.Add("articulo", articulo);
                lblMarca.Text = articulo.marca.Descripcion;
                lblNombre.Text = articulo.Nombre;
                lblPrecio.Text = articulo.Precio.ToString();
                lblDescripcion.Text = articulo.Descripcion;
                lblCodigo.Text = articulo.Codigo;
                imgArticulo.ImageUrl = articulo.ImagenUrl;
            }
        }

       

       
    }
}