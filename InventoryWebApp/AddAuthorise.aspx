<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AddAuthorise.aspx.cs" Inherits="InventoryWebApp.AddAuthorise" %>
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
    <div>
        <asp:TextBox ID="tbxSearch" runat="server" Width="250px" AutoPostBack="True" OnTextChanged="selectedTextChange"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:GridView ID="gvEmployee" runat="server" AutoGenerateColumns="False"
            OnSelectedIndexChanged  ="gv_SelectedIndexChanged" 
            DataKeyNames="EmployeeCode" CellPadding="4" ForeColor="#333333" GridLines="None">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                <asp:BoundField DataField="EmployeeCode" HeaderText="EmployeeCode" SortExpression="EmployeeCode" />
                <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeNmae" SortExpression="EmployeeName" />
                
                 <asp:CommandField HeaderText="Select" ShowSelectButton="True" />
                
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
        <asp:Label ID="lblEmployeeCode" runat="server"></asp:Label>
    <br />
    <asp:Label ID="lblRoleCode2" runat="server" Text="RoleName:"></asp:Label>
    <asp:DropDownList ID="ddlRolecodelist" runat="server"  >

    </asp:DropDownList>
    <br />
    
    <br />
 
    <asp:Label ID="lblStartDate" runat="server" Text="StartDate"></asp:Label>
    <asp:TextBox ID="tbxStartDate" runat="server" TextMode="Date" ></asp:TextBox>
         <asp:CompareValidator ID="CompareStartTodayValidator" Operator="GreaterThanEqual" 
             Type="Date" ControltoValidate="tbxStartDate" ErrorMessage="The Invalid StartDate" runat="server"
                         ForeColor="Red"   ValueToCompare="<%# DateTime.Today.ToShortDateString() %>"  /><br />
    <asp:Label ID="lblEndDate" runat="server" Text="EndDate"></asp:Label>
  <asp:TextBox ID="tbxEndDate" runat="server" TextMode="Date" ></asp:TextBox>
        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tbxEndDate"
                            ErrorMessage="Invalid EndDate " ControlToCompare="tbxStartDate" 
            Operator="GreaterThanEqual" SetFocusOnError="True" Type="Date" ForeColor="Red" ></asp:CompareValidator>
        <br />
        <asp:Label ID="lblmessage" runat="server"></asp:Label>
    <br />


    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnAssign" runat="server" BackColor="#CCFFCC" OnClick="btnAssign_Click" OnClientClick="return confirm('Are you sure to Add the authorise?')" Text="Add" Width="64px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    </div>
</body>
</html>
</asp:Content>
