using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class PODetailsDAO : IPODetailsDAO
    {
        public List<PODetail> ListAllPODetails()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PODetails.ToList<PODetail>();
            }
        }

        public List<PODetail> ListPODetailsByPOCode(string purchaseOrderCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PODetails
                    .Where(p => p.PurchaseOrderCode.ToUpper().Contains(purchaseOrderCode.ToUpper()))
                    .ToList<PODetail>();
            }
        }

        public List<PODetail> ListPODetailsByItemCode(string itemCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PODetails
                    .Where(p => p.ItemCode.ToUpper().Contains(itemCode.ToUpper()))
                    .ToList<PODetail>();
            }
        }

        public PODetail GetPODetail(string purchaseOrderCode, string itemCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PODetails
                    .Where(p => p.PurchaseOrderCode == purchaseOrderCode && p.ItemCode == itemCode)
                    .FirstOrDefault<PODetail>();
            }
        }

        public int UpdatePODetail(PODetail poDetail)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(poDetail).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }

        public List<PODetail> ListAllPODetailsByPOCode(string purchaseOrderCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PODetails
                    .Where(p => p.PurchaseOrderCode.ToUpper()==(purchaseOrderCode.ToUpper()))
                    .ToList<PODetail>();
            }
        }

    }
}