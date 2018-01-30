<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QuotationView.aspx.cs" 
    Inherits="InventoryWebApp.Store.QuotationView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-md-11">
            <h3>Stationery Supply Quotation List</h3>
        </div>
        <div class="col-md-1" style="text-align: right"><a href="#"><i style="margin: 20px 0 10px 0" class="fa fa-print fa-2x" aria-hidden="true"></i></a></div>
    </div>

    <div class="row" style="margin-top: 10px;">

        <div class="col-lg-12">
            <asp:GridView ID="gvQuotation" runat="server" AutoGenerateColumns="False" CssClass="table" CellSpacing="-1" GridLines="None">
                <Columns>
                    <asp:BoundField DataField="SupplierCode" HeaderText="Supplier Code" Visible="False" />
                    <asp:HyperLinkField DataTextField="SupplierName" DataNavigateUrlFields="SupplierCode" DataNavigateUrlFormatString="/Store/QuotationPrint.aspx?SupplierCode={0}"
                        HeaderText="Supplier Name" />
                    <asp:BoundField DataField="Address" HeaderText="Supplier Address" />
                    <asp:BoundField DataField="ContactName" HeaderText="Contact Person" />
                    <asp:BoundField DataField="PhoneNo" HeaderText="Contact Number" />
                </Columns>
            </asp:GridView>

        </div>
        <div class="col-sm-2">
        </div>
    </div>
</asp:Content>
