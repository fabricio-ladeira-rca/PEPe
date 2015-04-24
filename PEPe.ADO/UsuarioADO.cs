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
    public class UsuarioADO
    {

        /// <summary>
        /// Consulta um determinado registro
        /// </summary>
        /// <param name="usuarioId"></param>
        /// <returns></returns>
        public Usuario Consulta(int usuarioId)
        {
            using (var db = new PEPeEntities())
            {
                return db.Usuario.AsQueryable().Where(x => x.Id == usuarioId).FirstOrDefault();
            }

        }


        /// <summary>
        /// Consulta dados paginados no banco
        /// </summary>
        /// <param name="searsh"></param>
        /// <param name="skip"></param>
        /// <param name="take"></param>
        /// <returns></returns>
        public IEnumerable<Usuario> ListarAgendamentosPaginado(string searsh, int skip, int take)
        {
            IEnumerable<Usuario> lista = null;
            using (var db = new PEPeEntities())
            {

                if (string.IsNullOrEmpty(searsh))
                    lista = db.Usuario.OrderBy(x => x.Nome);
                else
                    lista = (from item in db.Usuario
                             where item.Nome.ToUpper().Contains(searsh.ToUpper())
                             orderby item.Nome
                             select item);

                return lista.Skip(skip).Take(take).ToList();
            }

        }


        /// <summary>
        /// Retorna total de registros
        /// </summary>
        /// <returns></returns>
        public int TotalRegistros(string searsh)
        {
            using (var db = new PEPeEntities())
            {
                int total = 0;

                if (string.IsNullOrEmpty(searsh))
                    total = db.Usuario.Count();
                else
                    db.Usuario.Where(x => x.Nome.ToUpper().Contains(searsh.ToUpper())).Count();


                return total;
            }

        }

        /// <summary>
        /// Grava 
        /// </summary>
        /// <param name="usuario"></param>
        public void Salvar(Usuario usuario)
        {
            using (var db = new PEPeEntities())
            {
                if (usuario.Id == 0)
                {
                    db.Usuario.Add(usuario);
                }
                else
                {
                    //Edita Agenda
                    Usuario upd = db.Usuario.Find(usuario.Id);
                    db.Entry(upd).CurrentValues.SetValues(usuario);
                }
                db.SaveChanges();
            }
        }


        /// <summary>
        /// Excluir
        /// </summary>
        /// <param name="Id"></param>
        public void Excluir(int Id)
        {
            using (var db = new PEPeEntities())
            {
                //Edita Agenda
                Usuario usuario = db.Usuario.Find(Id);

                List<int> agendasDeletar = new List<int>();
                foreach (var agenda in usuario.Agenda)
                {
                    if (agenda.Consulta != null)
                    {
                        db.Database.ExecuteSqlCommand("DELETE FROM ConsultaMedicamento WHERE Consulta_Id = @Id ", new SqlParameter("Id", agenda.Consulta.Id) );
                        db.Consulta.Remove(db.Consulta.Find(agenda.Consulta.Id));
                    }

                    if (agenda.Exame != null)
                        db.Exame.Remove(db.Exame.Find(agenda.Exame.Id));

                    agendasDeletar.Add(agenda.Id);

                }

                foreach (var item in agendasDeletar)
                {
                    db.Agenda.Remove(db.Agenda.Find(item));
                }

                db.Usuario.Remove(usuario);
                db.SaveChanges();
            }
        }

    }
}
