using InventoryWebApp.Controllers;
using InventoryWebApp.Models;
using InventoryWebApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryWebApp.Dept
{
    public partial class ChangeCollectionPoint : System.Web.UI.Page
    {
        EmployeeController ec = new EmployeeController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //TODO: display Department Name
                lblInfoDeptName.Text = "Institute of Systems Science";
                var collectionCode = ec.GetCollectionPoint(lblInfoDeptName.Text);
                tbxCCP.Text = ec.GetCollectionPointnameByCode(collectionCode);
                ddlCP.DataSource = ec.DdlCollectionPoint();
                ddlCP.DataTextField = "CollectionVenue";
                ddlCP.DataValueField = "CollectionPointCode";
                ddlCP.DataBind();
            }
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                
                if (!String.IsNullOrEmpty(tbxCCP.Text) && ddlCP.SelectedItem.Selected)
                {
                    string deptCode = ec.GetDeptCodeByName(lblInfoDeptName.Text);
                    //TODO: change department code
                    ec.UpdateCollectionPoint(deptCode, ddlCP.SelectedValue);

                }
                var collectionCode = ec.GetCollectionPoint(lblInfoDeptName.Text);
                tbxCCP.Text = ec.GetCollectionPointnameByCode(collectionCode);
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", sb.ToString(), false);
            }
        }
    }
}