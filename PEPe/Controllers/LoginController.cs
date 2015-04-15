using PEPe.BusinessObject;
using PEPe.DataAccessModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace PEPe.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /Login/
        public ActionResult Index()
        {
            ModelState.AddModelError("", "");

            return View();
        }


        public ActionResult Logar(string login, string senha)
        {
            //ModelState.AddModelError("Login", "Error");
            LoginBO loginbo = new LoginBO();
            UsuarioLogadoModel user = loginbo.Login(login,senha);

            if (user != null && user.Logado)
            {
                Session["user"] = user;
                return RedirectToAction("Index", "Home", new { area = "Logado" });
            }
            else
            {
                ViewBag.Erro = "Login ou Senha Invalido!";
            }


            return View("Index");
        }

	}
}