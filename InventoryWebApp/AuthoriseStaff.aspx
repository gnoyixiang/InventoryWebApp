<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AuthoriseStaff.aspx.cs" Inherits="InventoryWebApp.AuthoriseStaff" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .pager-style{

        }
        .pager-style span, .pager-style a{
            padding: 0 5px;
            font-size: 16px;
        }
        .pager-style span{
            font-weight: 600;
            text-decoration:underline;
        }
        .pager-style a{

        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html>
 
<html>
    <head><title></title></head>
<body>

    <h1>Authority</h1>
    <asp:GridView ID ="gv" runat ="server" AutoGenerateColumns="False" 
            DataKeyNames="AssignRoleCode" OnRowDataBound="OnRowDataBound" 
        OnSelectedIndexChanged  ="gv_SelectedIndexChanged" 
        OnRowDeleting="OnRowDeleting" 
        CellPadding="4" ForeColor="#333333" GridLines="None"
        AllowPaging="True"
        OnPageIndexChanging="gv_PageIndexChanging">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
           

                  <asp:TemplateField HeaderText="EmployeeCode" SortExpression="EmployeeCode">
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EmployeeName" SortExpression="EmployeeName">
                    <ItemTemplate>
                        <asp:Label ID="lblEmployeeName" runat="server"></asp:Label>
                    </ItemTemplate>     
                </asp:TemplateField>
                       
                <asp:TemplateField HeaderText="RoleCode" SortExpression="RoleCode">
                    <ItemTemplate>
                        <asp:Label ID="lblRoleCode" runat="server" Text='<%# Bind("TemporaryRoleCode") %>' ></asp:Label>
                    </ItemTemplate>                 
                </asp:TemplateField>

                 <asp:TemplateField HeaderText="RoleName" SortExpression="RoleName">
                    <ItemTemplate>
                        <asp:Label ID="lblRoleName" runat="server" ></asp:Label>
                    </ItemTemplate>     
                </asp:TemplateField>

                <asp:TemplateField HeaderText="StartDate" SortExpression="StartDate" >
                    <ItemTemplate>
                        <asp:Label ID="lblStartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="EndDate" SortExpression="EndDate">
                    <ItemTemplate>
                        <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>              
                <asp:CommandField ShowSelectButton="True" HeaderText="Select" />
                <asp:CommandField HeaderText="Remove" SelectText="Remove" ShowDeleteButton="True" DeleteText="Remove" />
            </Columns>
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
            <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style"/>
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Employee Name:"></asp:Label>
    <asp:Label ID="lblEmpName" runat="server" Text=""></asp:Label>
    <br />
    <asp:Label ID="Label3" runat="server" Text="Employee Code:"></asp:Label>
    <asp:Label ID="lblEmpCode" runat="server" Text=""></asp:Label>
    <br />
    <br />
    
    <br />
 
    <asp:Label ID="lblStartDate" runat="server" Text="StartDate"></asp:Label>
    &nbsp;&nbsp;
    <asp:TextBox ID="tbxStartDate" runat="server" TextMode="Date" ></asp:TextBox>
    <asp:CompareValidator ID="CompareStartTodayValidator" Operator="GreaterThanEqual" Type="Date" ControltoValidate="tbxStartDate" ErrorMessage="The Invalid StartDate" runat="server"
                         ForeColor="Red"   ValueToCompare="<%# DateTime.Today.ToShortDateString() %>"  /><br />
    <asp:Label ID="lblEndDate" runat="server" Text="EndDate"></asp:Label>
  &nbsp; &nbsp;&nbsp;
  <asp:TextBox ID="tbxEndDate" runat="server" TextMode="Date" ></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tbxEndDate"
                            ErrorMessage="Invalid EndDate " ControlToCompare="tbxStartDate" Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date" ForeColor="Red" ></asp:CompareValidator>
    <br />


    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnAssign" runat="server" BackColor="#CCFFCC" OnClick="btnAssign_Click" OnClientClick="return confirm('Are you sure to Update the authorise?')" Text="Update" Width="64px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnAdd" runat="server" BackColor="#FF9999" OnClick="btnAdd_Click" OnClientClick="return confirm('Are you sure to Add new authorise?')" Text="Add" Width="64px" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
    <asp:Label ID="lblSuccessMsg" runat="server"></asp:Label>
    <asp:Label ID="lblErrorMsg" runat="server"></asp:Label>


    </body></html>
    <br />
</asp:Content>


