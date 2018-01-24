<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewPurchaseOrders.aspx.cs"
    Inherits="InventoryWebApp.ViewPurchaseOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9 col-sm-8">
                <h3>Purchase Orders </h3>
            </div>
            <div class="col-md-3 col-sm-4">
                <a href="/CreateNewOrder" class="btn btn-success btn-lg" role="button" style="margin: 20px 0; width: 100%;">Create New</a>
                <%--<asp:Button runat="server" ID="btnCreate" Text="Create New" CssClass="btn btn-info btn-lg" Style="margin: 20px 0; float: right;" />--%>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-2">
                <asp:DropDownList runat="server" ID="ddlSearch" CssClass="form-control" Style="margin: 10px 0;"
                    OnSelectedIndexChanged="ddlSearch_SelectedIndexChanged" AutoPostBack="true">
                </asp:DropDownList>
            </div>
            <div class="col-lg-8">
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
            <asp:ListView runat="server" ID="listPO">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
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
                        <td><a href="/Store/PurchaseOrderDetail?PO=<%#Eval("PurchaseOrderCode") %>" style="color: #337ab7"><%# Eval("PurchaseOrderCode") %></a></td>
                        <td><%# Eval("SupplierCode") %></td>
                        <td><%# Eval("DateCreated") %></td>
                        <td><%# Eval("Username") %></td>
                        <td><%# Eval("DateSupplyExpected") %></td>
                        <td><%# Eval("Status") %></td>
                    </tr>
                </ItemTemplate>
            </asp:ListView>
            <ul class="pagination">
                <asp:DataPager runat="server" ID="lisPOPager" OnPreRender="lisPOPager_PreRender"
                    PagedControlID="listPO" PageSize="10">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Link"
                            ShowFirstPageButton="false"
                            ShowNextPageButton="false"
                            ShowPreviousPageButton="true" />
                        <asp:NumericPagerField ButtonCount="10" />
                        <asp:NextPreviousPagerField ButtonType="Link"
                            ShowLastPageButton="false"
                            ShowNextPageButton="true"
                            ShowPreviousPageButton="false" />
                    </Fields>
                </asp:DataPager>
            </ul>
        </div>
    </div>

</asp:Content>
