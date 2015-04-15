using System;
using System.Collections;
using System.Reflection;
using System.Web.Mvc;
using Castle.ActiveRecord;
using NHibernate.Criterion;
using randon_consorcios_volare_v1.ActionFilters;
using randon_consorcios_volare_v1.Controllers;
using W3.Helper;

namespace randon_consorcios_volare_v1.Manager.Controllers
{
    [AuthenticationFilter]
    public class AssemblyController : BaseController
    {
        public ActionResult List()
        {
            Order order = new Order("Date", false);
            ViewData["assemblies"] = randon_consorcios_volare_v1.Models.Assembly.FindAll(new Order[] { order });
            return View();
        }

        public ActionResult New()
        {
            ViewData["actionPost"] = "create";
            return View("form");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Exclude = "id")] randon_consorcios_volare_v1.Models.Assembly assembly)
        {
            ViewData["actionPost"] = "create";
            try
            {
                randon_consorcios_volare_v1.Models.Assembly assembleia = assembly;
    
                if (assembly.IsValid())
                {
                    assembly.Create();
                    TempData["notice"] = "Assembléia adicionada com sucesso.";
                    return RedirectToAction("list");
                }
                else
                {
                    foreach (PropertyInfo pi in assembly.PropertiesValidationErrorMessages.Keys)
                    {
                        ModelState.AddModelError(pi.Name, ((ArrayList)assembly.PropertiesValidationErrorMessages[pi])[0].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }
            return View("form");
        }


        public ActionResult Edit(string id)
        {
            ViewData["actionPost"] = "update";
            ViewData["assembly"] = randon_consorcios_volare_v1.Models.Assembly.Find(TypeHelper.ToInt(id));
            return View("form");
        }

        public ActionResult Destroy(string id)
        {
            try
            {
                randon_consorcios_volare_v1.Models.Assembly assembly = randon_consorcios_volare_v1.Models.Assembly.Find(TypeHelper.ToInt(id));
                assembly.Delete();
                TempData["notice"] = "Assembléia '" + assembly.Date + "' excluída com sucesso.";
            }
            catch (NotFoundException)
            {
                TempData["warning"] = "Este registro não existe na base dados, ele pode ter sido apagado anteriormente";
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao tentar excluir registo <!-- {0} -->", ex.InnerException.Message);
            }
            return RedirectToRoute("ManagerDefault", new { action = "list" });
        }
    }
}