<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="StoreEmployeeList.aspx.cs" Inherits="InventoryWebApp.StoreEmployeeList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .pager-style {
        }

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

    <ul class="breadcrumb">
                <li><a href="#">Home</a></li>
                <li class="active"><a href="#">StoreEmployee List</a></li>
               
            </ul>

    <div class="row">
        <div class="col-xs-12 col-md-2">
    <asp:TextBox ID="tbxSearch" runat="server" Height="30px" Width="150px"> </asp:TextBox>
            <asp:Label ID="lblNoresultFound" runat="server" ForeColor="Red" ViewStateMode="Disabled" Width="400px"></asp:Label>
           </div> 
      <div class="col-xs-12 col-md-2">
    <asp:Button ID="btnSearch" runat="server" Text="Search" Height="30px" Width="70px" OnClick="SearchButton_Click"  CssClass="btn btn-primary"/><br />
    
    </div>
   <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="SeachBox cann't be Empty" ControlToValidate="tbxSearch" ForeColor="Red">
    </asp:RequiredFieldValidator>--%>

    
    <div class="col-xs-12 col-md-2">
    <asp:Button ID="btnStoreEmployeeList" runat="server" Text="Store Employee List" OnClick="btnStoreEmployeeList_Click" Height="30px" Width="200px" />
    </div>
    </div>

    <asp:GridView ID="gvEmployeeList" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="false" Width="100%" 
       OnRowDataBound="gvEmployeeList_RowDataBound" OnPageIndexChanging="gvEmployeeList_PageIndexChanging" DataKeyNames="EmployeeCode" ShowHeaderWhenEmpty="True" AllowPaging="True" PageSize="10">
        <AlternatingRowStyle BackColor="White" />
        <EditRowStyle />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
       <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
        <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />

        <Columns>
                <asp:TemplateField HeaderText="Employee Code" SortExpression="EmployeeCode" >
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EmployeeName" SortExpression="EmployeeName" >
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeName" runat="server" Text='<%# Bind("EmployeeName") %>'>></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Employee Role" SortExpression="EmployeeRole" >
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeRole"  ItemStyle-HorizontalAlign="center" runat="server"  ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Temporary Role" SortExpression="TemporaryRole" >
                    
                    <ItemTemplate>
                        <asp:Label ID="lblTemporaryRole" runat="server" ></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="ReportTo" SortExpression="ReportTo" >
                    
                    <ItemTemplate>
                        <asp:Label ID="lblReportTo" runat="server" Text='<%# Bind("ReportTo") %>' ></asp:Label>
                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

    </asp:GridView>

    <br />
    <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green"></asp:Label>
    <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red"></asp:Label>

</asp:Content>
