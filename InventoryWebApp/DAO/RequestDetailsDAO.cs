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
        EntityModel em;
        RequestDetail rd;

        public List<RequestDetail> ListRequestDetail(string RequestCode)
        {
            using (em = new EntityModel())
            {
                return em.RequestDetails.Where(b => b.RequestCode.ToUpper().Contains(RequestCode.Trim().ToUpper())).ToList();
            }
            
        }
        public List<RequestDetail> SearchRequestbyStatus(string RequestDetailStatus)
        {
            using (em = new EntityModel())
            {
                return em.RequestDetails.Where(b => b.Status.ToUpper().Contains(RequestDetailStatus.Trim().ToUpper())).ToList();
            }
                
        }


        public int UpdateRequestDetailStatus(RequestDetail R, string newStatus)
        {
            int a = -1;
            R.Status = newStatus;
            a = em.SaveChanges();
            return a;
        }

        public int UpdateRequestDetailItemQuantity(RequestDetail R, int qtyChanged)
        {
            int a = -1;
            int qtyRem = (int)R.Quantity;
            R.RemainingQuant = qtyRem - qtyChanged;
            a = em.SaveChanges();

            return a;
        }

        public int CancelRequestDetail(RequestDetail rd)
        {
            rd.Status = "CANCELLED";
            int changes = 0;
            em.Entry(rd).State = System.Data.Entity.EntityState.Modified;
            changes = em.SaveChanges();
            return changes;

        }

        public RequestDetail GetRequestDetail(string RequestC, string itemCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.RequestDetails
                    .Where(r => r.RequestCode == RequestC && r.ItemCode == itemCode)
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

    }
}