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
    public class FaqController : BaseController
    {
        public ActionResult List()
        {
            ViewData["faqs"] = Faq.FindAll(Order.Desc("Id"));
            return View();
        }

        public ActionResult New()
        {
            ViewData["actionPost"] = "create";
            return View("form");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Exclude = "id")] Faq faq)
        {
            try
            {
                if (faq.IsValid())
                {
                    faq.Create();

                    TempData["notice"] = "FAQ criada com sucesso.";
                    return RedirectToAction("list");
                }
                else
                {
                    foreach (PropertyInfo pi in faq.PropertiesValidationErrorMessages.Keys)
                    {
                        ModelState.AddModelError(pi.Name, ((ArrayList)faq.PropertiesValidationErrorMessages[pi])[0].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }
            ViewData["actionPost"] = "create";
            return View("form");
        }

        public ActionResult Edit(string id)
        {
            ViewData["actionPost"] = "update";
            try
            {
                Faq faq = Faq.Find(TypeHelper.ToInt(id));
                ViewData["faq"] = faq;

                return View("form");
            }
            catch (NotFoundException)
            {
                TempData["warning"] = "Este registro não foi encontrado, não sendo possível ser editado.";
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao tentar excluir registo <!-- {0} -->", ex.Message);
            }
            return RedirectToAction("list");
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update([Bind] Faq faq)
        {
            try
            {
                if (faq.IsValid())
                {
                    faq.Update();
                    TempData["notice"] = "FAQ atualizado com sucesso.";
                    return RedirectToAction("list");
                }
                else
                {
                    ViewData["actionPost"] = "update";
                    ViewData["validation"] = faq.ValidationErrorMessages;
                    ViewData["num"] = faq.ValidationErrorMessages.Length;
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }
            return View("form");
        }

        public ActionResult Destroy(string id)
        {
            try
            {
                Faq faq = Faq.Find(TypeHelper.ToInt(id));
                faq.Delete();
                TempData["notice"] = "FAQ '" + faq.Question + "' excluída com sucesso.";
            }
            catch (NotFoundException)
            {
                TempData["warning"] = "Este registro não existe na base dados, ele pode ter sido apagado anteriormente";
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao tentar excluir registo <!-- {0} -->", ex.InnerException.Message);
            }
            return RedirectToAction("list");
        }
    }
}