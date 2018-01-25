<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="PendingPO.aspx.cs" Inherits="InventoryWebApp.PendingPO" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
            .pager-style span, .pager-style a {
                padding: 0 5px;
                font-size: 16px;
            }

            .pager-style span {
                font-weight: 600;
                text-decoration: underline;
            }

            .pager-style a {
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1><asp:Label ID="Label1" runat="server" Text="Pending PO Lists"></asp:Label></h1>
    <asp:GridView ID="gvPendingPO" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound"
        DataKeyNames="PurchaseOrderCode" OnSelectedIndexChanged="GvPendingPO_SelectedIndexChanged" AllowPaging="True"
        OnPageIndexChanging="gvPendingPO_PageIndexChanging" CssClass="table table-hover table-striped" CellSpacing="-1">
        
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />

        <Columns>
            <asp:TemplateField HeaderText="No">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1 %>
                </ItemTemplate>
            </asp:TemplateField>

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
            <asp:TemplateField ShowHeader="False">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Select" Text="View Details"></asp:LinkButton>
                </ItemTemplate>
                <ItemStyle ForeColor="#3333CC" />
            </asp:TemplateField>
        </Columns>
        <PagerSettings FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
        <PagerStyle />

    </asp:GridView>

</asp:Content>
