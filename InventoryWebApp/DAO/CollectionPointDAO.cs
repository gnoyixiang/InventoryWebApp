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
        EntityModel em = new EntityModel();
        public List<CollectionPoint> SearchByCollectionPointCode(string keyword)
        {
            return em.CollectionPoints.Where(x => x.CollectionPointCode.Contains(keyword)).ToList();
        }
        public List<CollectionPoint> SearchByCollectionVenue(string keyword)
        {
            return em.CollectionPoints.Where(x => x.CollectionVenue.Contains(keyword)).ToList();
        }
        public int AddCollectionPoint(CollectionPoint c)
        {
            try
            {
                em.CollectionPoints.Add(c);
                return em.SaveChanges();
            }
            catch(Exception e)
            {
                return 0;
            }
        }
        public int UpdateCollectionPoint(CollectionPoint c)
        {
            CollectionPoint collectionPoint = em.CollectionPoints.Where(x => x.CollectionPointCode == c.CollectionPointCode).FirstOrDefault();
            if( collectionPoint != null)
            {
                collectionPoint.CollectionVenue = c.CollectionVenue;
                collectionPoint.CollectionTime = c.CollectionTime;
                collectionPoint.SClerkInCharge = c.SClerkInCharge;
                return em.SaveChanges();
            }
            else
                return 0;
        }
        public void DeleteCollectionPoint(string collectionPointCode)
        {
            CollectionPoint collectionPoint = em.CollectionPoints.Where(x => x.CollectionPointCode == collectionPointCode).FirstOrDefault();
            em.CollectionPoints.Remove(collectionPoint);
            em.SaveChanges();
        }
        public CollectionPoint GetCollectionPoint(string collectionPointCode)
        {
            CollectionPoint cp = em.CollectionPoints.Where(x => x.CollectionPointCode == collectionPointCode).FirstOrDefault();
            return cp;
        }
    }
}
