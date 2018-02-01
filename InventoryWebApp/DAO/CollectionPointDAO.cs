using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryWebApp.DAO
{
    public class CollectionPointDAO : ICollectionPointDAO
    {
        public List<CollectionPoint> SearchByCollectionPointCode(string keyword)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.CollectionPoints.Where(x => x.CollectionPointCode.Contains(keyword)).ToList();
            }
        }
        public List<CollectionPoint> SearchByCollectionVenue(string keyword)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.CollectionPoints.Where(x => x.CollectionVenue.Contains(keyword)).ToList();
            }
        }
        public List<CollectionPoint> ListAllCollectionPoint()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.CollectionPoints.ToList();
            }
        }
        public int AddCollectionPoint(CollectionPoint c)
        {
            using (EntityModel em = new EntityModel())
            {
                int result = -1;
                try
                {
                    em.CollectionPoints.Add(c);
                    result = em.SaveChanges();
                    return 1;
                }
                catch (Exception e)
                {
                    return 0;
                }
            }
        }
        public int UpdateCollectionPoint(CollectionPoint c)
        {
            using (EntityModel em = new EntityModel())
            {
                CollectionPoint collectionPoint = em.CollectionPoints.Where(x => x.CollectionPointCode == c.CollectionPointCode).FirstOrDefault();
                if (collectionPoint != null)
                {
                    collectionPoint.CollectionVenue = c.CollectionVenue;
                    collectionPoint.CollectionTime = c.CollectionTime;
                    collectionPoint.SClerkInCharge = c.SClerkInCharge;
                    return em.SaveChanges();
                }
                else
                    return 0;
            }
        }
        public void DeleteCollectionPoint(string collectionPointCode)
        {
            using (EntityModel em = new EntityModel())
            {
                CollectionPoint collectionPoint = em.CollectionPoints.Where(x => x.CollectionPointCode == collectionPointCode).FirstOrDefault();
                em.CollectionPoints.Remove(collectionPoint);
                em.SaveChanges();
            }
        }
        public CollectionPoint GetCollectionPoint(string collectionPointCode)
        {
            using (EntityModel em = new EntityModel())
            {
                CollectionPoint cp = em.CollectionPoints.Where(x => x.CollectionPointCode == collectionPointCode).FirstOrDefault();
                return cp;
            }
        }
        public string GetCollectionPointNameByCode(string collectionPointCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.CollectionPoints.Where(x => x.CollectionPointCode.Equals(collectionPointCode)).Select(p => p.CollectionVenue).FirstOrDefault();
            }
        }
    }
}
