using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Selectors;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.Security.Principal;
using System.Diagnostics;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.AspNet.Identity;
using InventoryWebApp.Models;
using System.IdentityModel;
namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "LoginService" in code, svc and config file together.
    // NOTE: In order to launch WCF Test Client for testing this service, please select LoginService.svc or LoginService.svc.cs at the Solution Explorer and start debugging.
    public class LoginService : UserNamePasswordValidator, ILoginService
    {
        public LoginResult Login(LoginDetails details)
        {
            LoginResult result = new LoginResult();

            // ADD AUTHENTICATION LOGIC HERE 



            //  result.Name = "abc";

            //if (details.Email.Equals("test@test.com") && details.Password.Equals("test123"))
            //{
            //    result.Result = true;
            //    result.Name = "Mr.ABC";
            //}
            //else
            //{
            //    result.Result = false;
            //}
            try
            {
                Validate(details.Email, details.Password);
                result.Result = true;
                result.Name = "MS.ABC";

                return result;
            }
            catch (FaultException e)
            {
                result.Result = false;
                return result;
            }


            //return result;
        }
        public override  void Validate(string userName, string password)
        {
            using (var context = new IdentityDbContext())
            {
                using (var userManager = new UserManager<ApplicationUser>(new UserStore<ApplicationUser>(context)))
                {
                    var user = userManager.Find(userName, password);
                    if (user == null)
                    {
                        
                        var msg = String.Format("Unknown Username {0} or incorrect password {1}", userName, password);
                        Trace.TraceWarning(msg);
                        throw new FaultException(msg);//the client actually will receive MessageSecurityException. But if I throw MessageSecurityException, the runtime will give FaultException to client without clear message.
                    }
                }

            }
        }

        LoginResult ILoginService.Validate(LoginDetails details)
        {
            LoginResult result = new LoginResult();
            try
            {
                //Validate(details.Email, details.Password);
                //result.Result = true;
                //result.Name = "MS.ABC";
                if (details.Email.Equals("cc@gmail.com") && details.Password.Equals("test123"))
                {
                    result.Result = true;
                    result.Name = "Mr.ABC";
                }
                else
                {
                    result.Result = false;
                }
                return result;
            }
            catch(FaultException e)
            {
                result.Result = false;
                return result;
            }

        }
    }
}
