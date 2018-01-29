using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;
namespace InventoryWebApp.DAO
{
    public class SupplierDAO : ISupplierDAO
    {

        EntityModel em = new EntityModel();

        public int AddOrUpdateSupplier(Supplier supplier)
        {
            using (EntityModel em = new EntityModel())
            {
                Supplier sp1 = em.Suppliers.Where(p => p.SupplierCode.Contains(supplier.SupplierCode)).FirstOrDefault<Supplier>();

                em.Entry(supplier).State = sp1 == null ? EntityState.Added : EntityState.Modified;


                return em.SaveChanges();
            }
        }

        public List<Supplier> ListOfSupplier()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Suppliers.ToList<Supplier>();
            }
        }

        public Supplier GetSupplier(string supplierCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.Suppliers.Where(p => p.SupplierCode.Contains(supplierCode)).FirstOrDefault<Supplier>();
            }
        }

        public string GetSupplierCodeBySupplierName(string supplierName)
        {
            using (EntityModel em = new EntityModel())
            {
                Supplier s = em.Suppliers.Where(p => p.SupplierName.Contains(supplierName)).FirstOrDefault<Supplier>();
                return s.SupplierCode;
                
            }

        }

    }
}