<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="403.aspx.cs" Inherits="InventoryWebApp.ErrorPages._403" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Forbidden!</h2>
    <p>
        You have attempted to access a forbidden page.
    </p>
    <p>
        If you have any questions, please contact the site administrator.
    </p>
    <a href="../Default.aspx">Return to Home</a>
</asp:Content>
