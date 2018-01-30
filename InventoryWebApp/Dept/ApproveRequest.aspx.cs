using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp.Dept
{
    public partial class ApproveRequest : System.Web.UI.Page
    {
        
        DepartmentHeadController dCon = new DepartmentHeadController();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ddlEmpName.DataSource = dCon.ListEmpName("ISS1", "Empl");

                ddlEmpName.DataBind();
                ddlEmpName.Visible = true;
                List<Request> rlist = dCon.ListPendingRequest();
                if (rlist.Count == 0)
                {
                    lblNull.Text = "No pending request currently.";
                    lblNull.Visible = true;
                }else
                {
                    BindGrid();

                }
                
            }
           
        }

        protected void ddlSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSelect.SelectedIndex==0)
            {
                
                ddlEmpName.Visible = true;
                calSearch.Visible = false;
            }else if (ddlSelect.SelectedIndex==1)
            {
                calSearch.Visible = true;
                ddlEmpName.Visible = false;
            }


        }

       
        
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Request request = (Request)e.Row.DataItem;
                string username = request.UserName;
                string name = dCon.GetEmployeeName(username);

                Label lblName = (e.Row.FindControl("lblName") as Label);
                if (lblName != null)
                    lblName.Text = name;
            }


       }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (ddlSelect.SelectedIndex == 0)
            {
                string emp = ddlEmpName.SelectedItem.ToString();
                
                List<Request> rlist= dCon.SearchRequestByName(emp);
                if (rlist.Count==0)
                {
                    lblNull.Visible = true;
                    lblNull.Text = "No pending requisition of " + ddlEmpName.SelectedItem.ToString() + "!";
                    gvRequest.Visible = false;
                }else
                {
                    gvRequest.DataSource = rlist;
                    gvRequest.DataBind();
                    lblNull.Visible = false;
                    gvRequest.Visible = true;

                }
                
                
            }else if (ddlSelect.SelectedIndex == 1)
            {
                
                DateTime d = calSearch.SelectedDate;
                if (calSearch.SelectedDate==DateTime.MinValue)
                {
                    lblNull.Text = "Please select A date!";
                    lblNull.Visible = true;
                    gvRequest.Visible = false;

                }else
                {

                    List<Request> rlist= dCon.SearchRequestByDate(d);
                if (rlist.Count == 0)
                {
                    lblNull.Text = "No pending requisition on " + d.ToShortDateString() + "!";
                    lblNull.Visible = true;
                    gvRequest.Visible = false;
                }else
                {
                    gvRequest.DataSource = rlist;
                    gvRequest.DataBind();
                    gvRequest.Visible = true;
                    lblNull.Visible = false;

                }

                }
                
                

            }

        }

        

        protected void gvRequest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detail")
                
            {
                
                string code = e.CommandArgument.ToString();

                Request r=dCon.GetRequest(code);
                Session["request"] = r;
                     
                               
               Response.Redirect("HeadApproveDetail.aspx");
            }
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {
            List<Request> rlist = dCon.ListPendingRequest();
            if (rlist.Count == 0)
            {
                lblNull.Text = "No pending request currently.";
                lblNull.Visible = true;
            }else
            {
                BindGrid();
                gvRequest.Visible = true;
                lblNull.Visible = false;

            }
                
        }

        protected void gvRequest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {


            gvRequest.PageIndex = e.NewPageIndex;
            BindGrid();
        }

        private void BindGrid()
        {
            gvRequest.DataSource = dCon.ListPendingRequest();
            gvRequest.DataBind();
        }
    }
}