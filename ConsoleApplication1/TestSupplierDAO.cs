using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.DAO;
namespace ConsoleTestApp
{
    class TestSupplierDAO
    {
        //public static void Main(string[] args)
        //{



            ////1.
            ////Create supplier detail and pass the supplierDetail to add to the supplier's suppdetails collection so while 
            ////creatig supplier supplier detail object will create.

            //SupplierDetail spdetail = new SupplierDetail()
            //{
            //    //This item code is the foreign key so must be match with existing item code in the catalogue file.
            //    ItemCode = "C001",
            //    Price = 10

            //};
            ////Create the supplier to add new supplier
            //Supplier sp = new Supplier()
            //{
            //    SupplierCode = "SP02",
            //    SupplierName = "Chai Chain",
            //    ContactTitle = "Mr",
            //    ContactName = "Mrknown",
            //    PhoneNo = "123456",
            //    FaxNo = "45643",
            //    Address = "Jurong",
            //    GSTRegistrationNo = "G01",
            //    Notes = "",

            //};


            ////add the supplier detail to the supplier's calss supplierDetails collecion obeject
            ////sp.SupplierDetails.Add(spdetail);

            ////Create the supplierDao class object 
            //SupplierDAO spDao = new SupplierDAO();

            ////Call the AddSupplier method to crate a new supplier
            ////spDao.AddOrUpdateSupplier(sp);

            ////2.
            ////call the UpdateSupplier method to update the existing supplier
            //spDao.AddOrUpdateSupplier(sp);

            ////3.
            ////Upadte SupplierDetail based on supplierId
            ////SupplierDetail spdetail = new SupplierDetail()
            ////{
            ////    SupplierCode = "SP01",

            ////    ItemCode = "C001",
            ////    Price =200

            ////};
            ////Create supplierDetailsDAO object 
            //ISupplierDetailsDAO spDaoDeatil = new SupplierDetailsDAO();

            ////Call UpdateUpdateSupplierDetails method and pass the supplierdetails object.
            //// spDaoDeatil.UpdateSupplierDetails(spdetail);

            ////4.
            ////The ListOfSupplier will show the list of supplier 
            ////List<Supplier> listOfSupplier =  spDao.ListOfSupplier();

            //// foreach(Supplier s in listOfSupplier)
            //// {
            ////     Console.WriteLine( "The list of supplier :"+s.SupplierCode+","+s.SupplierName+","+s.ContactName);

            //// }

            ////5.
            ////Get supplier details based on the supplier code

            ////Supplier supplier = spDao.GetSupplier("ALPA");
            ////Console.WriteLine(supplier.SupplierCode+","+supplier.SupplierName);


            ////6.
            ////get List of supplierDetails based on itemCode
            ////List<SupplierDetail> listOfsupplierByItem = spDaoDeatil.ListOfSupplierByItemCode("C001");

            ////foreach (SupplierDetail s in listOfsupplierByItem)
            ////{
            ////    Console.WriteLine(s.SupplierCode + "," + s.ItemCode + "," + s.Price);

            ////}



            //Console.ReadLine();






       // }

    }
}
