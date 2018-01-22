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
    public partial class DisbursementFormPage : System.Web.UI.Page
    {
        StoreClerkController sClerkCtrl = new StoreClerkController();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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

                ddlDepartment.DataSource = sClerkCtrl.GetDisbursingDepartmentList(sClerkCtrl.GetDisbursingDisbursements());
                ddlDepartment.DataTextField = "DepartmentName";
                ddlDepartment.DataValueField = "DepartmentCode";
                ddlDepartment.DataBind();
            }
            
            tbxRep.Text = GetEmployee(GetDepartment().RepresentativeCode).EmployeeTitle+ " " + GetEmployee(GetDepartment().RepresentativeCode).EmployeeName;
            tbxDisbursementDate.Text = GetPlanToCollectDate().ToString("dd MMM yyyy");
            tbxStatus.Text = GetDisbursingDisbursementByDeptCode(ddlDepartment.SelectedValue).Status;
            tbxDisbursementTime.Text = GetCollectionTime();

            BindLvDisbursementDetails();
           
        }

        protected void BindLvDisbursementDetails()
        {
            lvDisbursementDetails.DataSource = sClerkCtrl.GetDisbursingDisbDetailsByDeptCode(ddlDepartment.SelectedValue);
            lvDisbursementDetails.DataBind();
        }

        protected String GetCollectionTime()
        {
            DateTime time = DateTime.Today.Add((TimeSpan)sClerkCtrl.GetCollectionPointByCode(GetDepartment().CollectionPointCode).CollectionTime);
            return time.ToString("hh:mm tt");
        }

        protected Disbursement GetDisbursingDisbursementByDeptCode(String deptCode)
        {
            return sClerkCtrl.GetDisbursingDisbursementByDeptCode(deptCode);
        }

        protected void ddlCollectionPoint_SelectedIndexChanged(object sender, EventArgs e)
        {
            ddlDepartment.DataSource = ddlCollectionPoint.SelectedValue == "ALL" ? sClerkCtrl.GetDisbursingDepartmentList(sClerkCtrl.GetDisbursingDisbursements()) : sClerkCtrl.GetDisbursingDepartmentList(sClerkCtrl.GetDisbursementListByCollectionPoint(ddlCollectionPoint.SelectedValue));
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "DepartmentCode";
            ddlDepartment.DataBind();

        }

        protected Employee GetEmployee(String emplCode)
        {
            return sClerkCtrl.GetEmployee(emplCode);
        }

        protected Request GetRequest(String requestCode)
        {
            return sClerkCtrl.GetRequest(requestCode);
        }
        //NEED TO RE-CODE
        protected Department GetDepartment()
        {
            return sClerkCtrl.GetDeptByCode(ddlDepartment.SelectedValue);
        }

        protected DateTime GetPlanToCollectDate()
        {
            return (DateTime)sClerkCtrl.GetDisbursingDisbursements().First().DatePlanToCollect;
        }

        protected CollectionPoint GetCollectionPoint()
        {
            return sClerkCtrl.GetCollectionPointByCode(GetDepartment().CollectionPointCode);
        }

        protected StationeryCatalogue GetStationeryByCode(String itemCode)
        {
            return sClerkCtrl.GetStationeryByCode(itemCode);
        }
        
        protected RequestDetail GetRequestDetail (String requestCode, String itemCode)
        {
            return sClerkCtrl.GetRequestDetail(requestCode, itemCode);
        }

        protected void lvDisbursementDetails_ItemEditing(object sender, ListViewEditEventArgs e)
        {
            lvDisbursementDetails.EditIndex = e.NewEditIndex;
            BindLvDisbursementDetails();
        }

        protected void lvDisbursementDetails_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            //TextBox tbxActualQuantity = lvDisbursementDetails.Items[e.ItemIndex].FindControl("tbxActualQuantity") as TextBox;

            //lblTest.Text = e.NewValues["Quantity"].ToString();
            


            lvDisbursementDetails.EditIndex = -1;
            BindLvDisbursementDetails();
        }

        protected void lvDisbursementDetails_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvDisbursementDetails.EditIndex = -1;
            BindLvDisbursementDetails();
        }
    }
}