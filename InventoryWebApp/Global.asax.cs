using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace InventoryWebApp
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            //System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition
            //    ("jquery",
            //     new System.Web.UI.ScriptResourceDefinition
            //     {
            //         Path = "~/scripts/jquery-1.12.4.min.js",
            //         DebugPath = "~/scripts/jquery-1.12.4.js",
            //         CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.12.4.min.js",
            //         CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.12.4.js"
            //     }
            //    );
        }
    }
}