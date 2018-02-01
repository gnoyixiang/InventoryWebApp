<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StockCardSearch.aspx.cs" Inherits="InventoryWebApp.Store.StockCardSearch" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pager-style {
        }

            .pager-style span, .pager-style a {
                padding: 0 5px;
                font-size: 16px;
            }

            .pager-style span {
                font-weight: 600;
                text-decoration: underline;
            }

            .pager-style a {
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Search Stock Card</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>Stock Card</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-1" style="padding-top: 6px">
                Search:
            </div>
            <div class="col-md-3">
                <asp:DropDownList ID="ddlStockCardSearch" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>
            <div class="col-md-5">
                <asp:TextBox ID="txtSearch" runat="server" AutoPostBack="True" OnTextChanged="txtChangedEvent" OnDataBinding="txtChangedEvent" CssClass="form-control"></asp:TextBox>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="padding-top: 6px">
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <asp:Button ID="btnCategory" runat="server" Text='<%# Eval("CategoryCode") %>' CommandName="Category" CssClass="btn btn-default" Style="margin-bottom: 10px" />
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12" style="padding-top: 6px">
                <asp:GridView ID="gvItem" runat="server" AutoGenerateColumns="False" CellSpacing="-1" CssClass="table table-striped" HeaderStyle-BackColor="#cfd8dc"
                    DataKeyNames="ItemCode" OnSelectedIndexChanged="GvItem_SelectedIndexChanged" GridLines="None" AllowPaging="True"
                    OnPageIndexChanging="GVItem_PageIndexChanging">
                    <Columns>
                        <asp:BoundField DataField="ItemCode" HeaderText="ItemCode" SortExpression="ItemCode" />
                        <asp:BoundField DataField="Description" HeaderText="Item Description" SortExpression="Description" />
                        <asp:BoundField DataField="MeasureUnit" HeaderText="Unit of Measure" SortExpression="MeasureUnit" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                        <asp:BoundField DataField="Stock" HeaderText="Stock" SortExpression="Stock" />

                        <asp:CommandField SelectText="View Stock Card" ShowSelectButton="True"></asp:CommandField>
                    </Columns>
                    <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" Position="Bottom" PreviousPageText="Previous" NextPageText="Next" />
                    <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
