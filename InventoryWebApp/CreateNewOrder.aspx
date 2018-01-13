<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateNewOrder.aspx.cs" Inherits="InventoryWebApp.CreateNewOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12">
                <h3>New Purchase Order</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-12">
                <asp:GridView runat="server" AutoGenerateColumns="False" ID="dgvItems">
                    <Columns>

                        <asp:BoundField DataField="description" HeaderText="LastName"
                            SortExpression="LastName" />

                        <asp:BoundField DataField="FirstName" HeaderText="FirstName"
                            SortExpression="FirstName" />

                        <asp:BoundField DataField="Title" HeaderText="Title"
                            SortExpression="Title" />

                        <asp:BoundField DataField="HireDate" HeaderText="HireDate"
                            SortExpression="HireDate" />

                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="row">
            <div class="col-md-2">
                <asp:Button runat="server" Text="Add Item" CssClass="btn btn-primary" Style="width: 100%" />
            </div>
            <div class="col-md-6">
            </div>
            <div class="col-md-2">
                <asp:Button runat="server" Text="Submit" CssClass="btn btn-success" Style="width: 100%" />
            </div>
            <div class="col-md-2">
                <asp:Button runat="server" Text="Cancel" CssClass="btn btn-cancel" Style="width: 100%" />
            </div>
        </div>
    </div>
</asp:Content>
