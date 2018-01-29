<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="401.aspx.cs" Inherits="InventoryWebApp._401" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Unauthorised Access!</h2>
    <p>
        You have attempted to access a page that you are not authorized to view.
    </p>
    <p>
        If you have any questions, please contact the site administrator.
    </p>
    <a href="../Default.aspx">Return to Home</a>
</asp:Content>
