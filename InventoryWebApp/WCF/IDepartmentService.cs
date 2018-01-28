using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IDepartmentService" in both code and config file together.
    [ServiceContract]
    public interface IDepartmentService
    {

        [OperationContract]
        [WebGet(UriTemplate = "/List", ResponseFormat = WebMessageFormat.Json)]
        List<WCFRequest> ListAllPendingRequest();

        [OperationContract]
        [WebGet(UriTemplate = "/Detail/{code}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFRequestDetail> ListRequestDetail(string code);

        [OperationContract]
        [WebInvoke(UriTemplate = "/Update", Method = "POST",RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        void Update(WCFRequest r);


    }

    [DataContract]
    public class WCFRequest
    {
        
        private String requestCode;        
        private String departmentCode;        
        private String dateCreated;               
        private String status;        
        private String notes;        
        private String userName;
        private String empName;
        private String approvedBy;
        private String headRemark;
       

        public WCFRequest(String requestCode, String departmentCode, String dateCreated,
            String status, String notes,String userName,String empName)  
            
        {

            this.requestCode = requestCode;
            this.departmentCode = departmentCode;
            this.dateCreated = dateCreated;
            this.status = status;
            this.notes = notes;
            this.userName = userName;
            this.empName = empName;
           
        }
       
        [DataMember]
        public string RequestCode
        {
            get { return requestCode; }
            set { requestCode = value; }
        }
        [DataMember]
        public string DepartmentCode
        {
            get { return departmentCode; }
            set {departmentCode = value; }
        }

        [DataMember]
        public string DateCreated
        {
            get { return dateCreated; }
            set { dateCreated = value; }
        }

        [DataMember]
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
        [DataMember]
        public string Notes
        {
            get { return notes; }
            set { notes = value; }
        }
        [DataMember]
        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        [DataMember]
        public string EmpName
        {
            get { return empName; }
            set { empName = value; }
        }

        [DataMember]
        public string ApprovedBy
        {
            get { return approvedBy; }
            set { approvedBy = value; }
        }

        [DataMember]
        public string HeadRemark
        {
            get { return headRemark; }
            set { headRemark = value; }
        }
    }

    [DataContract]
    public class WCFRequestDetail
    {

        private String itemCode;
        private String quantity;
        private String categoryCode;
        private String description;
        
        
        



        public WCFRequestDetail(String itemCode, String quantity,String categoryCode,String description)

        {

            this.itemCode = itemCode;
            this.quantity = quantity;
            this.categoryCode = categoryCode;
            this.description = description;

        }

        [DataMember]
        public string ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }
        [DataMember]
        public string Quantity
        {
            get { return quantity; }
            set { quantity = value; }
        }

        [DataMember]
        public string CategoryCode
        {
            get { return categoryCode; }
            set { categoryCode = value; }
        }

        [DataMember]
        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        


    }

}

