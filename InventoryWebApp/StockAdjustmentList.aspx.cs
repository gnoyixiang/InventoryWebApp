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
    public partial class StockAdjustmentList : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        //EntityModel em = new EntityModel();
        //private static IAdjustmentDAO adjDAO = new AdjustmentDAO();
        protected void Page_Load(object sender, EventArgs e)
        {
            gvAdjustmentStatus.DataSource = sClerkCtrl.ListAllAdjustments();
            gvAdjustmentStatus.DataBind();

            //programmatically add hyperlinks dependent on status
            //handled in method gvAdjustmentStatus_RowDataBound

            //dao to get AdjustmentList
            //gvAdjustmentStatus.DataSource = adjDAO.ListAllAdjustments();
            //gvAdjustmentStatus.DataBind();

            //em to get AdjustmentList
            //gvAdjustmentStatus.DataSource = em.Adjustments.Select
            //    (x => new { x.AdjustmentCode, x.ItemCode, x.AdjustmentQuant, x.DateCreated, x.Status, x.Reason }).ToList();

        }

        protected void btnNewStockAdjustment_Click(object sender, EventArgs e)
        {
            Response.Redirect("StockAdjustmentNew.aspx");
        }

        protected void gvAdjustmentStatus_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                //int ParameterId = 1;

                Adjustment a = (Adjustment)e.Row.DataItem;

                if (a.Status == "pending" || a.Status == "unsubmitted")
                {
                    HyperLink hl = e.Row.FindControl("HyperLink1") as HyperLink;
                    //hl.NavigateUrl = "~/StockAdjustmentEdit.aspx?AdjustmentCode=" + ParameterId.ToString();
                    hl.NavigateUrl = "~/StockAdjustmentEdit.aspx?AdjustmentCode=" + a.AdjustmentCode;
                    hl.Text = "Edit";
                }
                else
                {
                    HyperLink hl = e.Row.FindControl("HyperLink1") as HyperLink;
                    //hl.NavigateUrl = "~/StockAdjustmentView.aspx?AdjustmentCode=" + ParameterId.ToString();
                    hl.NavigateUrl = "~/StockAdjustmentView.aspx?AdjustmentCode=" + a.AdjustmentCode;
                    hl.Text = "View";
                }
            }
        }
    }
}