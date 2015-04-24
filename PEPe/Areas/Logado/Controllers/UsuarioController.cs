using PEPe.BusinessObject;
using PEPe.DataAccessModel;
using PEPe.Areas.Logado.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PEPe.Areas.Logado.Controllers
{
    public class UsuarioController : Controller
    {
        // GET: Logado/Usuario
        public ActionResult Index()
        {
            return View();
        }


        public ActionResult ConsultaUsuarios(jQueryDataTableParamModel param)
        {

            //Monta palavra chave
            string palavraChave = (param.sSearch != null) ? param.sSearch.ToString() : string.Empty;

            //Cria Instancia da BO de motorista
            UsuarioBO usuarioBO = new UsuarioBO();

            //Retorna total de registros para monstar a paginação
            int totalReg = usuarioBO.TotalRegistros(palavraChave);

            //Corrige calculo paginação
            int skip = param.iDisplayStart;
            int take = param.iDisplayLength;


            //Consulta dados no banco
            var result = usuarioBO.ListarAgendamentosPaginado(palavraChave, skip, take);


            //Formata saida dos dados para funcionar no DataGrid obrigatório colocar todos parametros que vão aparecer lá
            List<string[]> listaDados = new List<string[]>();
            foreach (var item in result)
            {
                listaDados.Add(new string[] { item.Id.ToString(),                                              
                                              item.Nome,
                                              item.Id.ToString(),                                              
                                              item.Id.ToString()

                });
            }

            //Monta Json de Retorno
            JsonResult retorno = Json(new
            {
                sEcho = param.sEcho,
                iTotalRecords = totalReg,
                iTotalDisplayRecords = totalReg,
                aaData = listaDados
            },
            JsonRequestBehavior.AllowGet);

            return retorno;


        }


        public ActionResult UsuarioDetalhe(int? id)
        {
            UsuarioBO usuarioBO = new UsuarioBO();
            Usuario retorno = new Usuario();

            if(id != null)
                retorno = usuarioBO.ConsultaUsuario(Convert.ToInt32(id));
          

            return View("UsuarioDetalhe", retorno);
        }

        [HttpPost]
        public ActionResult UsuarioSalvar(Usuario usuario)
        {

            UsuarioBO usuarioBO = new UsuarioBO();
            usuarioBO.Salvar(usuario);
                        
            return View("Index");
        }


        public ActionResult UsuarioExcluir(int? id)
        {
            UsuarioBO usuarioBO = new UsuarioBO();
            Usuario retorno = new Usuario();

            if (id != null)
                usuarioBO.Excluir(Convert.ToInt32(id));

            return View("Index");
        }



    }
}