<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentView.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
            <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>View Inventory Adjustment #</h3>
                <p>&nbsp;</p>
                <asp:Label ID="ItemChoiceLabel" runat="server" Text="Item:"></asp:Label>
                <asp:Label ID="ItemChoiceNameLabel" runat="server" Text="Load item name from DB"></asp:Label>
                <br />
                <asp:Label ID="CurrentStockLabel" runat="server" Text="Current Stock:"></asp:Label>
                <asp:Label ID="CurrentStockAmountLabel" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="NewQuantityLabel" runat="server" Text="New Quantity:"></asp:Label>
                <asp:Label ID="NewQuantityAmountLabel" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="ReasonLabel" runat="server" Text="Reason:"></asp:Label>
                <asp:Label ID="ReasonSubmittedLabel" runat="server" Text="Load submitted reason"></asp:Label>
                <br />
                <asp:Label ID="RejectionReasonLabel" runat="server" Text="Rejection Reason:"></asp:Label>
                <asp:Label ID="RejectionReasonShowLabel" runat="server" Text="Load rejection reason"></asp:Label>
                <br />
                <asp:Button ID="ReturnToAdjustmentList" runat="server" Text="Back" OnClick="ReturnToAdjustmentList_Click" />
                
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
