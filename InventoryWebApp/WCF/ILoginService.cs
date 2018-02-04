using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Web;
namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ILoginService" in both code and config file together.
    [ServiceContract]
    public interface ILoginService
    {

        [OperationContract]
        [WebInvoke(UriTemplate = "/Login", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        LoginResult Login(LoginDetails details);
        bool ValidateUser(string userName, string password);

    }
    [DataContract]
    public class LoginDetails
    {
        [DataMember]
        public string Email
        {
            get; set;
        }

        [DataMember]
        public string Password
        {
            get; set;
        }
    }

    public class LoginResult
    {
        private bool result;
        private string departmentCode;
        private string roleCode;
        private string empName;

        [DataMember]
        public bool Result
        {
            get { return result; }
            set { result = value; }
        }
        [DataMember]
        public string DepartmentCode
        {
            get { return departmentCode; }
            set { departmentCode = value; }
        }
        [DataMember]
        public string RoleCode
        {
            get { return roleCode; }
            set { roleCode = value; }
        }
        [DataMember]
        public string EmpName
        {
            get { return empName; }
            set { empName = value; }
        }
        public LoginResult()
        {

        }
    }

}