<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockAdjustmentList.aspx.cs" Inherits="InventoryWebApp.Store.StockAdjustmentList" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li class="active">Stock Adjustment</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-10 col-sm-9">
            <h3>Stock Adjustment</h3>
        </div>
        <% if (Context.User.IsInRole("Store Clerk"))
            { %>
        <div class="col-md-2 col-sm-3" style="margin-top: 5px;">
            <asp:Button ID="btnNewStockAdjustment" runat="server" Text="New" OnClick="btnNewStockAdjustment_Click" CssClass="btn btn-primary" Width="100%"/>
        </div>
        <% } %>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <asp:GridView ID="gvAdjustmentStatus" runat="server" AutoGenerateColumns="False" OnRowDataBound="gvAdjustmentStatus_RowDataBound"
                CellSpacing="-1" GridLines="None" CssClass="table table-striped" HeaderStyle-BackColor="#cfd8dc" >
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
    </div>
    <div class="row">
        
    </div>
        </div>
</asp:Content>
