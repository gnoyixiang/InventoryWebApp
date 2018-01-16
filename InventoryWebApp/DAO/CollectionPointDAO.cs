using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace InventoryWebApp.DAO
{
    public class CollectionPointDAO 
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
            CollectionPoint collectionPoint = new CollectionPoint
            {
                CollectionPointCode = c.CollectionPointCode,
                CollectionVenue = c.CollectionVenue,
                CollectionTime = c.CollectionTime,
                SClerkInCharge = c.SClerkInCharge
            };
            em.CollectionPoints.Add(collectionPoint);
            return em.SaveChanges();
        }
        public int UpdateCollectionPoint(CollectionPoint c)
        {
            CollectionPoint collectionPoint = em.CollectionPoints.Where(x => x.CollectionPointCode == c.CollectionPointCode).FirstOrDefault();
            collectionPoint.CollectionVenue = c.CollectionVenue;
            collectionPoint.CollectionTime = c.CollectionTime;
            collectionPoint.SClerkInCharge = c.SClerkInCharge;
            return em.SaveChanges();
        }
        public int DeleteCollectionPoint(string collectionPointCode)
        {
            CollectionPoint collectionPoint = em.CollectionPoints.Where(x => x.CollectionPointCode == collectionPointCode).FirstOrDefault();
            em.CollectionPoints.Remove(collectionPoint);
            return em.SaveChanges();
        }
    }
}
