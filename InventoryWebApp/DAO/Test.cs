using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp
{
    public class Test
    {
        


        static void Main(string[] args)
        {
            Supplier sp = new Supplier()
            {
                SupplierCode = "s1",
                SupplierName = "Amit",
                ContactTitle = "Mr",
                ContactName = "Amit Mohanty",
                PhoneNo = "1234567",
                FaxNo = "461 2238",
                Address = "Jurong",
                GSTRegistrationNo = "G01",
                Notes = "First_Time"


            };

            SupplierDetail spDetail = new SupplierDetail()
            {
                SupplierCode = sp.SupplierCode,
                ItemCode = "A101",
                Price = 10
           };



        }

    }
}