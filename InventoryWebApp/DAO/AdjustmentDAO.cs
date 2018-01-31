using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryWebApp.DAO
{
    public class AdjustmentDAO : IAdjustmentDAO
    {
        EntityModel em = new EntityModel();
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
        public int AddAdjustment(Adjustment b)
        {

            using (EntityModel em = new EntityModel())
            {
                em.Adjustments.Add(b);
                int a = em.SaveChanges();
                return a;
            }
        }
        public int UpdateAdjustment(string b, int d, string e)
        {

            using (EntityModel em = new EntityModel())
            {
                Adjustment c = new Adjustment();
                c = em.Adjustments.Where(x => x.AdjustmentCode == b).FirstOrDefault();
                c.AdjustmentQuant = d;
                c.Reason = e;
                int a = em.SaveChanges();
                return a;
            }
        }

        public List<Adjustment> ListAllAdjustmentsByItemCode(string itemCode,DateTime start)
        {

            using (EntityModel em = new EntityModel())
            {
                return em.Adjustments.Where(x => x.ItemCode == itemCode && x.DateApproved>=start).ToList<Adjustment>();
            }
        }
        public int UpdateAdjustmentByStoreSupervisor(Adjustment adjustment)
        {
            using (EntityModel em = new EntityModel())
            {
                Adjustment ad = em.Adjustments.Where(x => x.AdjustmentCode.Equals(adjustment.AdjustmentCode)).FirstOrDefault();

                ad.AdjustmentCode = adjustment.AdjustmentCode;
                ad.Status = adjustment.Status;
                ad.DateApproved = adjustment.DateApproved;
                ad.ApprovedBy = adjustment.ApprovedBy;
                //ad.Notes = adjustment.Notes;
                ad.HeadRemarks = adjustment.HeadRemarks;

                return em.SaveChanges();


            }


        }
        public Adjustment GetAdjustmentByAdjustmentCode(string adjustmentCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Adjustments.Where(x => x.AdjustmentCode.Equals(adjustmentCode)).FirstOrDefault();


            }

        }

    }
}
