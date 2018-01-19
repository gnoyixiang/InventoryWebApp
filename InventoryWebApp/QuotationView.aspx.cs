using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp
{
    public partial class QuotationView : System.Web.UI.Page
    {
        private static ISupplierDAO suppDAO = new SupplierDAO();
        EntityModel em = new EntityModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvQuotation.DataSource = suppDAO.ListOfSupplier();
            //gvQuotation.DataSource = em.Suppliers.Select
            //    (x => new { x.SupplierCode,x.SupplierName, x.Address, x.ContactName, x.PhoneNo}).ToList();
            gvQuotation.DataBind();
        }
    }
}