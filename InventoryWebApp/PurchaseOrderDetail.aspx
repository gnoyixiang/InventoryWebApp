<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PurchaseOrderDetail.aspx.cs" Inherits="InventoryWebApp.PurchaseOrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row {
            margin: 10px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <asp:Panel ID="panelError" runat="server">
            <div class="row">
                <div class="col-sm-12">
                    <h4>No records found!</h4>
                    <a href="/ViewPurchaseOrders">Return to view purchase orders</a>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelDetails" runat="server">
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
                    <asp:ListView ID="listDetails" runat="server">
                        <LayoutTemplate>
                            <table class="table">
                                <tr>
                                    <th>Description</th>
                                    <th>Quantity</th>
                                    <th>Price</th>
                                    <th>Amount</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server"></tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td>Grand Total</td>
                                    <td><asp:Label ID="lblGrandTotal" runat="server"></asp:Label></td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# getItemDescription(Eval("ItemCode").ToString()) %></td>
                                <td><%# Eval("Quantity") %></td>
                                <td><%# Eval("Price") %></td>
                                <td><%# getAmount(Eval("Quantity").ToString(), Eval("Price").ToString()) %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
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
                    <div class="col-sm-2">
                        <asp:Label runat="server" Text="Received by:"></asp:Label>
                    </div>
                    <div class="col-sm-4">
                        <asp:Label runat="server" ID="lblReceivedBy" Font-Bold="true"></asp:Label>
                    </div>
                    <div class="col-sm-2">
                        <asp:Label runat="server" Text="Received Date:"></asp:Label>
                    </div>
                    <div class="col-sm-4">
                        <asp:Label runat="server" ID="lblReceivedDate" Font-Bold="true"></asp:Label>
                    </div>
                </div>
            </div>
        </asp:Panel>
    </div>
</asp:Content>
