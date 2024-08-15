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
                Usuario usuario = new Usuario();
                UsuarioNegocio negocio = new UsuarioNegocio();
                usuario.Email = txtEmail.Text;
                usuario.Pass = txtPass.Text;
                usuario.Id= negocio.nuevoUsuario(usuario);
                Session.Add("usuario", usuario);
                Response.Redirect("../Vistas/Default.aspx", false);
            }
            catch (Exception ex)
            {

                Session.Add("../Vistas/Error.aspx", ex.ToString());
            }
        }
    }
}