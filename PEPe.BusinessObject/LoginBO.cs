using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PEPe.ADO;
using PEPe.DataAccessModel;
namespace PEPe.BusinessObject
{
    public class LoginBO
    {

        /// <summary>
        /// Loga usuário no sistema
        /// </summary>
        /// <param name="login"></param>
        /// <param name="senha"></param>
        /// <returns></returns>
        public UsuarioLogadoModel Login(string login, string senha)
        {           
            LoginADO loginado = new LoginADO();
            return loginado.Login(login, senha);
        }

    }
}
