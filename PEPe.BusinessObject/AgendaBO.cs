using Agendamento.DataAccessModel;
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
            var db = new PEPeDataModelEntities();
            var result =  db.Agenda.AsQueryable().Where(x => x.Usuario.Id == usuarioId).ToList<Agenda>();

            return result;
           
        }

        //public AG_AGENDA ConsultaAgenda(int numeroAgenda)
        //{
        //    return agendaado.ConsultaAgenda(numeroAgenda);
        //}

        //public IEnumerable<AG_DASHBOARD> ListaAgenda(CL_USER user)
        //{
        //    return agendaado.ListarAgendamentos(user);
        //}


        ///// <summary>
        ///// 
        ///// </summary>
        ///// <returns></returns>
        //public IEnumerable<AG_DASHBOARD> ListarAgendamentosPaginado(CL_USER user, string searsh, int skip, int take)
        //{
        //    return agendaado.ListarAgendamentosPaginado(user, searsh, skip, take);
        //}


        ///// <summary>
        ///// Retorna total de registros
        ///// </summary>
        ///// <returns></returns>
        //public int TotalRegistros(CL_USER user, string searsh)
        //{

        //    return agendaado.TotalRegistros(user, searsh);

        //}


        ///// <summary>
        ///// Salva Agenda
        ///// </summary>
        ///// <param name="agenda"></param>
        //public Validacao Salvar(AG_AGENDA agenda)
        //{
        //    //Cria obj de validação
        //    Validacao validacao = new Validacao();

        //    if (DateTime.Now > agenda.DATA)
        //    {             
        //        validacao.Erros.Add(new ErroModel("CustomData", "A Data não pode ser menor que o dia atual !"));             

        //    }

        //    PeriodoADO periodoado = new PeriodoADO();
        //    int totDias = periodoado.ConsultaNumeroDias();
        //    DateTime dataSoma = DateTime.Now.AddDays(totDias);

        //    if (agenda.DATA > dataSoma)
        //    {
        //        validacao.Erros.Add(new ErroModel("CustomData", string.Format("A Data atual não pode ser superior a mais de {0} !",totDias)));             
        //    }






            
        //    if(validacao.Erros.Count() == 0)
        //        agendaado.Salvar(agenda);
            
        //    return validacao;
        //}


        ///// <summary>
        ///// Lista Veículos por placa
        ///// </summary>
        ///// <param name="placa"></param>
        ///// <returns></returns>
        //public List<VeiculoAutoCompleteModel> ConsultaVeiculo(string placa)
        //{
        //    List<VeiculoAutoCompleteModel> result = new List<VeiculoAutoCompleteModel>();
        //    VeiculoADO veiculoADO = new VeiculoADO();

        //    var lista = veiculoADO.ListarVeiculos(placa);
        //    foreach (var item in lista)
        //    {                
        //        result.Add(new VeiculoAutoCompleteModel { value = item.VEICULO , CapacidadeVeiculo = item.CAPACREAL });
        //    }
        //    return result;
        //}


        //public IEnumerable<CL_MOTORISTA> ConsultaMotorista(string veiculo)
        //{            
        //    MotoristaADO motoristaado = new MotoristaADO();
        //    return motoristaado.ConsultaMotoristaPorVeiculo(veiculo);

        //}

        ///// <summary>
        ///// Retorna lista de faixas
        ///// </summary>
        ///// <returns></returns>
        //public IEnumerable<AG_FAIXA> ListaFaixas()
        //{
        //    FaixaADO faixaado = new FaixaADO();
        //    return faixaado.Lista();
        //}


    }
}
