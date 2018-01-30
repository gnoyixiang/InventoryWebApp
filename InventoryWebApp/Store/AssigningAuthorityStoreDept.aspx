<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="AssigningAuthorityStoreDept.aspx.cs" 
    Inherits="InventoryWebApp.Store.AssigningAuthorityStoreDept" %>
<%@ MasterType VirtualPath="~/Layout.Master" %>
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

        table {
            max-width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Assign Authority</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
    <div class="row">
        <div class="col-md-12">
            <h3>Assign Authority</h3>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <asp:TextBox ID="tbxSearch" runat="server" CssClass="form-control" placeholder="Search Employee Name or Code"> </asp:TextBox>            
        </div>
        <div class="col-md-2">
            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="SearchButton_Click" CssClass="btn btn-primary" Width="100%"/>
        </div>
        <div class="col-md-4">
            <asp:Label ID="lblNoresultFound" runat="server" ForeColor="Red" ViewStateMode="Disabled"></asp:Label><br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator" runat="server" ErrorMessage="SeachBox cannot be Empty" ControlToValidate="tbxSearch" ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="gvSearchResult" runat="server" CellSpacing="-1" CssClass="table table-striped" GridLines="None" AutoGenerateColumns="false"
                DataKeyNames="EmployeeCode"
                OnRowEditing="gvSearchResult_RowEditing" OnRowDataBound="gvSearchResult_OnRowDataBound" OnRowUpdating="gvSearchResult_RowUpdating"
                OnRowCancelingEdit="gvSearchResult_RowCancelingEdit" HeaderStyle-BackColor="#cfd8dc"
                AllowPaging="True" OnPageIndexChanging="gvSearchResult_PageIndexChanging" OnSelectedIndexChanged="gvSearchResult_SelectedIndexChanged"
                OnRowCommand="gvSearchResult_RowCommand"
                OnRowDeleting="gvSearchResult_RowDeleting" PageSize="4" ShowFooter="True" ShowHeaderWhenEmpty="True">
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" PreviousPageText="Previous" NextPageText="Next" />
                <PagerStyle ForeColor="Black" HorizontalAlign="Center" CssClass="pager-style" />

                <Columns>

                    <asp:TemplateField HeaderText="Employee Code" SortExpression="EmployeeCode">
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeCode" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:Label>
                        </ItemTemplate>

                        <FooterTemplate>
                            <asp:Label ID="lblEmployeeCodeFooter" runat="server"></asp:Label>
                        </FooterTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Employee Name" SortExpression="EmployeeName">
                        <ItemTemplate>
                            <asp:Label ID="lblEmployeeName" runat="server" ItemStyle-HorizontalAlign="center"></asp:Label>
                        </ItemTemplate>

                        <FooterTemplate>
                            <asp:Label ID="lblEmployeeNameFooter" runat="server" ItemStyle-HorizontalAlign="center"></asp:Label>
                        </FooterTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Current Role" SortExpression="CurrentRole">
                        <ItemTemplate>
                            <asp:Label ID="lblCurrentRole" runat="server" ItemStyle-HorizontalAlign="center"></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblCurrentRoleFooter" runat="server" ItemStyle-HorizontalAlign="center"></asp:Label>
                        </FooterTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Temp Role" SortExpression="TempRoleCode">
                        <ItemTemplate>
                            <asp:Label ID="lblTemporaryRoleCode" runat="server"></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:DropDownList ID="ddlTemporaryRoleCode" runat="server" ItemStyle-HorizontalAlign="Left">
                                <asp:ListItem Text="Acting Store Supervisor" Value="ActSSup" />

                            </asp:DropDownList>

                        </EditItemTemplate>

                        <FooterTemplate>
                            <asp:DropDownList ID="ddlTemporaryRoleCodeFooter" runat="server" ItemStyle-HorizontalAlign="Left">
                                <asp:ListItem Text="Acting Store Supervisor" Value="ActSSup" />

                            </asp:DropDownList>
                        </FooterTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Start Date" SortExpression="StartDate">
                        <ItemTemplate>
                            <asp:Label ID="lblStartDate" runat="server" ItemStyle-HorizontalAlign="center"></asp:Label>

                        </ItemTemplate>

                        <EditItemTemplate>

                            <asp:TextBox ID="tbxStartDate" runat="server" TextMode="Date" ItemStyle-HorizontalAlign="Left"></asp:TextBox><br />

                            <asp:CompareValidator ID="compStartTodayValidator" Operator="GreaterThanEqual" Type="Date" ControlToValidate="tbxStartDate"
                                ErrorMessage="Invalid StartDate" runat="server"
                                Display="Dynamic" ForeColor="Red" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>" /><br />

                            <asp:RequiredFieldValidator ID="rqValidatorStartdate" runat="server" ControlToValidate="tbxStartDate" Display="Dynamic"
                                ForeColor="Red" ErrorMessage="Required" ValidationGroup="updateValidation">
                            </asp:RequiredFieldValidator>


                        </EditItemTemplate>

                        <FooterTemplate>
                            <asp:TextBox ID="tbxStartDateFooter" runat="server" TextMode="Date"></asp:TextBox><br />

                            <asp:CompareValidator ID="compStartTodayValidatorFooter" Operator="GreaterThanEqual" Type="Date"
                                ControlToValidate="tbxStartDateFooter" ErrorMessage="Invalid StartDate" runat="server"
                                Display="Dynamic" ForeColor="Red" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>" /><br />

                            <asp:RequiredFieldValidator ID="rqValidatorStartdateFooter" Display="Dynamic" runat="server" ErrorMessage="Required"
                                ControlToValidate="tbxStartDateFooter" ForeColor="Red" ValidationGroup="addValidation">
                            </asp:RequiredFieldValidator>
                        </FooterTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="End Date" SortExpression="EndDate" ItemStyle-HorizontalAlign="Left">
                        <ItemTemplate>

                            <asp:Label ID="lblEndDate" runat="server" ItemStyle-HorizontalAlign="Left"></asp:Label>
                        </ItemTemplate>

                        <EditItemTemplate>

                            <asp:TextBox ID="tbxEndDate" runat="server" TextMode="Date"></asp:TextBox></br>

                    <asp:CompareValidator ID="compEndDateValidator" Display="Dynamic" runat="server" ControlToValidate="tbxEndDate"
                        ErrorMessage="Invalid EndDate " ControlToCompare="tbxStartDate" Operator="GreaterThanEqual" SetFocusOnError="True"
                        Type="Date" ForeColor="Red">
                    </asp:CompareValidator><br />

                            <asp:RequiredFieldValidator ID="rqValidatorEnddate" Display="Dynamic" runat="server" ErrorMessage="Required"
                                ControlToValidate="tbxEndDate" ForeColor="Red" ValidationGroup="updateValidation">
                            </asp:RequiredFieldValidator>

                        </EditItemTemplate>

                        <FooterTemplate>
                            <asp:TextBox ID="tbxEndDateFooter" runat="server" TextMode="Date" ItemStyle-HorizontalAlign="center"></asp:TextBox>

                            <asp:CompareValidator ID="compEndDateValidator" runat="server" ControlToValidate="tbxEndDateFooter" Display="Dynamic"
                                ErrorMessage="Invalid EndDate " ControlToCompare="tbxStartDateFooter" Operator="GreaterThanEqual" SetFocusOnError="True"
                                Type="Date" ForeColor="Red">

                            </asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="rqValidatorEnddateFooter" runat="server" Display="Dynamic" ErrorMessage="Required"
                                ControlToValidate="tbxEndDateFooter" ForeColor="Red" ValidationGroup="addValidation">
                            </asp:RequiredFieldValidator>

                        </FooterTemplate>

                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Select">
                        <ItemTemplate>
                            <%--<asp:ImageButton ImageUrl="~/Images/selecte.jpg" CommandName="Select" ToolTip="Select" Width="20px" Height="20px" runat="server" />--%>
                            <asp:LinkButton CommandName="Select" runat="server"><i  class="fa fa-hand-o-up fa-2x" aria-hidden="true"></i></asp:LinkButton>
                        </ItemTemplate>


                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Edit">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnEdit" CommandName="Edit" runat="server"><i style="color:darkorange" class="fa fa-pencil fa-2x" aria-hidden="true"></i></asp:LinkButton>
                            <%--<asp:ImageButton ID="btnEdit" ImageUrl="~/Images/edit.png" CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" runat="server" />--%>
                        </ItemTemplate>


                        <EditItemTemplate>
                            <asp:LinkButton CommandName="Update" runat="server"><i style="color:green" class="fa fa-floppy-o fa-2x" aria-hidden="true"></i></asp:LinkButton>
                            <asp:LinkButton CommandName="Cancel" runat="server"><i style="color:darkred" class="fa fa-times fa-2x" aria-hidden="true"></i></asp:LinkButton>
                            <%--<asp:ImageButton ImageUrl="~/Images/save.png" CommandName="Update" ToolTip="Update" Width="23px" Height="23px" runat="server" 
                                ValidationGroup="updateValidation" />
                            <asp:ImageButton ImageUrl="~/Images/cancel.png" CommandName="Cancel" ToolTip="Cancel" Width="23px" Height="23px" runat="server" />--%>
                        </EditItemTemplate>

                        <FooterTemplate>
                            <asp:LinkButton ID="btnAdd" CommandName="AddNew" runat="server"><i style="color:forestgreen" class="fa fa-plus-circle fa-2x" aria-hidden="true"></i></asp:LinkButton>
                            <%--<asp:ImageButton ID="btnAdd" ImageUrl="~/Images/addnew.png" CommandName="AddNew" ToolTip="AddNew" 
                                Width="20px" Height="20px" runat="server" ValidationGroup="addValidation" />--%>
                        </FooterTemplate>

                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Delete">

                        <ItemTemplate>
                            <asp:LinkButton CommandName="Delete" runat="server"><i style="color:darkred" class="fa fa-trash-o fa-2x" aria-hidden="true"></i></asp:LinkButton>
                            <%--<asp:ImageButton ImageUrl="~/Images/delete.png" CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" runat="server" />--%>
                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>

            </asp:GridView>
        </div>
    </div>
    <%-- <asp:CompareValidator ID="compStartTodayValidator" Operator="GreaterThanEqual" Type="Date" ControlToValidate="gvSearchResult.tbxStartDate" ErrorMessage="The Invalid StartDate" runat="server"
                        ForeColor="Red" ValueToCompare="<%# DateTime.Today.ToShortDateString() %>" />
    <asp:RequiredFieldValidator ID="rqValidatorStartdate" runat="server" ErrorMessage="Invalid Date" ControlToValidate="tbxStartDate" ForeColor="Red">
    </asp:RequiredFieldValidator>--%>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblSuccessMsg" Text="" runat="server" ForeColor="Green" ViewStateMode="Disabled"></asp:Label>
            <asp:Label ID="lblErrorMsg" Text="" runat="server" ForeColor="Red" ViewStateMode="Disabled"></asp:Label>
        </div>
    </div>
        </div>

</asp:Content>
