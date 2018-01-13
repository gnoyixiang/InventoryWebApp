<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AcknowledgeReceipt.aspx.cs" Inherits="InventoryWebApp.AcknowledgeReceipt" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row{
            margin:10px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-5">
                <h3>Acknowledge Receipt</h3>
            </div>
            <div class="col-sm-7">
                <h3>Purchase Order #</h3>
                <asp:Label runat="server" ID="lblOrderID"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12" style="float: right;">
                <asp:Label runat="server" ID="lblStatus" Text="Status: "></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <asp:Label runat="server" Text="Supplier:"></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:Label runat="server" ID="lblSupplierName" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label runat="server" Text="Deliver to:"></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:Label runat="server" ID="lblDeliverAddress" Font-Bold="true"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <asp:Label runat="server" Text="Estimated Deilvery Date:"></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:Label runat="server" ID="lblEstDeliverDate" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label runat="server" Text="Attn to:"></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:Label runat="server" ID="lblAttnTo" Font-Bold="true"></asp:Label>
            </div>
        </div>
        <div class="row">
            <asp:GridView runat="server" CssClass="table"></asp:GridView>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <asp:Label runat="server" Text="Ordered by:"></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:Label runat="server" ID="lblOrderBy" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label runat="server" Text="Order Date:"></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:Label runat="server" ID="lblOrderDate" Font-Bold="true"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-2">
                <asp:Label runat="server" Text="Approved by:"></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:Label runat="server" ID="lblApprovedBy" Font-Bold="true"></asp:Label>
            </div>
            <div class="col-sm-2">
                <asp:Label runat="server" Text="Approved Date:"></asp:Label>
            </div>
            <div class="col-sm-4">
                <asp:Label runat="server" ID="lblApprovedDate" Font-Bold="true"></asp:Label>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-10">
                <div class="form-inline" >
                <span>Received Date: </span>
                <asp:TextBox runat="server" type="date" CssClass="form-control"></asp:TextBox>
                    
                <asp:Button runat="server" Text="Acknowledge Receipt" CssClass="btn btn-primary" /></div>
            </div>
            <div class="col-sm-2">
                <asp:Button runat="server" Text="Cancel" style="float:right;" CssClass="btn btn-danger" />
            </div>
        </div>
    </div>
</asp:Content>
