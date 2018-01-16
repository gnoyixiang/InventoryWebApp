using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp.DAO
{
    class PurchaseOrderDAOImpl:PurchaseOrderDAO
    {
        EntityModel em;
        List<StationeryCatalogue> getAllStationeries()
        {
            using (em = new EntityModel())
            {
                return em.StationeryCatalogues.ToList<StationeryCatalogue>();
            }
        }

        StationeryCatalogue getStationeriesByItemCode(string itemCode)
        {
            using (em = new EntityModel())
            {
                return em.StationeryCatalogues.Where(s => s.ItemCode == itemCode).FirstOrDefault<StationeryCatalogue>();
            }
        }


    }
}