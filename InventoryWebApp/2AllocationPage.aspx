<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="2AllocationPage.aspx.cs" Inherits="InventoryWebApp._2AllocationPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h3>Stationery Allocation</h3>
    <p>The allocation is prioritized based on date of approval.</p>
    <asp:Button ID="btnBack" runat="server" Text="<Back to Retrieval" Style="float: left" OnClick="btnBack_Click" CssClass="btn btn-success"/>
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Disbursement>" Style="float: right" OnClick="btnNext_Click" CssClass="btn btn-success"/>
    
    
    <br />
    <br />
    <br />
    <asp:Label ID="lblNotification" runat="server" Text=""></asp:Label>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <asp:ListView ID="lvAllocation" runat="server" OnItemEditing="lvAllocation_ItemEditing" OnItemCanceling="lvAllocation_ItemCanceling" OnItemUpdating="lvAllocation_ItemUpdating">
                <LayoutTemplate>
                    <table class="table" border="0">
                        <thead>
                            <th class="col-md-1" ></th>
                            <th class="col-md-2">Stationery Description</th>
                            <th class="col-md-1">Status</th>
                            <th class="col-md-1" style="text-align: right; padding-right: 20px">Needed Quantity</th>
                            <th class="col-md-1" style="text-align: right; padding-right: 20px">Disbursing Quantity</th>
                            <%--<td class="head" style="text-align: left; padding-left: 20px">Notes</td>--%>
                        </thead>
                        <tbody id="itemPlaceholder" runat="server"></tbody>
                    </table>
                </LayoutTemplate>

                <ItemTemplate>
                    <tbody >
                        <tr style ="background-color:#dadeef">
                            <td>
                                <asp:LinkButton ID="linkDisplay" runat="server" CommandName="Display" OnCommand="Display_InnerList"><span class="glyphicon glyphicon-plus" style="color:#008e09" aria-hidden="true"></span></asp:LinkButton>
                                <asp:LinkButton ID="linkHide" runat="server" CommandName="Display" OnCommand="Hide_InnerList"><span class="glyphicon glyphicon-minus" style="color:#d80000" aria-hidden="true"></span></asp:LinkButton>
                                <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit" Title="Edit">
                                    <i class="fa fa-pencil-square" style="font-size:1.5em;color:darkorange" aria-hidden="true"></i>
                                </asp:LinkButton>
                            </td>
                            <td> <asp:HiddenField ID="hfItemCode" runat="server" Value='<%# Eval("ItemCode") %>' />
                                <%#GetStationeryByCode(Eval("ItemCode").ToString()).Description %></td>
                            <td><%#GetStatus(Eval("ItemCode").ToString()) %></td>
                            <td style="text-align: right; padding-right: 20px"><%# Eval("QuantityNeeded") %></td>
                            <td style="text-align: right; padding-right: 20px"><%# Eval("QuantityRetrieved") %></td>

                            <%--<td style="text-align: left; padding-left: 20px"></td>--%>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:ListView ID="lvDetails" runat="server" >
                                    <LayoutTemplate>
                                        <table class="table" border="0">
                                            <tbody id="itemPlaceholder" runat="server"></tbody>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td class="col-md-1"></td>
                                                <td class="col-md-1"></td>
                                                <td class="col-md-1"><%# GetDepartment(GetDisbursement(Eval("DisbursementCode").ToString()).DepartmentCode).DepartmentName %></td>
                                                <td class="col-md-1"><%# Eval("RequestCode") %></td>
                                                <td  class="col-md-1" style="text-align: right; padding-right: 20px"><%# GetRequestDetail(Eval("RequestCode").ToString(), Eval("ItemCode").ToString()).RemainingQuant %></td>
                                                <td  class="col-md-1" style="text-align: right; padding-right: 20px"><%# Eval("Quantity") %></td>
                                                <%--<td><%# GetRequest(Eval("RequestCode").ToString()).HeadRemarks %></td>--%>
                                                <%--<asp:TextBox ID="tbxNotes" runat="server"></asp:TextBox></td>--%>
                                    
                                            </tr>
                                        </tbody>

                                    </ItemTemplate>

                                </asp:ListView>
                            </td>
                        </tr>
                    </tbody>
                </ItemTemplate>
                <EditItemTemplate>
                    <tbody >
                        <tr style ="background-color:#dadeef">
                            <td>
                                <asp:LinkButton ID="linkDisplay" runat="server" CommandName="Display" OnCommand="Display_InnerList"><span class="glyphicon glyphicon-plus" style="color:#008e09" aria-hidden="true"></span></asp:LinkButton>
                                <asp:LinkButton ID="linkHide" runat="server" CommandName="Display" OnCommand="Hide_InnerList"><span class="glyphicon glyphicon-minus" style="color:#d80000" aria-hidden="true"></span></asp:LinkButton>
                                <asp:LinkButton ID="lbtUpdate" runat="server" CommandName="Update"><span class="glyphicon glyphicon-ok" aria-hidden="true" style="font-size:1.5em;color:forestgreen"></span></asp:LinkButton>
                                <asp:LinkButton ID="lbtCancel" runat="server" CommandName="Cancel"><span class="glyphicon glyphicon-remove" aria-hidden="true" style="font-size:1.5em;color:red"></span></asp:LinkButton>
                            </td>
                            <td> <asp:HiddenField ID="hfItemCode" runat="server" Value='<%# Eval("ItemCode") %>' />
                                <%#GetStationeryByCode(Eval("ItemCode").ToString()).Description %></td>
                            <td><%#GetStatus(Eval("ItemCode").ToString()) %></td>
                            <td style="text-align: right; padding-right: 20px"><%# Eval("QuantityNeeded") %></td>
                            <td style="text-align: right; padding-right: 20px">
                                <asp:TextBox ID="tbxQuantityRetrieved" runat="server" Text=<%# Bind("QuantityRetrieved") %>></asp:TextBox></td>

                            <%--<td style="text-align: left; padding-left: 20px"></td>--%>
                        </tr>
                        <tr>
                            <td colspan="6">
                                <asp:ListView ID="lvDetails" runat="server" >
                                    <LayoutTemplate>
                                        <table class="table" border="0">
                                            <tbody id="itemPlaceholder" runat="server"></tbody>
                                        </table>
                                    </LayoutTemplate>
                                    <ItemTemplate>
                                        <tbody>
                                            <tr>
                                                <td class="col-md-1"></td>
                                                <td class="col-md-1"></td>
                                                <td class="col-md-1"><%# GetDepartment(GetDisbursement(Eval("DisbursementCode").ToString()).DepartmentCode).DepartmentName %></td>
                                                <td class="col-md-1"><%# Eval("RequestCode") %></td>
                                                <td  class="col-md-1" style="text-align: right; padding-right: 20px"><%# GetRequestDetail(Eval("RequestCode").ToString(), Eval("ItemCode").ToString()).RemainingQuant %></td>
                                                <td  class="col-md-1" style="text-align: right; padding-right: 20px"><%# Eval("Quantity") %></td>
                                                <%--<td><%# GetRequest(Eval("RequestCode").ToString()).HeadRemarks %></td>--%>
                                                <%--<asp:TextBox ID="tbxNotes" runat="server"></asp:TextBox></td>--%>
                                    
                                            </tr>
                                        </tbody>

                                    </ItemTemplate>

                                </asp:ListView>
                            </td>
                        </tr>
                    </tbody>
                </EditItemTemplate>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
<%--<tr>
                                                <td class="col-md-1" ></td>
                                                <td class="col-md-1" ></td>
                                                <td class="col-md-1" ></td>
                                                <td class="col-md-1" ></td>
                                                <td class="col-md-1" style="text-align: right; padding-right: 20px"></td>
                                                <td class="col-md-1" style="text-align: right; padding-right: 20px"></td>
                                                <th class="col-md-1" >Notes</th>
                                            </tr>--%>
