<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentView.aspx.cs" Inherits="InventoryWebApp.Store.StockAdjustmentView" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li><a href="StockAdjustmentList">Stock Adjustment</a></li>
        <li class="active">Stock Adjustment Details</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <asp:Panel runat="server" ID="panelNoAdj">
            <h3>No adjustment found!</h3>
            <a href="/Store/StockAdjustmentList.aspx">Return to view all adjustments</a>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelAdj">
            <div>
                <div style="text-align: right;">
                    <a href="#" onclick='printDiv("printA")'><i class="fa fa-print fa-2x" aria-hidden="true"></i></a>
                </div>
            </div>
            <div id="printA">
                <div class="row">
                    <div class="col-sm-10">
                        <h3>Stock Adjustment #<%= (string)Request.QueryString["AdjustmentCode"]%></h3>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-3 col-sm-5">
                        <asp:Label ID="lblItemChoice" runat="server" Text="Item:"></asp:Label>
                    </div>
                    <div class="col-md-4 col-sm-5">
                        <asp:Label ID="lblItemChoiceName" runat="server" Text="Load item name from DB" CssClass="form-control disabled"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-5">
                        <asp:Label ID="lblQuantityAdjusted" runat="server" Text="Quantity Adjusted:"></asp:Label>
                    </div>
                    <div class="col-md-4 col-sm-5">
                        <asp:Label ID="lblQuantityAdjustedShow" runat="server" Text="Load item name from DB" CssClass="form-control disabled"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-5">
                        <asp:Label ID="lblReason" runat="server" Text="Reason:"></asp:Label>
                    </div>
                    <div class="col-md-4 col-sm-5">
                        <asp:Label ID="lblReasonSubmitted" runat="server" Text="Load submitted reason" CssClass="form-control disabled"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-5">
                        <asp:Label ID="lblRejectionReason" runat="server" Text="Rejection Reason:"></asp:Label>
                    </div>
                    <div class="col-md-4 col-sm-5">
                        <asp:Label ID="lblRejectionReasonShow" runat="server" Text="Load rejection reason" CssClass="form-control disabled"></asp:Label>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 col-sm-5">
                        <asp:Button ID="btnReturn" runat="server" Text="Back" OnClick="ReturnToAdjustmentList_Click" CssClass="btn btn-warning" />
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
