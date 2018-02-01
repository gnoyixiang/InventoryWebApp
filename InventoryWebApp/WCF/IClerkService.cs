using InventoryWebApp.Models.Entities;
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
        [WebInvoke(UriTemplate = "/MarkAsNotCollected/{email}/{password}", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        void MarkAsNotCollected(WCF_DisbursementDetail wdd, String email, String password);
        [OperationContract]
        [WebInvoke(UriTemplate = "/UpdateDisbursementDetail/{email}/{password}", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        void UpdateDisbursementDetail(WCF_DisbursementDetail wdd, String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/DisbursementDetail/{departmentCode}/{requestCode}/{itemCode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCF_DisbursementDetail GetConfirmedDisburDetail(string departmentCode, string requestCode, string itemCode, String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/ConfirmedDisbursementDetails/{departmentCode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_DisbursementDetail> GetConfirmedDisburDetailsByDepartment(string departmentCode, String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/ConfirmedDisbursement/{departementCode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCF_ConfirmedDisbursement GetConfirmedDisbursementByDeptCode(string departementCode, String email, String password);
        [OperationContract]
        [WebGet(UriTemplate = "/ConfirmedDisbursements/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_ConfirmedDisbursement> GetConfirmedDisbursementList(String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/GetCollectionDate/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCF_CollectionDate GetCollectionDate(String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/AllocatingDisbursementDetails/{itemCode}/{deparmentName}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCF_DisbursementDetail GetAllocatingDisbursementDetail(string itemCode, string deparmentName, String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/AllocatingDisbursementDetails/{itemCode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_DisbursementDetail> GetAllocatingDisbursementDetails(string itemCode, String email, String password);

        [OperationContract]
        [WebInvoke(UriTemplate = "/UpdateRetrievalDetail/{email}/{password}", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        void UpdateRetrievalDetail(WCF_RetrievalDetail wrd, String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/AllocatingRetrievalDetail/{itemCode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCF_RetrievalDetail GetAllocatingRetrievalDetail(string itemCode, String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/AllocatingRetrievalDetails/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_RetrievalDetail> GetAllocatingRetrievalDetails(String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/ProcessingRetrievalDetail/{id}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        WCF_RetrievalDetail GetRetrievalDetail(string id, String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/ProcessingRetrievalDetails/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_RetrievalDetail> GetProcessingRetrievalDetails(String email, String password);

        [OperationContract]
        [WebGet(UriTemplate = "/OutstandingRequests/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_Request> GetOutstandingRequests(String email, String password);

    }

    [DataContract]
    public class WCF_ConfirmedDisbursement
    {
        private string collectionPoint;
        private string collectionTime;
        private string departmentCode;
        private string departmentName;
        private string clerkInCharge;
        private string representative;
        private string disbursementDate;
        private string notes;
        private string status;
        private string disbursementCode;
        public WCF_ConfirmedDisbursement(string collectionPoint, string time, string departmentCode, string departmentName, string clerkInCharge, string representative, string disbursementDate)
        {
            this.CollectionPoint = collectionPoint;
            this.CollectionTime = time;
            this.DepartmentCode = departmentCode;
            this.DepartmentName = departmentName;
            this.ClerkInCharge = clerkInCharge;
            this.Representative = representative;
            this.DisbursementDate = disbursementDate;
        }
        public WCF_ConfirmedDisbursement() { }
        [DataMember]
        public string CollectionPoint
        {
            get
            {
                return collectionPoint;
            }

            set
            {
                collectionPoint = value;
            }
        }

        [DataMember]
        public string CollectionTime
        {
            get
            {
                return collectionTime;
            }

            set
            {
                collectionTime = value;
            }
        }

        [DataMember]
        public string DepartmentCode
        {
            get
            {
                return departmentCode;
            }

            set
            {
                departmentCode = value;
            }
        }

        [DataMember]
        public string DepartmentName
        {
            get
            {
                return departmentName;
            }

            set
            {
                departmentName = value;
            }
        }

        [DataMember]
        public string ClerkInCharge
        {
            get
            {
                return clerkInCharge;
            }

            set
            {
                clerkInCharge = value;
            }
        }

        [DataMember]
        public string Representative
        {
            get
            {
                return representative;
            }

            set
            {
                representative = value;
            }
        }

        [DataMember]
        public string DisbursementDate
        {
            get
            {
                return disbursementDate;
            }

            set
            {
                disbursementDate = value;
            }
        }

        [DataMember]
        public string Notes
        {
            get
            {
                return notes;
            }

            set
            {
                notes = value;
            }
        }

        [DataMember]
        public string Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        [DataMember]
        public string DisbursementCode
        {
            get
            {
                return disbursementCode;
            }

            set
            {
                disbursementCode = value;
            }
        }
    }

    [DataContract]
    public class WCF_CollectionDate
    {
        private string datePlanToCollect;
        private string status;

        public WCF_CollectionDate() { }

        public WCF_CollectionDate(string datePlanToCollect, string status)
        {
            DatePlanToCollect = datePlanToCollect;
            this.Status = status;
        }
        [DataMember]
        public string DatePlanToCollect
        {
            get
            {
                return datePlanToCollect;
            }

            set
            {
                datePlanToCollect = value;
            }
        }
        [DataMember]
        public string Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }
    }

    [DataContract]
    public class WCF_DisbursementDetail
    {
        private string disbursementCode;
        private string departmentName;
        private string departmentCode;
        private string itemName;
        private string itemCode;
        private string quantityNeeded;
        private string quantityRetrieved;
        private string quantityActual;
        private string status;
        private string notes;
        private string requestCode;

        public WCF_DisbursementDetail() { }
        public WCF_DisbursementDetail(string disbursementCode, string departmentName, string departmentCode, string itemName, string itemCode, string quantityNeeded, string quantityRetrieved, string status)
        {
            this.disbursementCode = disbursementCode;
            this.departmentName = departmentName;
            this.departmentCode = departmentCode;
            this.itemName = itemName;
            this.itemCode = itemCode;
            this.quantityNeeded = quantityNeeded;
            this.quantityRetrieved = quantityRetrieved;
            this.status = status;
        }
        [DataMember]
        public string DisbursementCode
        {
            get
            {
                return disbursementCode;
            }

            set
            {
                disbursementCode = value;
            }
        }

        [DataMember]
        public string DepartmentName
        {
            get
            {
                return departmentName;
            }

            set
            {
                departmentName = value;
            }
        }

        [DataMember]
        public string DepartmentCode
        {
            get
            {
                return departmentCode;
            }

            set
            {
                departmentCode = value;
            }
        }

        [DataMember]
        public string ItemName
        {
            get
            {
                return itemName;
            }

            set
            {
                itemName = value;
            }
        }

        [DataMember]
        public string ItemCode
        {
            get
            {
                return itemCode;
            }

            set
            {
                itemCode = value;
            }
        }

        [DataMember]
        public string QuantityNeeded
        {
            get
            {
                return quantityNeeded;
            }

            set
            {
                quantityNeeded = value;
            }
        }

        [DataMember]
        public string QuantityRetrieved
        {
            get
            {
                return quantityRetrieved;
            }

            set
            {
                quantityRetrieved = value;
            }
        }

        [DataMember]
        public string Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }
        [DataMember]
        public string Notes
        {
            get
            {
                return notes;
            }

            set
            {
                notes = value;
            }
        }

        [DataMember]
        public string QuantityActual
        {
            get
            {
                return quantityActual;
            }

            set
            {
                quantityActual = value;
            }
        }
        [DataMember]
        public string RequestCode
        {
            get
            {
                return requestCode;
            }

            set
            {
                requestCode = value;
            }
        }
    }
    [DataContract]
    public class WCF_RetrievalDetail
    {
        private string retrievalCode;
        private string itemName;
        private string quantityRetrieved;
        private string quantityNeeded;
        private string notes;
        private string status;
        private string dateRetrieved;
        private string stock;
        private string location;
        private string itemCode;
        public WCF_RetrievalDetail(string retrievalCode, string itemName, string quantityRetrieved, string quantityNeeded, string notes, string status, string dateRetrieved, string stock, string location, string itemCode)
        {
            this.RetrievalCode = retrievalCode;
            this.ItemName = itemName;
            this.QuantityRetrieved = quantityRetrieved;
            this.QuantityNeeded = quantityNeeded;
            this.Notes = notes;
            this.Status = status;
            this.DateRetrieved = dateRetrieved;
            this.Stock = stock;
            this.Location = location;
            this.ItemCode = itemCode;
        }

        public WCF_RetrievalDetail(string retrievalCode)
        {
            this.retrievalCode = retrievalCode;
        }

        public WCF_RetrievalDetail() { }
        [DataMember]
        public string RetrievalCode
        {
            get
            {
                return retrievalCode;
            }

            set
            {
                retrievalCode = value;
            }
        }
        [DataMember]
        public string ItemName
        {
            get
            {
                return itemName;
            }

            set
            {
                itemName = value;
            }
        }
        [DataMember]
        public string QuantityRetrieved
        {
            get
            {
                return quantityRetrieved;
            }

            set
            {
                quantityRetrieved = value;
            }
        }

        [DataMember]
        public string QuantityNeeded
        {
            get
            {
                return quantityNeeded;
            }

            set
            {
                quantityNeeded = value;
            }
        }

        [DataMember]
        public string Notes
        {
            get
            {
                return notes;
            }

            set
            {
                notes = value;
            }
        }

        [DataMember]
        public string Status
        {
            get
            {
                return status;
            }

            set
            {
                status = value;
            }
        }

        [DataMember]
        public string DateRetrieved
        {
            get
            {
                return dateRetrieved;
            }

            set
            {
                dateRetrieved = value;
            }
        }
        [DataMember]
        public string Stock
        {
            get
            {
                return stock;
            }

            set
            {
                stock = value;
            }
        }
        [DataMember]
        public string Location
        {
            get
            {
                return location;
            }

            set
            {
                location = value;
            }
        }
        [DataMember]
        public string ItemCode
        {
            get
            {
                return itemCode;
            }

            set
            {
                itemCode = value;
            }
        }
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