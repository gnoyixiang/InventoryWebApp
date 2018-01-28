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
            DepartmentService d = new DepartmentService();
           List<WCFRequestDetail> rlist= d.ListRequestDetail("RQ123456789");
            foreach(WCFRequestDetail w in rlist)
            {
                Console.WriteLine(w.CategoryCode);
            }
        }
    }
}
