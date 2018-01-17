using System.Collections.Generic;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public interface ICollectionPointDAO
    {
        int AddCollectionPoint(CollectionPoint c);
        void DeleteCollectionPoint(string collectionPointCode);
        List<CollectionPoint> SearchByCollectionPointCode(string keyword);
        List<CollectionPoint> SearchByCollectionVenue(string keyword);
        int UpdateCollectionPoint(CollectionPoint c);
        CollectionPoint GetCollectionPoint(string collectionPointCode);
        List<CollectionPoint> ListAllCollectionPoint();
    }
}