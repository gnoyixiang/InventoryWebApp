using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class TenderDAO : ITenderDAO
    {
        private EntityModel em;

        public Tender getTender(string tenderCode)
        {
            Tender tender = null;
            using (em = new EntityModel())
            {
                tender = em.Tenders.Where(t => t.TenderCode == tenderCode).FirstOrDefault<Tender>();
            }
            return tender;
        }

        public List<Tender> ListAllTenders()
        {
            List<Tender> tenderList = null;
            using (em = new EntityModel())
            {
                tenderList = em.Tenders.ToList<Tender>();
            }
            return tenderList;
        }

        public List<Tender> ListTendersBySupplierCode(string supplierCode)
        {
            List<Tender> tenderList = null;
            using (em = new EntityModel())
            {
                tenderList = em.Tenders.Where(t => t.SupplierCode == supplierCode).ToList<Tender>();
            }
            return tenderList;
        }

        public List<Tender> ListTendersByUsername(string username)
        {
            List<Tender> tenderList = null;
            using (em = new EntityModel())
            {
                tenderList = em.Tenders
                    .Where(t => t.UserName == username)
                    .ToList<Tender>();
            }
            return tenderList;
        }

        public List<Tender> ListPurchaseOrderByDateCreated(DateTime dateCreated)
        {
            List<Tender> tenderList;
            using (em = new EntityModel())
            {
                tenderList = em.Tenders
                    .Where(t => Convert.ToDateTime(t.DateCreated).Date == dateCreated.Date)
                    .ToList<Tender>();
            }
            return tenderList;
        }

        public List<Tender> ListPurchaseOrderByCreated(DateTime startDate, DateTime endDate)
        {
            List<Tender> tenderList;
            using (em = new EntityModel())
            {
                tenderList = em.Tenders
                    .Where(t => Convert.ToDateTime(t.DateCreated).Date >= startDate.Date
                    && Convert.ToDateTime(t.DateCreated).Date >= endDate.Date)
                    .ToList<Tender>();
            }
            return tenderList;
        }

        public int AddTender(Tender tender)
        {
            int result = -1;
            using (em = new EntityModel())
            {
                em.Tenders.Add(tender);
                result = em.SaveChanges();
            }
            return result;
        }

        public int UpdateTender(Tender tender)
        {
            int result = -1;
            using (em = new EntityModel())
            {
                em.Entry(tender).State = EntityState.Modified;
                result = em.SaveChanges();
            }
            return result;
        }
    }
}
