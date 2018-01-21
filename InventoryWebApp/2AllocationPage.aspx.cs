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
        Retrieval retrieval;

        Disbursement disbursement;
        protected void Page_Load(object sender, EventArgs e)
        {
            retrieval = sClerkCtrl.GetCurrentRetrieval();
            if (!IsPostBack)
            {
                BindGrid();
            }
        }

        protected void BindGrid()
        {
            lvAllocation.DataSource = retrieval.RetrievalDetails;
            lvAllocation.DataBind();
            
        }
        //Ban vai noi
        protected List<DisbursementDetail> GetDisbursementDetailsPerItem(String itemCode)
        {
            sClerkCtrl.GetAllocatingDisbursementList();
           return sClerkCtrl.GenerateDisbursementDetailPerItem()[itemCode];
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

        protected void btnNext_Click(object sender, EventArgs e)
        {
            sClerkCtrl.ChangeDisbursementAllocatingToDisbursing();
            Response.Redirect("DisbursementGenerationPage.aspx");
        }
    }
}