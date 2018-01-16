using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class SupplierDetailsDAO : ISupplierDetailsDAO
    {
        EntityModel em = new EntityModel();
        public int UpdateSupplierDetails(String supplierCode, String itemCode, decimal price)
        {
            SupplierDetail spDetail = em.SupplierDetails.Where(p => p.SupplierCode == itemCode).First<SupplierDetail>();
            spDetail.SupplierCode = supplierCode;
            spDetail.ItemCode = itemCode;
            spDetail.Price = price;

            return em.SaveChanges();

        }
    }
}