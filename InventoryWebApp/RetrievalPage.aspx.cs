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
    public partial class RetrievalPage : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        Retrieval retrieval;
        List<RetrievalDetail> rdList;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                retrieval = sClerkCtrl.GetCurrentRetrieval();
                //lblCreatedBy.Text = sClerkCtrl.GetEmployeeNameByUserName(retrieval.UserName) ;
                lblRetrievalCode.Text = retrieval.RetrievalCode;
                lblRetrievalDate.Text = ((DateTime)retrieval.DateRetrieved).ToString("dd MMM yyyy");
                rdList = sClerkCtrl.GetCurrentRetrieval().RetrievalDetails.ToList<RetrievalDetail>();

                BindGrid();
            }


        }

        protected void BindGrid()
        {

            lvRetrievalList.DataSource = rdList;
            lvRetrievalList.DataBind();

            List<Request> rList = sClerkCtrl.GetNotDisbursedRequestList();
            List<RequestDetail> rDetailList = sClerkCtrl.GetNotDisbursedRequestDetailList();
            lblTotalItem.Text = rDetailList.Count.ToString();
        }

        protected StationeryCatalogue GetStationeryByCode(String itemCode)
        {
            return sClerkCtrl.GetStationeryByCode(itemCode);
        }

        protected void lvRetrievalList_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void lvRetrievalList_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            ListViewItem item = lvRetrievalList.Items[e.NewEditIndex];
            lvRetrievalList.EditIndex = e.NewEditIndex;
            List<RetrievalDetail> rdList = sClerkCtrl.GetCurrentRetrieval().RetrievalDetails.ToList<RetrievalDetail>();
            lvRetrievalList.DataSource = rdList;
            lvRetrievalList.DataBind();

        }
        protected int GetMaxRetrieved(String itemCode)
        {
            foreach (var item in rdList)
            {
                if (item.ItemCode == itemCode)
                {
                    return sClerkCtrl.GetMaxRetrieved(item);
                }
            }
            return 0;
        }
        protected void btnReset_Click(object sender, EventArgs e)
        {
            Retrieval r = sClerkCtrl.ResetRetrieval(sClerkCtrl.GetCurrentRetrieval());
            rdList = sClerkCtrl.GetCurrentRetrieval().RetrievalDetails.ToList<RetrievalDetail>();

            BindGrid();
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            rdList = sClerkCtrl.GetCurrentRetrieval().RetrievalDetails.ToList<RetrievalDetail>();

            for (int i = 0; i < rdList.Count; i++)
            {
                CheckBox cbxRetrieved = (CheckBox)lvRetrievalList.Items[i].FindControl("cbxRetrieved");
                if (cbxRetrieved.Checked == false)
                {
                    lblNotification.Text = "Please tick all items in 'Retrieved' column for proceeding to the next step.";
                    return;
                }
            }

            for (int i = 0; i < rdList.Count; i++)
            {
                TextBox tbxQuantRetrieved = (TextBox)lvRetrievalList.Items[i].FindControl("tbxQuantityRetrieved");
                TextBox tbxNotes = (TextBox)lvRetrievalList.Items[i].FindControl("tbxNotes");

                rdList[i].QuantityRetrieved = Int32.Parse(tbxQuantRetrieved.Text);
                rdList[i].Notes = tbxNotes.Text;
                sClerkCtrl.UpdateRetrievalDetail(rdList[i]);
            }

            Response.Redirect("/AllocationPage.aspx");

        }

        protected void lvRetrievalList_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            ListViewDataItem item = lvRetrievalList.Items[e.ItemIndex];

        }

        protected void tbxQuantityRetrieved_TextChanged(object sender, EventArgs e)
        {
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            lblTotalItem.Text = "Run 2";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("/RequisitionList.aspx");
        }
    }
}