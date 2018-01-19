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
        EntityModel em=new EntityModel();
        public List<Request> ListAllRequest()
        {
            return em.Requests.ToList();
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

        public int UpdateRequestStatus(Request r)
        {
            Request req = em.Requests.Where(x => x.RequestCode == r.RequestCode).FirstOrDefault();

            req.Status = r.Status;
            req.DateApproved = r.DateApproved;
            req.HeadRemarks = r.HeadRemarks;
            return em.SaveChanges();
            
        }

        public int UpdateRequestApproval(Request r)
        {
            Request req = em.Requests.Where(x => x.RequestCode == r.RequestCode).FirstOrDefault();
            req.ApprovedBy = r.ApprovedBy;


            return em.SaveChanges();
            
        }

        public List<Request> SearchPendingRequestByName(string username)
        {
            return em.Requests.Where(x => x.UserName.Contains(username)&&x.Status=="pending").ToList();
        }

        public List<Request> SearchPendingRequestByDate(DateTime d)
        {
            return em.Requests.Where(x => x.DateCreated==d && x.Status == "pending").ToList();
        }




    }
}