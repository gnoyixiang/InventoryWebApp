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

        [OperationContract]
        [WebGet(UriTemplate = "/PODetail/{id}", ResponseFormat = WebMessageFormat.Json)]
        List<WCFPODetail> GetPODetail(String id);

        [OperationContract]
        [WebInvoke(UriTemplate = "/UpdatePendingPO", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
        void UpdatePendingPO(WCFPurchaseOrder po);

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
       

       
        public WCFPurchaseOrder(String PurchaseOrderCode, String DateCreated, String SupplierName,
             String TotalPrice)
        {

            this.PurchaseOrderCode = PurchaseOrderCode;
            this.DateCreated = DateCreated;

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
        public WCFPODetail(String itemDescription,String price,String quantity)
        {
            this.itemDescription = itemDescription;
            this.price = price;
            this.quantity = quantity;
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


    }

      
}
