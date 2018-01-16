using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models;

namespace InventoryWebApp.BusinessLogic
{
    public class StoreSupervisorBusinessLogic
    {
        static EntityModel em = new EntityModel();
        public static List<PurchaseOrder> ListPendingOrders()
        {
           return em.PurchaseOrders.Where(p => p.Status == "pending").ToList<PurchaseOrder>();
            
        }


    }
}