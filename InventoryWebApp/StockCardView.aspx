<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockCardView.aspx.cs" Inherits="InventoryWebApp.StockCardView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>Stock Card</h3>
                <p>&nbsp;</p>
                <asp:Label ID="lblItemChoice" runat="server" Text="Choose item to view: "></asp:Label>
                <asp:DropDownList ID="ddlItemName" runat="server"></asp:DropDownList>
                <br />
                <asp:Label ID="lblQuantity" runat="server" Text="Quantity: "></asp:Label>
                <asp:Label ID="lblQuantityShow" runat="server" Text="Get amount from DB"></asp:Label>
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
