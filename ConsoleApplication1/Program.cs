using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.WCF;

namespace ConsoleTestApp
{
    class Program
    {
        public static void Main(String[] args)
        {
            /*SupervisorService s = new SupervisorService();
            List<WCFPurchaseOrder> pl=s.GetAllPendingPO();
            foreach(WCFPurchaseOrder w in pl)
            {
                Console.WriteLine(w.HeadRemark);
                Console.WriteLine(w.DateApproved);
                Console.WriteLine(w.DateSupplyExpected);
                Console.WriteLine(w.DateCreated);
                Console.WriteLine(w.DateReceived);
                Console.WriteLine(w.PurchaseOrderCode);
                Console.WriteLine(w.Note);
                Console.WriteLine(w.Status);
                Console.WriteLine(w.SupplierCode);

            }*/

            IDepartmentService dsvc = new DepartmentService();
            WCFAssignRole role = new WCFAssignRole("1", "Rep", "10001", "2018-01-30", "2018-01-31",null , null);
            Console.WriteLine( dsvc.AddAssignRole(role));
        }
    }
}
