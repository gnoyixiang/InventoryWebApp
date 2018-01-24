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
    public partial class AllocationPage : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        Retrieval retrieval;
        
        Disbursement disbursement;
        protected void Page_Load(object sender, EventArgs e)
        {
            retrieval = sClerkCtrl.GetCurrentRetrieval();
            if (!IsPostBack){
                BindGrid();
            }
            //ListView lvTest = 
            TextBox tbxTest = rpt1.FindControl("tbxTest") as TextBox;


        }

        protected void BindGrid()
        {
            rpt1.DataSource = retrieval.RetrievalDetails;
            ListView lv = (ListView)rpt1.FindControl("lvView");
            rpt1.DataBind();
            
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
            foreach(var item in retrieval.RetrievalDetails)
            {
                if (item.ItemCode == itemCode)
                {
                    return item;
                }
            }
            return null;
        }

        protected void rpt1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            
        }
    }
}