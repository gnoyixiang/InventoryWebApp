<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PurchaseOrderDetail.aspx.cs" Inherits="InventoryWebApp.PurchaseOrderDetail" %>

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
            <div class="col-sm-10">
                <h3>Purchase Order #</h3>
                <asp:Label runat="server" ID="lblOrderID"></asp:Label>
            </div>
            <div class="col-sm-2">
                <a href="#"><i title="Print to PDF" style="margin: 20px 0 10px 0; float: right;" class="fa fa-print fa-2x" aria-hidden="true"></i></a>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblStatus" Text="Status: "></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Supplier:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblSupplierName" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Deliver to:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblDeliverAddress" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Estimated Deilvery Date:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblEstDeliverDate" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Attn to:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblAttnTo" Font-Bold="true"></asp:Label>
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
                <asp:Label runat="server" id="lblOrderBy" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Order Date:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblOrderDate" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Approved by:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblApprovedBy" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Approved Date:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblApprovedDate" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Received by:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblReceivedBy" Font-Bold="true"></asp:Label>
                </div>
                <div class="col-sm-2">
                <asp:Label runat="server" Text="Received Date:"></asp:Label>
                </div>
                <div class="col-sm-4">
                <asp:Label runat="server" id="lblReceivedDate" Font-Bold="true"></asp:Label>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
