<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdjustmentByStoreSupervisor.aspx.cs"
    Inherits="InventoryWebApp.Store.AdjustmentByStoreSupervisor" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Stock Adjustment</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>Stock Adjustment</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvPendingAdjutment" runat="server" GridLines="None" Width="100%" AutoGenerateColumns="false" DataKeyNames="AdjustmentCode"
                    OnRowDataBound="gvPendingAdjutment_RowDataBound" OnRowCommand="gvPendingAdjutment_RowCommand" CellSpacing="-1" CssClass="table table-striped"
                    HeaderStyle-BackColor="#cfd8dc">
                    <Columns>
                        <asp:TemplateField HeaderText="ItemCode" SortExpression="ItemCode">
                            <ItemTemplate>
                                <asp:Label ID="lblItemCode" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price" SortExpression="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblSymbol" runat="server" Text="Label">S$</asp:Label>
                                <asp:Label ID="lblPrice" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="AdjustmentQuantity" SortExpression="AdjustmentQuant">
                            <ItemTemplate>
                                <asp:Label ID="lblAdjustmentQuant" runat="server" Text='<%# Bind("AdjustmentQuant") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Stock" SortExpression="Stock">
                            <ItemTemplate>
                                <asp:Label ID="lblStock" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Reason" SortExpression="Reason">
                            <ItemTemplate>
                                <asp:Label ID="lblReason" runat="server" Text='<%# Bind("Reason") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="HeadRemarks" SortExpression="HeadRemarks">
                            <ItemTemplate>
                                <%--<asp:Label ID="lblHeadRemarks" runat="server" Text='<%# Bind("HeadRemarks") %>'></asp:Label>--%>
                                <asp:TextBox ID="tbxHeadRemarks" runat="server" CssClass="form-control" Text='<%# Bind("HeadRemarks") %>' ViewStateMode="Disabled"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Width="120px" HeaderText="Approve">
                            <ItemTemplate>
                                <asp:Button Text="Approve" CommandName="Approve" ToolTip="Approve" CssClass="btn btn-success" runat="server" />

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Width="120px" HeaderText="Reject">
                            <ItemTemplate>
                                <asp:Button Text="Reject" CommandName="Reject" ToolTip="Reject" CssClass="btn btn-danger" runat="server" />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green" ViewStateMode="Disabled"></asp:Label>
                <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red" ViewStateMode="Disabled"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
