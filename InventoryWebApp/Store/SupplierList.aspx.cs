using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.DAO;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;

namespace InventoryWebApp.Store
{
    public partial class SupplierList : System.Web.UI.Page
    {
        StoreSupervisorController spConteoller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                spConteoller = new StoreSupervisorController();

                gvSupplierList.DataSource = spConteoller.SupplierList();
                gvSupplierList.DataBind();

            }
        }
    }
}