using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp
{
    public class CatalogueController
    {
        EntityModel em = new EntityModel();
        public List<StationeryCatalogue> searchByItemCode(string keyword)
        {
            return em.StationeryCatalogues.Where(x => x.ItemCode.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> searchByDescription(string keyword)
        {
            return em.StationeryCatalogues.Where(x => x.Description.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> searchByCategory(string keyword)
        {
            return em.StationeryCatalogues.Where(x => x.CategoryCode.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> listAll()
        {
            return em.StationeryCatalogues.ToList();
        }
    }                   
}