<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="401.aspx.cs" Inherits="InventoryWebApp._401" %>
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
    <h2>Unauthorised Access!</h2>
    <p >
        You have attempted to access a page that you are not authorized to view.
    </p>
    <p>
        If you have any questions, please contact the site administrator.
    </p>
    <a href="../Default.aspx">Return to Home</a>
        </div>
</asp:Content>
