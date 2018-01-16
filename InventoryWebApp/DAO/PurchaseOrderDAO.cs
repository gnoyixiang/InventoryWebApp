using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class PurchaseOrderDAO : IPurchaseOrderDAO
    {
        private EntityModel em;
        public PurchaseOrder GetPurchaseOrder(string purchaseOrderCode)
        {
            PurchaseOrder po = null;
            using (EntityModel em = new EntityModel()) {
                po = em.PurchaseOrders
                    .Where(p => p.PurchaseOrderCode == purchaseOrderCode)
                    .FirstOrDefault<PurchaseOrder>();
            }
            return po;
        }

        public List<PurchaseOrder> ListPurchaseOrdersByStatus(string status)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p=>p.Status == status).ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrdersBySupplierCode(string supplierCode)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => p.Status == supplierCode).ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrdersByUsername(string username)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => p.UserName == username).ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrdersByApprovedBy(string approvedBy)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => p.ApprovedBy == approvedBy).ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrdersByReceivedBy(string receivedBy)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => p.ReceivedBy == receivedBy).ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrdersByLastUpdatedBy(string updatedBy)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => p.ReceivedBy == updatedBy).ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateCreated(DateTime dateCreated)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateCreated).Date == dateCreated.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateCreated(DateTime startDate, DateTime endDate)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateCreated).Date >= startDate.Date
                    && Convert.ToDateTime(p.DateCreated).Date >= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateApproved(DateTime dateApproved)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateApproved).Date == dateApproved.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateApproved(DateTime startDate, DateTime endDate)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateApproved).Date >= startDate.Date
                    && Convert.ToDateTime(p.DateApproved).Date >= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateReceived(DateTime dateReceived)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateReceived).Date == dateReceived.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateReceived(DateTime startDate, DateTime endDate)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateReceived).Date >= startDate.Date
                    && Convert.ToDateTime(p.DateReceived).Date >= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateLastUpdated(DateTime dateLastUpdated)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateLastUpdated).Date == dateLastUpdated.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateLastUpdated(DateTime startDate, DateTime endDate)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateLastUpdated).Date >= startDate.Date
                    && Convert.ToDateTime(p.DateLastUpdated).Date >= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateSupplyExpected(DateTime dateSupplyExpected)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateSupplyExpected).Date == dateSupplyExpected.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListPurchaseOrderByDateSupplyExpected(DateTime startDate, DateTime endDate)
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders
                    .Where(p => Convert.ToDateTime(p.DateSupplyExpected).Date >= startDate.Date
                    && Convert.ToDateTime(p.DateSupplyExpected).Date >= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
            return poList;
        }

        public List<PurchaseOrder> ListAllPurchaseOrders()
        {
            List<PurchaseOrder> poList;
            using (em = new EntityModel())
            {
                poList = em.PurchaseOrders.ToList<PurchaseOrder>();
            }
            return poList;
        }

        public int AddPurchaseOrder(PurchaseOrder purchaseOrder)
        {
            int result=-1;
            using(em = new EntityModel())
            {
                em.PurchaseOrders.Add(purchaseOrder);
                result = em.SaveChanges();
            }
            return result;
        }

        public int UpdatePurchaseOrder(PurchaseOrder purchaseOrder)
        {
            int result = -1;
            using (em = new EntityModel())
            {
                em.Entry(purchaseOrder).State = EntityState.Modified;
                result = em.SaveChanges();
            }
            return result;
        }
        
    }
}