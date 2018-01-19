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
            if (!IsPostBack && Request.QueryString["REQUESTCODE"] != null)
            {
                RequestC = Request.QueryString["REQUESTCODE"];
                RO=ec.GetRequestbyRequestCode(RequestC);
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





    }
}