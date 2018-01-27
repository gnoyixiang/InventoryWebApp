<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RequisitionList.aspx.cs" Inherits="InventoryWebApp.RequisitionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>View Outstanding Requests</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <h3>Stationery Requests</h3>
    <p>
        Total item quantity need to be processed: 
    <asp:Label ID="lblTotalQuant" runat="server" Text="TotalQuant"></asp:Label>
    </p>
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Retrieval>" OnClick="btnNext_Click" Style="float: right" CssClass="btn btn-success" />
    <br />
    <br />

    <asp:Label ID="lblNotification" runat="server" Text="" class="label label-danger" Style="float: right; font-size:12px"></asp:Label>

    <br />
    <br />
    <%-- <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>--%>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>

            <asp:ListView ID="lvRequestList" runat="server">
                <LayoutTemplate>
                    <table class="table">
                        <thead>
                            <th class="col-md-1"></th>
                            <th class="col-md-2">Request ID</th>
                            <th class="col-md-3">Department</th>
                            <th class="col-md-3" style="text-align: right; padding-right: 50px">Remaining Quantity</th>
                            <th class="col-md-2" style="text-align: left; padding-left: 20px">Approved Date</th>
                            <th class="col-md-2">Status</th>
                        </thead>
                        <tbody id="itemPlaceholder" runat="server"></tbody>
                </LayoutTemplate>
                <ItemTemplate>

                    <tbody>
                        <tr style="background-color: #dadeef">
                            <td>
                                <asp:LinkButton ID="linkDisplay" runat="server" CommandName="Display" OnCommand="Display_InnerList"><span class="glyphicon glyphicon-plus" style="color:#008e09" aria-hidden="true"></span></asp:LinkButton>
                                <asp:LinkButton ID="linkHide" runat="server" CommandName="Display" OnCommand="Hide_InnerList"><span class="glyphicon glyphicon-minus" style="color:#d80000" aria-hidden="true"></span></asp:LinkButton>

                            </td>
                            <td>
                                <asp:Label ID="lblRequestCode" runat="server" Text='<%# Eval("RequestCode") %>'></asp:Label></td>
                            <td><%# GetDeptByCode(Eval("DepartmentCode").ToString()).DepartmentName %></td>
                            <td style="text-align: right; padding-right: 50px"><%# GetTotalQuantOfRequest(Eval("RequestCode").ToString()) %></td>
                            <td style="text-align: left; padding-left: 20px"><%# Eval("DateApproved", "{0:dd MMM yyyy}") %></td>
                            <%--<td><%# DateTime.Now.ToString("dd/MMM/yyy") %></td>--%>
                            <td><%# Eval("Status") %></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="padding-left:0">
                                <asp:ListView ID="lvRequestDetails" runat="server">
                                    <LayoutTemplate>
                                        <table class="table">
                                            <tbody id="itemPlaceholder" runat="server"></tbody>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td class="col-md-1"></td>
                                                <td class="col-md-2"></td>
                                                <td class="col-md-3"><%# GetStationery(Eval("ItemCode").ToString()).Description %></td>
                                                <td class="col-md-3" style="text-align: right; padding-right: 50px"><%# Eval("RemainingQuant") %></td>
                                                <td class="col-md-2"></td>
                                                <td class="col-md-2"></td>
                                            </tr>
                                        </tbody>
                                    </ItemTemplate>
                                </asp:ListView>
                        </tr>

                    </tbody>
                </ItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<%--  --%>
