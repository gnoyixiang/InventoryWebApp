using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Models.Entities
{
    public class TransactionOfRetrieval_Adjustment_PurchaseOrder : IComparable<TransactionOfRetrieval_Adjustment_PurchaseOrder>
    {
        public DateTime? Date { get; set; }
        public int? Quantity { get; set; }
        public int? Balance { get; set; }

        public string DeptId { get; set; }
        public string SupplierId { get; set; }

        public TransactionOfRetrieval_Adjustment_PurchaseOrder(DateTime? Date,int? Quantity,string DeptId,string SupplierId)
        {
            //Date = Date ?? DateTime.Now ;
            this.Date = Date;
           
            this.Quantity = Quantity;
            this.DeptId = DeptId;
            this.SupplierId = SupplierId;
        }
        public TransactionOfRetrieval_Adjustment_PurchaseOrder()
        {

        }
        public int CompareTo(TransactionOfRetrieval_Adjustment_PurchaseOrder comparePart)
        {
            // A null value means that this object is greater.
            if (comparePart == null)
                return 1;

            else if (this.Date > comparePart.Date)
                return 1;
            else if (this.Date < comparePart.Date)
                return -1;
            else
                return 0;
            // return DateTime.Compare(this.Date, comparePart.Date);
        }
    }
}