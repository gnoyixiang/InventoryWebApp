<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="403.aspx.cs" Inherits="InventoryWebApp.ErrorPages._403" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
        .errorform {
            padding-top: 200px;
            padding-left: 50px;
        }
        .errorform p{
            color:white
        }
        .errorform a{
            color:gainsboro;
            text-decoration:underline;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="errorform">
    <h2>Forbidden!</h2>
    <p>
        You have attempted to access a forbidden page.
    </p>
    <p>
        If you have any questions, please contact the site administrator.
    </p>
    <a href="../Default.aspx">Return to Home</a></div>
</asp:Content>
