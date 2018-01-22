<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UpdateCollectionPoint.aspx.cs" Inherits="InventoryWebApp.ChangeCollectionPoint" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Update Collection Point</li>
    </ul>
    <h3>Update Collection Point</h3>
    <br />
    <br />
    <div class="row">
        <div class="col-xs-12 col-md-6">
            <asp:Label ID="lblCCP" runat="server" Text="Current Collection Point: "></asp:Label>
            <asp:TextBox ID="tbxCCP" runat="server" Width="129px" margin="5px"></asp:TextBox>
        </div>
    </div>
    <br />
    <br />
    <div class="row">
        <div class="col-xs-12 col-md-9">
            <asp:Label ID="lblNewCCP" runat="server" Text="New Collection Point: "></asp:Label>
            <asp:DropDownList ID="ddlCP" runat="server" Width="300px">
            </asp:DropDownList>
        </div>
    </div>
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
