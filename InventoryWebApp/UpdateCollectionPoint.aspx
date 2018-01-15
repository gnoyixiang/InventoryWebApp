<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UpdateCollectionPoint.aspx.cs" Inherits="InventoryWebApp.ChangeCollectionPoint" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Update Collection Point</li>
         </ul>
    <h3>Update Collection Point</h3>
    <table>
        <tr>
            <td><asp:Label ID="lblCCP" runat="server" Text="Current Collection Point: "></asp:Label>
                <br />
            </td>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;</td>
            <td><asp:TextBox ID="tbxCCP" runat="server" ReadOnly="true" Width="129px"></asp:TextBox>
                <br />
            </td>
        </tr>
        <tr>
            <td><asp:Label ID="lblNewCCP" runat="server" Text="New Collection Point: "></asp:Label>
                <br />
            </td>
            <td></td>
            <td><asp:DropDownList ID="ddlCP" runat="server">
                </asp:DropDownList>
                <br />
            </td>
        </tr>
    </table>
     <br />
     <br />
    <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-primary" />
    
</asp:Content>
