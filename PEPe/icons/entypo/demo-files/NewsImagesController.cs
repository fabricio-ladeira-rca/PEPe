using System;
using System.Collections;
using System.Reflection;
using System.Web.Mvc;
using Castle.ActiveRecord;
using randon_consorcios_volare_v1.ActionFilters;
using randon_consorcios_volare_v1.Controllers;
using randon_consorcios_volare_v1.Models;
using W3.Helper;

namespace randon_consorcios_volare_v1.Manager.Controllers
{
	[AuthenticationFilter]
    public class NewsImagesController : BaseController
    {
        public ActionResult List(string id)
        {
            if (!string.IsNullOrEmpty(id))
            {
                ViewData["images"] = NewsImage.FindAllByProperty("NewsId", TypeHelper.ToInt(id));
                ViewData["news"] = News.Find(TypeHelper.ToInt(id));
                return View();
            }
            else { 
                return RedirectToRoute("ManagerDefault", new { controller = "news", action = "list" });
            }
        }

        public ActionResult New() 
        {
            ViewData["actionPost"] = "create";
			return View("form");
        }

		[AcceptVerbs(HttpVerbs.Post)]
		public ActionResult Create([Bind(Exclude = "id")] NewsImage newsImage)
        {
            ViewData["actionPost"] = "create";
            
            try
            {
                News news = News.Find(TypeHelper.ToInt(RouteData.Values["id"]));
                if (news != null) {
                    newsImage.NewsId = news.Id;
                }

                newsImage.ImageFile = Request.Files["newsImage.imageFile"];
                
                if (newsImage.IsValid()){
                    newsImage.Create();
                    TempData["notice"] = "Foto cadastrada com sucesso.";
                    return RedirectToAction("list", new { id = RouteData.Values["id"]});
                }
				else
				{
					foreach (PropertyInfo pi in newsImage.PropertiesValidationErrorMessages.Keys)
					{
                        ModelState.AddModelError(pi.Name, ((ArrayList)newsImage.PropertiesValidationErrorMessages[pi])[0].ToString());
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
            ViewData["newsImage"] = NewsImage.Find(TypeHelper.ToInt(id));
         
			return View("form");
        }

		[AcceptVerbs(HttpVerbs.Post)]
        public ActionResult Update([Bind] NewsImage newsImage)
        {
            ViewData["actionPost"] = "update";
            try
            {
				if (Request.Files["newsImage.imageFile"].ContentLength > 0)
				{
					newsImage.ImageFile = Request.Files["newsImage.imageFile"];
				}

                if (newsImage.IsValid())
                {
                    newsImage.Update();

                    TempData["notice"] = "Foto atualizada com sucesso.";
                    return RedirectToAction("list", new { id = newsImage.NewsId });
                }
                else
                {
					foreach (PropertyInfo pi in newsImage.PropertiesValidationErrorMessages.Keys)
					{
						ModelState.AddModelError(pi.Name, ((ArrayList)newsImage.PropertiesValidationErrorMessages[pi])[0].ToString());
					}
                }
            }
            catch (Exception ex)
            {
                TempData["error"] = string.Format("Erro ao salvar dados no banco <!-- {0} -->", ex.Message);
            }
			ViewData["newsImage"] = NewsImage.Find(newsImage.Id);
			return View("form");
        }

		public ActionResult Destroy(string id)
		{
            string newsId;
            NewsImage newsImage = NewsImage.Find(TypeHelper.ToInt(id));
            newsId = newsImage.NewsId.ToString();
			try
			{	
				newsImage.Delete();   
				TempData["notice"] = "Foto '" + newsImage.Name + "' excluída com sucesso.";
			}
			catch (NotFoundException)
			{
				TempData["warning"] = "Este registro não existe na base dados, ele pode ter sido apagado anteriormente";
			}
			catch (Exception ex)
			{
				TempData["error"] = string.Format("Erro ao tentar excluir registo <!-- {0} -->", ex.InnerException.Message);
			}

            return RedirectToRoute("ManagerIndex", new { action = "news/edit/" + newsId });
		}
	}
}