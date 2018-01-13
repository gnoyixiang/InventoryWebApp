<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewPurchaseOrders.aspx.cs" Inherits="InventoryWebApp.ViewPurchaseOrders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-9 col-sm-8">
                <h3>Purchase Orders </h3>
            </div>
            <div class="col-md-3 col-sm-4">
                <a href="/CreateNewOrder" class="btn btn-success btn-lg" role="button" style="margin: 20px 0; width:100%;">Create New</a>
                <%--<asp:Button runat="server" ID="btnCreate" Text="Create New" CssClass="btn btn-info btn-lg" Style="margin: 20px 0; float: right;" />--%>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-md-2">
                <asp:DropDownList runat="server" ID="ddlSearch" CssClass="form-control" Style="margin: 10px 0;">
                    <asp:ListItem Value="">Select</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-md-8">
                <asp:TextBox runat="server" placeholder="Search" CssClass="form-control" Style="margin: 10px 0;"></asp:TextBox>
            </div>
            <div class="col-md-2">
                <asp:Button runat="server" ID="btnSearch" Text="Search" CssClass="btn btn-primary" Style="margin: 10px 0; float: right; width: 100%" />
            </div>
        </div>
    </div>
    <br />
    <asp:GridView runat="server" ID="dgvList" CssClass="table-striped">
    </asp:GridView>
    
    <div class="container-fluid">
        <ul class="pagination" >
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">5</a></li>
        </ul>
    </div>
</asp:Content>
