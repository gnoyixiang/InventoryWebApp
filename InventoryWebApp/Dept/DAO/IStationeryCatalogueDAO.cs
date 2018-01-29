using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
using System.Collections.Generic;

namespace InventoryWebApp.DAO
{
    public interface IStationeryCatalogueDAO
    {
        int AddStationery(StationeryCatalogue st);
        void DeleteStationery(string itemCode);
        StationeryCatalogue GetStationery(string itemcode);
        List<StationeryCatalogue> ListAllStationery();
        List<StationeryCatalogue> SearchByCategory(string keyword);
        List<StationeryCatalogue> SearchByDescription(string keyword);
        List<StationeryCatalogue> SearchByItemCode(string keyword);
        int UpdateStationery(StationeryCatalogue st);
        List<string> ListAllItemCode();
    }
}