﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace InventoryWebApp
{
    public partial class SupplierList : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //GridViewSupplierList.DataSource = StoreSupervisorBusinessLogic.SupplierList();
                //GridViewSupplierList.DataBind();
            }
        }
    }
}