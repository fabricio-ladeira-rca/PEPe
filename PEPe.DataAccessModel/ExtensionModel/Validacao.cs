using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PEPe.DataAccessModel
{
    public class Validacao
    {
        public Validacao()
        {
            this.Erros = new List<ErroModel>();
        }

        public List<ErroModel> Erros { get; set; }

    }
}
