using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class AdjustmentDAO : IAdjustmentDAO
    {
        public List<Adjustment> ListAllAdjustments()
        {
            using (EntityModel em = new EntityModel())
            {
                List<Adjustment> a = new List<Adjustment>();
                a = em.Adjustments.ToList();
                return a;
            }
        }
        public List<Adjustment> SearchAdjustmentByStatus(String b)
        {
            using (EntityModel em = new EntityModel())
            {
                List<Adjustment> c = new List<Adjustment>();
                c = em.Adjustments.Where(x => x.Status == b).ToList();
                return c;
            }
        }
        public Adjustment GetAdjustment(string adjustmentCode)
        {
            using (EntityModel em = new EntityModel())
            {
                Adjustment adjResult = em.Adjustments.Where
                    (x => x.AdjustmentCode == adjustmentCode).FirstOrDefault();
                return adjResult;
            }
        }
        public string GetLastAdjustment()
        {
            using (EntityModel em = new EntityModel())
            {
                Adjustment adjResult = em.Adjustments.ToList().LastOrDefault();
                return adjResult.AdjustmentCode;
            }
        }
        public int AddAdjustment(Adjustment b)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Adjustments.Add(b);
                int a = em.SaveChanges();
                return a;
            }
        }
        public int UpdateAdjustment(Adjustment c)
        {
            using (EntityModel em = new EntityModel())
            {
                em.Entry(c).State = c.AdjustmentCode == null ?
                                   EntityState.Added :
                                   EntityState.Modified;
                //em.Entry(c).State = EntityState.Modified;
                return em.SaveChanges();
            }
        }
        public int UpdateAdjustment(string adjustmentCode, int adjustmentQuant, string reason)
        {
            using (EntityModel em = new EntityModel())
            {
                Adjustment c = new Adjustment();
                c = em.Adjustments.Where(x => x.AdjustmentCode == adjustmentCode).FirstOrDefault();
                c.AdjustmentQuant = adjustmentQuant;
                c.Reason = reason;
                int a = em.SaveChanges();
                return a;
            }
        }
        public int ApproveAdjustment(string adjustmentCode)
        {
            using (EntityModel em = new EntityModel())
            {
                Adjustment c = new Adjustment();
                c = em.Adjustments.Where(x => x.AdjustmentCode == adjustmentCode).FirstOrDefault();
                c.Status = "approved";
                int a = em.SaveChanges();
                return a;
            }
        }
        public int RejectAdjustment(string adjustmentCode, string headRemarks)
        {
            using (EntityModel em = new EntityModel())
            {
                Adjustment c = new Adjustment();
                c = em.Adjustments.Where(x => x.AdjustmentCode == adjustmentCode).FirstOrDefault();
                c.Status = "rejected";
                c.HeadRemarks = headRemarks;
                int a = em.SaveChanges();
                return a;
            }
        }

        public List<Adjustment> ListAllAdjustmentsByItemCode(string itemCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Adjustments.Where(x => x.ItemCode == itemCode).ToList<Adjustment>();
            }
        }

    }
}
