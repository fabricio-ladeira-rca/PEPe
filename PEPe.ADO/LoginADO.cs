using PEPe.DataAccessModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PEPe.ADO
{
    public class LoginADO
    {

        public UsuarioLogadoModel Login(string login, string senha)
        {
            UsuarioLogadoModel usuario = new UsuarioLogadoModel() { Logado=true};


            return usuario;

        }
    }
}
