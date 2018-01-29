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
    public partial class WebForm4 : System.Web.UI.Page
    {
        DepartmentHeadController dCon = new DepartmentHeadController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Request r = (Request)Session["request"];
                string name = dCon.GetEmployeeName(r.UserName);
                lblEmp.Text = name;
                DateTime d = (DateTime)r.DateCreated;
                lblDc.Text = d.ToShortDateString();
                string status = r.Status;
                lblStatus.Text = "Status: " + status;
                string code = r.RequestCode;
                lblCode.Text = "Request Code: " + code;
                if (r.HeadRemarks!=null)
                {
                    lblRemark.Text = "Head comment:" + r.HeadRemarks;
                    lblRemark.Visible = true;
                }
                if (r.Status != "pending" && r.Status != "rejected" && r.Status != "cancelled")
                {
                    DateTime da =(DateTime) r.DateApproved;
                    lblDApproved.Text = "Date Approved: " + da.ToShortDateString();
                    lblDApproved.Visible = true;
                    string user = r.ApprovedBy;
                    string approved = dCon.GetEmployeeName(user);
                    lblApprovedBy.Text = "Approved By: " + approved;
                    lblApprovedBy.Visible = true;
                }            
                
                gvDetail.DataSource = dCon.ListRequestDetail(code);
                gvDetail.DataBind();
                List<DisbursementDetail> ddlist = dCon.ListDisbursementDetail(r);
                if (ddlist.Count != 0)
                {

                    lblDisburse.Visible = true;
                    gvDisburse.Visible = true;


                    List<Disbursement> dlist = new List<Disbursement>();
                    foreach(DisbursementDetail dd in ddlist)
                    {
                        int count = 0;
                        Disbursement nd = dCon.GetDisbursement(dd.DisbursementCode);
                        foreach(Disbursement dis in dlist)
                        {
                            if (dis.DisbursementCode == nd.DisbursementCode)
                                count++;
                        }
                        if (count == 0)
                            dlist.Add(nd);
                            
                        
                        
                    }
                    gvDisburse.DataSource = dlist;
                    gvDisburse.DataBind();
                }

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

        protected void btnView_Click(object sender, EventArgs e)
        {
            Response.Redirect("HeadViewRequest.aspx");
        }

        protected void gvDisburse_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Disbursement d = (Disbursement)e.Row.DataItem;
               LinkButton btnDis= (e.Row.FindControl("btnDisburse") as LinkButton);


                if (btnDis != null)
                    btnDis.Text = d.DisbursementCode;
                
            }

        }

        protected void gvDisburse_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Detail")

            {

                string code = e.CommandArgument.ToString();

                Disbursement d = dCon.GetDisbursement(code);

                Session["disbursement"] =d;


                Response.Redirect("HeadDisbursement.aspx");
            }
        }
    }
}