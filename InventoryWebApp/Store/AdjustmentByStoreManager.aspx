<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AdjustmentByStoreManager.aspx.cs" Inherits="InventoryWebApp.Store.AdjustmentByStoreManager" %>

<%@ MasterType VirtualPath="~/Layout.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <ul class="breadcrumb">
        <li><a href="Home">Home</a></li>
        <li class="active">Stock Adjustment</li>

    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>Stock Adjustment</h3>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="gvPendingAdjutment" runat="server" CssClass="table table-striped" GridLines="None" Width="100%"
                    AutoGenerateColumns="false" DataKeyNames="AdjustmentCode" CellSpacing="-1" HeaderStyle-BackColor="#cfd8dc"
                    OnRowDataBound="gvPendingAdjutment_RowDataBound" OnRowCommand="gvPendingAdjutment_RowCommand">

                    <Columns>
                        <asp:TemplateField HeaderText="ItemCode" SortExpression="ItemCode">
                            <ItemTemplate>
                                <asp:Label ID="lblItemCode" runat="server" Text='<%# Bind("ItemCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Price" SortExpression="Price">
                            <ItemTemplate>
                                <asp:Label ID="lblSymbol" runat="server" Text="Label">S$</asp:Label>
                                <asp:Label ID="lblPrice" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="AdjustmentQuantity" SortExpression="AdjustmentQuant">
                            <ItemTemplate>
                                <asp:Label ID="lblAdjustmentQuant" ItemStyle-HorizontalAlign="center" runat="server" Text='<%# Bind("AdjustmentQuant") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Stock" SortExpression="Stock">

                            <ItemTemplate>
                                <asp:Label ID="lblStock" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Reason" SortExpression="Reason">

                            <ItemTemplate>
                                <asp:Label ID="lblReason" runat="server" Text='<%# Bind("Reason") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="HeadRemarks" SortExpression="HeadRemarks">

                            <ItemTemplate>
                                <%--<asp:Label ID="lblHeadRemarks" runat="server" Text='<%# Bind("HeadRemarks") %>'></asp:Label>--%>
                                <asp:TextBox ID="tbxHeadRemarks" runat="server" CssClass="form-control" Text='<%# Bind("HeadRemarks") %>' ViewStateMode="Disabled"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Width="120px" HeaderText="Approve">
                            <ItemTemplate>
                                <asp:Button Text="Approve" CommandName="Approve" ToolTip="Approve" CssClass="btn btn-success" runat="server"  />

                            </ItemTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField ItemStyle-Width="120px" HeaderText="Reject">
                            <ItemTemplate>
                                <asp:Button Text="Reject" CommandName="Reject" ToolTip="Reject" CssClass="btn btn-danger" runat="server" />

                            </ItemTemplate>

                        </asp:TemplateField>

                    </Columns>



                </asp:GridView>
            </div>
        </div>
        <br />
        <div class="row">
            <div class="col-md-12">
                <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green"></asp:Label>
                <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red"></asp:Label>
            </div>
        </div>
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
                        <span class="input-group-addon">@</span>
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
