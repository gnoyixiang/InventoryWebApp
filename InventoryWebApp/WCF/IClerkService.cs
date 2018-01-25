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
        [WebGet(UriTemplate = "/ProcessingRetrievalDetail/{itemCode}", ResponseFormat = WebMessageFormat.Json)]
        WCF_RetrievalDetail GetRetrievalDetail(string itemCode);

        [OperationContract]
        [WebGet(UriTemplate = "/ProcessingRetrievalDetails", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_RetrievalDetail> GetProcessingRetrievalDetails();

        [OperationContract]
        [WebGet(UriTemplate = "/OutstandingRequests", ResponseFormat = WebMessageFormat.Json)]
        List<WCF_Request> GetOutstandingRequests();

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
