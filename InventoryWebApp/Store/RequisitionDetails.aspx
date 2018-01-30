<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionDetails.aspx.cs" Inherits="InventoryWebApp.Store.RequisitionDetails" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <nav aria-label="breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="RequisitionList">View Requisition</a></li>
            <li class="breadcrumb-item active" aria-current="page">Requisition Details</li>
        </ol>
    </nav>
    <h3>Requisition Details</h3>
    <asp:Panel ID="Panel2" runat="server" Visible="false">No Request Details found!</asp:Panel>
    <asp:Panel ID="Panel1" runat="server">
        <div class="row">
            <div class="col-md-4">
                <label>Request Code: </label>
                <asp:Label ID="lblRequestCode" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col-md-5">
                <label>Employee Name: </label>
                <asp:Label ID="lblEmployeeName" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-4">
                <label>Department Name: </label>
                <asp:Label ID="lblDepartmentName" runat="server" Text="Label"></asp:Label>
            </div>
            <div class="col-md-5">
                <label>Requisition Status: </label>
                <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
            </div>
        </div>
        <br />
        <asp:ListView ID="ListView1" runat="server">
            <LayoutTemplate>
                <table class="table">
                    <tr>
                        <th>Request Code</th>
                        <th>Item Code</th>
                        <th>Status</th>
                        <th>Remaining Quantity</th>
                        <th>Quantity</th>
                        <th>Notes</th>

                    </tr>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("RequestCode") %></a></td>
                    <td><%# Eval("ItemCode") %></td>
                    <td><%# Eval("Status") %></td>
                    <td><%# Eval("RemainingQuant") %></td>
                    <td><%# Eval("Quantity") %></td>
                    <td><%# Eval("Notes") %></td>
                    
                </tr>
            </ItemTemplate>
           
        </asp:ListView>
       
        <h3>Disbursements</h3>
        <asp:ListView ID="ListView2" runat="server">
            <LayoutTemplate>
                <table class="table">
                    <tr>
                        <th>Disbursement Code</th>
                        <th>Status</th>
                        <th>Date Disbursed</th>
                        <th>Received By</th>
                    </tr>
                    <tr id="itemPlaceholder" runat="server">
                    </tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("DisbursementCode") %></a></td>
                    <td><%# Eval("Status") %></td>
                    <td><%# Eval("DateDisbursed","{0:MMM dd, yyyy}") %></td>
                    <td><%# Eval("ReceivedBy") %></td>
                </tr>
            </ItemTemplate>

        </asp:ListView>
    </asp:Panel>

    <!-- Modal -->
    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLongTitle">Delete Confirmation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you Sure You Want To Remove Entry
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">Confirm</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Confirm</button>
                </div>
            </div>
        </div>
        <asp:Button ID="PrintButton" runat="server" Text="Print" OnClientClick='printDiv("printableArea")' />


        <script type="text/javascript">
            function printDiv(divName) {
                var printContents = document.getElementById(divName).innerHTML;
                var originalContents = document.body.innerHTML;

                document.body.innerHTML = printContents;

                window.print();

                document.body.innerHTML = originalContents;
            }

        </script>
</asp:Content>
