using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace InventoryWebApp.WCF
{
    // NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "ISupervisorService" in both code and config file together.
    [ServiceContract]
    public interface ISupervisorService
    {
        [OperationContract]
        [WebGet(UriTemplate = "/Pending", ResponseFormat = WebMessageFormat.Json)]
        List<WCFPurchaseOrder> GetAllPendingPO();

        //[OperationContract]
        //[WebGet(UriTemplate = "/Adjustment", ResponseFormat = WebMessageFormat.Json)]
        //List<WCFPurchaseOrder> GetAllAdjustment();

    }
    [DataContract]
    public class WCFPurchaseOrder
    { 
        private String purchaseOrderCode;
        private string dateCreated;
        private String dateApproved;
        private String note;
        private String status;
        private String supplierCode;
        private String dateReceived;
        private String dateSupplyExpected;
        private String headRemark;

        public WCFPurchaseOrder(String purchaseOrderCode, String dateCreated, String dateApproved, String note, String status, String supplierCode, String dateReceived,
            String dateSupplyExpected, String headRemark)
        {

            this.purchaseOrderCode = purchaseOrderCode;
            this.dateCreated = dateCreated;
            this.dateApproved = dateApproved;
            this.note = note;
            this.status = status;
            this.supplierCode = supplierCode;
            this.dateReceived = dateReceived;
            this.dateSupplyExpected = dateSupplyExpected;
            this.headRemark = headRemark;
        }
        //public WCFPurchaseOrder(String PurchaseOrderCode, String Note, String SupplierName,
        //     String HeadRemark)
        //{

        //    this.PurchaseOrderCode = PurchaseOrderCode;
        //    // this.DateCreated = DateCreated;

        //    this.Note = Note;
        //    //this.Status = Status;
        //    this.SupplierName = SupplierName;

        //    this.HeadRemark = HeadRemark;
        //}
        //public WCFPurchaseOrder(String PurchaseOrderCode, String Note, String Status, String SupplierName, String HeadRemark)
        //{
        //    this.PurchaseOrderCode = PurchaseOrderCode;

        //    this.Note = Note;
        //    this.Status = Status;
        //    this.SupplierName = SupplierName;

        //    this.HeadRemark = HeadRemark;
        //}
        [DataMember]
        public string PurchaseOrderCode
        {
            get { return purchaseOrderCode; }
            set { this.purchaseOrderCode = value; }
        }

        [DataMember]
        public string DateCreated
        {
            get { return dateCreated; }
            set { this.dateCreated = value; }
        }

        [DataMember]
        public string DateApproved
        {
            get { return dateApproved; }
            set { this.dateApproved = value; }
        }

        [DataMember]
        public string Note
        {
            get { return note; }
            set { this.note = value; }
        }
        [DataMember]
        public string Status
        {
            get { return status; }
            set { this.status = value; }
        }

        [DataMember]
        public string SupplierCode
        {
            get { return supplierCode; }
            set { this.supplierCode = value; }
        }
        [DataMember]
        public string DateReceived
        {
            get { return dateReceived; }
            set { this.dateReceived = value; }
        }
        [DataMember]
        public string DateSupplyExpected
        {
            get { return dateSupplyExpected; }
            set { this.dateSupplyExpected = value; }
        }
        [DataMember]
        public string HeadRemark
        {
            get { return headRemark; }
            set { this.headRemark = value; }
        }
    }

}
