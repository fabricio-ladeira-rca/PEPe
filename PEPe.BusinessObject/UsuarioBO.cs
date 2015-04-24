using PEPe.DataAccessModel;
using PEPe.ADO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PEPe.BusinessObject
{
    public class UsuarioBO
    {
        private UsuarioADO ado = new UsuarioADO();

        public int TotalRegistros(string palavraChave)
        {
            return ado.TotalRegistros(palavraChave);
        }


        public List<Usuario> ListarAgendamentosPaginado(string searsh, int skip, int take)
        {
            return ado.ListarAgendamentosPaginado(searsh, skip, take).ToList();
        }


        public Usuario ConsultaUsuario(int id)
        {
            return ado.Consulta(id);

        }


        public void Salvar(Usuario usuario)
        {
            ado.Salvar(usuario);
        }


        public void Excluir(int id)
        {
            ado.Excluir(id);

        }



    }
}
