<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewCatalogue.aspx.cs" Inherits="InventoryWebApp.Dept.ViewCatalogue" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

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
        <li><a href="Home">Home</a></li>
        <li class="active">Stationery Catalogue</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-10" style="float:left">
            <h3>Stationery Catalogue</h3>
        </div>
    </div>    
    <div class="row">
        <div class="col-xs-12 col-md-3">
            <asp:DropDownList ID="ddlSearchBy" runat="server"  CssClass="form-control">
                <asp:ListItem>-Choose Category-</asp:ListItem>
                <asp:ListItem>Description</asp:ListItem>
                <asp:ListItem>Stationery Number</asp:ListItem>
                <asp:ListItem>Category</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-xs-12 col-md-7">
            <asp:TextBox ID="txbkeyword" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="tbxSearchRequiredFieldValidator1" Display="Dynamic" runat="server" ErrorMessage="Empty search information" ForeColor="Red" ControlToValidate="txbkeyword"></asp:RequiredFieldValidator>

        </div>
        <div class="col-xs-12 col-md-2">
        <asp:Button ID="btnSearch" runat="server" Text="Search By" OnClick="btnSearch_Click" Class="btn btn-primary" Width="100%" />
            <asp:Label ID="lblSearch" runat="server" ForeColor="Red" ></asp:Label>
        </div>
    </div>
        <br>
    <asp:GridView ID="gvCatalogue" runat="server" AutoGenerateColumns="False" Width="100%" AllowPaging="True"
        OnPageIndexChanging="OnPageIndexChanging" OnRowDataBound="gvCatalogue_RowDataBound" CellPadding="4" GridLines="None" CellSpacing="-1"
        CssClass="table table-striped   " HeaderStyle-BackColor="#cfd8dc">
       
        <Columns>
            <asp:TemplateField HeaderText="Stationery Number" ItemStyle-Width="150px">
                <ItemTemplate>
                    <asp:HyperLink ID="ItemCode" runat="server" ForeColor="Blue"
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
        <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style"/>
       
    </asp:GridView>
        </div>
</asp:Content>
