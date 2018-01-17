using InventoryWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

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