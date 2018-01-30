﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" 
    Inherits="InventoryWebApp.Dept.CreateRequest" %>

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
        <li><a href="#">Manage Requests</a></li>
        <li class="active">Create Request</li>
    </ul>
    <h3>New Requisition Details</h3>
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
    <asp:UpdatePanel ID="UpdatePanelAddRequest"
        runat="server" UpdateMode="Always">
        <ContentTemplate>
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
                        <asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" Class="btn btn-default" />
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" Class="btn btn-primary" />
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>