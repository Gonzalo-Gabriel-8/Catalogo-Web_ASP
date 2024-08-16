using System;
using System.Web.UI;
using System.Web.Optimization;

namespace Catalogo_Web
{
    public class Global : System.Web.HttpApplication
    {


        protected void Application_Start(object sender, EventArgs e)
        {
            string JQueryVer = "1.11.3";
            ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            {
                Path = "~/js/jquery-" + JQueryVer + ".min.js",
                DebugPath = "~/js/jquery-" + JQueryVer + ".js",
                CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".min.js",
                CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".js",
                CdnSupportsSecureConnection = true,
                LoadSuccessExpression = "window.jQuery"
            });
        }
        void application_Error(object sender, EventArgs e)
        {
            Exception exc = Server.GetLastError();
            Session.Add("error", exc.ToString());
            Response.Redirect("../Vistas/Error.aspx", false);
        }

    }
}