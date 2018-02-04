<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="InventoryWebApp.ErrorPages._404" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style>
       .errorform {
            padding-top: 30vh;
            padding-right:20px;
        }
        .errorform div{
            padding-left:20px;
            border-left:solid 2px #ffffff36;
            height:40vh;
            padding-top:40px;
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
        <div>
    <h2>Page Not Found!</h2>
    <p>
        The page you have requested could not be found.
    </p>
    <a href="../Default.aspx">Return to Home</a>
        </div></div>
</asp:Content>
