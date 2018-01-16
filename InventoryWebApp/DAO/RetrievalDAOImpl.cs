using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
namespace InventoryWebApp.DAO
{
    public class RetrievalDAOImpl
    {
        public int AddRetrieval(Retrieval r)
        {
            using (EntityModel en = new EntityModel())
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
               
                en.Retrievals.Add(re);
               return en.SaveChanges();
            }
        }


        public int UpdateRetrival(Retrieval r)
        {
            using (EntityModel en = new EntityModel())
            {
                Retrieval re = en.Retrievals.Where(p => p.RetrievalCode == r.RetrievalCode).FirstOrDefault<Retrieval>();
                re.Status = r.Status;
                re.Notes = r.Notes;
                re.DateRetrieved = r.DateRetrieved;
                re.UserName = r.UserName;
                return en.SaveChanges();
            }
        }

        public  List<Retrieval> ListRetrievalByDate(DateTime name)
        {
            using (EntityModel en = new EntityModel())
            {
                return en.Retrievals.Where(p => p.DateRetrieved== name).ToList<Retrieval>();
            }
        }

        public List<Retrieval> ListRetrievalByStatus(string name)
        {
            using (EntityModel en = new EntityModel())
            {
                return en.Retrievals.Where(p => p.Status== name).ToList<Retrieval>();
            }
        }

        public List<Retrieval> ListAllRetrieval()
        {
            using (EntityModel en = new EntityModel())
            {
                return en.Retrievals.ToList<Retrieval>();
            }
        }

        public Retrieval GetRetrieval(string retrievalCode)
        {
            using (EntityModel en = new EntityModel())
            {
                return en.Retrievals.Where(p => p.RetrievalCode == retrievalCode).FirstOrDefault<Retrieval>();
            }
        }

        public void DeleteRetrieval(string retrievalCode)
        {
            using (EntityModel en = new EntityModel())
            {
                Retrieval r = en.Retrievals.Where(p => p.RetrievalCode == retrievalCode).FirstOrDefault<Retrieval>();
                en.Retrievals.Remove(r);
                en.SaveChanges();
            }
        }

       
    }
}