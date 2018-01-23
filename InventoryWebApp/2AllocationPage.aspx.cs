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
    public partial class _2AllocationPage : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        Dictionary<String, List<DisbursementDetail>> innerList;
        List<RetrievalDetail> outerList;
        Retrieval retrieval;

        protected void Page_Load(object sender, EventArgs e)
        {
            retrieval = sClerkCtrl.GetCurrentRetrieval();

            if (!IsPostBack)
            {
                sClerkCtrl.GetAllocatingDisbursementList();
                outerList = (List<RetrievalDetail>) retrieval.RetrievalDetails;
                BindGrid();
            }
        }

        protected void BindGrid()
        {
            lvAllocation.DataSource = outerList;
            lvAllocation.DataBind();
        }
        
        protected List<DisbursementDetail> GetDisbursementDetailsPerItem(String itemCode)
        {
            innerList = sClerkCtrl.GenerateDisbursementDetailPerItem();
            return innerList[itemCode];
        }



        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/RetrievalPage.aspx");
        }

        protected StationeryCatalogue GetStationeryByCode(String itemCode)
        {
            return sClerkCtrl.GetStationeryByCode(itemCode);
        }

        protected String GetStatus(String itemCode)
        {
            RetrievalDetail rd = GetRetrievalDetail(itemCode);
            if (rd.QuantityNeeded > rd.QuantityRetrieved)
                return "Unfulfilled";
            else
                return "Fulfilled";
        }

        protected RetrievalDetail GetRetrievalDetail(String itemCode)
        {
            foreach (var item in retrieval.RetrievalDetails)
            {
                if (item.ItemCode == itemCode)
                {
                    return item;
                }
            }
            return null;
        }

        protected RequestDetail GetRequestDetail(String requestCode, String itemCode)
        {
            return sClerkCtrl.GetRequestDetail(requestCode, itemCode);
        }
        
        protected Request GetRequest(String requestCode)
        {
            return sClerkCtrl.GetRequest(requestCode);
        }

        protected Department GetDepartment (String departmentCode)
        {
            return sClerkCtrl.GetDeptByCode(departmentCode);
        }

        protected Disbursement GetDisbursement(String disbursementCode)
        {
            return sClerkCtrl.GetDisbursement(disbursementCode);
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            sClerkCtrl.ChangeDisbursementAllocatingToDisbursing();
            Response.Redirect("DisbursementGenerationPage.aspx");
        }

        protected void Display_InnerList(object sender, CommandEventArgs e)
        {
            LinkButton linkViewRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listDetails = (ListView)listItem.FindControl("lvDetails");
            HiddenField hfItemCode = (HiddenField)listItem.FindControl("hfItemCode");

            listDetails.DataSource = null;
            listDetails.DataSource = GetDisbursementDetailsPerItem(hfItemCode.Value);
            listDetails.DataBind();

        }
        protected void Hide_InnerList(object sender, CommandEventArgs e)
        {
            LinkButton linkViewRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listDetails = (ListView)listItem.FindControl("lvDetails");

            listDetails.DataSource = null;
            listDetails.DataBind();

        }
    }
}