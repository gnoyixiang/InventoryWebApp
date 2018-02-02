<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs"
    Inherits="InventoryWebApp.Dept.CreateRequest" %>

<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pager-style {
        }

            .pager-style span, .pager-style a {
                padding: 0 5px;
                font-size: 16px;
            }

            .pager-style span {
                font-weight: 600;
                text-decoration: underline;
            }

            .pager-style a {
            }

        .icon {
            font-size: 1.2em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Manage Requests</li>
        <li class="active">New Request</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>New Request</h3>
            </div>
        </div>
        <table>
            <tr>
                <td style="padding-right: 5px">
                    <asp:Label ID="lblDept" runat="server" Text="Department Name:"></asp:Label>
                    <br />
                    <br />
                </td>
                <td>
                    <asp:Label ID="lblDeptName" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td style="padding-right: 5px">
                    <asp:Label ID="lblEmp" runat="server" Text="Employee Name:"></asp:Label>
                    <br />
                    <br />
                </td>
                <td>
                    <asp:Label ID="lblEmpName" runat="server"></asp:Label>
                    <br />
                    <br />
                </td>
            </tr>
        </table>
        <%--  <asp:UpdatePanel ID="UpdatePanelAddRequest"
        runat="server" UpdateMode="Always">--%>
        <%--<contenttemplate>--%>
            <asp:GridView ID="gvNewRequest" runat="server" AutoGenerateColumns="False"
                CellPadding="4"
                CellSpacing="-1"
                GridLines="None" Width="100%"
                OnRowEditing="gvNewRequest_RowEditing"
                OnRowDeleting="gvNewRequest_RowDeleting"
                OnRowCancelingEdit="gvNewRequest_RowCancelingEdit"
                OnRowUpdating="gvNewRequest_RowUpdating"
                OnPageIndexChanging="gvNewRequest_PageIndexChanging" AllowPaging="True" CssClass="table " OnRowDataBound="gvNewRequest_RowDataBound">

                <Columns>
                    <asp:BoundField DataField="ItemCode" HeaderText="Item Number" ReadOnly="true" />
                    <asp:BoundField DataField="Category" HeaderText="Category" ReadOnly="true" />
                    <asp:BoundField DataField="Description" HeaderText="Description" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                        <EditItemTemplate>
                            <asp:TextBox ID="tbxQuantity" runat="server" type="number">
                            </asp:TextBox>
                            <asp:CompareValidator ID="quantityCompareValidator2" runat="server" Type="Integer" Operator="GreaterThan" Display="Dynamic"
                                ErrorMessage="Enter a value greater than Zero" ValueToCompare="0" ControlToValidate="tbxQuantity"
                                ForeColor="Red"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="quantityRequiredValidator" runat="server"
                                ErrorMessage="Empty Quantity" ForeColor="Red" ControlToValidate="tbxQuantity"></asp:RequiredFieldValidator>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkEdit" CommandName="Edit" runat="server" Style="color: orange;" CssClass="icon">
                                    <i class="fa fa-pencil" aria-hidden="true"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="linkUpdate" CommandName="Update" runat="server" Style="color: green;" CssClass="icon">
                                    <i class="fa fa-floppy-o" aria-hidden="true"></i>
                            </asp:LinkButton>
                            <asp:LinkButton ID="linkCancel" CommandName="Cancel" runat="server" Style="color: red;" CssClass="icon">
                                    <i class="fa fa-times-circle-o" aria-hidden="true"></i>
                            </asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:LinkButton ID="linkDelete" CommandName="Delete" runat="server" Style="color: red;" CssClass="icon">
                                    <i class="fa fa-trash-o" aria-hidden="true"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />
            </asp:GridView>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" Class="btn btn-primary" />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            <%--<asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Class="btn btn-success" />--%>
            <asp:Button runat="server" ID="btnModal" Text="Submit" CssClass="btn btn-success" OnClick="btnModal_Click" />
            <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" Class="btn btn-warning" />



            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Message</h4>
                        </div>
                        <div class="modal-body">
                            Your request -
                            <label id="lblRequestCode"></label>
                            has been placed!
                     Proceed to View Request?
                        </div>
                        <div class="modal-footer">
                            <a href="DeptRequisitionList.aspx" class="btn btn-default" data-dismiss="modal" aria-label="Close">OK</a>
                            <a href="CreateRequest.aspx" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Back to Create Request </a>
                        </div>
                    </div>
                </div>
            </div>
        <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
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
