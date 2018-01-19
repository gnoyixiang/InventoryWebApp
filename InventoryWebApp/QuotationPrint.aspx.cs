using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InventoryWebApp.Models.Entities;
using System.Data;

namespace InventoryWebApp
{
    public partial class QuotationPrint : System.Web.UI.Page
    {
        EntityModel em = new EntityModel();
        protected void Page_Load(object sender, EventArgs e)
        {
            String s = Request.QueryString["SupplierCode"];

            Supplier supplierPick = em.Suppliers.First(x => x.SupplierCode == s);
            lblSupplierName.Text = supplierPick.SupplierName;
            lblSupplierAddress.Text = supplierPick.Address;

            List<StationeryCatalogue> stationerySupplied = em.StationeryCatalogues.Where
                (x => x.Supplier1 == s || x.Supplier2 == s || x.Supplier3 == s).ToList();

            DataTable intermediateDataSource = new DataTable();
            DataColumn[] keys = new DataColumn[1];
            DataColumn column;
            DataRow rowTempDataSource;

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.String");
            column.ColumnName = "Description";

            intermediateDataSource.Columns.Add(column);

            keys[0] = column;
            intermediateDataSource.PrimaryKey = keys;

            column = new DataColumn();
            column.DataType = System.Type.GetType("System.Decimal");
            column.ColumnName = "Price";
            intermediateDataSource.Columns.Add(column);

            Tender tenderTemp;
            tenderTemp = em.Tenders.Where
                    (x => x.SupplierCode == supplierPick.SupplierCode).OrderByDescending(x => x.DateCreated).FirstOrDefault();
            foreach (StationeryCatalogue a in stationerySupplied)
            {
                rowTempDataSource = intermediateDataSource.NewRow();
                rowTempDataSource["Description"] = a.Description;

                if (tenderTemp !=null)
                {
                    rowTempDataSource["Price"] = em.TenderDetails.Where
                        (x => x.ItemCode == a.ItemCode &&
                        x.TenderCode == tenderTemp.TenderCode).FirstOrDefault().Price;
                }

                intermediateDataSource.Rows.Add(rowTempDataSource);
            }

            gvItemsSupplied.DataSource = intermediateDataSource;
            gvItemsSupplied.DataBind();
        }
    }
}