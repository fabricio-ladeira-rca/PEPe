using System.Web.Mvc;
using randon_consorcios_volare_v1.ActionFilters;

namespace randon_consorcios_volare_v1.Manager.Controllers
{
	[AuthenticationFilter]
    public class ManagerController : Controller
    {
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Login() 
        {
            ViewData["bodyId"] = "login";
            return View();
        }
    }
}