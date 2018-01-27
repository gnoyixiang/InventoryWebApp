using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;

using System.Text;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IEmployeeService" in both code and config file together.
    [ServiceContract]
    public interface IEmployeeService
    {
        [OperationContract]
        [WebGet(UriTemplate = "/ListDisbursement", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_Disbursement> ListAllDisbursement();

        [OperationContract]
        [WebGet(UriTemplate = "/DisbursementDetails/{disbursementCode}", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_DisbursementDetails> DisbursementDetails(string disbursementCode);

        [OperationContract]
        [WebInvoke(UriTemplate = "/UpdateDisbursement", Method = "POST", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
        void UpdateDisbursement(WCF_Disbursement wcfDisbursement);
    }
    [DataContract]
    public class WCF_Disbursement
    {
        
        private string disbursementCode;
  
        private string departmentName;

        private string status;

        private string repName;
        public WCF_Disbursement()
        {

        }
        public WCF_Disbursement(string _disbursementCode, string _departmentName, string _status, string _repName)
        {
            this.disbursementCode = _disbursementCode;
            this.departmentName = _departmentName;
            this.status = _status;
            this.repName = _repName;
        }

        public WCF_Disbursement(string _disbursementCode)
        {
            this.disbursementCode = _disbursementCode;
           
        }


        [DataMember]
        public string DisbursementCode
        {
            get { return disbursementCode; }
            set { disbursementCode = value; }
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
        [DataMember]
        public string RepName
        {
            get { return repName; }
            set { repName = value; }
        }
    }
    [DataContract]
    public class WCF_DisbursementDetails
    {
       
        private string disbursementCode;
        
        private string itemDescription;
        
        private string actualQuantity;

        private string neededQuantity;
      
        private string collectionPointName;
        
        //private string collectionTime;

        private string departmentName;
        
        private string repName;
      
        private string status;
        public WCF_DisbursementDetails(string _disbursementCode, string _itemDescription,
            string _actualQuantity, string _neededQuantity, string _collectionPointName, string _deparmentName, string _repName, string _status)
        {
            this.disbursementCode = _disbursementCode;
            this.itemDescription = _itemDescription;
            this.actualQuantity = _actualQuantity;
            this.neededQuantity = _neededQuantity;
            this.collectionPointName = _collectionPointName;
           // this.collectionTime = _collectionTime;
            this.departmentName = _deparmentName;
            this.repName = _repName;
            this.status = _status;
        }
        //string _collectionTime,
        [DataMember]
        public string DisbursementCode
        {
            get { return disbursementCode; }
            set { disbursementCode = value; }
        }
        [DataMember]
        public string ItemDescription
        {
            get { return itemDescription; }
            set { itemDescription = value; }
        }
        [DataMember]
        public string ActualQuantity
        {
            get { return actualQuantity; }
            set { actualQuantity = value; }
        }
        [DataMember]
        public string NeededQuantity
        {
            get { return neededQuantity; }
            set { neededQuantity = value; }
        }

        [DataMember]
        public string CollectionPointName
        {
            get { return collectionPointName; }
            set { collectionPointName = value; }
        }
        //public string CollectionTime
        //{
        //    get { return collectionTime; }
        //    set { collectionTime = value; }
        //}
        [DataMember]
        public string DepartmentName
        {
            get { return departmentName; }
            set { departmentName = value; }
        }
        [DataMember]
        public string RepName
        {
            get { return repName; }
            set { repName = value; }
        }
        [DataMember]
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}
