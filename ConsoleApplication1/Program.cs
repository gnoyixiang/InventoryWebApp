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
            WCF_CollectionDate wcd = new WCF_CollectionDate();
            wcd.DatePlanToCollect = "11 Jul 2018";
            cs.ConfirmCollectionDate("08 Feb 2018", "nathalie@ssis.edu.sg", "null");
        }   
     }
}
