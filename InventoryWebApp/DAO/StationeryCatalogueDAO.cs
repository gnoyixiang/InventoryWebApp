using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryWebApp.DAO
{
    public class StationeryCatalogueDAO : IStationeryCatalogueDAO
    {
        EntityModel em = new EntityModel();
        public List<StationeryCatalogue> SearchByItemCode(string keyword)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.StationeryCatalogues.Where(x => x.ItemCode.Contains(keyword)).ToList();
            }
        }
        public List<StationeryCatalogue> SearchByDescription(string keyword)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.StationeryCatalogues.Where(x => x.Description.Contains(keyword)).ToList();
            }
        }
        public List<StationeryCatalogue> SearchByCategory(string keyword)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.StationeryCatalogues.Where(x => x.CategoryCode.Contains(keyword)).ToList();
            }
        }
        public List<StationeryCatalogue> ListAllStationery()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.StationeryCatalogues.ToList();
            }
        }
        public StationeryCatalogue GetStationery(string itemcode)
        {
            using (EntityModel em = new EntityModel())
            {
                StationeryCatalogue stationery = em.StationeryCatalogues.Where(x => x.ItemCode == itemcode).FirstOrDefault();
                return stationery;
            }
        }
        public int AddStationery(StationeryCatalogue st)
        {
            using (EntityModel em = new EntityModel())
            {
                try
                {
                    em.StationeryCatalogues.Add(st);
                    return em.SaveChanges();
                }
                catch (Exception e)
                {
                    return 0;
                }
            }
        }
        public int UpdateStationery(StationeryCatalogue st)
        {
            using (EntityModel em = new EntityModel())
            {
                StationeryCatalogue stationery = em.StationeryCatalogues.Where(x => x.ItemCode == st.ItemCode).FirstOrDefault();
                if (stationery != null)
                {
                    stationery.CategoryCode = st.CategoryCode;
                    stationery.Description = st.Description;
                    stationery.ReorderLevel = st.ReorderLevel;
                    stationery.ReorderQuantity = st.ReorderQuantity;
                    stationery.MeasureUnit = st.MeasureUnit;
                    stationery.Price = st.Price;
                    stationery.Stock = st.Stock;
                    stationery.Supplier1 = st.Supplier1;
                    stationery.Supplier2 = st.Supplier2;
                    stationery.Supplier3 = st.Supplier3;
                    return em.SaveChanges();
                }
                else
                    return 0;
            }
        }
        public void DeleteStationery(string itemCode)
        {
            using (EntityModel em = new EntityModel())
            {
                StationeryCatalogue stationery = em.StationeryCatalogues.Where(x => x.ItemCode == itemCode).FirstOrDefault();
                em.StationeryCatalogues.Remove(stationery);
                em.SaveChanges();
            }
        }
    }
}
