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
        void DoWork();

        [OperationContract]
        [WebGet(UriTemplate = "/PendingRequestForSupervisor", ResponseFormat = WebMessageFormat.Json)]

        List<WCFAdjustment> ListOfPendingRequestForSupervisor();

        [OperationContract]
        [WebGet(UriTemplate = "/PendingRequestForManager", ResponseFormat = WebMessageFormat.Json)]

        List<WCFAdjustment> ListOfPendingRequestForManager();


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

