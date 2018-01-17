<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PendingPO.aspx.cs" Inherits="InventoryWebApp.PendingPO" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:GridView ID="gvPendingPO" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" >
            <Columns>
                <asp:BoundField DataField="PurchaseOrderCode" HeaderText="PO Number" SortExpression="PurchaseOrderCode" />
                <asp:BoundField DataField="DateCreated" HeaderText="Issue Date" SortExpression="DateCreated" />
               
                <asp:TemplateField HeaderText="Total Price">
                    <ItemTemplate>
                        <asp:Label ID="lblPrice" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="Supplier Name">
                    <ItemTemplate>
                        <asp:Label ID="lblSupplierName" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

</asp:Content>
