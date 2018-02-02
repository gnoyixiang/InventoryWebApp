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
        static IRetrievalDAO re = new RetrievalDAO();
        static IClerkService cs = new ClerkService();
        public static void Main(String[] args)
        {
            IClerkService cs = new ClerkService();
            cs.GetOutstandingRequests();
            
        }   
     }
}
