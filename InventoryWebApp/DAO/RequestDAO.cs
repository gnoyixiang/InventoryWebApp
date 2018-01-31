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
            using (EntityModel em = new EntityModel())
            {
                return em.Requests.Where(p => p.RequestCode == ROCode).FirstOrDefault<Request>();
            }
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
                Request re = em.Requests.Where(x => x.RequestCode == r.RequestCode).FirstOrDefault();
                re.Status = r.Status;
                em.Entry(r).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }
        public List<Request> SearchRequestbyStatus(string RequestStatus, string deptcode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Requests.Where(b => b.Status.ToUpper().Contains(RequestStatus.Trim().ToUpper()) && b.DepartmentCode == deptcode).ToList();
            }
        }
        public int UpdateRequestStatus(Request r)
        {
            using (EntityModel em = new EntityModel())
            {
                Request req = em.Requests.Where(x => x.RequestCode == r.RequestCode).FirstOrDefault();

                req.Status = r.Status;
                req.DateApproved = r.DateApproved;
                req.HeadRemarks = r.HeadRemarks;
                req.ApprovedBy = r.ApprovedBy;
                return em.SaveChanges();
            }

        }

        public int UpdateRequestApproval(Request r)
        {
            using (EntityModel em = new EntityModel())
            {
                Request req = em.Requests.Where(x => x.RequestCode == r.RequestCode).FirstOrDefault();
                req.ApprovedBy = r.ApprovedBy;


                return em.SaveChanges();
            }
        }
    }
}