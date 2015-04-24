using PEPe.DataAccessModel;
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


        public List<Agenda> Consulta(int usuarioId)
        {
            //using (var db = new PEPeEntities())
            //{
            var db = new PEPeEntities();
                var result = db.Agenda.AsQueryable().Where(x => x.Usuario.Id == usuarioId).ToList<Agenda>();

                return result;
            //}

        }


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
        ///// Grava 
        ///// </summary>
        ///// <param name="usuario"></param>
        //public void Salvar(Usuario usuario)
        //{
        //    using (var db = new PEPeEntities())
        //    {

        //        if (usuario.Id == 0)
        //        {                   
        //            db.Usuario.Add(usuario);
        //        }
        //        else
        //        {
        //            //Edita Agenda
        //            Usuario upd = db.Usuario.Find(usuario.Id);
        //            db.Entry(upd).CurrentValues.SetValues(usuario);
        //        }
        //        db.SaveChanges();
        //    }
        //}




    }
}
