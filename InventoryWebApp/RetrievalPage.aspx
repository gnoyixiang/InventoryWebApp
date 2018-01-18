<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="RetrievalPage.aspx.cs" Inherits="InventoryWebApp.RetrievalPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <h3>Retrieval list</h3>
    <div>
        <p>Retrieval Code: 
    <asp:Label ID="lblRetrievalCode" runat="server" Text=""></asp:Label></p>
        <p>Retrieval Created Date: 
    <asp:Label ID="lblRetrievalDate" runat="server" Text=""></asp:Label></p>
        <p>Created by:
    <asp:Label ID="lblCreatedBy" runat="server" Text="Need to work with DAO null exception"></asp:Label></p>

        </p>
        <p>Number of items need to be retrieved: 
    <asp:Label ID="lblTotalItem" runat="server" Text="TotalQuant"></asp:Label></p>
    </div>
    <asp:Button ID="btnBack" runat="server" Text="<Back" Style="float: left" OnClick="btnBack_Click" />
    <asp:Button ID="btnNext" runat="server" Text="Proceed to Allocation>" Style="float: right" OnClick="btnNext_Click" />
    <asp:Button ID="btnReset" runat="server" Text="Reset" Style="float: right" OnClick="btnReset_Click" />
    

    <br/>
    
    <br/>
    <asp:Label ID="lblNotification" runat="server" Text="" Style="float: right; font-size:12px" class="label label-danger"></asp:Label>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            
            <%-- <asp:Label ID="lblTest" runat="server" Text="Label"></asp:Label>--%>
            <asp:ListView ID="lvRetrievalList" runat="server" OnItemUpdating="lvRetrievalList_ItemUpdating">
                <LayoutTemplate>
                    <table class="table">
                        <tr>
                            <td class="head">Stationery Description</td>
                            <td class="head">Location</td>
                            <td class="head" style="text-align: right; padding-right: 20px">Stock</td>
                            <td class="head" style="text-align: right; padding-right: 20px">Needed Quantity</td>
                            <td class="head" style="text-align: right; padding-right: 20px">Retrieved Quantity</td>
                            <td class="head" style="text-align: left; padding-left: 20px">Notes</td>
                            <td class="head" style="text-align: left; padding-left: 20px">Retrieved</td>
                        </tr>
                        <tr id="itemPlaceholder" runat="server"></tr>
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
                        <td style="text-align: left; padding-left: 20px">
                            <asp:CheckBox ID="cbxRetrieved" runat="server" /></td>
                    </tr>
                </ItemTemplate>
                <%--<EditItemTemplate>
          <tr style="background-color: #ADD8E6">
              <td><%#GetStationeryByCode(Eval("ItemCode").ToString()).Description %></td>
                <td><%#GetStationeryByCode(Eval("ItemCode").ToString()).Location %></td>
                <td style="text-align: right; padding-right: 20px"><%#GetStationeryByCode(Eval("ItemCode").ToString()).Stock %></td>
                <td style="text-align: right; padding-right: 20px"><%#Eval("QuantityNeeded") %></td>
                <td style="text-align: right; padding-right: 20px">
                    <asp:TextBox TextMode="Number" runat="server" min='0' max='<%#Eval("QuantityRetrieved") %>' step="1" Text='<%#Eval("QuantityRetrieved") %>' /></td>
            <td>
              <asp:LinkButton ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />&nbsp;
              <asp:LinkButton ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </td>
            
          </tr>
        </EditItemTemplate>--%>
            </asp:ListView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
