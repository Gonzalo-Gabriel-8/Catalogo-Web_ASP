using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Catalogo_Web;
using Catalogo_Web.Vistas;
using Dominio;
using Negocio;
using Acceso_Datos;

namespace Catalogo_Web
{
    public partial class Master_Gonza : System.Web.UI.MasterPage
    {
        public bool txtBusqueda = false;
        public bool repCarrucel = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!(Page is Registro || Page is Default || Page is Detalle || Page is Error))
            {
                if (!Seguridad.sessionActiva(Session["usuario"]))
                {
                    Response.Redirect("../Vistas/Registro.aspx", false);
                }
                else
                {
                    Usuario usuario =(Usuario) Session["usuario"];
                    lblSaludo.Text = usuario.Nombre;
                }
                
            }
            if (Seguridad.sessionActiva(Session["usuario"]))
            {
                imgImagen.ImageUrl = "~/Images/" + ((Usuario)Session["usuario"]).UrlImagenPerfil;
            }
            else
                imgImagen.ImageUrl = "https://th.bing.com/th/id/R.cb6407042d307d6e07c7b5818f57d504?rik=osJEzH15cv8H%2bw&pid=ImgRaw&r=0";
            if (Page is Default || Page is Detalle)
            { 
                
                txtBusqueda = true;
                ArticuloNegocio negocio = new ArticuloNegocio();
                Session.Add("Listado", negocio.listar());
                List<Articulo> lista = (List<Articulo>)Session["Listado"];
                List<Articulo> filtrada = lista.Where(x => x.Precio > 0).ToList();
                Session["Listado"] = filtrada;
                repRepetidor.DataSource = Session["Listado"];
                repRepetidor.DataBind();
            }
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario usuario= new Usuario();
            UsuarioNegocio negocio= new UsuarioNegocio();
            try
            {
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtPass.Text;
                if (negocio.Loguin(usuario))
                {
                    Session.Add("usuario", usuario);
                    Response.Redirect("../Vistas/MI-Perfil.aspx", false);
                }
                else
                {
                    Session.Add("error", "user o pass incorrectos");
                    Session.Add("../Vistas/Error.aspx", false);
                }
            }
            catch (Exception ex)
            {

                Session.Add("../Vistas/Error.aspx", ex.ToString());
            }
        }

        protected void busqueda_TextChanged(object sender, EventArgs e)
        {
            if (busqueda.Text != "")
            {
                repCarrucel = true;
                List<Articulo> lista = (List<Articulo>)Session["Listado"];
                List<Articulo> listado = lista.FindAll(x => x.Nombre.ToUpper().Contains(busqueda.Text.ToUpper()) ||
                    x.Descripcion.ToUpper().Contains(busqueda.Text.ToUpper()) ||
                    x.marca.Descripcion.ToUpper().Contains(busqueda.Text.ToUpper()) ||
                    x.Codigo.ToUpper().Contains(busqueda.Text.ToUpper()));

                repRepetidor.DataSource = listado;
                repRepetidor.DataBind();
            }

        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Vistas/Default.aspx", false);
        }
    }
}