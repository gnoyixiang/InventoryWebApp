<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="DisbursementGenerationPage.aspx.cs" 
    Inherits="InventoryWebApp.Store.DisbursementGenerationPage" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title></title>

    <style type="text/css">
        .Background {
            background-color: Black;
            filter: alpha(opacity=90);
            opacity: 0.8;
        }

        .Popup {
            background-color: #FFFFFF;
            border-width: 3px;
            border-style: solid;
            border-color: black;
            padding-top: 10px;
            padding-left: 10px;
            width: 400px;
            height: 270px;
        }

        .lbl {
            font-size: 16px;
            font-style: italic;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <!-- ModalPopupExtender -->
    <cc1:ModalPopupExtender ID="mp1" runat="server" PopupControlID="pnlPopUp" TargetControlID="btnPopUp"
        BackgroundCssClass="Background">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlPopUp" runat="server" CssClass="Popup" align="center" Style="display: none">
        <h5>Change collection date to</h5>
        <table>
            <tr>
                <br />
                <br />
            </tr>
            <tr>
                <asp:TextBox ID="tbxDate" runat="server" TextMode="Date" ClientIdMode = "static" />
                <%--<asp:RangeValidator ID="RV1" runat="server" ControlToValidate="tbxDate" Type="Date" ErrorMessage="Disbursement"></asp:RangeValidator>--%>
            </tr>
            <tr>
                <br />
                <br />
                <br />
                <br />
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnChangeDate" runat="server" Text="Change date" CssClass="btn btn-primary"/></td>
                <td>&nbsp &nbsp &nbsp</td>
                <td>
                    <asp:Button ID="btnResetDate" runat="server" Text="Cancel" CssClass="btn btn-danger" OnClick="btnResetDate_Click" /></td>
            </tr>
        </table>
        <br />
    </asp:Panel>

    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Generate Disbursement</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-12">
            <h3>Disbursement Overview</h3>
        </div>
    </div>

    
    <asp:Button ID="btnBack" runat="server" Text="<Back to Allocation" Style="float: left" CssClass="btn btn-success" OnClick="btnBack_Click" />
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Disbursement Form>" Enabled="false" Style="float: right" CssClass="btn btn-success" OnClick="btnNext_Click"/>
    <br />
    <br />
    <br />
    <div class="alert alert-success" role="alert" style ="text-align: center; vertical-align: middle; line-height: 20px; padding-left:20px ">
        <table border="0" >
            <tr>
                <td style="padding:0px 20px 0px 20px">
                    <asp:Label ID="lblFixedDisbursementDate" runat="server" Text="Disbursement Date"></asp:Label> </td>
            </tr>
            <tr >
                <td style="font-weight:bold; padding:0px 20px 0px 20px">
                    <asp:Label ID="lblCollectionDate" runat="server" />
                    </td>
                <td rowspan="3" style="padding:0px 40px 0px 40px">
                    <asp:Button ID="btnConfirm" runat="server" Text="Confirm Collection Date" CssClass="btn btn-danger" OnClick="btnModal_Click" />
                    <br />
                    <asp:Label ID="lblConfirmDate" runat="server" ForeColor="#990000">Please click Confirm for sending the disbursement to respective Department Representatives</asp:Label >
                    </td>

            </tr>
            <tr>
                <td style="padding:10px 20px 0px 20px">
                    <asp:Button ID="btnPopUp" runat="server" Text="Change Collection Date" CssClass="btn btn-primary" OnClick="btnPopUp_Click" />
                </td>
                <td></td>
            </tr>
        </table>
    </div>
    <table>
        <tr>
            <td class="col-lg-4" style="padding-left: 0px">
                <asp:Label ID="lblFixedCollectionPoint" runat="server" Text="Collection point"></asp:Label></td>
            <td>
                <asp:DropDownList ID="ddlCollectionPoint" runat="server" class="dropdown" AutoPostBack="True" OnSelectedIndexChanged="ddlCollectionPoint_SelectedIndexChanged"></asp:DropDownList>

            </td>
            <%--<td>&nbsp &nbsp &nbsp &nbsp &nbsp</td>
            <td><asp:DropDownList ID="ddlSClerk" runat="server" class="dropdown" AutoPostBack="True"></asp:DropDownList></td>--%>
        </tr>



    </table>
    <br />
    <asp:ListView ID="lvCollectionPointList" runat="server">
        <LayoutTemplate>
            <table class="table">
                <thead>
                    <th>Collection Point</th>
                    <th style="text-align: right; padding-right: 30px">Time</th>
                    <th style="text-align: left; padding-left: 30px">Department</th>
                    <th>Clerk In Charge</th>
                </thead>
                <tbody id="itemPlaceholder" runat="server"></tbody>
            </table>
        </LayoutTemplate>
        <ItemTemplate>
            <tbody>
                <tr>
                    <td><%# GetCollectionVenue(Eval("CollectionPointCode").ToString())%></td>
                    <td style="text-align: right; padding-right: 30px"><%# GetCollectionTime(Eval("CollectionPointCode").ToString())%></td>
                    <td style="text-align: left; padding-left: 30px"><%# GetDepartmentName(Eval("DepartmentCode").ToString()) %></td>
                    <td><%# GetCollectionSClerkInCharge(Eval("CollectionPointCode").ToString()) %></td>
                </tr>
            </tbody>
        </ItemTemplate>

    </asp:ListView>

        </div>

      <!-- Email Modal -->
    <div class="modal fade" id="emailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLongTitle">Please verify your password</h3>
                </div>
                <div class="modal-body">
                    <div class="input-group " style="margin-bottom: 10px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-log-in"></i></span>
                        <input type="text" class="form-control disabled" id="txtUsername" aria-describedby="lblUsername" value="<%= Context.User.Identity.Name %>" readonly>
                    </div>
                    <div class="input-group " style="margin-bottom: 10px">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                        <asp:TextBox type="password" CssClass="form-control" ID="txtPassword" aria-describedby="lblPassword" runat="server"></asp:TextBox>
                    </div>
                    <div style="margin-bottom: 10px">
                        <asp:Label ID="lblVerifyError" runat="server" Text="" ForeColor="Red" Visible="false"></asp:Label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" style="margin-bottom: 10px">Close</button>
                    <asp:Button runat="server" ID="btnSubmit" Text="Submit" CssClass="btn btn-success" CausesValidation="true" type="button"
                        OnClick="btnSubmit_Click" Style="margin-bottom: 10px; margin-left: 0" />
                </div>
            </div>
        </div>
    </div>


</asp:Content>
