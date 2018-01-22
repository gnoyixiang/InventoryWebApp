<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentView.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>View Inventory Adjustment <%=Request.QueryString["AdjustmentCode"].ToString()%></h3>
                <br />
                <table border="0" style="width: 300px; height: 100px">
                    <tr>
                        <td>
                            <asp:Label ID="lblItemChoice" runat="server" Text="Item:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblItemChoiceName" runat="server" Text="Load item name from DB"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblQuantityAdjusted" runat="server" Text="Quantity Adjusted:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblQuantityAdjustedShow" runat="server" Text="Load item name from DB"></asp:Label>
                            <%--                <asp:Label ID="lblCurrentStock" runat="server" Text="Current Stock:"></asp:Label>
                <asp:Label ID="lblCurrentStockAmount" runat="server" Text=""></asp:Label>
                <br />
                <asp:Label ID="lblNewQuantity" runat="server" Text="New Quantity:"></asp:Label>
                <asp:Label ID="lblNewQuantityAmount" runat="server" Text=""></asp:Label>
                <br />--%>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblReason" runat="server" Text="Reason:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblReasonSubmitted" runat="server" Text="Load submitted reason"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblRejectionReason" runat="server" Text="Rejection Reason:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblRejectionReasonShow" runat="server" Text="Load rejection reason"></asp:Label>
                        </td>
                    </tr>
                </table>
                <asp:Button ID="btnReturn" runat="server" Text="Back" OnClick="ReturnToAdjustmentList_Click" />

            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
