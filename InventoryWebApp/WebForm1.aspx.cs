using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.WCF;
namespace InventoryWebApp
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            LoginService s = new LoginService();
            LoginDetails d = new LoginDetails();
            d.Email = "nathalie@ssis.edu.sg";
            d.Password = "!Passw0rd";

            LoginResult r = s.Login(d);
            Label1.Text = r.RoleCode + r.Result;




        }
    }
}