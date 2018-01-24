<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QuotationView.aspx.cs" Inherits="InventoryWebApp.QuotationView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>Stationery Supply Quotation List</h3>
                <br />
                <asp:GridView ID="gvQuotation" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:BoundField DataField="SupplierCode" HeaderText="Supplier Code" Visible="False" />
                        <asp:BoundField DataField="SupplierName" HeaderText="Supplier Name" />
                        <asp:BoundField DataField="Address" HeaderText="Supplier Address" />
                        <asp:BoundField DataField="ContactName" HeaderText="Contact Person" />
                        <asp:BoundField DataField="PhoneNo" HeaderText="Contact Number" />
                        <asp:HyperLinkField DataNavigateUrlFields="SupplierCode" DataNavigateUrlFormatString="~\QuotationPrint.aspx?SupplierCode={0}" Text="View" />
                    </Columns>
                </asp:GridView>
                
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
