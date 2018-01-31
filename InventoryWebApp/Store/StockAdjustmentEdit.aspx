<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentEdit.aspx.cs" Inherits="InventoryWebApp.Store.StockAdjustmentEdit" %>

<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .error {
            border: 1px solid red;
        }

        .row {
            margin: 10px 0;
        }

        .disabled {
            background-color: #eeecec;
        }

        .btn {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li><a href="StockAdjustmentList">Stock Adjustment</a></li>
        <li class="active">Edit Stock Adjustment</li>
    </ul>
    <div class="container-fluid" id="mainContainer">

        <asp:Panel runat="server" ID="panelNoAdj">
            <h3>No adjustment found!</h3>
            <a href="/Store/StockAdjustmentList.aspx">Return to view all adjustments</a>
        </asp:Panel>
        <asp:Panel runat="server" ID="panelAdj">
            <div class="row">
                <div class="col-sm-10">
                    <h3>Stock Adjustment #<%= (string)Request.QueryString["AdjustmentCode"]%></h3>
                </div>
            </div>

            <div class="row">
                <div class="col-md-4 col-sm-5">
                    <asp:Label ID="lblItemChoice" runat="server" Text="Item:"></asp:Label>
                </div>
                <div class="col-md-4 col-sm-5">
                    <asp:Label ID="lblItemChoiceName" runat="server" CssClass="form-control disabled">
                    </asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-5">
                    <asp:Label ID="lblCurrentStock" runat="server" Text="Current Stock:"></asp:Label>
                </div>
                <div class="col-md-4 col-sm-5">
                    <asp:Label ID="lblCurrentStockAmount" runat="server" Text="Load amount from DB" CssClass="form-control disabled"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-5">
                    <asp:Label ID="lblNewQuantity" runat="server" Text="New Quantity:"></asp:Label>
                </div>
                <div class="col-md-4 col-sm-5">
                    <asp:TextBox ID="tbxNewQuantity" runat="server" OnTextChanged="tbxQuantityAdjust_TextChanged" AutoPostBack="True" TextMode="Number"
                        CausesValidation="true" CssClass="form-control"></asp:TextBox>
                    <asp:CustomValidator ID="validNewQuantity" runat="server" ErrorMessage="" ForeColor="Red" ControlToValidate="tbxNewQuantity"
                        OnServerValidate="validNewQuantity_ServerValidate" Display="Dynamic"></asp:CustomValidator>
                    <asp:RequiredFieldValidator ID="validRequiredQty" runat="server" ErrorMessage="New quantity is required" ControlToValidate="tbxNewQuantity"
                        Display="Dynamic" ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-5">
                    <asp:Label ID="lblQuantityAdjust" runat="server" Text="Quantity to Adjust:"></asp:Label>
                </div>
                <div class="col-md-4 col-sm-5">
                    <asp:Label ID="lblQuantityAdjustShow" runat="server" Text="" CssClass="form-control disabled"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4 col-sm-5">
                    <asp:Label ID="lblReason" runat="server" Text="Reason:"></asp:Label>
                </div>
                <div class="col-md-4 col-sm-5">
                    <asp:TextBox ID="tbxReason" runat="server" Text="" AutoPostBack="True" OnTextChanged="tbxReason_TextChanged" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-2 col-sm-3">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-success" />
                </div>
                <div class="col-md-2 col-sm-3">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary" />
                </div>
                <div class="col-md-2 col-sm-3">
                    <asp:Button ID="btnDiscard" runat="server" Text="Cancel" OnClick="btnDiscard_Click" CssClass="btn btn-danger" CausesValidation="false" />
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
