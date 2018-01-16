<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentEdit.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentEdit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>Edit Inventory Adjustment #</h3>
                <p>&nbsp;</p>
                <asp:Label ID="lblItemChoice" runat="server" Text="Item:"></asp:Label>
                <asp:Label ID="lblItemChoiceName" runat="server" Text="Load item name from DB"></asp:Label>
                <br />
                <asp:Label ID="lblQuantityAdjust" runat="server" Text="Quantity to Adjust:"></asp:Label>
                <asp:TextBox ID="tbxQuantityAdjust" runat="server" Text="Enter amount to adjust"></asp:TextBox>
                <br />
                <asp:Label ID="lblCurrentStock" runat="server" Text="Current Stock:"></asp:Label>
                <asp:Label ID="lblCurrentStockAmount" runat="server" Text="Load amount from DB"></asp:Label>
                <br />
                <asp:Label ID="lblNewQuantity" runat="server" Text="New Quantity:"></asp:Label>
                <asp:Label ID="lblNewQuantityShow" runat="server" Text="Load amount by calculation"></asp:Label>
                <br />
                <asp:Label ID="lblReason" runat="server" Text="Reason:"></asp:Label>
                <asp:TextBox ID="tbxReason" runat="server" Text="enter new reason..."></asp:TextBox>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" />
                <asp:Button ID="btnSave" runat="server" Text="Save" />
                <asp:Button ID="btnDiscard" runat="server" Text="Cancel" />
                
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
