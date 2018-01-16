using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models;

namespace InventoryWebApp.DAO
{
    public class StoreSupervisorDAOImpl : StoreSupervisorDAO
    {
        //Creating EntityModel class obejct.
        EntityModel em = new EntityModel();

        /*
         * This method will return the List of supplier
         */
        public List<Supplier> supplierList()
        {
            return em.Suppliers.ToList<Supplier>();
        }
    }
}