using InventoryWebApp.Models;
using System.Collections.Generic;

namespace InventoryWebApp.DAO
{
    public interface ICollectionPointDAO
    {
        int AddCollectionPoint(CollectionPoint c);
        void DeleteCollectionPoint(string collectionPointCode);
        List<CollectionPoint> SearchByCollectionPointCode(string keyword);
        List<CollectionPoint> SearchByCollectionVenue(string keyword);
        int UpdateCollectionPoint(CollectionPoint c);
    }
}