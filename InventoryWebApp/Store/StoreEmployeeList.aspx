<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StoreEmployeeList.aspx.cs" Inherits="InventoryWebApp.Store.StoreEmployeeList" %>

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
        <li class="active">Store Employee List</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>Store Employee List</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <asp:TextBox ID="tbxSearch" runat="server" CssClass="form-control" placeholder="Search Employee Name or Code"> </asp:TextBox>                
            </div>
            <div class="col-md-2">
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="SearchButton_Click" CssClass="btn btn-primary" Width="100%" />
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnStoreEmployeeList" runat="server" Text="View All Employees" OnClick="btnStoreEmployeeList_Click" CssClass="btn btn-basic" Width="100%" />
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblNoresultFound" runat="server" ForeColor="Red" ViewStateMode="Disabled"></asp:Label>
            </div>
        </div>

        <asp:GridView ID="gvEmployeeList" runat="server" CellPadding="4" GridLines="None" AutoGenerateColumns="false" Width="100%"
            OnRowDataBound="gvEmployeeList_RowDataBound" OnPageIndexChanging="gvEmployeeList_PageIndexChanging" DataKeyNames="EmployeeCode"
            CssClass="table table-striped" HeaderStyle-BackColor="#cfd8dc" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10">

            <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />
            <Columns>
                <asp:TemplateField HeaderText="Employee Code" SortExpression="Employee Code">
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EmployeeName" SortExpression="Employee Name">
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'>></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Employee Role" SortExpression="Employee Role">
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeRole" ItemStyle-HorizontalAlign="center" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Temporary Role" SortExpression="Temporary Role">

                    <ItemTemplate>
                        <asp:Label ID="lblTemporaryRole" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ReportTo" SortExpression="Report To">

                    <ItemTemplate>
                        <asp:Label ID="lblReportTo" runat="server" Text='<%# Bind("ReportTo") %>'></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

        <br />
        <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green"></asp:Label>
        <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
