using System;
using System.Collections;
using System.Reflection;
using System.Web.Mvc;
using Castle.ActiveRecord;
using NHibernate.Criterion;
using randon_consorcios_volare_v1.ActionFilters;
using randon_consorcios_volare_v1.Controllers;
using randon_consorcios_volare_v1.Models;
using W3.Helper;

namespace randon_consorcios_volare_v1.Manager.Controllers
{
	[AuthenticationFilter]
    public class HighlightController : BaseController
    {
        public ActionResult List()
        {
            ViewData["allHighlight"] = Highlight.FindAll(Order.Desc("Id"));
			return View();
        }

        public ActionResult New() 
        {
            ViewData["actionPost"] = "create";
            return View("form");
        }

		[AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Exclude = "id")] Highlight highlight)
        {
            ViewData["actionPost"] = "create";
            try
            {
                highlight.HighlightFile = Request.Files["highlight.highlightFile"];
                if (highlight.IsValid())
                {
                    highlight.Create();
                    TempData["notice"] = "Destaque criado com sucesso.";
                    return RedirectToAction("list");
                }
				else
				{
                    foreach (PropertyInfo pi in highlight.PropertiesValidationErrorMessages.Keys)
					{
                        ModelState.AddModelError(pi.Name, ((ArrayList)highlight.PropertiesValidationErrorMessages[pi])[0].ToString());
					}
				}
            }
            catch(Exception ex)
            {
				TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }
            return View("form");
        }


        public ActionResult Edit(string id)
        {
            ViewData["actionPost"] = "update";
            ViewData["highlight"] = Highlight.Find(TypeHelper.ToInt(id));
            return View("form");
        }

		[AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update([Bind] Highlight highlight)
        {
            ViewData["actionPost"] = "update";
            try
            {
                if (Request.Files["highlight.highlightFile"].ContentLength > 0)
				{
                    highlight.HighlightFile = Request.Files["highlight.highlightFile"];
				}

                if (highlight.IsValid())
                {
                    highlight.Update();

                    TempData["notice"] = "Destaque atualizado com sucesso.";
                    return RedirectToAction("list");
                }
                else
                {
                    foreach (PropertyInfo pi in highlight.PropertiesValidationErrorMessages.Keys)
					{
                        ModelState.AddModelError(pi.Name, ((ArrayList)highlight.PropertiesValidationErrorMessages[pi])[0].ToString());
					}
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }

            ViewData["highlight"] = Highlight.Find(highlight.Id);
            return View("form");
        }

		public ActionResult Destroy(string id)
		{
			try
			{
                Highlight highlight = Highlight.Find(TypeHelper.ToInt(id));
                highlight.Delete();
                TempData["notice"] = "Destaque '" + highlight.Title + "' excluída com sucesso.";
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