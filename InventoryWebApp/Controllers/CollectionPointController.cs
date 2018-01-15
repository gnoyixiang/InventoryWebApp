using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace InventoryWebApp
{
    public  class CollectionPointController
    {
        EntityModel em = new EntityModel();
        public List<CollectionPoint> CollectionPoint()
        {
            return em.CollectionPoints.ToList();
        }
        public void UpdateCCP()
        {

        }
    }
}