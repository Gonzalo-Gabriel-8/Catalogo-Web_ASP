using Acceso_Datos;
using Dominio;
using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Catalogo_Web
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            try
            {
                Page.Validate();
                if (!Page.IsValid)
                    return;

                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                if (!Validacion.validaTextoVacio(txtEmail.Text) || Validacion.validaTextoVacio(txtPass.Text) 
                    || Validacion.validaTextoVacio(txtNombre) || Validacion.validaTextoVacio(txtApellido))
                {
                    Session.Add("error", "Todos los campos son requeridos");
                    Response.Redirect("../Vistas/Error.aspx", false);
                }
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtPass.Text;
                usuario.Nombre= txtNombre.Text;
                usuario.Apellido= txtApellido.Text;
                usuario.Id = negocio.nuevoUsuario(usuario);
                Session.Add("usuario", usuario);
                Response.Redirect("../Vistas/Default.aspx", false);
            }
            catch (Exception ex)
            {
                Session.Add("../Vistas/Error.aspx", ex.ToString());
                Response.Redirect("../Vistas/Error.aspx", false);
            }
        }
    }
}