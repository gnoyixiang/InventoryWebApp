<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="UpdateCollectionPoint.aspx.cs" Inherits="InventoryWebApp.Dept.ChangeCollectionPoint" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li class="active">Update Collection Point</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-12">
            <h3>Update Collection Point</h3>
        </div>
    </div>
        <div class="row form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-3" for="tbxStartDate">Department Name:</label>
                    <div class="col-md-4">
                        <asp:Label ID="lblInfoDeptName" runat="server" CssClass="form-control disabled"></asp:Label>
                    </div>
                </div>
            </div>
    
    <asp:UpdatePanel ID="UpdatePanelUpdateCollectionPt"
        runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="row form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-3" for="tbxStartDate">Current Collection Point:</label>
                    <div class="col-md-4">
                        <asp:TextBox ID="tbxCCP" runat="server" CssClass="form-control disabled" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>
            </div>
            <div class="row form-horizontal">
                <div class="form-group">
                    <label class="control-label col-md-3" for="tbxStartDate">New Collection Point:</label>
                    <div class="col-md-4">
                        <asp:DropDownList ID="ddlCP" runat="server"  CssClass="form-control"></asp:DropDownList>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3"></div>
                <div class="col-md-4"><asp:Button ID="btnUpdate" runat="server" Text="Update" class="btn btn-primary" 
                    width="100%" OnClick="btnUpdate_Click" /></div>
            </div>
            
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
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
                            <a href="/Dept/UpdateCollectionPoint.aspx" class="btn btn-default">OK</a>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
        </div>
</asp:Content>
