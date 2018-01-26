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
        //[WebGet(UriTemplate = "/login", ResponseFormat =WebMessageFormat.Json)]
        [WebInvoke(Method = "POST", UriTemplate = "/Login", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        LoginResult Login(LoginDetails details);
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
        public bool Result { get; set; }
        public string Name { get; set; }

        public LoginResult()
        {
            Result = false;
            Name = "";
        }
    }

}
