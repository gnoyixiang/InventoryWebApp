using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models;

namespace InventoryWebApp
{
    public partial class StockAdjustmentList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void NewStockAdjustment_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentNew.aspx");
        }
    }
}