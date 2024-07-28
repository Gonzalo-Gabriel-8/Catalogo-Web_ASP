using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public enum UserType //una especie de clase que tiene esos valores
        {
            NORMAL = 1,
            ADMIN = 2
        }
        public int Id { get; set; }
        public string User { get; set; }
        public string Pass { get; set; }
        public UserType TipoUsuario { get; set; }

        //contrucctor
        public Usuario(string user, string pass, bool admin)
        {
            this.User = user;
            this.Pass = pass;
            this.TipoUsuario = admin ? UserType.ADMIN : UserType.NORMAL;
        }
    }
}
