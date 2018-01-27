<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="2AllocationPage.aspx.cs" Inherits="InventoryWebApp._2AllocationPage"
    MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        table{
            table-layout: fixed;
            width: 100%;
        }
        table > tr > td {
            width: 10%;
        }
        table > tr > th {
            width: 10%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h3>Stationery Allocation</h3>
    <p>The allocation is prioritized based on date of approval.</p>
    <asp:Button ID="btnBack" runat="server" Text="<Back to Retrieval" Style="float: left" OnClick="btnBack_Click" CssClass="btn btn-success" />
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Disbursement>" Style="float: right" OnClick="btnNext_Click" CssClass="btn btn-success" />


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
                    <th colspan="1"></th>
                    <th colspan="3">Stationery Description</th>
                    <th colspan="2">Status</th>
                    <th colspan="2" style="text-align: right; padding-right: 20px">Needed Quantity</th>
                    <th colspan="2" style="text-align: right; padding-right: 20px">Disbursing Quantity</th>
                    <%--<td class="head" style="text-align: left; padding-left: 20px">Notes</td>--%>
                </thead>
                <tbody id="itemPlaceholder" runat="server"></tbody>
            </table>
        </LayoutTemplate>

        <ItemTemplate>
            <tbody>
                <tr style="background-color: #dadeef">
                    <td colspan="1">
                        <asp:LinkButton ID="linkDisplay" runat="server" CommandName="Display" OnCommand="Display_InnerList"><span class="glyphicon glyphicon-plus" style="color:#008e09" aria-hidden="true"></span></asp:LinkButton>
                        <asp:LinkButton ID="linkHide" runat="server" CommandName="Display" OnCommand="Hide_InnerList"><span class="glyphicon glyphicon-minus" style="color:#d80000" aria-hidden="true"></span></asp:LinkButton>
                        
                    </td>
                    <td colspan="3">
                        <asp:HiddenField ID="hfItemCode" runat="server" Value='<%# Eval("ItemCode") %>' />
                        <%#GetStationeryByCode(Eval("ItemCode").ToString()).Description %></td>
                    <td colspan="2"><%#GetStatus(Eval("ItemCode").ToString()) %></td>
                    <td colspan="2" style="text-align: right; padding-right: 20px"><%# Eval("QuantityNeeded") %></td>
                    <td colspan="2" style="text-align: right; padding-right: 20px"><%# Eval("QuantityRetrieved") %></td>

                    <%--<td style="text-align: left; padding-left: 20px"></td>--%>
                </tr>
                <tr>
                    <td colspan="10" style="padding:8px 0">
                        <asp:ListView ID="lvDetails" runat="server" OnItemEditing="lvDetails_ItemEditing" OnItemUpdating="lvDetails_ItemUpdating"
                            OnItemCanceling="lvDetails_ItemCanceling">
                            <LayoutTemplate>
                                <table class="table" border="0">
                                    <tbody id="itemPlaceholder" runat="server"></tbody>
                                </table>
                            </LayoutTemplate>
                            <ItemTemplate>
                                <tbody>
                                    <tr>
                                        <td colspan="1"></td>
                                        <td colspan="3"><%# GetDepartment(GetDisbursement(Eval("DisbursementCode").ToString()).DepartmentCode).DepartmentName %></td>
                                        <td colspan="2"><%# Eval("RequestCode") %></td>
                                        <td colspan="2" style="text-align: right; padding-right: 20px"><%# GetRequestDetail(Eval("RequestCode").ToString(), Eval("ItemCode").ToString()).RemainingQuant %></td>
                                        <td colspan="2" style="text-align: right; padding-right: 20px">
                                            <div style="float: left">
                                                <asp:LinkButton ID="lbEdit" runat="server" CommandName="Edit" Title="Edit" style="padding-left:20px">
                                                           <i class="fa fa-pencil-square" style="font-size:1.5em;color:darkorange" aria-hidden="true"></i>
                                                </asp:LinkButton>
                                            </div>
                                            <div style="float: right">
                                                <%# Eval("Quantity") %>
                                            </div>
                                        </td>
                                        <%--<td><%# GetRequest(Eval("RequestCode").ToString()).HeadRemarks %></td>--%>
                                        <%--<asp:TextBox ID="tbxNotes" runat="server"></asp:TextBox></td>--%>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <tbody>
                                    <tr>
                                        <td colspan="1"></td>
                                        <td colspan="3"><%# GetDepartment(GetDisbursement(Eval("DisbursementCode").ToString()).DepartmentCode).DepartmentName %></td>
                                        <td colspan="2"><%# Eval("RequestCode") %></td>
                                        <td colspan="2" style="text-align: right; padding-right: 20px"><%# GetRequestDetail(Eval("RequestCode").ToString(), Eval("ItemCode").ToString()).RemainingQuant %></td>
                                        <td colspan="2" style="text-align: right; padding-right: 20px">
                                            <div>
                                                <asp:TextBox runat="server" ID="tbxAllocatedQty" Text='<%# Bind("Quantity") %>' Width="60%" TextMode="Number"
                                                    style="text-align:center"></asp:TextBox>
                                                
                                                <asp:LinkButton ID="lbUpdate" runat="server" CommandName="Update" Title="Update">
                                                    <i class="fa fa-check-circle-o" aria-hidden="true" style="color:forestgreen;font-size:1.5em"></i>
                                                </asp:LinkButton>
                                                <asp:LinkButton ID="lbCancel" runat="server" CommandName="Cancel" Title="Cancel">
                                                        <i class="fa fa-times-circle-o" aria-hidden="true" style="color:red;font-size:1.5em"></i>
                                                </asp:LinkButton>
                                            </div>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="10" align="right" style="border-top:none">
                                         <asp:CustomValidator ID="validAllocatedQty" runat="server"
                                                OnServerValidate="validAllocatedQty_ServerValidate"
                                                ControlToValidate="tbxAllocatedQty" ForeColor="Red" ErrorMessage="" Display="Dynamic">
                                            </asp:CustomValidator>
                                        </td>
                                    </tr>
                                </tbody>
                            </EditItemTemplate>

                        </asp:ListView>
                    </td>
                </tr>
            </tbody>

        </ItemTemplate>
    </asp:ListView>
    </td>
                        </tr>
                    </tbody>
                </ItemTemplate>

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
