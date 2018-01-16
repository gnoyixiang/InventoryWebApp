using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryWebApp.DAO
{
    public class StationeryCatalogueDAO
    {
        EntityModel em = new EntityModel();
        public List<StationeryCatalogue> SearchByItemCode(string keyword)
        {
            return em.StationeryCatalogues.Where(x => x.ItemCode.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> SearchByDescription(string keyword)
        {
            return em.StationeryCatalogues.Where(x => x.Description.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> SearchByCategory(string keyword)
        {
            return em.StationeryCatalogues.Where(x => x.CategoryCode.Contains(keyword)).ToList();
        }
        public List<StationeryCatalogue> ListAllStationery()
        {
            return em.StationeryCatalogues.ToList();
        }
        public string GetStationery(string itemcode)
        {
            StationeryCatalogue stationery = em.StationeryCatalogues.Where(x => x.ItemCode == itemcode).ToList<StationeryCatalogue>()[0];
            return stationery.Description;
        }
        public int AddStationery(string itemCode, string categoryCode, string description,
            int reorderLevel, int reorderQuantity, string measureUnit, decimal itemPrice, int itemStock,
            string supplier1, string supplier2, string supplier3)
        {
            StationeryCatalogue stationery = new StationeryCatalogue
            {
                ItemCode = itemCode,
                CategoryCode = categoryCode,
                Description = description,
                ReorderLevel = reorderLevel,
                ReorderQuantity = reorderQuantity,
                MeasureUnit = measureUnit,
                Price = itemPrice,
                Stock = itemStock,
                Supplier1 = supplier1,
                Supplier2 = supplier2,
                Supplier3 = supplier3
            };
            em.StationeryCatalogues.Add(stationery);
            return em.SaveChanges(); ;
        }

        public int UpdateStationery(string itemCode, string categoryCode, string description,
            int reorderLevel, int reorderQuantity, string measureUnit, decimal itemPrice, int itemStock,
            string supplier1, string supplier2, string supplier3)
        {
            StationeryCatalogue stationery = em.StationeryCatalogues.Where(x => x.ItemCode == itemCode).FirstOrDefault();
            stationery.CategoryCode = categoryCode;
            stationery.Description = description;
            stationery.ReorderLevel = reorderLevel;
            stationery.ReorderQuantity = reorderQuantity;
            stationery.MeasureUnit = measureUnit;
            stationery.Price = itemPrice;
            stationery.Stock = itemStock;
            stationery.Supplier1 = supplier1;
            stationery.Supplier2 = supplier2;
            stationery.Supplier3 = supplier3;
            return em.SaveChanges();
        }
        public int DeleteStationery(string itemCode)
        {
            StationeryCatalogue stationery = em.StationeryCatalogues.Where(x => x.ItemCode == itemCode).FirstOrDefault();
            em.StationeryCatalogues.Remove(stationery);
            return em.SaveChanges();
        }
    }
}
