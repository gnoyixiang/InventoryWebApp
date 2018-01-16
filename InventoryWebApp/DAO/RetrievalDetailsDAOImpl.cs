using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class RetrievalDetailsDAOImpl
    {
        public int UpdateRetrivalDetails(RetrievalDetail rd)
        {
            using (EntityModel en = new EntityModel())
            {
                RetrievalDetail r = en.RetrievalDetails.Where(p => p.RetrievalCode == rd.RetrievalCode && p.ItemCode==rd.ItemCode).FirstOrDefault<RetrievalDetail>();
                r.Quantity = rd.Quantity;
                r.Notes = rd.Notes;
                return en.SaveChanges();
            }
        }

        public void DeleteRetrievalDetails(RetrievalDetail rd)
        {
            using (EntityModel en = new EntityModel())
            {
                RetrievalDetail r = en.RetrievalDetails.Where(p => p.RetrievalCode == rd.RetrievalCode && p.ItemCode == rd.ItemCode).FirstOrDefault<RetrievalDetail>();
                en.RetrievalDetails.Remove(r);
                en.SaveChanges();
            }
        }

        public List<RetrievalDetail> ListAllRetrievalDetails()
        {
            using (EntityModel en = new EntityModel())
            {
                return en.RetrievalDetails.ToList<RetrievalDetail>();
            }
        }

        public RetrievalDetail GetRetrievalDetails(string retrievalCode,string itemCode)
        {
            using (EntityModel en = new EntityModel())
            {
                return en.RetrievalDetails.Where(p => p.RetrievalCode == retrievalCode && p.ItemCode==itemCode).FirstOrDefault<RetrievalDetail>();
            }
        }

        public List<RetrievalDetail> ListRetrievalDetailsByRetrievalCode(string name)
        {
            using (EntityModel en = new EntityModel())
            {
                return en.RetrievalDetails.Where(p => p.RetrievalCode == name).ToList<RetrievalDetail>();
            }
        }

        public List<RetrievalDetail> ListRetrievalDetailsByitemCode(string name)
        {
            using (EntityModel en = new EntityModel())
            {
                return en.RetrievalDetails.Where(p => p.ItemCode== name).ToList<RetrievalDetail>();
            }
        }
    }
}