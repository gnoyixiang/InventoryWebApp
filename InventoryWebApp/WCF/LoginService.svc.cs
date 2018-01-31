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
        EmployeeController controller = new EmployeeController();
        StoreSupervisorController sController = new StoreSupervisorController();

        public bool ValidateUser(string userName,string password)
        {
            try
            {
                Validate(userName, password);
                return true;
            }
            catch(Exception excep)
            {
                return false;
            }
        }
        public LoginResult Login(LoginDetails detail)
        {
            LoginResult result = new LoginResult();

            try
            {
                Validate(detail.Email, detail.Password);
              
                Employee em = controller.GetEmployee(detail.Email);
              
                string temporaryCode = sController.GetTemporaryRole(em.EmployeeCode);
               
                if (temporaryCode != null)
                {
                    DateTime start = sController.GetTemporaryRoleStartDate(sController.GetAssignRoleCode(em.EmployeeCode));
                    DateTime end = sController.GetTemporaryRoleEndDate(sController.GetAssignRoleCode(em.EmployeeCode));

                    // string sdate = DateTime.Now.ToString("yyyyMMdd");

                    //DateTime startDate = DateTime.Parse(sdate);

                    if (DateTime.Now.Date >= start.Date && DateTime.Now.Date <= end.Date)
                    {
                        result.RoleCode = temporaryCode;
                    }
                    
                    
                }
                else
                {
                    result.RoleCode = controller.GetRole(detail.Email).Id;
                }

                result.DepartmentCode = em.DepartmentCode;
                result.Result = true;
                result.EmpName = em.EmployeeName;

                return result;
            }
            catch (FaultException e)
            {
                result.Result = false;
                return result;
            }

        }
        public override void Validate(string userName, string password)
        {
            using (var context = new ApplicationDbContext())
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
    }
}
