using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
namespace InventoryWebApp
{
    public partial class PendingPODetails : System.Web.UI.Page
    {
        StoreSupervisorController supervisorController = new StoreSupervisorController();
        decimal? total = 0;
        static PurchaseOrder pOrder;
        static List<PODetail> podList;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               
                string pOCode = (string)Session["POrderCode"];
                pOrder = supervisorController.GetPOByPOCode(pOCode);
                podList= supervisorController.ListPODetailsByPOCode(pOCode);
                BindGrid();
                gvPendingPODetails.FooterRow.Cells[4].Text = "Total";
                gvPendingPODetails.FooterRow.Cells[4].HorizontalAlign = HorizontalAlign.Left;
                gvPendingPODetails.FooterRow.Cells[5].Text = total.ToString();

                lblNoValue.Text = ((int)Session["No"]).ToString();
                lblIssueDateValue.Text = pOrder.DateCreated.ToString();
                lblSupplierNameValue.Text = supervisorController.GetSupplier(pOrder.SupplierCode).SupplierName;
            }

        }

        public void BindGrid()
        {
            gvPendingPODetails.DataSource = podList;
            gvPendingPODetails.DataBind();
        }
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                PODetail orderDetail = (PODetail)e.Row.DataItem;
                string description = supervisorController.GetStationeryCatalogue(orderDetail.ItemCode).Description;

                Label descriptionLabel = (e.Row.FindControl("lblDescription") as Label);
                if (descriptionLabel != null)
                    descriptionLabel.Text = description;

                Label amountLabel = (e.Row.FindControl("lblAmount") as Label);
                if (amountLabel != null)
                    amountLabel.Text ="$"+ (orderDetail.Price*orderDetail.Quantity).ToString();
                total += orderDetail.Price * orderDetail.Quantity;
            }
           
        }

       

        protected void btnApprove_Click(object sender, EventArgs e)
        {
           
            PurchaseOrder po = supervisorController.GetPOByPOCode(pOrder.PurchaseOrderCode);
            po.Status = "APPROVED";
            po.DateApproved = DateTime.Now;
            po.ApprovedBy = "";
            supervisorController.updatePOStatus(po);
            Response.Redirect("PendingPO.aspx");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            PurchaseOrder po = supervisorController.GetPOByPOCode(pOrder.PurchaseOrderCode);
            po.Status = "CANCELLED";
            po.DateApproved = DateTime.Now;
            po.ApprovedBy = "";
            supervisorController.updatePOStatus(po);
            Response.Redirect("PendingPO.aspx");
        }

        
    }
}