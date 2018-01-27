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
        List<DisbursementDetail> ddList;
        List<Department> deptList;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropDownList();
            }


        }

        protected void BindDropDownList()
        {
            CollectionPoint all = new CollectionPoint();
            all.CollectionVenue = "ALL";
            all.CollectionPointCode = "ALL";

            HashSet<CollectionPoint> collectionPointList = sClerkCtrl.GetListOfCollectionPoint("disbursing");
            collectionPointList.Add(all);
            List<CollectionPoint> sortedCPList = collectionPointList.ToList();
            sortedCPList.Sort();

            ddlCollectionPoint.DataSource = sortedCPList;
            ddlCollectionPoint.DataTextField = "CollectionVenue";
            ddlCollectionPoint.DataValueField = "CollectionPointCode";
            ddlCollectionPoint.DataBind();

            deptList = sClerkCtrl.GetDisbursingDepartmentList(sClerkCtrl.GetDisbursingDisbursements());
            ddlDepartment.DataSource = deptList;
            ddlDepartment.DataTextField = "DepartmentName";
            ddlDepartment.DataValueField = "DepartmentCode";
            ddlDepartment.DataBind(); BindLvDisbursementDetails();
        }

        protected void BindLvDisbursementDetails()
        {
            ddList = sClerkCtrl.GetDisbursingDisbDetailsByDeptCode(ddlDepartment.SelectedValue);
            lvDisbursementDetails.DataSource = ddList;
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
            ddlDepartment.DataSource = ddlCollectionPoint.SelectedValue == "ALL" ? sClerkCtrl.GetDisbursingDepartmentList(sClerkCtrl.GetDisbursingDisbursements()) : sClerkCtrl.GetDisbursingDepartmentList(sClerkCtrl.GetDisbursementListByCollectionPoint(ddlCollectionPoint.SelectedValue,"disbursing"));
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

        protected RequestDetail GetRequestDetail(String requestCode, String itemCode)
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
            TextBox tbxNotes = lvDisbursementDetails.Items[e.ItemIndex].FindControl("tbxNotes") as TextBox;

            List<DisbursementDetail> ddList = sClerkCtrl.GetDisbursingDisbDetailsByDeptCode(ddlDepartment.SelectedValue);
            DisbursementDetail dd = ddList[e.ItemIndex];
            dd.ActualQuantity = Int32.Parse(e.NewValues["ActualQuantity"].ToString());
            dd.Notes = tbxNotes.Text;
            sClerkCtrl.UpdateDisbursementDetail(dd);

            lvDisbursementDetails.EditIndex = -1;
            BindLvDisbursementDetails();
        }

        protected void lvDisbursementDetails_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            lvDisbursementDetails.EditIndex = -1;
            BindLvDisbursementDetails();
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            BindLvDisbursementDetails();

            if (deptList != null && deptList.Count != 0)
            {
                tbxRep.Text = GetEmployee(GetDepartment().RepresentativeCode).EmployeeTitle + " " + GetEmployee(GetDepartment().RepresentativeCode).EmployeeName;
                tbxDisbursementDate.Text = GetPlanToCollectDate().ToString("dd MMM yyyy");
                tbxStatus.Text = GetDisbursingDisbursementByDeptCode(ddlDepartment.SelectedValue).Status;
                tbxDisbursementTime.Text = GetCollectionTime();
            }
            else
            {
                lblAlert.Text = "There is no disbursement at the moment.";
            }
            base.OnPreRenderComplete(e);
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("DisbursementGenerationPage.aspx");
        }

        protected void btnNotCollected_Click(object sender, EventArgs e)
        {

            if (ddlDepartment.SelectedValue != "")
            {
                Disbursement d = GetDisbursingDisbursementByDeptCode(ddlDepartment.SelectedValue);
                d.Status = "not collected";
                List<DisbursementDetail> ddList = sClerkCtrl.GetDisbursementDetails(d.DisbursementCode);
                foreach (var item in ddList)
                {
                    StationeryCatalogue sc = sClerkCtrl.GetStationeryByCode(item.ItemCode);
                    sc.Stock += item.ActualQuantity;
                    item.ActualQuantity = 0;
                    sClerkCtrl.UpdateDisbursementDetail(item);
                    sClerkCtrl.UpdateStationeryCatalogue(sc);
                    RequestDetail rd = sClerkCtrl.GetRequestDetail(item.RequestCode, item.ItemCode);
                    sClerkCtrl.UpdateDisbursement(d);
                    BindDropDownList();
                }
            }
            else
                btnNotCollected.Enabled = false;
            
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChargeBackPage.aspx");
        }
    }


}