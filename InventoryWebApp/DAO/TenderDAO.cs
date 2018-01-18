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

        public Tender getTender(string tenderCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Tenders.Where(t => t.TenderCode == tenderCode).FirstOrDefault<Tender>();
            }
          
        }

        public List<Tender> ListAllTenders()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Tenders.ToList<Tender>();
            }
        }

        public List<Tender> ListTendersBySupplierCode(string supplierCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Tenders.Where(t => t.SupplierCode.ToUpper().Contains(supplierCode.ToUpper())).ToList<Tender>();
            }
        }

        public List<Tender> ListTendersByUsername(string username)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Tenders
                    .Where(t => t.UserName.ToUpper().Contains(username.ToUpper()))
                    .ToList<Tender>();
            }
        }

        public List<Tender> ListPurchaseOrderByDateCreated(DateTime dateCreated)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Tenders
                    .Where(t =>t.DateCreated == dateCreated.Date)
                    .ToList<Tender>();
            }
        }

        public List<Tender> ListPurchaseOrderByCreated(DateTime startDate, DateTime endDate)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Tenders
                    .Where(t => t.DateCreated >= startDate.Date
                    && t.DateCreated <= endDate.Date)
                    .ToList<Tender>();
            }
        }

        public int AddTender(Tender tender)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Tenders.Add(tender);
                return em.SaveChanges();
            }
        }

        public int UpdateTender(Tender tender)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(tender).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }
    }
}
