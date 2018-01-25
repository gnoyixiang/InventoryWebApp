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
        static IRetrievalDAO re = new RetrievalDAO();
        public static void Main(String[] args)
        {
            re.ListRetrievalByStatus("processing");
        }   
     }
}
