<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ViewDisbursementDetails.aspx.cs" Inherits="InventoryWebApp.Dept.ViewDisbursementDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
      <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/Dept/ViewDisbursement">View Disbursement</a></li>
                <li class="breadcrumb-item active" aria-current="page">Disbursement Details</li>
            </ol>
        </nav>
    <div id="printableArea">
            <h1>Disbursement Details</h1>
            <asp:Panel ID="Panel2" runat="server" Visible="false">No Disbursement Details found!</asp:Panel>
            <asp:Panel ID="Panel1" runat="server">
                <div class="row">
                    <div class="col-md-4">
                        <label>Disbursement Code: </label>
                        <asp:Label ID="lblDisbursementCode" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="col-md-5">
                        <label>Request Code: </label>
                        <asp:Label ID="lblRequestCode" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-4">
                        <label>Disbursment Status: </label>
                        <asp:Label ID="lblStatus" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <br />
                <asp:ListView ID="lvDisbursementDetails" runat="server">
                    <LayoutTemplate>
                        <table class="table">
                            <tr>
                                <th>Request Code</th>
                                <th>Item Code</th>
                                <th>Quantity</th>
                                <th>Notes</th>

                            </tr>
                            <tr id="itemPlaceholder" runat="server">
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>                           
                            <td><%# Eval("RequestCode") %></td>
                            <td><%# Eval("ItemCode") %></td>
                            <td><%# Eval("Quantity") %></td>
                            <td><%# Eval("Notes") %></td>          
                        </tr>
                    </ItemTemplate>
                    
                    <%--<EditItemTemplate>--%>
                       <%-- <tr>--%>
                            <%--<asp:HiddenField ID="hfMinReorderQty" runat="server" />--%>
                           <%-- <td>
                                <asp:Label ID="lblEditRequisitionCode" runat="server"><%# Eval("RequestCode") %></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEditItemCode" runat="server"><%# Eval("ItemCode") %></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEditStatus" runat="server"><%# Eval("Status") %></asp:Label></td>
                            <td>
                                <asp:Label ID="lblEditRemainingQuantity" runat="server"><%# Eval("RemainingQuant") %></asp:Label></td>
                            <td align="left">
                                <asp:TextBox ID="txtOrderQuantity" runat="server" CssClass="control"
                                    TextMode="Number" Width="80px" Text='<%# Bind("Quantity") %>' /></td>                            
                            <td>
                                <asp:Label ID="lblEditNotes" runat="server"><%# Eval("Notes") %></asp:Label></td>

                            <td align="center">
                                <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update">
                                            <i class="fa fa-check-square" style="font-size:1.5em;color:forestgreen" aria-hidden="true"></i>
                                </asp:LinkButton>
                                <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel">
                                            <i class="fa fa-minus-square " style="font-size:1.5em;color:red" aria-hidden="true"></i>
                                </asp:LinkButton>
                            </td>
                            <td><asp:CompareValidator ID="quantityCompareValidator2" runat="server" Type="Integer" Operator="GreaterThan" Display="Dynamic"
                                ErrorMessage="Enter a value greater than Zero" ValueToCompare="0" ControlToValidate="txtOrderQuantity"
                                ForeColor="Red"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="quantityRequiredValidator" runat="server"
                                ErrorMessage="Empty Quantity" ForeColor="Red" ControlToValidate="txtOrderQuantity"></asp:RequiredFieldValidator></td>
                        </tr>
                        --%>
                        <%--                        <tr>
                            <td colspan="12" style="border-top: none;">
                                <asp:CustomValidator ID="validOrderQuantity" runat="server"
                                    OnServerValidate="validOrderQuantity_ServerValidate"
                                    ControlToValidate="txtOrderQuantity" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                </asp:CustomValidator>
                            </td>
                        </tr>--%>
                    <%--</EditItemTemplate>--%>
                </asp:ListView>
                </asp:Panel>
               <%-- <% if (IsEditable())
                    { %><asp:Button ID="btnAddItem" runat="server" Text="Add Item" OnClick="btnAddItem_Click" />
                <br />
                <% } %>
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
        </div>--%>

        <!-- Modal -->
        <%--<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
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
            </div>--%>
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
