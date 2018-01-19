<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewCatalogue.aspx.cs" Inherits="InventoryWebApp.ViewCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pager-style{

        }
        .pager-style span, .pager-style a{
            padding: 0 5px;
            font-size: 16px;
        }
        .pager-style span{
            font-weight: 600;
            text-decoration:underline;
        }
        .pager-style a{

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">View Catalogue</li>
    </ul>
    <div class="row">
        <div class="col-xs-12 col-md-2">

            <asp:DropDownList ID="ddlSearchBy" runat="server" Height="31px" Width="172px">
                <asp:ListItem>Description</asp:ListItem>
                <asp:ListItem>Stationery Number</asp:ListItem>
                <asp:ListItem>Category</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-xs-12 col-md-7">
            <asp:TextBox ID="txbkeyword" runat="server" Height="31px" Width="619px"></asp:TextBox>
            <asp:RequiredFieldValidator ID="tbxSearchRequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="Empty search information" ForeColor="Red" ControlToValidate="txbkeyword"></asp:RequiredFieldValidator>

        </div>
        <div class="col-xs-12 col-md-3">
        <asp:Button ID="btnSearch" runat="server" Text="Search By" OnClick="btnSearch_Click" Class="btn btn-primary" Height="31px" Width="103px" />
        </div>
    </div>
    <br />
    <br />
    <br />
    <asp:GridView ID="gvCatalogue" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True"
        OnPageIndexChanging="OnPageIndexChanging" CellPadding="4" ForeColor="#333333" GridLines="None"
        CssClass="table table-striped table-bordered table-hover">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Stationery Number" ItemStyle-Width="150px">
                <ItemTemplate>
                    <asp:HyperLink ID="ItemCode" runat="server" ForeColor="Blue" DataNavigateUrlFields="ItemCode"
                        NavigateUrl='<%#"~/ItemDetails.aspx?ItemCode="+ Eval("ItemCode")%>'
                        Text='<%# Eval("ItemCode") %>'>
                    </asp:HyperLink>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CategoryCode" HeaderText="Category">
                <ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="Description" HeaderText="Description">
                <ItemStyle Width="150px"></ItemStyle>
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style"/>
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
</asp:Content>
