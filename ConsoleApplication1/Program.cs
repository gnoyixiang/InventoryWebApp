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
            EmployeeService e = new EmployeeService();
            List<WCF_Disbursement> dlist = e.ListAllDisbursement();
            foreach(WCF_Disbursement w in dlist)
            {
                Console.WriteLine(w.DisbursementCode);
            }
        }
    }
}
