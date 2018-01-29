<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="CreateRequest.aspx.cs" Inherits="InventoryWebApp.CreateRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pager-style{

        }
        .pager-style span, .pager-style a{
            padding: 0 5px;
            font-size: 16px;
        }
        .pager-style span{
            font-weight: 600;
            text-decoration:underline;
        }
        .pager-style a{

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
            <td style="padding-right:5px">
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
            <td style="padding-right:5px">
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
    <asp:GridView ID="gvNewRequest" runat="server" AutoGenerateColumns="False"
        CellPadding="4" ForeColor="#333333"
        GridLines="None" Width="100%"
        OnRowEditing="gvNewRequest_RowEditing"
        OnRowDeleting="gvNewRequest_RowDeleting"
        OnRowCancelingEdit="gvNewRequest_RowCancelingEdit"
        OnRowUpdating="gvNewRequest_RowUpdating"
        OnPageIndexChanging="gvNewRequest_PageIndexChanging" AllowPaging="True" CssClass="table table-striped table-bordered table-hover" OnRowDataBound="gvNewRequest_RowDataBound">
        <AlternatingRowStyle BackColor="White" />
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
                    <asp:ImageButton ImageUrl="~/Images/edit.png" CommandName="Edit" Width="20px" Height="20px" runat="server" />
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:ImageButton ImageUrl="~/Images/save.png" CommandName="Update" Width="20px" Height="20px" runat="server" />
                    <asp:ImageButton ImageUrl="~/Images/cancel.png" CommandName="Cancel" Width="20px" Height="20px" runat="server" />
                </EditItemTemplate>
            </asp:TemplateField>
           <asp:TemplateField HeaderText="Delete">
               <ItemTemplate>
                   <asp:ImageButton ImageUrl="~/Images/delete.png" CommandName="Delete" Width="20px" Height="20px" runat="server" HeaderText="Delete" />
               </ItemTemplate>
           </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />
        <RowStyle  BackColor="#EFF3FB"  />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
                    Your request - <label id="lblRequestCode"></label> has been placed!
                     Proceed to View Request?
                </div>
                <div class="modal-footer">
                    <a href="~/RequisitionList.aspx" class="btn btn-default" data-dismiss="modal" aria-label="Close">OK</a>
                    <a href="~/CreateRequest.aspx" class="btn btn-primary" data-dismiss="modal" aria-label="Close">Back to Create Request </a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
