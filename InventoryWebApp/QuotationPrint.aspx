<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="QuotationPrint.aspx.cs" Inherits="InventoryWebApp.QuotationPrint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>Stationery Supply Tender Quotation Form</h3>
                <p>&nbsp;</p>
                <asp:Label ID="SupplierNameLabel" runat="server" Text="Load supplier name here..."></asp:Label>
                <asp:Label ID="SupplierAddressLabel" runat="server" Text="Load supplier address here..."></asp:Label>
                <br />
                <asp:GridView ID="ItemsSuppliedList" runat="server"></asp:GridView>
                
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
