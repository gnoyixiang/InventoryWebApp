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
                innerList = sClerkCtrl.GenerateDisbursementDetailPerItem();
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

        protected void btnNext_Click(object sender, EventArgs e)
        {
            sClerkCtrl.ChangeDisbursementAllocatingToDisbursing();
            Response.Redirect("DisbursementGenerationPage.aspx");
        }
    }
}