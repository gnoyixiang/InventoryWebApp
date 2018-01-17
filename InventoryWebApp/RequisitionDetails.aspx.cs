using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using InventoryWebApp.Models.Entities;


namespace InventoryWebApp
{
    public partial class RequisitionDetails : System.Web.UI.Page
    {
        string RequestC;
        Request RO;
        

        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack || Request.QueryString["REQUESTCODE"] != null)
            {
                RequestC = Request.QueryString["REQUESTCODE"];
                RO = getRequest(RequestC);
                FillFields();
            
            }
        }
        private Request getRequest(string ROCode)
        {
            return new EntityModel().Requests.Where(p => p.RequestCode == ROCode).FirstOrDefault<Request>();
        }

        private void FillFields()
        {
            lblRequestCode.Text = RO.RequestCode.ToString();
            lblStatus.Text = RO.Status.ToString();
            lblDepartmentName.Text = RO.DepartmentCode.ToString();
        }

        
    }
}