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
    public partial class WebForm3 : System.Web.UI.Page
    {
        DepartmentHeadController dCon = new DepartmentHeadController();
        private void BindGrid()
        {
            gvRequest.DataSource = dCon.ListAllRequest();
            gvRequest.DataBind();
        }

        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ddlEmpName.DataSource = dCon.ListEmpName("ISS1", "Empl");

                ddlEmpName.DataBind();
                ddlEmpName.Visible = true;
                BindGrid();

            }

        }

        protected void ddlSelect_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlSelect.SelectedIndex == 0)
            {
                ddlEmpName.DataSource = dCon.ListEmpName("ISS1", "Empl");

                ddlEmpName.DataBind();
                ddlEmpName.Visible = true;
                calSearch.Visible = false;
            }
            else if (ddlSelect.SelectedIndex == 1)
            {
                calSearch.Visible = true;
                ddlEmpName.Visible = false;
            }
            else
            {
                List<string> slist = new List<string> { "pending", "processing", "rejected", "cancelled", "incomplete","complete"};
                calSearch.Visible = false;
                ddlEmpName.Visible = true;
                ddlEmpName.DataSource = slist;
                ddlEmpName.DataBind();
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
                LinkButton btnReq = (e.Row.FindControl("btnReq") as LinkButton);
                if (btnReq != null)
                    btnReq.Text = request.RequestCode;

            }


        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (ddlSelect.SelectedIndex == 0)
            {
               
                string emp = ddlEmpName.SelectedItem.ToString();

                List<Request> rlist = dCon.SearchRequestByName(emp);
                if (rlist.Count == 0)
                {
                    lblNull.Visible = true;
                    lblNull.Text = "No requisition record of " + ddlEmpName.SelectedItem.ToString() + "!";
                    gvRequest.Visible = false;
                }
                else
                {
                    gvRequest.DataSource = rlist;
                    gvRequest.DataBind();
                    lblNull.Visible = false;
                    gvRequest.Visible = true;

                }


            }
            else if (ddlSelect.SelectedIndex == 1)
            {

                DateTime d = calSearch.SelectedDate;
                if (calSearch.SelectedDate == DateTime.MinValue)
                {
                    lblNull.Text = "Please select A date!";
                    lblNull.Visible = true;
                    gvRequest.Visible = false;

                }
                else
                {

                    List<Request> rlist = dCon.SearchRequestByDate(d);
                    if (rlist.Count == 0)
                    {
                        lblNull.Text = "No requisition record on " + d.ToShortDateString() + "!";
                        lblNull.Visible = true;
                        gvRequest.Visible = false;
                    }
                    else
                    {
                        gvRequest.DataSource = rlist;
                        gvRequest.DataBind();
                        gvRequest.Visible = true;
                        lblNull.Visible = false;

                    }

                }



            }
            else
            {
                string status = ddlEmpName.SelectedItem.ToString();

                List<Request> rlist = dCon.SearchRequestByStatus(status);
                if (rlist.Count == 0)
                {
                    lblNull.Visible = true;
                    lblNull.Text = "No " + ddlEmpName.SelectedItem.ToString() + " requisition!";
                    gvRequest.Visible = false;
                }
                else
                {
                    gvRequest.DataSource = rlist;
                    gvRequest.DataBind();
                    lblNull.Visible = false;
                    gvRequest.Visible = true;

                }

            }

        }



        protected void gvRequest_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detail")

            {

                string code = e.CommandArgument.ToString();

                Request r = dCon.GetRequest(code);
                Session["request"] = r;


                Response.Redirect("HeadRequestDetail.aspx");
            }
        }

        protected void btnAll_Click(object sender, EventArgs e)
        {

            BindGrid();
            lblNull.Visible = false;
            gvRequest.Visible = true;
            
        }

        protected void gvRequest_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {


            gvRequest.PageIndex = e.NewPageIndex;
            BindGrid();
        }

    }



}


