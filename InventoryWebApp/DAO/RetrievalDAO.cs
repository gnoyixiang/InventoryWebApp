using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class RetrievalDAO : IRetrievalDAO
    {
        public int AddRetrieval(Retrieval r)
        {
            using (EntityModel em = new EntityModel())
            {
                Retrieval re = new Retrieval
                {
                    RetrievalCode = r.RetrievalCode,
                    Status = r.Status,
                    Notes = r.Notes,
                    DateRetrieved = r.DateRetrieved,
                    UserName = r.UserName,
                    RetrievalDetails = r.RetrievalDetails

                };

                em.Retrievals.Add(re);
                return em.SaveChanges();
            }
        }


        public int UpdateRetrival(Retrieval r)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(r).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }

        public List<Retrieval> ListRetrievalByDate(DateTime name)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Retrievals.Where(p => p.DateRetrieved == name).ToList<Retrieval>();
            }
        }

        public List<Retrieval> ListRetrievalByStatus(string name)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Retrievals.Where(p => p.Status == name).ToList<Retrieval>();
            }
        }

        public List<Retrieval> ListAllRetrieval()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Retrievals.ToList<Retrieval>();
            }
        }

        public Retrieval GetRetrieval(string retrievalCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Retrievals.Where(p => p.RetrievalCode == retrievalCode).FirstOrDefault<Retrieval>();
            }
        }

        public void DeleteRetrieval(string retrievalCode)
        {
            using (EntityModel em = new EntityModel())
            {
                Retrieval r = em.Retrievals.Where(p => p.RetrievalCode == retrievalCode).FirstOrDefault<Retrieval>();
                em.Retrievals.Remove(r);
                em.SaveChanges();
            }
        }

    }
}