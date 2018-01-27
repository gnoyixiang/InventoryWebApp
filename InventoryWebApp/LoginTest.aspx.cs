using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class LoginTest1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            //var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();
            string emailUserName = Request["User"]??"";
            string password = Request["Password"]??"";

            LoginUser( emailUserName, password);
            // This doen't count login failures towards account lockout
            // To enable password failures to trigger lockout, change to shouldLockout: true
            //var result = signinManager.PasswordSignIn(emailUserName, password, false, shouldLockout: false);

            //Response.Write(emailUserName + "<br/>" + password + "<br/>");

            //switch (result)
            //{
            //    case SignInStatus.Success:

            //        Response.Write("Succes");
            //        break;


            //    case SignInStatus.Failure:
            //    default:
            //        Response.Write("Fail");
            //        break;
            //}

        }


        public  string LoginUser(string emailUserName, string password)
        {
            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

            var result = signinManager.PasswordSignIn(emailUserName, password, false, shouldLockout: false);

            Response.Write(emailUserName + "<br/>" + password + "<br/>");

            switch (result)
            {
                case SignInStatus.Success:

                    Response.Write("Succes");
                    break;


                case SignInStatus.Failure:
                default:
                    Response.Write("Fail");
                    break;
            }

            return "";
        }
    }
}