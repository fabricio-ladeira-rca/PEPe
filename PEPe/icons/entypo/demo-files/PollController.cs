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
    public class PollController : BaseController
    {
        public ActionResult List()
        {
            ViewData["polls"] = Poll.FindAll(Order.Desc("Id"));
            return View();
        }

        public ActionResult New()
        {
            return View();
        }

        [AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Create([Bind(Exclude = "id")] Poll poll,
            [Bind(Exclude = "id")] PollAnswer answer1, [Bind(Exclude = "id")] PollAnswer answer2,
            [Bind(Exclude = "id")] PollAnswer answer3, [Bind(Exclude = "id")] PollAnswer answer4,
            [Bind(Exclude = "id")] PollAnswer answer5)
        {
            try
            {

                int answers = string.IsNullOrEmpty(answer1.Description) ? 0 : 1;
                answers += string.IsNullOrEmpty(answer2.Description) ? 0 : 1;
                answers += string.IsNullOrEmpty(answer3.Description) ? 0 : 1;
                answers += string.IsNullOrEmpty(answer4.Description) ? 0 : 1;
                answers += string.IsNullOrEmpty(answer5.Description) ? 0 : 1;

                if (answers < 2)
                {
                    TempData["error"] = "É preciso cadastrar ao menos 2 respostas";
                    return View("new");
                }

                poll.AddAnswer(answer1);
                poll.AddAnswer(answer2);
                poll.AddAnswer(answer3);
                poll.AddAnswer(answer4);
                poll.AddAnswer(answer5);

                if (poll.IsValid())
                {
                    poll.Create();

                    TempData["notice"] = "Enquete criada com sucesso.";
                    return RedirectToAction("list");
                }
                else
                {
                    foreach (PropertyInfo pi in poll.PropertiesValidationErrorMessages.Keys)
                    {
                        ModelState.AddModelError(pi.Name, ((ArrayList)poll.PropertiesValidationErrorMessages[pi])[0].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }

            return View("new");
        }

        public ActionResult Edit(string id)
        {
            try
            {
                Poll poll = Poll.Find(TypeHelper.ToInt(id));
                ViewData["poll"] = poll;

                int index = 0;
                foreach (PollAnswer answer in poll.Answers)
                {
                    ViewData[string.Format("answer{0:D}", ++index)] = answer;
                }

                return View();
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
        public ActionResult Update([Bind] Poll poll,
            [Bind] PollAnswer answer1, [Bind] PollAnswer answer2,
            [Bind] PollAnswer answer3, [Bind] PollAnswer answer4,
            [Bind] PollAnswer answer5)
        {
            try
            {
                int answers = string.IsNullOrEmpty(answer1.Description) ? 0 : 1;
                answers += string.IsNullOrEmpty(answer2.Description) ? 0 : 1;
                answers += string.IsNullOrEmpty(answer3.Description) ? 0 : 1;
                answers += string.IsNullOrEmpty(answer4.Description) ? 0 : 1;
                answers += string.IsNullOrEmpty(answer5.Description) ? 0 : 1;

                if (answers < 2)
                {
                    TempData["error"] = "É preciso cadastrar ao menos 2 respostas";
                }
                else if (poll.IsValid())
                {
                    poll.UpdateAnswer(answer1);
                    poll.UpdateAnswer(answer2);
                    poll.UpdateAnswer(answer3);
                    poll.UpdateAnswer(answer4);
                    poll.UpdateAnswer(answer5);

                    poll.Update();

                    TempData["notice"] = "Enquete atualizada com sucesso.";
                    return RedirectToAction("list");
                }
                else
                {
                    ViewData["validation"] = poll.ValidationErrorMessages;
                    ViewData["num"] = poll.ValidationErrorMessages.Length;
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }
            return View("edit");
        }

        public ActionResult Destroy(string id)
        {
            try
            {
                Poll poll = Poll.Find(TypeHelper.ToInt(id));
                poll.Delete();
                TempData["notice"] = "Enquete '" + poll.Question + "' excluída com sucesso.";
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

        public ActionResult Result(string id)
        {
            ViewData["poll"] = Poll.Find(TypeHelper.ToInt(id));
            return View();
        }
    }

}