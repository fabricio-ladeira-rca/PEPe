using System;
using randon_consorcios_volare_v1.Controllers;
using System.Security.Cryptography;
using System.Text;
using randon_consorcios_volare_v1.Helpers;
using System.Linq;
using System.Web.Mvc;

namespace randon_consorcios_volare_v1.Manager.Controllers
{
    public class UserSessionController : BaseController
    {
        public ActionResult Create(string email, string password)
        {
            if (email == "randon@randon.com.br" && password == "randon2@1@")
            {
				string loginValues = string.Format("{0}{1}{2}", email, password, DateTime.Now);
				Session["login_hash"] = loginValues.MD5();
                Session["email"] = email;
                Session["password"] = password;
                return RedirectToAction("index", "manager");
            }

            TempData["error"] = "Usuário ou senha inválido";
            return RedirectToAction("login", "manager");
        }

        public ActionResult Destroy() {
			Session.Remove("email");
			Session.Remove("password");
			Session.Abandon();
			return RedirectToAction("login", "manager");
        }
    }
}
