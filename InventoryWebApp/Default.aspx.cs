using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Context.User.Identity.Name != "")
            {
                if(Context.User.IsInRole("Store Clerk") || Context.User.IsInRole("Store Supervisor") || Context.User.IsInRole("Store Manager"))
                {
                    Response.Redirect("/Store/Home");
                }
                if (Context.User.IsInRole("Employee") || Context.User.IsInRole("Department Head"))
                {
                    Response.Redirect("/Dept/Home");
                }
            }
        }
    }
}