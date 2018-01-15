<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentList.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>Inventory Adjustment Request Status</h3>
                <p>&nbsp;</p>
                <asp:GridView ID="AdjustmentStatusList" runat="server"></asp:GridView>
                <asp:Button ID="NewStockAdjustment" runat="server" Text="New" OnClick="NewStockAdjustment_Click" />
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
