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
    public partial class ChargeBackPage : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        List<Disbursement> dList;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                List<String> statusList = new List<String>();
                statusList.Add("ALL");
                statusList.Add("allocating");
                statusList.Add("disbursing");
                statusList.Add("disbursed");
                statusList.Add("charged back");
                ddlStatus.DataSource = statusList;
                //ddlStatus.DataTextField = statusList;
                ddlStatus.DataBind();

                BindGrid(ddlStatus.SelectedValue);

            }
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            
            if (dList.Count==0)
            {
                lblNotification.Text = "There is no request of status " + ddlStatus.SelectedValue;
            }
            else
            {
                lblNotification.Text = "";
            }
            base.OnPreRenderComplete(e);
        }

        protected void BindGrid(String status)
        {
            if (status == "ALL")
                dList = sClerkCtrl.GetAllDisbursement();
            else
                dList = sClerkCtrl.GetDisbursementsByStatus(status);
            lvDisbursementList.DataSource = dList;
            lvDisbursementList.DataBind();
        }

        protected decimal? GetPriceOfDisbursement(String disbursementCode)
        {
            return sClerkCtrl.GetPriceOfDisbursement(disbursementCode);
        }

        protected Department GetDepartment(String deptCode)
        {
            return sClerkCtrl.GetDeptByCode(deptCode);
        }
        public void btnChargeBack_OnClick (object sender, CommandEventArgs e)
        {
            LinkButton linkViewRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listDetails = (ListView)listItem.FindControl("lvDetails");
            Label lblDisbursementCode = (Label) listItem.FindControl("lblDisbursementCode");

            Disbursement d = sClerkCtrl.GetDisbursement(lblDisbursementCode.Text);
            d.Status = "charged back";
            sClerkCtrl.UpdateDisbursement(d);
            BindGrid(ddlStatus.SelectedValue);

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisbursementFormPage.aspx");
        }

        protected void ddlStatus_SelectedIndexChanged(object sender, EventArgs e)
        {
            BindGrid(ddlStatus.SelectedValue);
        }
    }
}