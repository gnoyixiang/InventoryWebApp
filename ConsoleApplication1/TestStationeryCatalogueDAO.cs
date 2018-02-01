using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleTestApp
{
    class TestStationeryCatalogueDAO
    {
    //    public static void Main(String[] args)
    //    {
    //        //Get Stationery
    //        IStationeryCatalogueDAO ISC = new StationeryCatalogueDAO();
    //        var sc = ISC.GetStationery("C001");
    //        Console.WriteLine(sc.Description);
    //        //Get List Stationery
    //        var allsc = ISC.ListAllStationery();
    //        foreach (StationeryCatalogue st in allsc)
    //        {
    //            Console.WriteLine(SCToString(st));
    //        }
    //        //Add stationery
    //        StationeryCatalogue sct = new StationeryCatalogue()
    //        {
    //            ItemCode = "0002",
    //            CategoryCode = "Pen",
    //            Description = "Large Tray",
    //            ReorderLevel = 50,
    //            ReorderQuantity = 40,
    //            MeasureUnit = "Box",
    //            Price = 2,
    //            Stock = 100,
    //            Supplier1 = "ALPA",
    //            Supplier2 = "CHEP",
    //            Supplier3 = "BANE"
    //        };
    //        var stationery = ISC.AddStationery(sct);
    //        Console.WriteLine(stationery);
    //        //Update stationery
    //        ISC.UpdateStationery(sct);
    //        //Delete stationery
    //        ISC.DeleteStationery("0002");
    //    }
    //    private static string SCToString(StationeryCatalogue sc)
    //    {
    //        return "ItemCode: " + sc.ItemCode + ", CategoryCode: " + sc.CategoryCode + ", Description: " + sc.Description
    //            + ", ReorderLevel: " + sc.ReorderLevel + ", ReOrderQuantity: " + sc.ReorderQuantity + ", MearsureUnit: " + sc.MeasureUnit
    //            + ", Price: " + sc.Price + ", Stock: " + sc.Stock + ", Supplier1:" + sc.Supplier1 + ", Supplier2:" + sc.Supplier2 + ", Supplier3:" + sc.Supplier3;
    //    }
    }
}

