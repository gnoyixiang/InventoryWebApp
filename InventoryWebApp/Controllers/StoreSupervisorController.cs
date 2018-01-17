using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
namespace InventoryWebApp.Controllers
{
    public class StoreSupervisorController
    {
        IPurchaseOrderDAO poDAO = new PurchaseOrderDAO();
        ISupplierDAO sDAO = new SupplierDAO();
        public List<PurchaseOrder> ListAllPendingPO()
        {
            return poDAO.ListPurchaseOrdersByStatus("pending");
        }

        public Supplier GetSupplier(string SupplierCode)
        {
            return sDAO.GetSupplier(SupplierCode);
        }

    }
}