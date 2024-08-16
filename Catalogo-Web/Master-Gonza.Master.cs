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
            imgImagen.ImageUrl = "https://th.bing.com/th/id/R.cb6407042d307d6e07c7b5818f57d504?rik=osJEzH15cv8H%2bw&pid=ImgRaw&r=0";
            if (!(Page is Default || Page is Detalle || Page is Error || Page is Registro))
            {
                if (!Seguridad.sessionActiva(Session["usuario"]))
                {
                    Response.Redirect("../Vistas/Registro.aspx", false);
                }
            }
            if (Seguridad.sessionActiva(Session["usuario"]))
            {
                Usuario usuario = (Usuario)Session["usuario"];
                lblSaludo.Text = "Bievenido " + usuario.Nombre; 
                if(!string.IsNullOrEmpty(usuario.UrlImagenPerfil))
                imgImagen.ImageUrl = "~/Images/" + ((Usuario)Session["usuario"]).UrlImagenPerfil;
            }
          

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
            Usuario usuario = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();
            try
            {
                if (!Validacion.validaTextoVacio(txtEmail))
                {
                    Session.Add("error", "Debes ingresar un Email");
                    Response.Redirect("../Vistas/Error.aspx");
                }
                if (!Validacion.validaTextoVacio(txtPass))
                {
                    Session.Add("error", "Debes ingresar una contraseña");
                    Response.Redirect("../Vistas/Error.aspx");
                }
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtPass.Text;
                if (negocio.Loguin(usuario))
                {                    
                    Session.Add("usuario", usuario);                  

                    Response.Redirect("../Vistas/Default.aspx", false);
                    
                }
                else
                {
                    Session.Add("error", "user o pass incorrectos");
                    Response.Redirect("../Vistas/Error.aspx", false);
                }
            }
            catch (System.Threading.ThreadAbortException ex)
            {

            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("../Vistas/Error.aspx");
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

        
    }
}