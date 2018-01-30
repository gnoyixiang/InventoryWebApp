using InventoryWebApp.Controllers;
using InventoryWebApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;

namespace InventoryWebApp.Dept
{
    public partial class ItemDetails : System.Web.UI.Page
    {
        EmployeeController ec = new EmployeeController();
        string requestcode;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["REQUESTCODE"] != null)
            {
                requestcode = Request.QueryString["REQUESTCODE"];
                var RO = ec.GetRequestbyRequestCode(requestcode);

            }

            if (!IsPostBack)
            {
                string itemcode = Request.QueryString["ItemCode"];

                try
                {
                    Session["ItemDetails"] = Session["ItemDetails"] != null ? (List<RequestDTO>)Session["ItemDetails"] : new List<RequestDTO>();
                    var itemInfo = ec.GetStationery(itemcode);
                    if (itemInfo != null)
                    {
                        lblItemCode.Text = Request.QueryString["ItemCode"].ToString();
                        lblCategory.Text = itemInfo.CategoryCode;
                        lblDescription.Text = itemInfo.Description;
                    }
                }
                catch (Exception ex)
                {
                    string errormsg = string.Format("<script>Error:{0}</script>", ex.Message);
                    Response.Write(errormsg);
                }
            }
        }
        protected void tbxQuantity_TextChanged(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(tbxQuantity.Text))
            {
                rdlQuantity.Enabled = false;
                rdlRequiredValidator.Visible = false;
                int quantity = -1;
                if (!int.TryParse(tbxQuantity.Text, out quantity))
                {
                    lblQuantityResult.Text = "";
                }
                else if (int.TryParse(tbxQuantity.Text, out quantity) && int.Parse(tbxQuantity.Text) < 0)
                {
                    lblQuantityResult.Text = "";
                }
                else
                {
                    lblQuantityResult.Text = "Quantity for this item is:" + Convert.ToInt32(tbxQuantity.Text);
                }
            }
        }
        protected void rdlQuantity_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rdlQuantity.SelectedItem != null)
            {
                tbxQuantity.Text = rdlQuantity.SelectedItem.Text;
                tbxRequiredValidator.Visible = false;
                lblAnotherQuantity.Visible = false;
            }
        }

        protected bool IsRedirect()
        {
            if (Request.QueryString["REQUESTCODE"] != null)
            {
                return true;
            }
            else
                return false;
        }

        protected void btnAddToRequest_Click(object sender, EventArgs e)
        {

            if (Page.IsValid)
            {
                //add item from existing database
                if (Request.QueryString["REQUESTCODE"] != null)
                {
                    if ((string)Request.QueryString["REQUESTCODE"] != "")
                    {
                        RequestDetail requestDetail=null;
                        if (!String.IsNullOrEmpty(tbxQuantity.Text))
                        {
                            requestDetail = new RequestDetail();
                            requestDetail.RequestCode = (string)Request.QueryString["REQUESTCODE"];
                            requestDetail.ItemCode = (string)Request.QueryString["ItemCode"];
                            requestDetail.Quantity = requestDetail.RemainingQuant = Convert.ToInt32(tbxQuantity.Text);

                            //newItem = new RequestDTO(lblItemCode.Text, lblCategory.Text, lblDescription.Text, Convert.ToInt32(tbxQuantity.Text));
                            //addItem.Add(newItem);
                            //Session["ItemDetails"] = addItem;
                        }
                        else if (rdlQuantity.SelectedItem.Selected)
                        {
                            requestDetail = new RequestDetail();
                            requestDetail.RequestCode = (string)Request.QueryString["REQUESTCODE"];
                            requestDetail.ItemCode = (string)Request.QueryString["ItemCode"];
                            requestDetail.Quantity = requestDetail.RemainingQuant =
                                Convert.ToInt32(rdlQuantity.SelectedItem.Text);

                            //newItem = new RequestDTO(lblItemCode.Text, lblCategory.Text, lblCategory.Text, Convert.ToInt32(rdlQuantity.SelectedItem.Text));
                            //addItem.Add(newItem);
                            //Session["ItemDetails"] = addItem;
                        }
                        if (requestDetail != null)
                        {
                            RequestDetail existingRequestDetail = 
                                ec.GetRequestDetail(requestDetail.RequestCode, requestDetail.ItemCode);
                            if (existingRequestDetail == null)
                                ec.AddRequestDetail(requestDetail);
                            else
                            {
                                existingRequestDetail.Quantity += requestDetail.Quantity;
                                existingRequestDetail.RemainingQuant += requestDetail.RemainingQuant;
                                ec.UpdateRequestDetail(existingRequestDetail);
                            }
                        }

                    }
                }
                else
                {
                    //add item to new request

                    List<RequestDTO> addItem = (List<RequestDTO>)Session["ItemDetails"];
                    RequestDTO newItem = addItem.FirstOrDefault(x => x.ItemCode == lblItemCode.Text);
                    if (newItem == null)
                    {
                        if (!String.IsNullOrEmpty(tbxQuantity.Text))
                        {
                            newItem = new RequestDTO(lblItemCode.Text, lblCategory.Text, lblDescription.Text, Convert.ToInt32(tbxQuantity.Text));
                            addItem.Add(newItem);
                            Session["ItemDetails"] = addItem;
                        }
                        else if (rdlQuantity.SelectedItem.Selected)
                        {
                            newItem = new RequestDTO(lblItemCode.Text, lblCategory.Text, lblCategory.Text, Convert.ToInt32(rdlQuantity.SelectedItem.Text));
                            addItem.Add(newItem);
                            Session["ItemDetails"] = addItem;
                        }
                    }
                    else
                    {
                        if (!String.IsNullOrEmpty(tbxQuantity.Text))
                        {
                            newItem.Quantity += Convert.ToInt32(tbxQuantity.Text);
                            addItem.RemoveAll(x => x.ItemCode == lblItemCode.Text);
                            addItem.Add(newItem);
                            Session["ItemDetails"] = addItem;
                        }
                        else if (rdlQuantity.SelectedItem.Selected)
                        {
                            newItem.Quantity += Convert.ToInt32(rdlQuantity.SelectedItem.Text);
                            addItem.RemoveAll(x => x.ItemCode == lblItemCode.Text);
                            addItem.Add(newItem);
                            Session["ItemDetails"] = addItem;
                        }
                    }
                }
            }

            if (IsRedirect() && Session["ItemDetails"] != null)
            {
                Response.Redirect("RequisitionDetails.aspx?REQUESTCODE=" + requestcode);
            }
            else
            {
                //show success message
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append(@"<script type='text/javascript'>");
                sb.Append("$('#myModal').modal('show');");
                sb.Append(@"</script>");
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "none", sb.ToString(), false);
            }


        }
    }
}