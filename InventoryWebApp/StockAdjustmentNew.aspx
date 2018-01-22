<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentNew.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>New Inventory Adjustment</h3>
                <br />
                <table border="0" style="width: 600px; height: 100px">
                    <tr>
                        <td>
                            <asp:Label ID="lblItemChoice" runat="server" Text="Item:"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlItemChoice" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlItemChoice_SelectedIndexChanged" OnLoad="ddlItemChoice_Load"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblCurrentStock" runat="server" Text="Current Stock:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblCurrentStockAmount" runat="server" Text="Load amount from DB"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNewQuantity" runat="server" Text="New Quantity:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbxNewQuantity" runat="server" OnTextChanged="tbxQuantityAdjust_TextChanged" AutoPostBack="True" TextMode="Number"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblQuantityAdjust" runat="server" Text="Quantity to Adjust:"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="lblQuantityAdjustShow" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblReason" runat="server" Text="Reason:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="tbxReason" runat="server" Text="" AutoPostBack="True" OnTextChanged="tbxReason_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                </table>
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
