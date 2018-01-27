using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using System;
using System.Collections.Generic;
using System.Linq;

using System.Web;

namespace InventoryWebApp
{
    public class AuthenticationTest
    {
        

        //public  string LoginUser(string emailUserName, string password)
        //{
        //    var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
        //    var signinManager = Context.GetOwinContext().GetUserManager<ApplicationSignInManager>();

        //    var result = signinManager.PasswordSignIn(emailUserName, password, false, shouldLockout: false);

        //    Response.Write(emailUserName + "<br/>" + password + "<br/>");

        //    switch (result)
        //    {
        //        case SignInStatus.Success:

        //            Response.Write("Succes");
        //            break;


        //        case SignInStatus.Failure:
        //        default:
        //            Response.Write("Fail");
        //            break;
        //    }

        //    return "";
        //}



        //public static bool ValidateUser(string Email, string Password)
        //{
        //    var user = UserManager.FindByName(Email);
        //    return SignInManager.UserManager.CheckPassword(user, Password);
        //}

    }
}