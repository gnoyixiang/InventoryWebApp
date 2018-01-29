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
        EntityModel em=new EntityModel();
        public List<Request> ListAllRequest()
        {
            using (EntityModel e = new EntityModel())
            {
                return e.Requests.ToList<Request>();
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

        public int UpdateRequestStatus(Request r)
        {
            Request req = em.Requests.Where(x => x.RequestCode == r.RequestCode).FirstOrDefault();

            req.Status = r.Status;
            req.DateApproved = r.DateApproved;
            req.HeadRemarks = r.HeadRemarks;
            req.ApprovedBy = r.ApprovedBy;
            return em.SaveChanges();

        }

        public int UpdateRequestApproval(Request r)
        {
            Request req = em.Requests.Where(x => x.RequestCode == r.RequestCode).FirstOrDefault();
            req.ApprovedBy = r.ApprovedBy;


            return em.SaveChanges();

        }

        public List<Request> SearchPendingRequestByName(string username, string deptcode)
        {
            return em.Requests.Where(x => x.UserName.Contains(username) && x.Status == "pending" && x.DepartmentCode == deptcode).ToList();
        }

        public List<Request> SearchPendingRequestByDate(DateTime d, string deptcode)
        {
            return em.Requests.Where(x => x.DateCreated == d && x.Status == "pending" && x.DepartmentCode == deptcode).ToList();
        }

        public List<Request> SearchRequestbyDept(string dept)
        {
            return em.Requests.Where(b => b.DepartmentCode.ToUpper().Contains(dept.Trim().ToUpper())).ToList();
        }
        public List<Request> SearchRequestbyStatus(string RequestStatus, string deptcode)
        {
            return em.Requests.Where(b => b.Status.ToUpper().Contains(RequestStatus.Trim().ToUpper()) && b.DepartmentCode == deptcode).ToList();
        }
        public List<Request> SearchRequestByDeptCode(string deptCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Requests.Where(b => b.DepartmentCode == deptCode)
                .ToList();
            }
        }
    }
}