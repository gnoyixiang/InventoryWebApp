using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace ConsoleTestApp
{
    class Program
    {
        static void Main(string[] args)
        {
            IPurchaseOrderDAO IPO = new PurchaseOrderDAO();
            var po = IPO.GetPurchaseOrder("123");

            PODetail pod = new PODetail();


            Console.WriteLine(po.UserName);
            Console.WriteLine(po.UserName);
            Console.WriteLine(po.UserName);
        }
    }
}
