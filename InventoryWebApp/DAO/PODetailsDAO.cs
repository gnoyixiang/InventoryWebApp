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
        private EntityModel em;

        public List<PODetail> ListAllPODetails()
        {
            List<PODetail> pod = null;
            using (em = new EntityModel())
            {
                pod = em.PODetails.ToList<PODetail>();
            }
            return pod;
        }

        public List<PODetail> ListPODetailsByPOCode(string purchaseOrderCode)
        {
            List<PODetail> pod = null;
            using (em = new EntityModel())
            {
                pod = em.PODetails
                    .Where(p => p.PurchaseOrderCode == purchaseOrderCode)
                    .ToList<PODetail>();
            }
            return pod;
        }

        public List<PODetail> ListPODetailsByItemCode(string itemCode)
        {
            List<PODetail> pod = null;
            using (em = new EntityModel())
            {
                pod = em.PODetails
                    .Where(p => p.ItemCode == itemCode)
                    .ToList<PODetail>();
            }
            return pod;
        }

        public PODetail GetPODetail(string purchaseOrderCode, string itemCode)
        {
            PODetail poList;
            using (em = new EntityModel())
            {
                poList = em.PODetails
                    .Where(p => p.PurchaseOrderCode == purchaseOrderCode && p.ItemCode == itemCode)
                    .FirstOrDefault<PODetail>();
            }
            return poList;
        }

        public int UpdatePODetail(PODetail poDetail)
        {
            int result = -1;
            using (em = new EntityModel())
            {
                em.Entry(poDetail).State = EntityState.Modified;
                result = em.SaveChanges();
            }
            return result;
        }
        
    }
}