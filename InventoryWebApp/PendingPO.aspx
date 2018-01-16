<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PendingPO.aspx.cs" Inherits="InventoryWebApp.PendingPO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="gvPendingPO" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                <asp:BoundField DataField="FoodID" HeaderText="FoodID" SortExpression="FoodID" />
                <asp:BoundField DataField="FoodName" HeaderText="FoodName" SortExpression="FoodName" />
                <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                <asp:BoundField DataField="Chilli" HeaderText="Chilli" SortExpression="Chilli" />
                <asp:BoundField DataField="MoreSalt" HeaderText="MoreSalt" SortExpression="MoreSalt" />
                <asp:BoundField DataField="Pepper" HeaderText="Pepper" SortExpression="Pepper" />
            </Columns>
        </asp:GridView>
</asp:Content>



