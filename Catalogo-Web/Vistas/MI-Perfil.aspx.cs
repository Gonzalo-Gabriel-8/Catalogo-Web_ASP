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
    public partial class MI_Perfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Seguridad.sessionActiva(Session["usuario"]))
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    lblNombre.Text = usuario.Nombre;
                    lblApellido.Text = usuario.Apellido;
                    lblEmail.Text = usuario.Email;

                    txtId.Visible = false;
                    txtId.Text = usuario.Id.ToString(); ;
                    txtApellido.Text = usuario.Apellido;
                    txtNombre.Text = usuario.Nombre;
                    txtEmail.ReadOnly = true;
                    txtEmail.Text = usuario.Email;
                    txtPass.Attributes["Value"] = usuario.Pass;
                    if (!string.IsNullOrEmpty(usuario.UrlImagenPerfil))
                    {
                        miAvatar.ImageUrl = "~/Images/" + usuario.UrlImagenPerfil;
                    }
                    else
                        miAvatar.ImageUrl = "https://th.bing.com/th/id/R.cb6407042d307d6e07c7b5818f57d504?rik=osJEzH15cv8H%2bw&pid=ImgRaw&r=0";
                }
            }

        }

        protected void btnRegistrarse_Click(object sender, EventArgs e)
        {
            try
            {
                UsuarioNegocio negocio = new UsuarioNegocio();
                Usuario usuario = (Usuario)Session["usuario"];
                if (txtImagen.PostedFile.FileName != "")
                {
                    string ruta = Server.MapPath("../Images/");
                    txtImagen.PostedFile.SaveAs(ruta + "perfil-" + usuario.Id + ".jpg");
                    usuario.UrlImagenPerfil = "perfil-" + usuario.Id + ".jpg";

                }
                if (Validacion.validaTextoVacio(txtApellido.Text) || Validacion.validaTextoVacio(txtNombre.Text) ||
                    Validacion.validaTextoVacio(txtPass.Text))
                {
                    usuario.Nombre = txtNombre.Text;
                    usuario.Apellido = txtApellido.Text;
                    usuario.Pass = txtPass.Text;
                    negocio.Actualizar(usuario);
                }
                Image img = (Image)Master.FindControl("imgImagen");
                img.ImageUrl = "~/Images/" + usuario.UrlImagenPerfil;
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("../Vistas/Error.aspx", false);
            }
        }

        protected void btnSalir_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("../Vistas/Default.aspx", false);
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {

                UsuarioNegocio negocio = new UsuarioNegocio();
                negocio.EliminarUsuario(int.Parse(txtId.Text));
                Session.Clear();
                Response.Redirect("../Vistas/Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("error", ex.ToString());
                Response.Redirect("../Vistas/Error.aspx", false);
            }
        }
    }
}