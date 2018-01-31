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
        [WebGet(UriTemplate = "/Pending/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFPurchaseOrder> GetAllPendingPO(string email,string password);

        [OperationContract]
        [WebGet(UriTemplate = "/PODetail/{id}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFPODetail> GetPODetail(String id,string email, string password);

        [OperationContract]
        [WebInvoke(UriTemplate = "/UpdatePendingPO/{email}/{password}", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        void UpdatePendingPO(WCFPurchaseOrder po, string email, string password);

        [OperationContract]
        [WebGet(UriTemplate = "/PendingAdjustmentSupervisor/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFAdjustment> ListOfPendingRequestForSupervisor( string email, string password);


        [OperationContract]
        [WebGet(UriTemplate = "/Adjustment/{adjustmentcode}/{email}/{password}", ResponseFormat = WebMessageFormat.Json)]

        WCFAdjustment GetAdjustment(string adjustmentcode, string email, string password);

        [OperationContract]
        [WebInvoke(UriTemplate = "/UpdateAdjustmentSupervisor/{email}/{password}", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        String UpdateAdjustmentBySupervisor(WCFAdjustment adjustment, string email, string password);

        

    }
    [DataContract]
    public class WCFPurchaseOrder
    { 
        private String purchaseOrderCode;
        private string dateCreated;
        private String dateApproved;
        private String status;
        private String supplierCode;
        private String headRemark;
        private String approvedBy;
        private String supplierName;
        private String totalPrice;
        private String empName;

       
        public WCFPurchaseOrder(String PurchaseOrderCode, String DateCreated, String SupplierName,String empName,
             String TotalPrice)
        {

            this.PurchaseOrderCode = PurchaseOrderCode;
            this.DateCreated = DateCreated;
            this.empName = empName;
            this.SupplierName = SupplierName;
            this.TotalPrice = TotalPrice;
            

            this.HeadRemark = HeadRemark;
        }
        
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
        public string HeadRemark
        {
            get { return headRemark; }
            set { this.headRemark = value; }
        }
        [DataMember]
        public string SupplierName
        {
            get { return supplierName; }
            set { this.supplierName = value; }
        }
        [DataMember]
        public string EmpName
        {
            get { return empName; }
            set { this.empName = value; }
        }
        [DataMember]
        public string TotalPrice
        {
            get { return totalPrice; }
            set { this.totalPrice = value; }
        }

        [DataMember]
        public string ApprovedBy
        {
            get { return approvedBy; }
            set { this.approvedBy = value; }
        }
    }

    [DataContract]
    public class WCFPODetail
    {
        private String itemDescription;
        private string price;
        private String quantity;
        private String amount;
        public WCFPODetail(String itemDescription,String price,String quantity,String amount)
        {
            this.itemDescription = itemDescription;
            this.price = price;
            this.quantity = quantity;
            this.amount = amount;
        }
        [DataMember]
        public string ItemDescription
        {
            get { return itemDescription; }
            set { this.itemDescription = value; }
        }
        [DataMember]
        public string Price
        {
            get { return price; }
            set { this.price = value; }
        }
        [DataMember]
        public string Quantity
        {
            get { return quantity; }
            set { this.quantity = value; }
        }
        [DataMember]
        public string Amount
        {
            get { return amount; }
            set { this.amount = value; }
        }

    }
    [DataContract]
    public class WCFAdjustment
    {
        string adjustmentCode;
        string itemCode;
        string itemDescription;
        string price;
        string adjustmentQuant;
        string stock;
        string reason;
        string remark;
        string status;
        String dateOfApprove;
        string approvedBy;

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
        public string ItemDescription
        {
            get { return itemDescription; }
            set { itemDescription = value; }
        }
        [DataMember]
        public string Price
        {
            get { return price; }
            set { price = value; }
        }

        [DataMember]
        public string AdjustmentQuant
        {
            get { return adjustmentQuant; }
            set { adjustmentQuant = value; }
        }

        [DataMember]
        public string Stock
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

        [DataMember]
        public string Status
        {
            get { return status; }
            set { status = value; }
        }

        [DataMember]
        public String DateOfApprove
        {
            get { return dateOfApprove; }
            set { dateOfApprove = value; }
        }

        [DataMember]
        public string ApprovedBy
        {
            get { return approvedBy; }
            set { approvedBy = value; }
        }

        public WCFAdjustment(string adjustmentCode, string itemCode, string price, string adjustmentQuant, string stock, string reason, string remark,string itemDescription)
        {
            this.adjustmentCode = adjustmentCode;

            this.itemCode = itemCode;
            this.price = price;
            this.adjustmentQuant = adjustmentQuant;

            this.stock = stock;
            this.reason = reason;
            this.remark = remark;
            this.ItemDescription = itemDescription;
        }


        public WCFAdjustment()
        {

        }
    }




      
}
