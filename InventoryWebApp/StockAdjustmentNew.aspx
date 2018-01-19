<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentNew.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>New Inventory Adjustment</h3>
                <p>&nbsp;</p>
                <asp:Label ID="lblItemChoice" runat="server" Text="Item:"></asp:Label>
                <asp:DropDownList ID="ddlItemChoice" runat="server"></asp:DropDownList>
                <br />
                <asp:Label ID="lblQuantityAdjust" runat="server" Text="Quantity to Adjust:"></asp:Label>
                <asp:TextBox ID="tbxQuantityAdjust" runat="server" Text=""></asp:TextBox>
                <br />
                <asp:Label ID="lblCurrentStock" runat="server" Text="Current Stock:"></asp:Label>
                <asp:Label ID="lblCurrentStockAmount" runat="server" Text="Load amount from DB"></asp:Label>
                <br />
                <asp:Label ID="lblNewQuantity" runat="server" Text="New Quantity:"></asp:Label>
                <asp:Label ID="lblNewQuantityShow" runat="server" Text="Enter a quantity to adjust"></asp:Label>
                <br />
                <asp:Label ID="lblReason" runat="server" Text="Reason:"></asp:Label>
                <asp:TextBox ID="tbxReason" runat="server" Text=""></asp:TextBox>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                <asp:Button ID="btnDiscard" runat="server" Text="Cancel" OnClick="btnDiscard_Click" />
                
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
