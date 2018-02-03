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
    public partial class DisbursementGenerationPage : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();
        String disbursementStatus = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tbxDate.Attributes["min"] = DateTime.Now.ToString("yyyy-MM-dd");
                if (sClerkCtrl.GetDisbursementsByStatus("allocating").FirstOrDefault() != null)
                {                    
                    disbursementStatus = "allocating";
                    tbxDate.Text = GetPlanToCollectDate(disbursementStatus);
                    lblCollectionDate.Text = DisplayDate(DateTime.Parse(tbxDate.Text));
                    lblFixedCollectionPoint.Visible = false;
                    ddlCollectionPoint.Visible = false;
                }
                else if (sClerkCtrl.GetDisbursementsByStatus("disbursing").FirstOrDefault() != null)
                {
                    disbursementStatus = "disbursing";
                    tbxDate.Text = GetPlanToCollectDate(disbursementStatus);
                    BindDropDownList(disbursementStatus);
                    lblCollectionDate.Text = DisplayDate(DateTime.Parse(tbxDate.Text));
                    lblConfirmDate.Text = "Disbursements have been confirmed. Please proceed to Disbursement Form.";
                    lvCollectionPointList.DataSource = sClerkCtrl.GetDisbursementsByStatus(disbursementStatus);
                    lvCollectionPointList.DataBind();
                    btnNext.Enabled = true;
                    lblCollectionDate.Visible = true;
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
            if(sClerkCtrl.GetDisbursementsByStatus("allocating").FirstOrDefault() != null || sClerkCtrl.GetDisbursementsByStatus("disbursing").FirstOrDefault() != null)
            {
                lblCollectionDate.Text = DisplayDate(DateTime.Parse(tbxDate.Text));
            }
            base.OnPreRenderComplete(e);
        }

        protected void BindDropDownList(String status)
        {
            CollectionPoint all = new CollectionPoint();
            all.CollectionVenue = "ALL";
            all.CollectionPointCode = "ALL";

            HashSet<CollectionPoint> collectionPointList = sClerkCtrl.GetListOfCollectionPoint(status);
            collectionPointList.Add(all);
            List<CollectionPoint> sortedCPList = collectionPointList.ToList();
            sortedCPList.Sort();


            ddlCollectionPoint.DataSource = sortedCPList;
            ddlCollectionPoint.DataTextField = "CollectionVenue";
            ddlCollectionPoint.DataValueField = "CollectionPointCode";
            ddlCollectionPoint.DataBind();
        }
        protected String GetPlanToCollectDate(String disbursementStatus)
        {

            if (disbursementStatus == "allocating")
            {
                return sClerkCtrl.GetDefaultCollectionDate().ToString("yyyy-MM-dd");
            }
            else
            {
                Disbursement disbursement = sClerkCtrl.GetDisbursementsByStatus(disbursementStatus).FirstOrDefault();
                lblConfirmDate.Text = "The collection date has been confirmed and sent to respective Department Representatives.";
                btnConfirm.Visible = false;
                btnPopUp.Visible = false;
                btnNext.Enabled = true;
                return ((DateTime)disbursement.DatePlanToCollect).ToString("yyyy-MM-dd");
            }
        }


        protected String DisplayDate(DateTime dt)
        {
            return dt.DayOfWeek.ToString() + ", " + dt.ToString("dd MMM yyyy");
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("2AllocationPage.aspx");
        }

        protected void btnResetDate_Click(object sender, EventArgs e)
        {
            tbxDate.Text = sClerkCtrl.GetDefaultCollectionDate().ToString("yyyy-MM-dd");
            lblCollectionDate.Text = DisplayDate(DateTime.Parse(tbxDate.Text));
        }

        protected void ddlCollectionPoint_SelectedIndexChanged(object sender, EventArgs e)
        {
            lvCollectionPointList.DataSource = ddlCollectionPoint.SelectedValue == "ALL" ? sClerkCtrl.GetDisbursingDisbursements() : sClerkCtrl.GetDisbursementListByCollectionPoint(ddlCollectionPoint.SelectedValue, "disbursing");
            lvCollectionPointList.DataBind();
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            sClerkCtrl.SetCollectionDateToDisbursement(DateTime.Parse(tbxDate.Text), Context.User.Identity.Name);
            sClerkCtrl.UpdateCurrentRetrievalToRetrieved();
            btnBack.Enabled = false;
            btnNext.Enabled = true;
            GetPlanToCollectDate("disbursing");
            BindDropDownList(disbursementStatus);
            lblCollectionDate.Text = DisplayDate(DateTime.Parse(tbxDate.Text));
            lblConfirmDate.Text = "Disbursements have been confirmed. Please proceed to Disbursement Form.";
            disbursementStatus = "disbursing";
            BindDropDownList(disbursementStatus);
            lvCollectionPointList.DataSource = sClerkCtrl.GetDisbursementsByStatus(disbursementStatus);
            lvCollectionPointList.DataBind();
            lvCollectionPointList.Visible = true;
            lblFixedCollectionPoint.Visible = true;
            ddlCollectionPoint.Visible = true;
        }

        protected void btnPopUp_Click(object sender, EventArgs e)
        {

        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Store/DisbursementFormPage.aspx");
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
    }
}