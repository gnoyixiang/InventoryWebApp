<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentList.aspx.cs" Inherits="InventoryWebApp.StockAdjustmentList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .row {
            margin: 10px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
            <h3>Inventory Adjustment Request Status</h3>
    </div>
    <div class="row">
            <asp:GridView ID="gvAdjustmentStatus" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvAdjustmentStatus_RowDataBound"
                CellSpacing="-1" GridLines="None" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="AdjustmentCode" HeaderText="Adjustment Code" />
                    <asp:BoundField DataField="ItemCode" HeaderText="Description" />
                    <asp:BoundField DataField="AdjustmentQuant" HeaderText="Quantity To Adjust" />
                    <asp:BoundField DataField="DateCreated" HeaderText="Created Date" DataFormatString="{0:dd-MM-yyyy}" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:BoundField DataField="Reason" HeaderText="Reason" />
                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "/Store/StockAdjustmentEdit?AdjustmentCode="+Eval("AdjustmentCode") %>' Text=""></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
    </div>
    <div class="row">
        <div class="col-md-2 col-sm-3" style="margin-left: 0; padding-left:0;">
            <asp:Button ID="btnNewStockAdjustment" runat="server" Text="New" OnClick="btnNewStockAdjustment_Click" CssClass="btn btn-primary" />
        </div>
    </div>
</asp:Content>
