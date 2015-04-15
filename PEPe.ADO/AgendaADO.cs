using PEPe.DataAccessModel;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Data.Objects;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PEPe.ADO
{
    public class AgendaADO
    {
      

        //public AG_AGENDA ConsultaAgenda(int numeroAgenda)
        //{
        //    AG_AGENDA agenda = null;
        //    using (var db = new AgendamentoEntities())
        //    {
        //        agenda = db.AG_AGENDA.Where(x => x.NUM_AGENDA.Equals(numeroAgenda)).FirstOrDefault();
        //    }
        //    return agenda;

        //}


        ///// <summary>
        ///// 
        ///// </summary>
        ///// <param name="usuario"></param>
        ///// <returns></returns>
        //public IEnumerable<AG_DASHBOARD> ListarAgendamentos(CL_USER usuario)
        //{           
        //    IEnumerable<AG_DASHBOARD> lista = null;
        //    using (var db = new AgendamentoEntities())
        //    {
        //        lista = (from item in db.AG_DASHBOARD
        //                 where item.SIG_CLIENTE == usuario.SIG_CLIENTE
        //                 orderby item.NUM_AGENDA descending
        //                 select item).ToList(); 

        //    }
        //    return lista;
        //}


        //public IEnumerable<AG_DASHBOARD> ListarAgendamentosPaginado(CL_USER user, string searsh, int skip, int take)
        //{
        //    IEnumerable<AG_DASHBOARD> lista = null;
        //    using (var db = new AgendamentoEntities())
        //    {
        //        lista = (from item in db.AG_DASHBOARD
        //                 where item.SIG_CLIENTE.Equals(user.SIG_CLIENTE)
        //                 && item.VEICULO.ToUpper().Contains(searsh.ToUpper())
        //                 select item);

        //        return lista.Skip(skip).Take(take).ToList();
        //    }

        //}


        ///// <summary>
        ///// Retorna total de registros
        ///// </summary>
        ///// <returns></returns>
        //public int TotalRegistros(CL_USER user, string searsh)
        //{
        //    using (var db = new AgendamentoEntities())
        //    {
        //        return db.AG_DASHBOARD.Where(x => x.SIG_CLIENTE.Equals(user.SIG_CLIENTE) && x.VEICULO.ToUpper().Contains(searsh.ToUpper())).Count();
        //    }

        //}


        ///// <summary>
        ///// Grava Agenda no banco
        ///// </summary>
        ///// <param name="agenda"></param>
        //public void Salvar(AG_AGENDA agenda)
        //{
        //    using (var db = new AgendamentoEntities())
        //    {

        //        if (agenda.NUM_AGENDA == 0)
        //        {
        //            //Adiciona agenda
        //            ObjectParameter id = new ObjectParameter("numero", typeof(int));
        //            int retorno = db.AG_PROXNUM(id);

        //            agenda.NUM_AGENDA = Convert.ToInt32(id.Value);
        //            db.AG_AGENDA.Add(agenda);
        //        }
        //        else
        //        {
        //            //Edita Agenda
        //            AG_AGENDA upd = db.AG_AGENDA.Find(agenda.NUM_AGENDA);
        //            db.Entry(upd).CurrentValues.SetValues(agenda);                    
        //        }
        //        db.SaveChanges();
        //    }
        //}




    }
}
