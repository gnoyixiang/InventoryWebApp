using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Models.Entities
{
    public class TransactionOfRetrieval_Adjustment_PurchaseOrder : IComparable<TransactionOfRetrieval_Adjustment_PurchaseOrder>
    {
        public string InventoryWebApp {get;set;}
        public DateTime? Date { get; set; }
        public string Quantity { get; set; }
        public int? Balance { get; set; }

        public string Dept_SupId { get; set; }
        public string DeptId { get; set; }
        public string SupId { get; set; }

        public TransactionOfRetrieval_Adjustment_PurchaseOrder(DateTime? Date, string Quantity, string Dept_SupId,string DeptId,string SupId)
        {
            //Date = Date ?? DateTime.Now ;
            this.Date = Date;

            this.Quantity = Quantity;
            this.Dept_SupId = Dept_SupId;
            this.DeptId = DeptId;
            this.SupId = SupId;

        }
        public TransactionOfRetrieval_Adjustment_PurchaseOrder()
        {

        }
        public int CompareTo(TransactionOfRetrieval_Adjustment_PurchaseOrder comparePart)
        {
            // A null value means that this object is greater.
            if (comparePart == null)
                return 1;

            else if (Convert.ToDateTime(this.Date) > Convert.ToDateTime(comparePart.Date))
                return 1;
            else if (Convert.ToDateTime(this.Date) < Convert.ToDateTime(comparePart.Date))
                return -1;
            else
                return 0;
            //return DateTime.Compare(this.Date, comparePart.Date);
            // return this.Date.CompareTo(comparePart.Date);
        }
    }
}