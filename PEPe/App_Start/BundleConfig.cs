using System.Web;
using System.Web.Optimization;

namespace PEPe
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {

            // JS
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Scripts/jquery-{version}.js",
                        "~/Scripts/vendor/jquery.cookie.js",
                        "~/Scripts/vendor/moment.min.js",
                        "~/Scripts/vendor/jquery.cookie.js",
                        "~/Scripts/vendor/jquery.cookie.js",
                        "~/Scripts/vendor/jquery.cookie.js",
                        "~/Scripts/vendor/jquery.flot/jquery.flot.js",
                        "~/Scripts/vendor/jquery.flot/jquery.flot.time.js",
                        "~/Scripts/vendor/jquery.flot/jquery.flot.tooltip.js",
                        "~/Scripts/jquery.mockjax.js",
                        "~/Scripts/jquery.autocomplete.js"
                        ));


            // Use the development version of Modernizr to develop with and learn from. Then, when you're
            // ready for production, use the build tool at http://modernizr.com to pick only the tests you need.
            bundles.Add(new ScriptBundle("~/bundles/modernizr").Include(
                        "~/Scripts/modernizr-*"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap").Include(
                      "~/Scripts/bootstrap/bootstrap.min.js",
                      "~/Scripts/respond.js",
                      "~/Scripts/vendor/bootstrap-datepicker.js"));


            bundles.Add(new ScriptBundle("~/bundles/thema").Include(
                            "~/Scripts/theme.js",
                            "~/Scripts/vendor/raphael-min.js",
                            "~/Scripts/vendor/jquery.dataTables.min.js",
                            "~/Scripts/vendor/morris.min.js",
                            "~/Scripts/vendor/bootstrap-datepicker.js",
                            "~/Scripts/vendor/jquery.validate.min.js",
                            "~/Scripts/vendor/jquery.maskedinput.js",
                            "~/Scripts/vendor/summernote.min.js",
                            "~/Scripts/vendor/jquery.raty.js",
                            "~/Scripts/vendor/jquery.cookie.js",
                            "~/Scripts/vendor/jquery.minicolors.min.js",
                            "~/Scripts/vendor/jquery.maskedinput.js",
                            "~/Scripts/vendor/locales/bootstrap-datepicker.pt-BR.js",
                            "~/Scripts/vendor/messenger/messenger.min.js",
                            "~/Scripts/vendor/messenger/messenger-theme-flat.js"
                            ));


            bundles.Add(new ScriptBundle("~/bundles/login").Include(
                         "~/Scripts/Login/login.js"
                         ));


            bundles.Add(new ScriptBundle("~/Areas/PEPe").Include(
                     "~/Content/Scripts/Areas/PEPe.js"
                     ));

            bundles.Add(new ScriptBundle("~/TimeLine").Include(
                     "~/Scripts/jquery.timelinr-0.9.54.js"
                     ));

            //CSS
            bundles.Add(new StyleBundle("~/css/bootstrap").Include(
                      "~/css/bootstrap/bootstrap.css"));


            bundles.Add(new StyleBundle("~/css/bootstrap").Include(
                      "~/css/bootstrap/bootstrap.css"));

            bundles.Add(new StyleBundle("~/css/thema").Include(
                    "~/css/compiled/theme.css",
                    "~/css/vendor/animate.css",
                    "~/css/vendor/brankic.css",
                    "~/css/vendor/ionicons.min.css",
                    "~/css/vendor/font-awesome.min.css",
                    "~/css/vendor/morris.css",
                    "~/css/vendor/jquery.dataTables.css",
                    "~/css/vendor/datepicker.css",
                    "~/css/vendor/select2.css",
                    "~/css/vendor/select2-bootstrap.css",
                    "~/css/vendor/jquery.minicolors.css",
                    "~/css/vendor/summernote.css",
                    "~/css/vendor/messenger/messenger.css",
                    "~/css/vendor/messenger/messenger-theme-flat.css"
                    ));


            bundles.Add(new StyleBundle("~/time-line.css").Include("~/Content/css/style.-time-line.css"));

        }
    }
}
