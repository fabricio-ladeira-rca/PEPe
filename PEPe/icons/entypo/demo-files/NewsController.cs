using System;
using System.Collections;
using System.Collections.Generic;
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
    public class NewsController : BaseController
    {
        public ActionResult List()
        {
            List<ICriterion> criteria = new List<ICriterion>();
            String title = string.Empty;
            Int32 id = 0;

            if (!string.IsNullOrEmpty(Request["id"]) && Int32.TryParse(Request["id"], out id))
            {
                criteria.Add(Expression.Eq("Id", id));
            }

            if (!string.IsNullOrEmpty(Request["title"]))
            {
                title = Request["title"].Trim();
                criteria.Add(Expression.Like("Title", String.Format("%{0}%", title)));
            }

            ViewData["actionPost"] = "list";
            ViewData["allNews"] = News.FindAll(new Order[] { Order.Desc("PostedAt"), Order.Desc("Id") }, criteria.ToArray());
            ViewData["title"] = title;
            ViewData["id"] = (id == 0) ? "" : id.ToString();
            
			return View();
        }

        public ActionResult New() 
        {
            ViewData["actionPost"] = "create";
			return View("form");
        }

		[AcceptVerbs(HttpVerbs.Post)]
		public ActionResult Create([Bind(Exclude = "id")] News news)
        {
            ViewData["actionPost"] = "create";

            try
            {
                bool hasImage = (Request.Files["image"] != null && Request.Files["image"].ContentLength > 0);

                if (news.IsValid())
                {
                    if (hasImage && string.IsNullOrEmpty(Request["subtitle"]))
                    {
                        ModelState.AddModelError("image_subtitle", "Legenda não pode ser nulo");
                        return View("form");
                    }

                    news.Create();

                    if (hasImage)
                    {
                        NewsImage photo = new NewsImage();
                        photo.NewsId = news.Id;
                        photo.ImageFile = Request.Files["image"];
                        photo.Legend = Request["subtitle"];
                        if (photo.IsValid())
                        {
                            photo.Create();
                        }
                    }

                    TempData["notice"] = "Notícia criada com sucesso.";
                    return RedirectToAction("list");
                }
                else
                {
                    foreach (PropertyInfo pi in news.PropertiesValidationErrorMessages.Keys)
                    {
                        ModelState.AddModelError(pi.Name, ((ArrayList)news.PropertiesValidationErrorMessages[pi])[0].ToString());
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
            ViewData["news"] = News.Find(TypeHelper.ToInt(id));
			return View("form");
        }

		[AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update([Bind] News news)
        {
            ViewData["actionPost"] = "update";
            try
            {
                bool hasImage = (Request.Files["image"] != null && Request.Files["image"].ContentLength > 0);

                if (news.IsValid())
                {
                    if (hasImage && string.IsNullOrEmpty(Request["subtitle"]))
                    {
                        ModelState.AddModelError("image_subtitle", "Legenda não pode ser nulo");
                        ViewData["news"] = News.Find(news.Id);
                        return View("form");
                    }

                    news.Update();

                    if (hasImage)
                    {
                        NewsImage photo = new NewsImage();
                        photo.NewsId = news.Id;
                        photo.ImageFile = Request.Files["image"];
                        photo.Legend = Request["subtitle"];
                        if (photo.IsValid())
                        {
                            photo.Create();
                        }
                    }

                    TempData["notice"] = "Notícia atualizada com sucesso.";
                    return RedirectToAction("list");
                }
                else
                {
                    foreach (PropertyInfo pi in news.PropertiesValidationErrorMessages.Keys)
                    {
                        ModelState.AddModelError(pi.Name, ((ArrayList)news.PropertiesValidationErrorMessages[pi])[0].ToString());
                    }
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }

            ViewData["news"] = News.Find(news.Id);
            return View("form");
        }

		public ActionResult Destroy(string id)
		{
			try
			{
				News news = News.Find(TypeHelper.ToInt(id));
				news.Delete();
				TempData["notice"] = "Notícia '" + news.Title + "' excluída com sucesso.";
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