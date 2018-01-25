using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IClerkService" in both code and config file together.
    [ServiceContract]
    public interface IClerkService
    {
        [OperationContract]
        [WebGet(UriTemplate = "/OutstandingRequests", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_Request> GetOutstandingRequests();
    }

    [DataContract]
    public class WCF_Request
    {
        private string requestCode;

        private string departmentName;

        private string status;

        public WCF_Request(string requestCode, string departmentName, string status)
        {
            this.requestCode = requestCode;
            this.departmentName = departmentName;
            this.status = status;
        }
        [DataMember]
        public string RequestCode
        {
            get { return requestCode; }
            set { requestCode = value; }
        }
        [DataMember]
        public string DepartmentName
        {
            get { return departmentName; }
            set { departmentName = value; }
        }
        [DataMember]
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}
