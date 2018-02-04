<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentNew.aspx.cs" Inherits="InventoryWebApp.Store.StockAdjustmentNew" %>

<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btnform {
            width: 100%;
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li class="active">View Catalogue</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>New Stock Adjustment</h3>
            </div>
        </div>

        <div class="row">
            <div class="col-md-4 col-sm-5">
                <asp:Label ID="lblItemChoice" runat="server" Text="Item:"></asp:Label>
            </div>
            <div class="col-md-4 col-sm-5">
                <asp:DropDownList ID="ddlItemChoice" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlItemChoice_SelectedIndexChanged"
                    CssClass="form-control" OnLoad="ddlItemChoice_Load">
                </asp:DropDownList>
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
                    OnServerValidate="validNewQuantity_ServerValidate" Display="Dynamic" ValidationGroup="validGroupSubmit"></asp:CustomValidator>
                <asp:RequiredFieldValidator ID="validRequiredQty" runat="server" ErrorMessage="New quantity is required" ControlToValidate="tbxNewQuantity"
                    Display="Dynamic" ForeColor="Red" ValidationGroup="validGroupSubmit">
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
                <asp:TextBox ID="tbxReason" runat="server" Text="" AutoPostBack="True" OnTextChanged="tbxReason_TextChanged" CssClass="form-control" AutoCompleteType="Disabled"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2 col-sm-3">
                <asp:Button runat="server" ID="btnModal" Text="Submit" CssClass="btn btn-success btnform" CausesValidation="true" Width="100%" 
                    ValidationGroup="validGroupSubmit" OnClick="btnModal_Click" />
            </div>
            <div class="col-md-2 col-sm-3">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary btnform"   />
            </div>
            <div class="col-md-2 col-sm-3">
                <asp:Button ID="btnDiscard" runat="server" Text="Cancel" OnClick="btnDiscard_Click" CssClass="btn btn-danger btnform" CausesValidation="false"  />
            </div>
        </div>

    </div>

    <!-- Email Modal -->
    <div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLongTitle">Please verify your password</h3>
                </div>
                <div class="modal-body">
                    <div class="input-group " style="margin-bottom: 10px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-log-in"></i></span>
                        <input type="text" class="form-control disabled" id="txtUsername" aria-describedby="lblUsername" value="<%= Context.User.Identity.Name %>" readonly>
                    </div>
                    <div class="input-group " style="margin-bottom: 10px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <asp:TextBox type="password" CssClass="form-control" ID="txtPassword" aria-describedby="lblPassword" runat="server" AutoCompleteType="Disabled"></asp:TextBox>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label ID="lblVerifyError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-bottom: 10px">Close</button>
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success" CausesValidation="true" type="button"
                        OnClick="btnSubmit_Click" Style="margin-bottom: 10px;" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
