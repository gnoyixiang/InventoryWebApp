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
        private EntityModel em;

        public TenderDetail getTenderDetail(string tenderCode, string itemCode)
        {
            TenderDetail td = null;
            using (em = new EntityModel())
            {
                td = em.TenderDetails.Where(t => t.TenderCode == tenderCode && t.ItemCode == itemCode).FirstOrDefault<TenderDetail>();
            }
            return td;
        }

        public List<TenderDetail> ListAllTenderDetails()
        {
            List<TenderDetail> tdList = null;
            using (em = new EntityModel())
            {
                tdList = em.TenderDetails.ToList<TenderDetail>();
            }
            return tdList;
        }

        public List<TenderDetail> ListTendersByTenderCode(string tenderCode)
        {
            List<TenderDetail> tdList = null;
            using (em = new EntityModel())
            {
                tdList = em.TenderDetails.Where(t => t.TenderCode == tenderCode).ToList<TenderDetail>();
            }
            return tdList;
        }

        public List<TenderDetail> ListTendersByItemCode(string itemCode)
        {
            List<TenderDetail> tdList = null;
            using (em = new EntityModel())
            {
                tdList = em.TenderDetails.Where(t => t.ItemCode == itemCode).ToList<TenderDetail>();
            }
            return tdList;
        }

        public List<TenderDetail> ListTendersByPrice(decimal price)
        {
            List<TenderDetail> tdList = null;
            using (em = new EntityModel())
            {
                tdList = em.TenderDetails.Where(t => t.Price == price).ToList<TenderDetail>();
            }
            return tdList;
        }

        public List<TenderDetail> ListTendersByPrice(decimal startPrice, decimal endPrice)
        {
            List<TenderDetail> tdList = null;
            using (em = new EntityModel())
            {
                tdList = em.TenderDetails.Where(t => t.Price >= startPrice && t.Price <= endPrice).ToList<TenderDetail>();
            }
            return tdList;
        }

        public int addTenderDetail(TenderDetail tenderDetail)
        {
            int result = -1;
            using (em = new EntityModel())
            {
                em.TenderDetails.Add(tenderDetail);
                result = em.SaveChanges();
            }
            return result;
        }

        public int updateTenderDetail(TenderDetail tenderDetail)
        {
            int result = -1;
            using (em = new EntityModel())
            {
                em.Entry(tenderDetail).State = EntityState.Modified;
                result = em.SaveChanges();
            }
            return result;
        }
    }
}
