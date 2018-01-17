using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleTestApp
{
    class TestCollectionPointDAO
    {
        public static void Main(String[] args)
        {

            // Get Collection Point
            ICollectionPointDAO ICD = new CollectionPointDAO();
            var gcp = ICD.GetCollectionPoint("ENGSCH");
            Console.WriteLine(gcp.CollectionVenue);
            //Get List Collection Point
            var allCP = ICD.ListAllCollectionPoint();
            foreach (CollectionPoint collectPoint in allCP)
            {
                Console.WriteLine(CPToString(collectPoint));
            }
            //Add CollectionPoint
            TimeSpan date = new TimeSpan(11, 00, 00);

            CollectionPoint cp = new CollectionPoint()
            {
                CollectionPointCode = "BUSSSSS",
                CollectionVenue = "Business School",
                CollectionTime = date,
                SClerkInCharge = "10001"
            };
            ICD.AddCollectionPoint(cp);
            Console.WriteLine(cp);
            //Update CollectionPoint
            ICD.UpdateCollectionPoint(cp);
            Console.WriteLine(cp);
            //Delete collectionPoint
            ICD.DeleteCollectionPoint("SeeeS");
            Console.WriteLine(cp);
        }
        private static string CPToString(CollectionPoint cpoint)
        {
            return "Collection Point Code: " + cpoint.CollectionPointCode + 
                ", Collection Point Venue: " + cpoint.CollectionVenue +
                ", Collection Time: " + cpoint.CollectionTime;
        }
    }
}
