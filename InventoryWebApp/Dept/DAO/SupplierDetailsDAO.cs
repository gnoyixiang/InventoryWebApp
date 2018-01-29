using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using InventoryWebApp.Models.Entities;
using System.Data.Entity;
namespace InventoryWebApp.DAO
{
    public class SupplierDetailsDAO : ISupplierDetailsDAO
    {
        EntityModel em = null;

        public int UpdateSupplierDetails(SupplierDetail sp)
        {
            using (EntityModel em = new EntityModel())
            {

                SupplierDetail spDetail = this.GetSupplierDetailsById(sp.SupplierCode);

                spDetail.Price = sp.Price;
                spDetail.ItemCode = sp.ItemCode;
                em.Entry(spDetail).State = EntityState.Modified;


                return em.SaveChanges();
            }

        }

        public SupplierDetail GetSupplierDetailsById(string supplierCode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.SupplierDetails.Where(p => p.SupplierCode == supplierCode).FirstOrDefault<SupplierDetail>();

            }


        }

        public List<SupplierDetail> ListOfSupplierByItemCode(string itemcode)
        {
            using (EntityModel em = new EntityModel())
            {
                return em.SupplierDetails.Where(p => p.ItemCode.Contains(itemcode)).ToList<SupplierDetail>();
            }
        }

        public int AddSupplierDetail(SupplierDetail sd)
        {
            using (EntityModel em = new EntityModel())
            {
                em.SupplierDetails.Add(sd);
                return em.SaveChanges();
            }
        }

        public List<SupplierDetail> ListAllSupplierDetail()
        {
            using (EntityModel em = new EntityModel())
            {
                return em.SupplierDetails.ToList();

            }
        }

    }
}