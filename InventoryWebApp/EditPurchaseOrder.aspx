<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="EditPurchaseOrder.aspx.cs" Inherits="InventoryWebApp.EditPurchaseOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <asp:Panel ID="panelError" runat="server" Visible="false">
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
                    <h3>Purchase Order #
                    <asp:Label runat="server" ID="lblOrderID"></asp:Label></h3>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblStatus" Text="Status:" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Label runat="server" Text="Supplier:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblSupplierName" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-2">
                    <asp:Label runat="server" Text="Estimated Deilvery Date:"></asp:Label>
                </div>
                <div class="col-sm-4">
                    <asp:Label runat="server" ID="lblEstDeliverDate" Font-Bold="true"></asp:Label>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                   
                </div>
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
            <div class="row" style="margin-top:20px;">
                <div class="col-md-1">Notes:</div>
                <div class="col-md-11">
                    <textarea rows="3" style="resize: none; width: 100%;"
                        class="form-control" runat="server" id="lblNotes" readonly="readonly"></textarea>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-3">
                    <asp:LinkButton ID="linkEdit" runat="server" CssClass="btn btn-warning"
                        Style="width: 100%; margin-bottom: 10px" OnCommand="linkEdit_Command">Edit Order</asp:LinkButton>
                </div>
                <div class="col-lg-3"></div>
                <div class="col-lg-3">
                    <asp:Button runat="server" ID="btnAckReceipt" CssClass="btn btn-success" OnClick="btnAckReceipt_Click"
                        Text="Acknowledge Receipt" Width="100%" Style="margin-bottom: 10px"
                        OnClientClick="return confirm('Confirm to receive this order?');" />

                </div>
                <div class="col-lg-3">
                    <asp:Button runat="server" ID="btnCancelOrder" CssClass="btn btn-danger" OnClick="btnCancelOrder_Click"
                        Text="Cancel Order" Width="100%" Style="margin-bottom: 10px"
                        OnClientClick="return confirm('Cancel this order?');" />
                </div>
            </div>

        </asp:Panel>

        
</asp:Content>
