using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;

namespace InventoryWebApp.DAO
{
    public class RequestDetailsDAO : IRequestDetailsDAO
    {
        RequestDetail rd;
       public List<RequestDetail> SearchOutstandingRequestDetails()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.RequestDetails.Where(rd =>rd.RemainingQuant!=0).ToList();
            }
        }

        public List<RequestDetail> ListRequestDetail(string RequestCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.RequestDetails.Where(b => b.RequestCode.ToUpper().Contains(RequestCode.Trim().ToUpper())).ToList();
            }

        }
        public List<RequestDetail> SearchRequestbyStatus(string RequestDetailStatus)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.RequestDetails.Where(b => b.Status.ToUpper().Contains(RequestDetailStatus.Trim().ToUpper())).ToList();
            }

        }


        public int UpdateRequestDetailStatus(RequestDetail R, string newStatus)
        {
            using (EntityModel e = new EntityModel())
            {
                int a = -1;
                R.Status = newStatus;
                a = e.SaveChanges();
                return a;
            }
        }

        public int UpdateRequestDetailItemQuantity(RequestDetail R, int qtyChanged)
        {
            using (EntityModel em = new EntityModel())
            {
                int a = -1;
                int qtyRem = (int)R.Quantity;
                R.RemainingQuant = qtyRem - qtyChanged;
                a = em.SaveChanges();

                return a;
            }
        }

        public int CancelRequestDetail(RequestDetail rd)
        {
            using (EntityModel em = new EntityModel())
            {
                rd.Status = "CANCELLED";
                int changes = 0;
                em.Entry(rd).State = System.Data.Entity.EntityState.Modified;
                changes = em.SaveChanges();
                return changes;
            }

        }

        public RequestDetail GetRequestDetail(string requestCode, string itemCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.RequestDetails
                    .Where(r => r.RequestCode == requestCode && r.ItemCode == itemCode)
                    .FirstOrDefault<RequestDetail>();
            }
        }

        public int UpdateRequestDetail(RequestDetail rDetail)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(rDetail).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }

        public int DeleteRequestDetail(RequestDetail rDetail)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(rDetail).State = EntityState.Deleted;
                return em.SaveChanges();
            }
        }

        public int AddRequestDetail(RequestDetail rd)
        {
            using (EntityModel em = new EntityModel())
            {
                em.RequestDetails.Add(rd);
                return em.SaveChanges();
            }
        }

    }
}