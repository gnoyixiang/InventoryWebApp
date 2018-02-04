<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewPurchaseOrders.aspx.cs"
    Inherits="InventoryWebApp.Store.ViewPurchaseOrders" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .inpager{
                color: black;
                background-color: #337ab7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li class="active">Purchase Orders</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        
        <div class="row">
            <div class="col-md-9 col-sm-8">
                <h3>Purchase Orders</h3>
            </div>
            <div class="col-md-3 col-sm-4">
                <% if (Context.User.IsInRole("Store Clerk"))
                    { %>
                <a href="CreateNewOrder" class="btn btn-success" role="button" style="margin-top: 5px; width: 100%;">Create New</a>
                <% } %>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-3">
                <asp:DropDownList runat="server" ID="ddlSearch" CssClass="form-control" Style="margin: 10px 0;"
                    OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div class="col-lg-7">
                <asp:TextBox runat="server" placeholder="Search" CssClass="form-control" ID="txtSearch"
                    Style="margin: 10px 0;" Visible="true">
                </asp:TextBox>
                <asp:Panel ID="panelDate" runat="server" Visible="false">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="input-group" style="margin: 10px 0;">
                                <div class="input-group-addon">From</div>
                                <asp:TextBox runat="server" ID="txtStartDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="input-group" style="margin: 10px 0;">
                                <div class="input-group-addon">To</div>
                                <asp:TextBox runat="server" ID="txtEndDate" TextMode="Date" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </asp:Panel>
            </div>
            <div class="col-lg-2">
                <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-primary"
                    OnClick="btnSearch_Click" Style="margin: 10px 0; float: right; width: 100%" />
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <asp:Panel runat="server" ID="panelNoList" Visible="false">
                    <h4>No purchase order to list!</h4>
                </asp:Panel>
                <asp:Panel runat="server" ID="panelList">
                    <asp:ListView runat="server" ID="listPO">
                        <LayoutTemplate>
                            <table class="table table-striped">
                                <tr style="background-color:#cfd8dc">
                                    <th>S/N</th>
                                    <th>PO#</th>
                                    <th>Supplier Name</th>
                                    <th>Order Date</th>
                                    <th>Created By</th>
                                    <th>Estimated Supply Date</th>
                                    <th>Status</th>
                                </tr>
                                <tr id="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%# Container.DataItemIndex + 1 %></td>
                                <td><a href="PurchaseOrderDetail?PO=<%#Eval("PurchaseOrderCode") %>" style="color: #337ab7"><%# Eval("PurchaseOrderCode") %></a></td>
                                <td><%# Eval("SupplierCode") %></td>
                                <td><%# Convert.ToDateTime(Eval("DateCreated")).ToString("d MMM yyyy") %></td>
                                <td><%# Master.GetEmployeeName((string)Eval("Username")) %></td>
                                <td><%# Eval("DateSupplyExpected") %></td>
                                <td><%# Eval("Status") %></td>
                            </tr>
                        </ItemTemplate>
                    </asp:ListView>
                    <asp:DataPager ID="listPOPager" runat="server" class="btn-group" PagedControlID="listPO" PageSize="10">
                        <Fields>
                            <asp:NextPreviousPagerField PreviousPageText="<" FirstPageText="|<" ShowPreviousPageButton="true"
                                ShowFirstPageButton="true" ShowNextPageButton="false" ShowLastPageButton="false"
                                ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                            <asp:NumericPagerField ButtonType="Link" CurrentPageLabelCssClass="btn btn-primary disabled inpager" RenderNonBreakingSpacesBetweenControls="false"
                                NumericButtonCssClass="btn btn-default" ButtonCount="10" NextPageText="..." NextPreviousButtonCssClass="btn btn-default" />
                            <asp:NextPreviousPagerField NextPageText=">" LastPageText=">|" ShowNextPageButton="true"
                                ShowLastPageButton="true" ShowPreviousPageButton="false" ShowFirstPageButton="false"
                                ButtonCssClass="btn btn-default" RenderNonBreakingSpacesBetweenControls="false" RenderDisabledButtonsAsLabels="false" />
                        </Fields>
                    </asp:DataPager>
                </asp:Panel>
            </div>
        </div>
    </div>
</asp:Content>
