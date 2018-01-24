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
    public partial class DisbursementGenerationPage : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            if (!IsPostBack)
            {
                tbxDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                if (sClerkCtrl.GetDisbursingDisbursements().FirstOrDefault() != null)
                {
                    tbxDate.Text = GetPlanToCollectDate();

                    CollectionPoint all = new CollectionPoint();
                    all.CollectionVenue = "ALL";
                    all.CollectionPointCode = "ALL";

                    HashSet<CollectionPoint> collectionPointList = sClerkCtrl.GetListOfCollectionPoint();
                    collectionPointList.Add(all);
                    List<CollectionPoint> sortedCPList = collectionPointList.ToList();
                    sortedCPList.Sort();


                    ddlCollectionPoint.DataSource = sortedCPList;
                    ddlCollectionPoint.DataTextField = "CollectionVenue";
                    ddlCollectionPoint.DataValueField = "CollectionPointCode";
                    ddlCollectionPoint.DataBind();

                    lblCollectionDate.Text = DisplayDate(DateTime.Parse(tbxDate.Text));

                    lvCollectionPointList.DataSource = sClerkCtrl.GetDisbursingDisbursements();
                    lvCollectionPointList.DataBind();
                }
                else
                {
                    lblConfirmDate.Text = "There is no outstanding disbursement at the moment.";
                    btnConfirm.Visible = false;
                    btnPopUp.Visible = false;
                    btnNext.Enabled = false;
                    lblFixedCollectionPoint.Visible = false;
                    lblFixedDisbursementDate.Visible = false;
                    ddlCollectionPoint.Visible = false;
                    
                }
            }
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            if (IsPostBack)
            {
                lblCollectionDate.Text = DisplayDate(DateTime.Parse(tbxDate.Text));
                base.OnPreRenderComplete(e);
            }
        }

        protected String GetPlanToCollectDate()
        {
            Disbursement disbursement = sClerkCtrl.GetDisbursingDisbursements().FirstOrDefault();
            if (disbursement.DatePlanToCollect == null)
            {
                return sClerkCtrl.GetDefaultCollectionDate().ToString("yyyy-MM-dd");
            }
            else
            {
                lblConfirmDate.Text = "The collection date has been confirmed and sent to respective Department Representatives.";
                btnConfirm.Visible = false;
                btnPopUp.Visible = false;
                btnNext.Enabled = true;
                return ((DateTime)disbursement.DatePlanToCollect).ToString("yyyy-MM-dd");
            }
        }

        protected String GetDepartmentName(String deptCode)
        {
            return sClerkCtrl.GetDeptByCode(deptCode).DepartmentName;
        }
        protected String GetCollectionSClerkInCharge(String collectionPointCode)
        {
            return sClerkCtrl.GetCollectionSClerkInCharge(collectionPointCode);
        }

        protected String GetCollectionVenue(String collectionPointCode)
        {
            return sClerkCtrl.GetCollectionPointByCode(collectionPointCode).CollectionVenue;
        }

        protected String GetCollectionTime(String collectionPointCode)
        {
            DateTime time = DateTime.Today.Add((TimeSpan)sClerkCtrl.GetCollectionPointByCode(collectionPointCode).CollectionTime);
            return time.ToString("hh:mm tt");
        }

        protected String DisplayDate(DateTime dt)
        {
            return dt.DayOfWeek.ToString() + ", " + dt.ToString("dd MMM yyyy");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (sClerkCtrl.GetRetrievalsByStatus("retrieving") != null || sClerkCtrl.GetDisbursingDisbursements() != null || sClerkCtrl.GetDisbursingDisbursements().FirstOrDefault().DatePlanToCollect != null && sClerkCtrl.GetRetrievalsByStatus("retrieving").Count == 0)
            {
                sClerkCtrl.ChangeDisbursementDisbursingToAllocating();
            }
            Response.Redirect("2AllocationPage.aspx");
        }

        protected void btnResetDate_Click(object sender, EventArgs e)
        {
            tbxDate.Text = sClerkCtrl.GetDefaultCollectionDate().ToString("yyyy-MM-dd");
            lblCollectionDate.Text = DisplayDate(DateTime.Parse(tbxDate.Text));
        }

        protected void ddlCollectionPoint_SelectedIndexChanged(object sender, EventArgs e)
        {
            lvCollectionPointList.DataSource = ddlCollectionPoint.SelectedValue == "ALL" ? sClerkCtrl.GetDisbursingDisbursements() : sClerkCtrl.GetDisbursementListByCollectionPoint(ddlCollectionPoint.SelectedValue);
            lvCollectionPointList.DataBind();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            sClerkCtrl.SetCollectionDateToDisbursement(DateTime.Parse(tbxDate.Text));
            sClerkCtrl.UpdateCurrentRetrievalToRetrieved();
            btnBack.Enabled = false;
            GetPlanToCollectDate();
            btnNext.Enabled = true;
        }

        protected void btnPopUp_Click(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisbursementFormPage.aspx");
        }
    }
}