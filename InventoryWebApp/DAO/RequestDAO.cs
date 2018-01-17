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
        EntityModel em;
        Request r;
        public List<Request> ListAllRequest()
        {
            em = new EntityModel();
            return em.Requests.ToList<Request>();
        }

        public List<Request> SearchRequestbyID(string RequestC)
        {
            return em.Requests.Where(b => b.RequestCode.ToUpper().Contains(RequestC.Trim().ToUpper())).ToList();
        }
        public List<Request> SearchRequestbyStatus(string RequestStatus)
        {
            return em.Requests.Where(b => b.Status.ToUpper().Contains(RequestStatus.Trim().ToUpper())).ToList();
        }
        public List<Request> SearchRequestbyDate(string RequestDate)
        {
            return em.Requests.Where(b => b.DateCreated == Convert.ToDateTime(RequestDate)).ToList();
        }
        public Request GetRequest(string ROCode)
        {
            return new EntityModel().Requests.Where(p => p.RequestCode == ROCode).FirstOrDefault<Request>();
        }
        public int AddRequest(Request newR)
        {
            int a = -1;
            using (em = new EntityModel())
            {
                em.Requests.Add(newR);
                a = em.SaveChanges();
            }

            return a;
        }


        public int UpdateRequestStatus(Request R, string newStatus)
        {
            int a = -1;
            R.Status = newStatus;
            a = em.SaveChanges();
            return a;
        }

        public int UpdateRequestApproval(Request R, string ApprovedN)
        {
            int a = -1;
            R.ApprovedBy = ApprovedN;
            a = em.SaveChanges();
            return a;
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