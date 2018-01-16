﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentNew.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>New Inventory Adjustment</h3>
                <p>&nbsp;</p>
                <asp:Label ID="ItemChoiceLabel" runat="server" Text="Item:"></asp:Label>
                <asp:DropDownList ID="ItemChoiceDropDownList" runat="server"></asp:DropDownList>
                <br />
                <asp:Label ID="QuantityAdjustLabel" runat="server" Text="Quantity to Adjust:"></asp:Label>
                <asp:TextBox ID="QuantityAdjustTextBox" runat="server" Text="Enter amount to adjust"></asp:TextBox>
                <br />
                <asp:Label ID="CurrentStockLabel" runat="server" Text="Current Stock:"></asp:Label>
                <asp:Label ID="CurrentStockAmountLabel" runat="server" Text="Load amount from DB"></asp:Label>
                <br />
                <asp:Label ID="NewQuantityLabel" runat="server" Text="New Quantity:"></asp:Label>
                <asp:Label ID="NewQuantityShowLabel" runat="server" Text="Load amount by calculation"></asp:Label>
                <br />
                <asp:Label ID="ReasonLabel" runat="server" Text="Reason:"></asp:Label>
                <asp:TextBox ID="ReasonTextBox" runat="server" Text="enter new reason..."></asp:TextBox>
                <br />
                <asp:Button ID="SubmitStockAdjustment" runat="server" Text="Submit" OnClick="SubmitStockAdjustment_Click" />
                <asp:Button ID="SaveStockAdjustment" runat="server" Text="Save" OnClick="SaveStockAdjustment_Click" />
                <asp:Button ID="DiscardStockAdjustment" runat="server" Text="Cancel" OnClick="DiscardStockAdjustment_Click" />
                
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
