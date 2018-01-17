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
        public PurchaseOrder GetPurchaseOrder(string purchaseOrderCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.PurchaseOrderCode.ToUpper() == purchaseOrderCode.ToUpper())
                    .FirstOrDefault<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByStatus(string status)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.Status.ToUpper().Contains(status.ToUpper())).ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersBySupplierCode(string supplierCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.SupplierCode.ToUpper().Contains(supplierCode.ToUpper())).ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByUsername(string username)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.UserName.ToUpper().Contains(username.ToUpper())).ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByApprovedBy(string approvedBy)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.ApprovedBy.ToUpper().Contains(approvedBy.ToUpper())).ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByReceivedBy(string receivedBy)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.ReceivedBy.ToUpper().Contains(receivedBy.ToUpper())).ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByLastUpdatedBy(string updatedBy)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.LastUpdatedBy.ToUpper().Contains(updatedBy.ToUpper())).ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateCreated(DateTime dateCreated)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateCreated == dateCreated.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateCreated(DateTime startDate, DateTime endDate)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateCreated >= startDate.Date
                    && p.DateCreated <= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateApproved(DateTime dateApproved)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateApproved == dateApproved.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateApproved(DateTime startDate, DateTime endDate)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateApproved >= startDate.Date
                    && p.DateApproved <= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateReceived(DateTime dateReceived)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateReceived == dateReceived.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateReceived(DateTime startDate, DateTime endDate)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateReceived >= startDate.Date
                    && p.DateReceived <= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateLastUpdated(DateTime dateLastUpdated)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateLastUpdated == dateLastUpdated.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateLastUpdated(DateTime startDate, DateTime endDate)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateLastUpdated >= startDate.Date
                    && p.DateLastUpdated <= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateSupplyExpected(DateTime dateSupplyExpected)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateSupplyExpected == dateSupplyExpected.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListPurchaseOrdersByDateSupplyExpected(DateTime startDate, DateTime endDate)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders
                    .Where(p => p.DateSupplyExpected >= startDate.Date
                    && p.DateSupplyExpected <= endDate.Date)
                    .ToList<PurchaseOrder>();
            }
        }

        public List<PurchaseOrder> ListAllPurchaseOrders()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.PurchaseOrders.ToList<PurchaseOrder>();
            }
        }

        public int AddPurchaseOrder(PurchaseOrder purchaseOrder)
        {
            using (EntityModel em = new EntityModel())
            {
                em.PurchaseOrders.Add(purchaseOrder);
                return em.SaveChanges();
            }            
        }

        public int UpdatePurchaseOrder(PurchaseOrder purchaseOrder)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(purchaseOrder).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }

    }
}