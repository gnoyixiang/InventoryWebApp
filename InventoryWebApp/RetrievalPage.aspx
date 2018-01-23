<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RetrievalPage.aspx.cs" Inherits="InventoryWebApp.RetrievalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h3>Retrieval list</h3>
    <div>
        <table>
            <tr>
                <td class="col-lg-1">Retrieval Code: </td>
                <td class="col-lg-2"><asp:Label ID="lblRetrievalCode" runat="server" Text=""></asp:Label></td>
                <td class="col-lg-2">Created on: </td>
                <td class="col-lg-2"><asp:Label ID="lblRetrievalDate" runat="server" Text=""></asp:Label></td>
            </tr>
            <tr>
                <td class="col-lg-1">Created by: </td>
                <td class="col-lg-2"><asp:Label ID="lblCreatedBy" runat="server" Text="Need to work with DAO null exception"></asp:Label></td>
                <td class="col-lg-2">Number of items need to be retrieved: </td>
                <td class="col-lg-2"><asp:Label ID="lblTotalItem" runat="server" Text="TotalQuant"></asp:Label></td>
            </tr>
        </table>
    </div>

    <br />
    <br />



    <asp:Button ID="btnBack" runat="server" Text="<Back to Requests" Style="float: left" OnClick="btnBack_Click" CssClass="btn btn-success"/>
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Allocation>" Style="float: right" OnClick="btnNext_Click" CssClass="btn btn-success" />
    <asp:Button ID="btnReset" runat="server" Text="Reset" Style="float: right" OnClick="btnReset_Click" CssClass="btn btn-danger"/>
    <br />
    <br />
    <asp:Label ID="lblNoData" runat="server"></asp:Label>
    <asp:Label ID="lblNotification" runat="server" Text="" Style="float: right; font-size:12px" class="label label-danger"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <%-- <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>--%>
            <asp:Button ID="btnTickAll" runat="server" Text="Tick All" Style="float: right; padding-right:10px"  CssClass="btn btn-primary" OnClick="btnTickAll_Click"/>
            <asp:ListView ID="lvRetrievalList" runat="server" >
                <LayoutTemplate>
                    <table class="table">
                        <thead>
                            <th class="head">Stationery Description</th>
                            <th class="head">Location</th>
                            <th class="head" style="text-align: right; padding-right: 20px">Stock</th>
                            <th class="head" style="text-align: right; padding-right: 20px">Needed Quantity</th>
                            <th class="head" style="text-align: right; padding-right: 20px">Retrieved Quantity</th>
                            <th class="head" style="text-align: left; padding-left: 20px">Notes</th>
                            <th class="head" style="text-align: right; padding-left: 20px"> Retrieved </th>
                        </thead>
                        <tbody id="itemPlaceholder" runat="server"></tbody>
                </LayoutTemplate>

                <ItemTemplate>
                    <tr>
                        <td><%#GetStationeryByCode(Eval("ItemCode").ToString()).Description %></td>
                        <td><%#GetStationeryByCode(Eval("ItemCode").ToString()).Location %></td>
                        <td style="text-align: right; padding-right: 20px"><%#GetStationeryByCode(Eval("ItemCode").ToString()).Stock %></td>
                        <td style="text-align: right; padding-right: 20px"><%#Eval("QuantityNeeded") %></td>
                        <td style="text-align: right; padding-right: 20px">
                            <asp:TextBox ID="tbxQuantityRetrieved" TextMode="Number" AutoPostBack="true" runat="server" min='0' max='<%#GetMaxRetrieved(Eval("ItemCode").ToString()) %>' step="1" Text='<%#Eval("QuantityRetrieved") %>' /></td>
                        <td style="text-align: left; padding-left: 20px">
                            <asp:TextBox ID="tbxNotes" runat="server" AutoPostBack="true" Text='<%#Eval("Notes") %>'></asp:TextBox></td>
                        <td style="text-align: right; padding-left: 20px">
                            <asp:CheckBox ID="cbxRetrieved" runat="server" /></td>
                    </tr>
                </ItemTemplate>
                
            </asp:ListView>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
