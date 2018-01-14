using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp
{
    public class CatalogueController
    {
        Team8_SSISEntities SSIS = new Team8_SSISEntities();
        public List<StationeryCatalogue> searchByItemCode(string keyword)
        {
            return SSIS.StationeryCatalogues.Where(x => x.ItemCode.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> searchByDescription(string keyword)
        {
            return SSIS.StationeryCatalogues.Where(x => x.Description.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> searchByCategory(string keyword)
        {
            return SSIS.StationeryCatalogues.Where(x => x.CategoryCode.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> listAll()
        {
            return SSIS.StationeryCatalogues.ToList();
        }
    }                   
}