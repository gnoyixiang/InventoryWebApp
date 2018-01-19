using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp
{
    public partial class StockAdjustmentView : System.Web.UI.Page
    {
        String s;
        EntityModel em;
        protected void Page_Load(object sender, EventArgs e)
        {
            s = Request.QueryString["AdjustmentCode"];

            em = new EntityModel();
            Adjustment adjRetrieved = em.Adjustments.Where(x => x.AdjustmentCode == s).FirstOrDefault();

            //get item description
            lblItemChoiceName.Text = em.StationeryCatalogues.Where
                (x => x.ItemCode == adjRetrieved.ItemCode).FirstOrDefault().Description.ToString();

            //get current stock present
            lblNewQuantityAmount.Text = em.StationeryCatalogues.Where
                (x => x.ItemCode == adjRetrieved.ItemCode).FirstOrDefault().Stock.ToString();

            //calc old stock
            int showPreviousQuantity = Convert.ToInt32(lblNewQuantityAmount.Text) + (int)adjRetrieved.AdjustmentQuant;
            lblCurrentStockAmount.Text = showPreviousQuantity.ToString();


            lblReasonSubmitted.Text = adjRetrieved.Reason;
            lblRejectionReasonShow.Text = adjRetrieved.HeadRemarks;
        }

        protected void ReturnToAdjustmentList_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentList.aspx");
        }
    }
}