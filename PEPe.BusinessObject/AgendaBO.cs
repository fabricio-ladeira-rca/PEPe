using PEPe.DataAccessModel;
using PEPe.ADO;
using PEPe.DataAccessModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace PEPe.BusinessObject
{
    public class AgendaBO
    {
       
        private AgendaADO agendaado = new AgendaADO();

        public List<Agenda> Consulta(int usuarioId)
        {
            return agendaado.Consulta(usuarioId);           
        }      


    }
}
