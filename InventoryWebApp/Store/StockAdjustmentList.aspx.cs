using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;

namespace InventoryWebApp.Store
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

            //base.OnPreRenderComplete(e);

            if (!IsPostBack)
            {
                //ddlSearch.Items.Clear();
                //ddlSearch.DataSource = SEARCH_ITEMS;
                //ddlSearch.DataBind();

                if (Session["SendCreateAdjEmail"] != null)
                {
                    //if ((bool)Session["CreatedPO"])
                    //{
                    if (!(bool)Session["SendCreateAjdEmail"])
                    {
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                            "alertMessage", "alert('Adjustment have been successfully created! However an error has occurred when sending email!')", true);
                    }
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
                       "alertMessage", "alert('Adjustment have been successfully created! Email notifications have been sent successfully!')", true);
                }
                //else
                //{
               //     ScriptManager.RegisterClientScriptBlock(this, this.GetType(),
               //"alertMessage", "alert('An error has occurred when creating adjustment!')", true);
                //}
                //Session["CreatedPO"] = null;
                Session["SendCreateAdjEmail"] = null;
            }


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

                if (a.Status == "unsubmitted")
                {
                    HyperLink hl = e.Row.FindControl("HyperLink1") as HyperLink;
                    //hl.NavigateUrl = "~/StockAdjustmentEdit.aspx?AdjustmentCode=" + ParameterId.ToString();
                    hl.NavigateUrl = "~/Store/StockAdjustmentEdit.aspx?AdjustmentCode=" + a.AdjustmentCode;
                    hl.Text = "Edit";
                }
                else
                {
                    HyperLink hl = e.Row.FindControl("HyperLink1") as HyperLink;
                    //hl.NavigateUrl = "~/StockAdjustmentView.aspx?AdjustmentCode=" + ParameterId.ToString();
                    hl.NavigateUrl = "~/Store/StockAdjustmentView.aspx?AdjustmentCode=" + a.AdjustmentCode;
                    hl.Text = "View";
                }
            }
        }
    }
}