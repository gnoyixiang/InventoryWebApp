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
            if (!IsPostBack){
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



                lblCollectionDate.Text = GetDayCollection(DateTime.Parse(tbxDate.Text));

                lvCollectionPointList.DataSource = sClerkCtrl.GetDisbursingDisbursements();
                lvCollectionPointList.DataBind();
            }
        }
        
        protected String GetPlanToCollectDate()
        {
            Disbursement disbursement = sClerkCtrl.GetDisbursingDisbursements().First();
            if (disbursement.DatePlanToCollect == null)
            {
                return sClerkCtrl.GetDefaultCollectionDate().ToString("yyyy-MM-dd");
            }
            else
            {
                lblConfirmDate.Text = "The collection date has been confirmed and sent to respective Department Representatives.";
                btnNext.Enabled = false;
                btnPopUp.Enabled = false;
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
            DateTime time = DateTime.Today.Add((TimeSpan) sClerkCtrl.GetCollectionPointByCode(collectionPointCode).CollectionTime);
            return time.ToString("hh:mm tt");
        }

        protected String GetDayCollection(DateTime dt)
        {
            return dt.DayOfWeek.ToString() + ", " + dt.ToString("dd MMM yyyy");
        }
        
        protected void btnBack_Click(object sender, EventArgs e)
        {
            sClerkCtrl.ChangeDisbursementDisbursingToAllocating();
            Response.Redirect("2AllocationPage.aspx");
        }

        protected void btnChangeDate_Click1(object sender, EventArgs e)
        {
            
        }

        protected void btnResetDate_Click(object sender, EventArgs e)
        {
            tbxDate.Text =  sClerkCtrl.GetDefaultCollectionDate().ToString("yyyy-MM-dd");
            lblCollectionDate.Text = GetDayCollection(DateTime.Parse(tbxDate.Text));
        }

        protected void ddlCollectionPoint_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlCollectionPoint.SelectedValue == "ALL")
            {
                lvCollectionPointList.DataSource = sClerkCtrl.GetDisbursingDisbursements();
                lvCollectionPointList.DataBind();
            }
            else
            {
                lvCollectionPointList.DataSource = sClerkCtrl.GetDisbursementListByCollectionPoint(ddlCollectionPoint.SelectedValue);
                lvCollectionPointList.DataBind();
            }
        }
    }
}