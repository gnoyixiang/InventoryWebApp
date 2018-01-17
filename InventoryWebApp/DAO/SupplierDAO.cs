using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.DAO
{
    public class SupplierDAO : ISupplierDAO
    {

        EntityModel em = new EntityModel();

        public int AddSupplier(Supplier supplier, String itemCode, decimal price)
        {


            Supplier sp = new Supplier
            {
                SupplierCode = supplier.SupplierCode,
                SupplierName = supplier.SupplierName,
                ContactTitle = supplier.SupplierName,
                ContactName = supplier.ContactName,
                PhoneNo = supplier.PhoneNo,
                FaxNo = supplier.FaxNo,
                Address = supplier.Address,
                GSTRegistrationNo = supplier.GSTRegistrationNo,
                Notes = supplier.Notes,
                SupplierDetails = supplier.SupplierDetails

            };


            em.Suppliers.Add(sp);
            return em.SaveChanges();


        }





        public int UpdateSupplier(Supplier supplier)
        {

            Supplier sp = em.Suppliers.Where(p => p.SupplierCode == supplier.SupplierCode).First<Supplier>();

            sp.SupplierCode = supplier.SupplierCode;
            sp.SupplierName = supplier.SupplierName;
            sp.ContactTitle = supplier.ContactTitle;
            sp.ContactName = supplier.ContactName;
            sp.PhoneNo = supplier.PhoneNo;
            sp.FaxNo = supplier.FaxNo;
            sp.Address = supplier.Address;
            sp.GSTRegistrationNo = supplier.GSTRegistrationNo;
            sp.Notes = supplier.Notes;


            return em.SaveChanges();

        }










        public Supplier GetSupplier(string supplierCode)
        {

            return em.Suppliers.Where(p => p.SupplierCode.Contains(supplierCode)).FirstOrDefault<Supplier>();
        }



    }
}