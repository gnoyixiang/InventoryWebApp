using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.Models.Classes
{
    public class ComparePurchaseOrderByPONum : IComparer<PurchaseOrder>
    {
        public int Compare(PurchaseOrder x, PurchaseOrder y)
        {
            return GetDateTimeFromPONum(x.PurchaseOrderCode).CompareTo(GetDateTimeFromPONum(y.PurchaseOrderCode));
        }

        private DateTime GetDateTimeFromPONum(string poNum)
        {
            string strDateTime = poNum.Substring(poNum.IndexOf(poNum.First(c => Char.IsNumber(c))));

            return DateTime.ParseExact(strDateTime, "yyMMddHHmmssfff", null);
        }
    }


}