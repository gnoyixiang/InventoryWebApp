using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;

namespace InventoryWebApp
{
    public partial class StockAdjustmentView : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        Adjustment adjRetrieved;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(Request.QueryString["AdjustmentCode"]))
            {
                adjRetrieved = sClerkCtrl.GetAdjustment(Request.QueryString["AdjustmentCode"]);
            }
            if (adjRetrieved != null)
            {
                panelAdj.Visible = true;
                panelNoAdj.Visible = false;

                lblItemChoiceName.Text = sClerkCtrl.DisplayItemChoiceName(adjRetrieved);
                lblQuantityAdjustedShow.Text = adjRetrieved.AdjustmentQuant.ToString();

                lblReasonSubmitted.Text = adjRetrieved.Reason;
                lblRejectionReasonShow.Text = adjRetrieved.HeadRemarks;
            }
            else
            {
                panelAdj.Visible = false;
                panelNoAdj.Visible = true;
            }
            ////get current stock present
            //lblNewQuantityAmount.Text = em.StationeryCatalogues.Where
            //    (x => x.ItemCode == adjRetrieved.ItemCode).FirstOrDefault().Stock.ToString();

            ////calc old stock
            //int showPreviousQuantity = Convert.ToInt32(lblNewQuantityAmount.Text) + (int)adjRetrieved.AdjustmentQuant;
            //lblCurrentStockAmount.Text = showPreviousQuantity.ToString();
        }

        protected void ReturnToAdjustmentList_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Store/StockAdjustmentList.aspx");
        }
    }
}