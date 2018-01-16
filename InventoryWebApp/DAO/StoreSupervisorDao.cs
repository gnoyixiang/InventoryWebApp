using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models;

namespace InventoryWebApp.DAO
{
    interface StoreSupervisorDAO
    {
        List<Supplier> supplierList();
        
    }
}
