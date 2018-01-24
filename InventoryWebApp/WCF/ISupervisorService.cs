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


        //[OperationContract]
        //[WebGet(UriTemplate = "/Adjustment", ResponseFormat = WebMessageFormat.Json)]
        //List<WCFPurchaseOrder> GetAllAdjustment();

        [OperationContract]
        [WebGet(UriTemplate = "/PendingSupervisor", ResponseFormat = WebMessageFormat.Json)]
        List<WCFAdjustment> ListOfPendingRequestForSupervisor();

        [OperationContract]
        [WebGet(UriTemplate = "/Pend", ResponseFormat = WebMessageFormat.Json)]
        List<WCFPurchaseOrder> GetAllPendingPO();

        [OperationContract]
        [WebGet(UriTemplate = "/PendingManager", ResponseFormat = WebMessageFormat.Json)]

        List<WCFAdjustment> ListOfPendingRequestForManager();

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

            this.purchaseOrderCode = PurchaseOrderCode;
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
            set { purchaseOrderCode = value; }
        }

        [DataMember]
        public string DateCreated
        {
            get { return dateCreated; }
            set { dateCreated = value; }
        }

        [DataMember]
        public string DateApproved
        {
            get { return dateApproved; }
            set { dateApproved = value; }
        }

        [DataMember]
        public string Note
        {
            get { return note; }
            set { note = value; }
        }
        [DataMember]
        public string Status
        {
            get { return status; }
            set { status = value; }
        }

        [DataMember]
        public string SupplierCode
        {
            get { return supplierCode; }
            set { supplierCode = value; }
        }
        [DataMember]
        public string DateReceived
        {
            get { return dateReceived; }
            set { dateReceived = value; }
        }
        [DataMember]
        public string DateSupplyExpected
        {
            get { return dateSupplyExpected; }
            set { dateSupplyExpected = value; }
        }
        [DataMember]
        public string HeadRemark
        {
            get { return headRemark; }
            set { headRemark = value; }
        }
    }

    [DataContract]
    public class WCFAdjustment
    {

        string adjustmentCode;


        string itemCode;


        decimal price;


        int adjustmentQuant;


        int stock;


        string reason;


        string remark;


        [DataMember]
        public string AdjustmentCode
        {
            get { return adjustmentCode; }
            set { adjustmentCode = value; }
        }

        [DataMember]
        public string ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }
        [DataMember]
        public decimal Price
        {
            get { return price; }
            set { price = value; }
        }

        [DataMember]
        public int AdjustmentQuant
        {
            get { return adjustmentQuant; }
            set { adjustmentQuant = value; }
        }

        [DataMember]
        public int Stock
        {
            get { return stock; }
            set { stock = value; }
        }

        [DataMember]
        public string Reason
        {
            get { return reason; }
            set { reason = value; }
        }
        [DataMember]
        public string Remark
        {
            get { return remark; }
            set { remark = value; }
        }


        public WCFAdjustment(string adjustmentCode, string itemCode, decimal price, int adjustmentQuant, int stock, string reason, string remark)
        {
            this.adjustmentCode = adjustmentCode;

            this.itemCode = itemCode;
            this.price = price;
            this.adjustmentQuant = adjustmentQuant;

            this.stock = stock;
            this.reason = reason;
            this.remark = remark;
        }

        public WCFAdjustment()
        {

        }
    }

}


