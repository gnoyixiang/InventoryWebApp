using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using Microsoft.AspNet.Identity;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp
{
    public partial class Layout : System.Web.UI.MasterPage
    {
        EmployeeController employeeController = new EmployeeController();
        DepartmentHeadController deptHeadController = new DepartmentHeadController();
        StoreClerkController storeClerkController = new StoreClerkController();

        private string userDepartmentCode = "";
        private string tempRoleCode = "";
        
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        public string UserDepartmentCode
        {
            get { return userDepartmentCode; }
        }
        public string TempRoleCode
        {
            get { return tempRoleCode; }
        }

        protected void Page_Init(object sender, EventArgs e)
        {
            // The code below helps to protect against XSRF attacks
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                // Use the Anti-XSRF token from the cookie
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                // Generate a new Anti-XSRF token and save to the cookie
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
            if (!String.IsNullOrEmpty(Context.User.Identity.Name))
            {
                userDepartmentCode = employeeController.GetDeptCodeByUserName(Context.User.Identity.Name);
                Department department = storeClerkController.GetDeptByCode(userDepartmentCode);
                Employee employee = employeeController.GetEmployeeByUsername(Context.User.Identity.Name);

                if (employee != null)
                {
                    AssignRole assignRole = deptHeadController.ListAssignRole().Where(ar => ar.EmployeeCode == employee.EmployeeCode).FirstOrDefault();
                    if (assignRole != null)
                    {
                        if (assignRole.TemporaryRoleCode == "Rep")
                        {
                            tempRoleCode = assignRole.TemporaryRoleCode;
                        }
                        else if (DateTime.Now.Date >= Convert.ToDateTime(assignRole.StartDate).Date 
                            && DateTime.Now.Date <= Convert.ToDateTime(assignRole.EndDate).Date)
                        {
                            tempRoleCode = assignRole.TemporaryRoleCode;
                        }
                    }
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
              
        }

        

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }

        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        public string GetEmployeeName(string username)
        {
            return employeeController.GetEmployeeNameByUserName(username);
        }

        public bool IsTempRoleCode(string tempRoleCode)
        {
            if (this.tempRoleCode == tempRoleCode)
            {
                return true;
            }
            return false;
        }
        
    }


}