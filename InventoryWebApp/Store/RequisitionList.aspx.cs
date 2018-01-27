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
    public partial class RequisitionList : System.Web.UI.Page
    {
        StoreClerkController sClerCtrl = new StoreClerkController();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack){
                if (HaveExistingRetrieval())
                {
                    lblNotification.Text = "There is outstanding retrieval, you cannot create new retrieval at the moment.";
                }
            }
            List<Request> requestList = sClerCtrl.GetNotDisbursedRequestList();
            lvRequestList.DataSource = requestList;
            lvRequestList.DataBind();

            int? itemCount = 0;
            foreach (Request r in requestList)
            {
                itemCount += GetTotalQuantOfRequest(r.RequestCode);
            }
            //lblTest.Text = getTotalQuantOfRequest("RQ123456789").ToString() + "Test";

            lblTotalQuant.Text = itemCount.ToString();
        }

        protected bool HaveExistingRetrieval()
        {
            List<Retrieval> retrievalList = sClerCtrl.GetRetrievalsByStatus("processing");
            if (retrievalList == null || retrievalList.Count == 0)
                return false;
            else
                return true;
        }
        protected int GetTotalQuantOfRequest(String requestCode)
        {
            List<RequestDetail> rdList;
            int quant = 0;
            if (sClerCtrl.GetRequest(requestCode) != null)
            {
                rdList = sClerCtrl.GetRequestDetails(requestCode).ToList();

                foreach (RequestDetail rdetail in rdList)
                {
                    quant += (int) rdetail.RemainingQuant;
                }
            }

            return quant;
        }
        protected Department GetDeptByCode(String code)
        {
            return sClerCtrl.GetDeptByCode(code);
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Store/RetrievalPage.aspx");
        }

        protected StationeryCatalogue GetStationery(String itemCode)
        {
            return sClerCtrl.GetStationeryByCode(itemCode);
        }

        protected void Display_InnerList(object sender, CommandEventArgs e)
        {
            LinkButton linkViewRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listDetails = (ListView)listItem.FindControl("lvRequestDetails");
            Label lblRequestCode = (Label)listItem.FindControl("lblRequestCode");

            listDetails.Visible = true;
            listDetails.DataSource = sClerCtrl.GetRequestDetails(lblRequestCode.Text);
            listDetails.DataBind();
        }

        protected void Hide_InnerList(object sender, CommandEventArgs e)
        {
            LinkButton linkViewRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listDetails = (ListView)listItem.FindControl("lvRequestDetails");

            listDetails.Visible = false;
        }
    }
}