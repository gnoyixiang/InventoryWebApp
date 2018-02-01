using InventoryWebApp.Controllers;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp.Store
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
                if (retrieval != null)
                {
                    sClerkCtrl.GetAllocatingDisbursementList();
                    outerList = (List<RetrievalDetail>)retrieval.RetrievalDetails;
                    BindGrid();
                }
                else
                {
                    lblNotification.Text = "There is no retrieval to allocate at the moment.";
                }


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
            Response.Redirect("/Store/RetrievalPage.aspx");
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

        protected Department GetDepartment(String departmentCode)
        {
            return sClerkCtrl.GetDeptByCode(departmentCode);
        }

        protected Disbursement GetDisbursement(String disbursementCode)
        {
            return sClerkCtrl.GetDisbursement(disbursementCode);
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {

            Response.Redirect("/Store/DisbursementGenerationPage.aspx");
        }

        protected void Display_InnerList(object sender, CommandEventArgs e)
        {
            LinkButton linkViewRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listDetails = (ListView)listItem.FindControl("lvDetails");
            HiddenField hfItemCode = (HiddenField)listItem.FindControl("hfItemCode");

            listDetails.Visible = true;
            listDetails.DataSource = GetDisbursementDetailsPerItem(hfItemCode.Value);
            listDetails.DataBind();

        }
        protected void Hide_InnerList(object sender, CommandEventArgs e)
        {
            LinkButton linkViewRequest = (LinkButton)sender;
            ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listDetails = (ListView)listItem.FindControl("lvDetails");

            listDetails.Visible = false;

        }
        protected void lvAllocation_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvAllocation.EditIndex = e.NewEditIndex;
            ////LinkButton linkViewRequest = (LinkButton)sender;
            ////ListViewDataItem listItem = (ListViewDataItem)linkViewRequest.Parent;
            ListView listDetails = lvAllocation.Items[e.NewEditIndex].FindControl("lvDetails") as ListView;
            HiddenField hfItemCode = lvAllocation.Items[e.NewEditIndex].FindControl("hfItemCode") as HiddenField;

            listDetails.Visible = true;
            listDetails.DataSource = GetDisbursementDetailsPerItem(hfItemCode.Value);
            listDetails.DataBind();
            BindGrid();


        }
        protected void lvAllocation_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
        }
        protected void lvAllocation_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
        }

        protected DateTime GetRequestDateFromDD(DisbursementDetail dd)
        {
            RequestDetail requestDetail = GetRequestDetail(dd.RequestCode, dd.ItemCode);
            Request request = sClerkCtrl.GetRequest(requestDetail.RequestCode);
            DateTime dateRequested = Convert.ToDateTime(request.DateApproved);
            return dateRequested;
        }

        protected void lvDetails_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            ListView listDetails = (ListView)sender;
            ListViewDataItem listItem = (ListViewDataItem)listDetails.Parent;
            
            HiddenField hfItemCode = (HiddenField)listItem.FindControl("hfItemCode");

            List<DisbursementDetail> ddList = GetDisbursementDetailsPerItem(hfItemCode.Value);

            List<DisbursementDetail> sortedDDList = new List<DisbursementDetail>();

            foreach (DisbursementDetail dd in ddList)
            {
                DateTime dateRequested = GetRequestDateFromDD(dd);
                bool isInserted = false;
                for (int i = 0; i < sortedDDList.Count; i++)
                {
                    if(dateRequested < GetRequestDateFromDD(sortedDDList[i]))
                    {
                        //if earlier insert into index
                        sortedDDList.Insert(i,dd);
                        isInserted = true;
                        break;
                    }
                }
                if (!isInserted)
                {
                    sortedDDList.Add(dd);
                }
            }

            int updatedQty = Convert.ToInt32(e.NewValues["Quantity"]);

            RetrievalDetail retrievalDetail = retrieval.RetrievalDetails.Where(rd => rd.ItemCode == hfItemCode.Value).FirstOrDefault();
            int? retrievedQty = retrievalDetail.QuantityRetrieved;

            DisbursementDetail updatedDD = sortedDDList[e.ItemIndex];
            updatedDD.Quantity = updatedQty;
            sClerkCtrl.UpdateDisbursementDetail(updatedDD);

            retrievedQty -= updatedQty;
            sortedDDList.Remove(updatedDD);

            for (int i = 0; i<sortedDDList.Count;i++)
            {
                DisbursementDetail sortedDD = sortedDDList[i];
                RequestDetail requestDetail = GetRequestDetail(sortedDD.RequestCode, sortedDD.ItemCode);
                if (retrievedQty != 0)
                {
                    if (requestDetail.RemainingQuant < retrievedQty)
                    {
                        sortedDD.Quantity = requestDetail.RemainingQuant;
                        retrievedQty -= requestDetail.RemainingQuant;
                    }
                    else
                    {
                        sortedDD.Quantity = retrievedQty;
                        retrievedQty -= retrievedQty;
                    }
                }
                else
                {
                    sortedDD.Quantity = 0;
                }
                sClerkCtrl.UpdateDisbursementDetail(sortedDD);
            }
            
            listDetails.EditIndex = -1;
            listDetails.DataSource = GetDisbursementDetailsPerItem(hfItemCode.Value);
            listDetails.DataBind();
        }

        protected void lvDetails_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            ListView listDetails = (ListView)sender;
            listDetails.EditIndex = e.NewEditIndex;
            ListViewDataItem listItem = (ListViewDataItem)listDetails.Parent;
            HiddenField hfItemCode = (HiddenField)listItem.FindControl("hfItemCode");
            listDetails.DataSource = GetDisbursementDetailsPerItem(hfItemCode.Value);
            listDetails.DataBind();
        }

        protected void validAllocatedQty_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (source is CustomValidator && IsPostBack)
            {
                CustomValidator validator = (CustomValidator)source;
                ListViewItem parentItem = (ListViewItem)validator.Parent;
                ListView listDetails = (ListView)parentItem.Parent.Parent;
                ListViewDataItem listItem = (ListViewDataItem)listDetails.Parent;
                HiddenField hfItemCode = (HiddenField)listItem.FindControl("hfItemCode");

                List<DisbursementDetail> ddList = GetDisbursementDetailsPerItem(hfItemCode.Value);
                DisbursementDetail dd = ddList[listDetails.EditIndex];

                RetrievalDetail retrievalDetail = retrieval.RetrievalDetails.Where(rd => rd.ItemCode == hfItemCode.Value).FirstOrDefault();

                RequestDetail requestDetail = GetRequestDetail(dd.RequestCode, dd.ItemCode);
                
                int num = Convert.ToInt32(args.Value);
                //args.IsValid = num <= rd.RemainingQuant && num >= 0;
                var tbxAllocatedQty = (TextBox)parentItem.FindControl("tbxAllocatedQty");
                //cannot be less than 0;
                if (num < 0)
                {
                    args.IsValid = false;
                    tbxAllocatedQty.CssClass = "control error";
                    validator.ErrorMessage = "Allocated Quantity cannot be less than 0";
                }
                else if(retrievalDetail.QuantityRetrieved >= requestDetail.RemainingQuant)
                {
                    if (num > requestDetail.RemainingQuant)
                    {
                        args.IsValid = false;
                        tbxAllocatedQty.CssClass = "control error";
                        validator.ErrorMessage = "Allocated Quantity cannot be more than needed quantity (" + requestDetail.RemainingQuant + ")";
                    }
                }
                else if(requestDetail.RemainingQuant > retrievalDetail.QuantityRetrieved)
                {
                    if (num > retrievalDetail.QuantityRetrieved)
                    {
                        args.IsValid = false;
                        tbxAllocatedQty.CssClass = "control error";
                        validator.ErrorMessage = "Allocated Quantity cannot be more than retrieved quantity (" + retrievalDetail.QuantityRetrieved + ")";
                    }
                }
                else
                {
                    args.IsValid = true;
                    tbxAllocatedQty.CssClass = "control";
                }
            }
        }

        protected void lvDetails_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ListView listDetails = (ListView)sender;
            ListViewDataItem listItem = (ListViewDataItem)listDetails.Parent;
            HiddenField hfItemCode = (HiddenField)listItem.FindControl("hfItemCode");
            listDetails.EditIndex = -1;
            listDetails.DataSource = GetDisbursementDetailsPerItem(hfItemCode.Value);
            listDetails.DataBind();
        }
    }
}