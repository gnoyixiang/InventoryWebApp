using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using InventoryWebApp.Models.Entities;
using InventoryWebApp.Controllers;


namespace InventoryWebApp
{
    public partial class RequisitionDetails : System.Web.UI.Page
    {
        string RequestC;
        Request RO;
        EmployeeController ec = new EmployeeController();
        
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Request.QueryString["REQUESTCODE"]!=null)
            {
                RequestC = Request.QueryString["REQUESTCODE"];
                RO = ec.GetRequestbyRequestCode(RequestC);

            }
            else
            {
                Panel2.Visible = true;
                Panel1.Visible = false;
                return;
            }

            if (!IsPostBack)
            {
                FillFields();
                ListView1.DataSource = ec.ListAllRequestDetails(RO);

                ListView1.DataBind();
                ListView2.DataSource = ec.ListDisbursementbyRequest(RO);
                ListView2.DataBind();

            }


        }

        private void FillFields()
        {
            lblRequestCode.Text = RO.RequestCode.ToString();
            lblStatus.Text = RO.Status.ToString();
            lblDepartmentName.Text = RO.DepartmentCode.ToString();
        }

        protected bool IsEditable()
        {
            return ec.CheckStatusToEdit(RO);
        }

        protected void listDetails_ItemEditing(object sender, ListViewEditEventArgs e)
        {
                ListView1.EditIndex = e.NewEditIndex;
                BindData();
        }

        private bool IsRequestEditing(Request R)
        {
            if (R.Status.ToUpper() == "PENDING") return true;
            return false;
        }

        private void BindData()
        {
            if (RO != null)
            {
                ListView1.DataSource = ec.ListAllRequestDetails(RO);
                ListView1.DataBind();
            }
        }

        protected void ListView1_ItemCanceling(object sender, ListViewCancelEventArgs e)
        {
            ListView1.EditIndex = -1;
            BindData();
        }

        protected void ListView1_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            int a = Convert.ToInt32(e.NewValues["Quantity"]);
            RequestDetail rd = ec.ListAllRequestDetails(RO)[ListView1.EditIndex];
            rd.Quantity = a;
            ec.UpdateRequestDetail(rd);
            ListView1.EditIndex = -1;
            BindData();
        }

        protected void ListView1_ItemDeleting(object sender, ListViewDeleteEventArgs e)
        {
            RequestDetail rd = ec.ListAllRequestDetails(RO)[e.ItemIndex];
            ec.DeleteRequestDetail(rd);
            BindData();

        }
    }
}