<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AuthoriseStaff.aspx.cs" 
    Inherits="InventoryWebApp.Dept.AuthoriseStaff" %>

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
        <li class="active">View Catalogue</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-12">
            <h3>Authority</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gv" runat="server" AutoGenerateColumns="False" CssClass="table"
                DataKeyNames="AssignRoleCode" OnRowDataBound="OnRowDataBound"
                OnSelectedIndexChanged="gv_SelectedIndexChanged"
                OnRowDeleting="OnRowDeleting"
                CellPadding="4" GridLines="None"
                AllowPaging="True"
                OnPageIndexChanging="gv_PageIndexChanging">
                <Columns>

                   
                    <asp:TemplateField HeaderText="Employee Name" SortExpression="EmployeeName">
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeName" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Role Name" SortExpression="RoleName">
                        <ItemTemplate>
                            <asp:Label ID="lblRoleName" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Start Date" SortExpression="StartDate">
                        <ItemTemplate>
                            <asp:Label ID="lblStartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="End Date" SortExpression="EndDate">
                        <ItemTemplate>
                            <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("EndDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CommandField ShowSelectButton="True" HeaderText="Select" />
                    <asp:CommandField HeaderText="Remove" SelectText="Remove" ShowDeleteButton="True" DeleteText="Remove" />
                </Columns>
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />
            </asp:GridView>
        </div>

    </div>

    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-3" for="lblEmpName">Employee Name:</label>
            <div class="col-md-4">
                <asp:Label ID="lblEmpName" runat="server" Text="" CssClass="form-control disabled"></asp:Label>
            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-3" for="lblEmpCode">Employee Code:</label>
            <div class="col-md-4">
                <asp:Label ID="lblEmpCode" runat="server" Text="" CssClass="form-control disabled"></asp:Label>
            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-3" for="tbxStartDate">Start Date:</label>
            <div class="col-md-4">
                <asp:TextBox ID="tbxStartDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:CompareValidator ID="CompareStartTodayValidator" Operator="GreaterThanEqual" Type="Date" ControlToValidate="tbxStartDate"
                    ErrorMessage="The Invalid StartDate" runat="server" Display="Dynamic"
                    ForeColor="Red" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>" />
            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <label class="control-label col-md-3" for="tbxEndDate">End Date:</label>
            <div class="col-md-4">
                <asp:TextBox ID="tbxEndDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="tbxEndDate" Display="Dynamic"
                    ErrorMessage="Invalid EndDate " ControlToCompare="tbxStartDate" Operator="GreaterThanEqual" SetFocusOnError="True"
                    Type="Date" ForeColor="Red"></asp:CompareValidator>

            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <div class="col-md-3"></div>
            <div class="col-md-4">
                <asp:Button ID="btnAssign" runat="server" OnClick="btnAssign_Click" CssClass="btn btn-success"
                    OnClientClick="return confirm('Are you sure to Update the authorise?')" Text="Update" Width="100%" />

            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <div class="col-md-3"></div>
            <div class="col-md-4">
                <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="btn btn-danger"
                    OnClientClick="return confirm('Are you sure to Add new authorise?')" Text="Add" Width="100%" />
            </div>
        </div>
    </div>
    <div class="row form-horizontal">
        <div class="form-group">
            <div class="col-md-3"></div>
            <div class="col-md-4">
                <asp:Label ID="lblSuccessMsg" runat="server" ForeColor="green"></asp:Label>
                <asp:Label ID="lblErrorMsg" runat="server" ForeColor="red"></asp:Label>
            </div>
        </div>
    </div>

    </div>  
</asp:Content>


