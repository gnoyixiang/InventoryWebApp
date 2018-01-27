<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Oops.aspx.cs" Inherits="InventoryWebApp.ErrorPages.Oops" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>An Error Has Occurred!</h2>
    <p>
        An unexpected error has occurred on our website.
    </p>
    <p>
        If you have any questions, please contact the site administrator.
    </p>
    <a href="Default.aspx">Return to Home</a>
</asp:Content>
