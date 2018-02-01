using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Models.Classes
{
    public class ComparePurchaseOrderByStatus : IComparer<PurchaseOrder>
    {
        private const string PENDING = "PENDING";
        private const string APPROVED = "APPROVED";
        private const string REJECTED = "REJECTED";
        private const string RECEIVED = "RECEIVED";
        private const string CANCELLED = "CANCELLED";
        private const string EDITING = "EDITING";
        public int Compare(PurchaseOrder x, PurchaseOrder y)
        {
            int thisStatus = ValueOf(x.Status);
            int otherStatus = ValueOf(y.Status);

            if (thisStatus < otherStatus) return -1;
            if (thisStatus > otherStatus) return 1;
            return 0;
        }

        private int ValueOf(string status)
        {
            return status.ToUpper() == PENDING ? 1
                : (status.ToUpper() == REJECTED ? 2
                : (status.ToUpper() == APPROVED ? 3
                : (status.ToUpper() == RECEIVED ? 4
                : (status.ToUpper() == CANCELLED ? 5 : 6))));
        }
    }
}