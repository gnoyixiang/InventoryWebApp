<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentList.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-10">
                <h3>Inventory Adjustment Request Status</h3>
                <p>&nbsp;</p>
                <asp:GridView ID="gvAdjustmentStatus" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvAdjustmentStatus_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="AdjustmentCode" HeaderText="Adjustment Code" />
                        <asp:BoundField DataField="ItemCode" HeaderText="Item" />
                        <asp:BoundField DataField="AdjustmentQuant" HeaderText="Quantity To Adjust" />
                        <asp:BoundField DataField="DateCreated" HeaderText="Created Date" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="Reason" HeaderText="Reason" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("AdjustmentCode") %>' Text=""></asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                <asp:Button ID="btnNewStockAdjustment" runat="server" Text="New" OnClick="btnNewStockAdjustment_Click" />
            </div>
            <div class="col-sm-2">
                <div class="margin:20px 0 10px 0;">
                    <a href="#"><i class="fa fa-print" aria-hidden="true"></i></a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
