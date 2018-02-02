<%@ Page Title="" Language="C#" MasterPageFile="~/Public.Master" AutoEventWireup="true" CodeBehind="Oops.aspx.cs" Inherits="InventoryWebApp.ErrorPages.Oops" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .errorform {
            padding-top: 200px;
            padding-left: 50px;
        }

            .errorform p {
                color: white;
            }

            .errorform a {
                color: gainsboro;
                text-decoration: underline;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="errorform">
        <h2>An Error Has Occurred!</h2>
        <p>
            An unexpected error has occurred on our website.
        </p>
        <p>
            If you have any questions, please contact the site administrator.
        </p>
        <a href="../Default.aspx">Return to Home</a>
    </div>

</asp:Content>
