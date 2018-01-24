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
        [WebGet(UriTemplate = "/ListDisbursementDetails", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_DisbursementDetails> ListAllDisbursementDetails();
    }
    [DataContract]
    public class WCF_Disbursement
    {
        
        private string disbursementCode;
  
        private string departmentName;

        private string status;
        
        public WCF_Disbursement(string _disbursementCode, string _departmentName, string _status)
        {
            this.disbursementCode = _disbursementCode;
            this.departmentName = _departmentName;
            this.status = _status;
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
    }
    [DataContract]
    public class WCF_DisbursementDetails
    {
        [DataMember]
        private string disbursementCode;
        [DataMember]
        private string itemDescription;
        [DataMember]
        private int actualQuantity;
        [DataMember]
        private string collectionPointName;
        //[DataMember]
        //private string collectionTime;
        [DataMember]
        private string repName;
        [DataMember]
        private string status;
        public WCF_DisbursementDetails(string _disbursementCode, string _itemDescription,
            int _actualQuantity, string _collectionPointName, string _repName, string _status)
        {
            this.disbursementCode = _disbursementCode;
            this.itemDescription = _itemDescription;
            this.actualQuantity = _actualQuantity;
            this.collectionPointName = _collectionPointName;
            //this.collectionTime = _collectionTime;
            this.repName = _repName;
            this.status = _status;
        }
        public string DisbursementCode
        {
            get { return disbursementCode; }
            set { disbursementCode = value; }
        }
        public string ItemDescription
        {
            get { return itemDescription; }
            set { itemDescription = value; }
        }
        public int ActualQuantity
        {
            get { return actualQuantity; }
            set { actualQuantity = value; }
        }
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
        public string RepName
        {
            get { return repName; }
            set { repName = value; }
        }
        public string Status
        {
            get { return status; }
            set { status = value; }
        }
    }
}
