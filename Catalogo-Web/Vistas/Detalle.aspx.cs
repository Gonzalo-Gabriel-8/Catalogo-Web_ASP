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
    public partial class Detalle : System.Web.UI.Page
    {
        public bool detalle = false;
        public bool cambiaImagen;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                detalle = true;
                string Id = Request.QueryString["id"] != null ? Request.QueryString["id"].ToString() : "";
                ArticuloNegocio negocio = new ArticuloNegocio();
                Articulo articulo = negocio.listar(Id)[0];
                Session.Add("articulo", articulo);
                lblMarca.Text = articulo.marca.Descripcion;
                lblNombre.Text = articulo.Nombre;
                lblPrecio.Text = articulo.Precio.ToString();
                lblDescripcion.Text = articulo.Descripcion;
                lblCodigo.Text = articulo.Codigo;
                imgArticulo.ImageUrl = articulo.ImagenUrl;

                if (Seguridad.sessionActiva(Session["usuario"]))
                {
                    FavoritoNegocio favoritos = new FavoritoNegocio();
                    int IdUsuario = ((Usuario)Session["usuario"]).Id;
                    bool existe = favoritos.ConsultarFavoritos(IdUsuario, int.Parse(Id));
                    if (existe)
                    {
                        cambiaImagen = false;
                    }

                    else
                    {
                        cambiaImagen = true;
                    }
                }

            }
        }



        protected void btnFavoritos_Click(object sender, ImageClickEventArgs e)
        {
            try
            {
                if (Seguridad.sessionActiva(Session["usuario"]))
                {
                    FavoritoNegocio favoritos = new FavoritoNegocio();
                    Favoritos fav = new Favoritos();
                    int IdUsuario = ((Usuario)Session["usuario"]).Id;
                    int IdArticulo = int.Parse(Request.QueryString["id"]);
                    bool existe = favoritos.ConsultarFavoritos(IdUsuario, IdArticulo);
                    if (existe)
                    {
                        favoritos.EliminarFavorito(IdUsuario, IdArticulo);
                        cambiaImagen = true;
                    }
                    else
                    {
                        favoritos.InsertarFavoritos(IdUsuario, IdArticulo);
                        cambiaImagen = false;
                        Session.Add("favoritos", fav); //borrar posiblemnete
                    }

                    Response.Redirect("/Vistas/Detalle.aspx?id=" + IdArticulo.ToString(), false);
                }
                else
                {
                    Session.Add("error", "Debes estar registrado para agregar a favoritos");
                    Response.Redirect("../Vistas/Error.aspx", false);
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }
    }
}