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
    public partial class WebForm2 : System.Web.UI.Page
    {
        DepartmentHeadController dCon = new DepartmentHeadController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Request r=(Request) Session["request"];
                string name = dCon.GetEmployeeName(r.UserName);
                lblEmp.Text = name;
                DateTime d = (DateTime)r.DateCreated;
                lblDc.Text = d.ToShortDateString();
                string code = r.RequestCode;
                gvDetail.DataSource = dCon.ListRequestDetail(code);
                gvDetail.DataBind();

            }
            
            
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                RequestDetail request = (RequestDetail)e.Row.DataItem;
                string item = request.ItemCode;
                StationeryCatalogue s = dCon.GetStationeryCatalogue(item);
                             
                Label lblCat = (e.Row.FindControl("lblCat") as Label);
                if (lblCat != null)
                    lblCat.Text = s.CategoryCode.ToString();
                Label lblItem = (e.Row.FindControl("lblItem") as Label);
                if (lblItem != null)
                    lblItem.Text = s.Description.ToString();
            }


        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            Request r = (Request)Session["request"];
            r.Status = "processing";
            if (tbxCom.Text.Length != 0)
            {
                r.HeadRemarks = tbxCom.Text;
            }

            r.DateApproved = DateTime.Now;
            r.ApprovedBy = "liong@logic.edu.sg";

            int i = dCon.UpdateRequest(r, "processing");

            if (i == 1)
            {
                btnApprove.Visible = false;
                btnReject.Visible = false;
                tbxCom.Visible = false;
                lblCom.Visible = false;
                lblSuccess.Visible = true;
                lblStatus.Visible = false;


            }else
            {
                lblSuccess.Text = "sorry ,the requisition cannot be approved";

                lblSuccess.Visible = true;
            }
            
                
            
          
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            Request r = (Request)Session["request"];
            r.Status = "rejected";
            string remark = tbxCom.Text;
            if (tbxCom.Text.Length!=0)
            {
                r.HeadRemarks = tbxCom.Text;
            }

            int i = dCon.UpdateRequest(r, "rejected");

            if (i == 1)
            {
                btnApprove.Visible = false;
                btnReject.Visible = false;
                tbxCom.Visible = false;
                lblCom.Visible = false;
                lblSuccess.Visible = true;
                lblSuccess.Text = "The requisition has been rejected.";
                lblStatus.Visible = false;


            }
            else
            {
                lblSuccess.Text = "Sorry ,the requisition cannot be rejected!";

                lblSuccess.Visible = true;
            }

        }

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("ApproveRequest.aspx");
        }

        
    }
}