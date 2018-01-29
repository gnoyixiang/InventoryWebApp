using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class TenderDetailsDAO : ITenderDetailsDAO
    {

        public TenderDetail getTenderDetail(string tenderCode, string itemCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.TenderDetails.Where(t => t.TenderCode.ToUpper() == tenderCode.ToUpper() 
                && t.ItemCode.ToUpper() == itemCode.ToUpper()).FirstOrDefault<TenderDetail>();
            }
        }

        public List<TenderDetail> ListAllTenderDetails()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.TenderDetails.ToList<TenderDetail>();
            }
        }

        public List<TenderDetail> ListTenderDetailsByTenderCode(string tenderCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.TenderDetails.Where(t => t.TenderCode.ToUpper().Contains(tenderCode.ToUpper())).ToList<TenderDetail>();
            }
        }

        public List<TenderDetail> ListTenderDetailsByItemCode(string itemCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.TenderDetails.Where(t => t.ItemCode.ToUpper().Contains(itemCode.ToUpper())).ToList<TenderDetail>();
            }
        }

        public List<TenderDetail> ListTenderDetailsByPrice(decimal price)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.TenderDetails.Where(t => t.Price == price).ToList<TenderDetail>();
            }
        }

        public List<TenderDetail> ListTenderDetailsByPrice(decimal startPrice, decimal endPrice)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.TenderDetails.Where(t => t.Price >= startPrice && t.Price <= endPrice).ToList<TenderDetail>();
            }
        }

        public int addTenderDetail(TenderDetail tenderDetail)
        {
            using (EntityModel em = new EntityModel())
            {
                em.TenderDetails.Add(tenderDetail);
                return em.SaveChanges();
            }
        }

        public int updateTenderDetail(TenderDetail tenderDetail)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(tenderDetail).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }

        
    }
}
