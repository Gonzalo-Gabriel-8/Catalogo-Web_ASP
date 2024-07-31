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
            string nombre = "Roberto";
            string Apellido = "Perez";
            string Email = "gonzalogabrielgarcia@outlook.com";


            MiAvatar.ImageUrl = "https://sm.ign.com/t/ign_es/news/n/netflixs-a/netflixs-avatar-the-last-airbender-adds-george-takei-amber-m_pe4h.1280.jpg";
            //lblNombre.Text = nombre;
            //lblApellido.Text = Apellido;
            lblEmail.Text = Email;
            lblNombre_Apellido.Text = nombre + Apellido;
            lblInfo_Nombre.Text = nombre;
            lblInfo_Email.Text = Email;
            lblInfo_Apellido.Text = Apellido;


        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {

        }
    }
}