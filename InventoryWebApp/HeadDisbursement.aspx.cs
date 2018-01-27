using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        DepartmentHeadController dCon = new DepartmentHeadController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Disbursement d = (Disbursement)Session["disbursement"];
                lblCode.Text = "Disbursement Code: "+ d.DisbursementCode;
                lblStatus.Text = "Status: " + d.Status;
                string name = dCon.GetEmployeeName(d.ReceivedBy);
                lblEmp.Text = "Received By: " + name;
                DateTime dc = (DateTime)d.DateCreated;
                lblDc.Text = dc.ToShortDateString();
                DateTime dd = (DateTime)d.DateDisbursed;
                lblD.Text = dd.ToShortDateString();

                gvDetail.DataSource = dCon.ListDisbursementDetailByCode(d.DisbursementCode);
                gvDetail.DataBind();

            }


        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DisbursementDetail dd = (DisbursementDetail)e.Row.DataItem;
                string item = dd.ItemCode;
                StationeryCatalogue s = dCon.GetStationeryCatalogue(item);

                Label lblCat = (e.Row.FindControl("lblCat") as Label);
                if (lblCat != null)
                    lblCat.Text = s.CategoryCode.ToString();
                Label lblItem = (e.Row.FindControl("lblItem") as Label);
                if (lblItem != null)
                    lblItem.Text = s.Description.ToString();
            }


        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("HeadRequestDetail.aspx");
        }
    }
}