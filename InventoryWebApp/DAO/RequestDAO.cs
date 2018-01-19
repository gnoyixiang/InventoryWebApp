using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class RequestDAO : IRequestDAO
    {
        Request r;
        public List<Request> ListAllRequest()
        {        
            using (EntityModel e = new EntityModel())
            {
                return  e.Requests.ToList<Request>();            
            }
        }

        public List<Request> SearchRequestbyID(string RequestC)
        {
            using (EntityModel e = new EntityModel())
            {
                return e.Requests.Where(b => b.RequestCode.ToUpper().Contains(RequestC.Trim().ToUpper())).ToList();
            }
        }
        public List<Request> SearchRequestbyStatus(string RequestStatus)
        {
            using (EntityModel e = new EntityModel())
            {
                return e.Requests.Where(b => b.Status.ToUpper().Contains(RequestStatus.Trim().ToUpper())).ToList();
            }
        }
        public List<Request> SearchRequestbyDate(DateTime RequestDate)
        {
            using (EntityModel e = new EntityModel())
            {
                return e.Requests.Where(b => b.DateCreated == RequestDate).ToList();
            }
        }
        public Request GetRequest(string ROCode)
        {
            using (EntityModel e = new EntityModel())
            {
                return new EntityModel().Requests.Where(p => p.RequestCode == ROCode).FirstOrDefault<Request>();
            }
        }
        public int AddRequest(Request newR)
        {
            int a = -1;
            using (EntityModel e = new EntityModel())
            {
                e.Requests.Add(newR);
                a = e.SaveChanges();
            }
            return a;
        }


        public int UpdateRequestStatus(Request R, string newStatus)
        {
            using (EntityModel e = new EntityModel())
            {
                int a = -1;
                R.Status = newStatus;
                a = e.SaveChanges();
                return a;
            }

        }

        public int UpdateRequestApproval(Request R, string ApprovedN)
        {
            using (EntityModel e = new EntityModel())
            {
                int a = -1;
                R.ApprovedBy = ApprovedN;
                a = e.SaveChanges();
                return a;
            }
        }

        public int UpdateRequest(Request r)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(r).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }


    }
}