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
            <td><asp:TextBox ID="tbxCCP" runat="server" Width="129px"></asp:TextBox>
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
    <asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-primary" OnClick="btnUpdate_Click" />
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Message</h4>
                </div>
                <div class="modal-body">
                    Successfully changed Collection Point!
                </div>
                <div class="modal-footer">
                    <a href="/UpdateCollectionPoint.aspx" class="btn btn-default">OK</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
