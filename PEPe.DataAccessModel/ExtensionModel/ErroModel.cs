using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PEPe.DataAccessModel
{
    public class ErroModel
    {
        public ErroModel()
        {

        }

        public ErroModel(string id, string descricao)
        {
            this.Id = id;
            this.Descricao = descricao;
        }

        public string Id { get; set; }
        public string Descricao { get; set; }
    }
}
