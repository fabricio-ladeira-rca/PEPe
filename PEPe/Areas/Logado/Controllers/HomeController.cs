using PEPe.Areas.Logado.Models;
using PEPe.BusinessObject;
using PEPe.DataAccessModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PEPe.Areas.Logado.Controllers
{
    public class HomeController : AutenticationControllercs
    {
        //
        // GET: /Logado/Home/
        public ActionResult Index()
        {

            PEPe.BusinessObject.AgendaBO bo = new AgendaBO();

            var result = bo.Consulta(1);

            //PEPe.BusinessObject.AgendaBO agendabo = new BusinessObject.AgendaBO();

            //CL_USER user = (CL_USER)Session["user"];

            //return View(agendabo.ListaAgenda(user));

            return View(result);
        }


        ///// <summary>
        ///// Retorna consulta páginada da lista de Motoristas
        ///// </summary>
        ///// <param name="param"></param>
        ///// <returns></returns>
        //public ActionResult ConsultDashboardPaginado(jQueryDataTableParamModel param)
        //{
                       

        //    ////Recupera a sessão logado
        //    //CL_USER user = (CL_USER)Session["user"];
           
        //    ////Monta palavra chave
        //    //string palavraChave = (param.sSearch != null) ? param.sSearch.ToString() : string.Empty; 

        //    ////Cria Instancia da BO de motorista
        //    //AgendaBO agendabo = new AgendaBO();

        //    ////Retorna total de registros para monstar a paginação
        //    //int totalReg = agendabo.TotalRegistros(user,palavraChave);

        //    ////Corrige calculo paginação
        //    //int skip = param.iDisplayStart;
        //    //int take = param.iDisplayLength;


        //    ////Consulta dados no banco
        //    //var result = agendabo.ListarAgendamentosPaginado(user,palavraChave, skip, take);


        //    ////Formata saida dos dados para funcionar no DataGrid
        //    //List<string[]> listaDados = new List<string[]>();
        //    //foreach (var item in result)
        //    //{
        //    //    listaDados.Add(new string[] { item.NUM_AGENDA.ToString(), 
        //    //                                  string.Format("{0:dd/MM/yyyy}", item.DATA), 
        //    //                                  item.FAIXA, 
        //    //                                  item.NUM_OR.ToString(),
        //    //                                  item.VEICULO,
        //    //                                  item.F_PARCIAL,
        //    //                                  item.CAPACIDADE.ToString(),
        //    //                                  item.NUM_COMP.ToString(),
        //    //                                  item.SIG_PROD,
        //    //                                  item.QUANTIDADE.ToString(),
        //    //                                  item.STATUS,
        //    //                                  item.USER_REG,                                               
        //    //                                  string.Format("{0:dd/MM/yyyy}", item.DTHR_REG), 
        //    //                                  item.USER_CANC,
        //    //                                  string.Format("{0:dd/MM/yyyy}", item.DTHR_CANC)                
        //    //    });
        //    //}

        //    ////Monta Json de Retorno
        //    //JsonResult retorno = Json(new
        //    //{
        //    //    sEcho = param.sEcho,
        //    //    iTotalRecords = totalReg,
        //    //    iTotalDisplayRecords = totalReg,
        //    //    aaData = listaDados
        //    //},
        //    //JsonRequestBehavior.AllowGet);

        //    //return retorno;

        //    return null;
        //}



    }
}