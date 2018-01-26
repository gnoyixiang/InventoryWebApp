using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Security;
using System.Web.Security;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "LoginService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select LoginService.svc or LoginService.svc.cs at the Solution Explorer and start debugging.
    public class LoginService : ILoginService
    {
        public LoginResult Login(LoginDetails details)
        {
            LoginResult result = new LoginResult();

            // ADD AUTHENTICATION LOGIC HERE 

            result.Result = Membership.ValidateUser(details.Email, details.Password);

            result.Name = "abc";

            //if (details.Email.Equals("test@test.com") && details.Password.Equals("test123"))
            //{
            //    result.Result = true;
            //    result.Name = "Mr.ABC";
            //}
            //else
            //{
            //    result.Result = false;
            //}



            return result;
        }
    }
}
