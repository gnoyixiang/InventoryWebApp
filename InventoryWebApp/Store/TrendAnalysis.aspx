<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutWithoutAjax.Master" AutoEventWireup="true" CodeBehind="TrendAnalysis.aspx.cs"
    MaintainScrollPositionOnPostback="true" Inherits="InventoryWebApp.Store.TrendAnalysis" %>

<%@ MasterType VirtualPath="~/LayoutWithoutAjax.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="active">Trend Analysis</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <div class="row">
            <div class="col-md-12">
                <h3>Trend Reporting and Analysis</h3>
            </div>
        </div>
        <p>Trend Analysis for Different Comparison</p>


        <div class="row">
            <div class="col-md-6">
                <div style="margin-bottom: 10px">
                    <asp:Label ID="lblAnalysisType" runat="server" Text="Please kindly Select Type of Analysis:">
                    </asp:Label>
                </div>
                <div style="margin-bottom: 10px">
                    <asp:RadioButtonList ID="rblAnalysisType" runat="server"></asp:RadioButtonList>
                </div>
                <div style="margin-bottom: 10px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="rblAnalysisType"
                        runat="server" ForeColor="Red" ErrorMessage="Please select Analysis Type!"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-md-6">
                <div style="margin-bottom: 10px">
                    <asp:Label ID="lblCount" runat="server" Text="No. of Dept / Suppliers to be compared: "></asp:Label>
                    <asp:DropDownList ID="ddlCount" runat="server"></asp:DropDownList>
                </div>
                <div style="margin-bottom: 10px">
                    <asp:Label ID="lblMonthsCount" runat="server" Text="No. of Months / Year to be compared: "></asp:Label>
                    <asp:DropDownList ID="ddlmonthsCount" runat="server"></asp:DropDownList>
                </div>
                <div style="margin-bottom: 10px">
                    <asp:Button ID="btnAnalysis"
                        class="btn btn-primary" runat="server" Text="Select" OnClick="btnAnalysis_Click" />
                </div>
            </div>
        </div>
        <br />
        <asp:Panel ID="PanelDept" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblDept" runat="server" Text="Department 1" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlDept" runat="server" Visible="false" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblDept2" runat="server" Text="Department 2" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlDept2" runat="server" Visible="false" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblDept3" runat="server" Text="Department 3" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlDept3" runat="server" Visible="false" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:CustomValidator ID="cvalidDept" OnServerValidate="cvalidDept_ServerValidate"
                        Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Department contains duplicate!!">
                    </asp:CustomValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblCatCode" runat="server" Text="Item Requested"></asp:Label>
                    <asp:DropDownList ID="ddlCatCode" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <br />
        </asp:Panel>
        <br />
        <asp:Panel ID="PanelSupplier" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblSupplier" runat="server" Text="Supplier Name1" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlSupplier" runat="server" Visible="false" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblSupplier2" runat="server" Text="Supplier Name2" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlSupplier2" runat="server" Visible="false" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblSupplier3" runat="server" Text="Supplier Name3" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlSupplier3" runat="server" Visible="false" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:CustomValidator ID="cvalidSup" OnServerValidate="cvSupplier_ServerValidate"
                        Display="Dynamic" runat="server" ForeColor="Red" ErrorMessage="Supplier contains duplicate!!">
                    </asp:CustomValidator>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblItemCode" runat="server" Text="ItemCode"></asp:Label>
                    <asp:DropDownList ID="ddlItemCode" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelMonth" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblMonth" runat="server" Text="Month1" Visible="false"></asp:Label>
                    <asp:TextBox ID="tbMonth" runat="server" TextMode="Month" Visible="false" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblMonth2" runat="server" Text="Month2" Visible="false"></asp:Label>
                    <asp:TextBox ID="tbMonth2" runat="server" TextMode="Month" Visible="false" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblMonth3" runat="server" Text="Month3" Visible="false"></asp:Label>
                    <asp:TextBox ID="tbMonth3" runat="server" TextMode="Month" Visible="false" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:CustomValidator ID="cvMonth" OnServerValidate="cvMonth_ServerValidate"
                        runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Month contains duplicate!!">
                    </asp:CustomValidator>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="pYear" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblYear" runat="server" Text="Year1" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlYear" runat="server" Visible="false"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblYear2" runat="server" Text="Year2" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlYear2" runat="server" Visible="false"></asp:DropDownList>
                </div>
                <div class="col-md-4">
                    <asp:Label ID="lblYear3" runat="server" Text="Year3" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlYear3" runat="server" Visible="false"></asp:DropDownList>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <asp:CustomValidator ID="cvYear" OnServerValidate="cvYear_ServerValidate"
                        runat="server" ForeColor="Red" Display="Dynamic" ErrorMessage="Year contains duplicate!!">
                    </asp:CustomValidator>
                </div>
            </div>
        </asp:Panel>

        <div class="row">
            <div class="col-md-4">
                <asp:Button ID="btnGenerateGraph" class="btn btn-primary" runat="server" Text="Generate Graph" OnClick="btnGenerateGraph_Click" Visible="false" />
            </div>
        </div>

        <br />
        <div>
            <div style="text-align: right; margin-bottom:10px">
                    <a href="#" onclick='printDiv("printArea")'><i class="fa fa-print fa-2x" aria-hidden="true"></i></a>
                </div>
        </div>
        <div id="printArea">
            <asp:Panel ID="PanelTable" runat="server" Visible="false">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped">
                            <tr style="background-color: #cfd8dc">
                                <th></th>
                                <% for (int i = 0; i < monthList.Count; i++)
                                    {  %>
                                <th><%= monthList[i].ToString("yyyy-MM") %></th>
                                <%} %>
                            </tr>
                            <tr>
                                <td><%= SeriesTitle1  %></td>
                                <% for (int i = 0; i < SeriesData1.Count; i++)
                                    { %>
                                <td><%= SeriesData1[i] %></td>
                                <%} %>
                            </tr>
                            <tr>
                                <td><%= SeriesTitle2  %></td>
                                <% for (int i = 0; i < SeriesData2.Count; i++)
                                    { %>
                                <td><%= SeriesData2[i] %></td>
                                <%} %>
                            </tr>
                            <% if (count == 3)
                                {%>
                            <tr>
                                <td><%= SeriesTitle3  %></td>
                                <% for (int i = 0; i < SeriesData3.Count; i++)
                                    { %>
                                <td><%= SeriesData3[i] %></td>
                                <%} %>
                            </tr>
                            <%} %>
                        </table>
                    </div>
                </div>
            </asp:Panel>
             <asp:Panel ID="PanelSupplierTable" runat="server" Visible="false">
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-striped">
                            <tr style="background-color: #cfd8dc">
                                <th></th>
                                <% for (int i = 0; i < yearList.Count; i++)
                                    {  %>
                                <th><%= yearList[i].ToString() %></th>
                                <%} %>
                            </tr>
                            <tr>
                                <td><%= SeriesTitle1  %></td>
                                <% for (int i = 0; i < SeriesData1.Count; i++)
                                    { %>
                                <td><%= SeriesData1[i] %></td>
                                <%} %>
                            </tr>
                            <tr>
                                <td><%= SeriesTitle2  %></td>
                                <% for (int i = 0; i < SeriesData2.Count; i++)
                                    { %>
                                <td><%= SeriesData2[i] %></td>
                                <%} %>
                            </tr>
                            <% if (count == 3)
                                {%>
                            <tr>
                                <td><%= SeriesTitle3  %></td>
                                <% for (int i = 0; i < SeriesData3.Count; i++)
                                    { %>
                                <td><%= SeriesData3[i] %></td>
                                <%} %>
                            </tr>
                            <%} %>
                        </table>
                    </div>
                </div>
            </asp:Panel>

            <div class="row">
                <div class="col-lg-12">
                    <div id="container" style="min-width: 100%; height: 400px; margin: 0 auto">
                        <script type="text/javascript">
                            /**
                             * (c) 2010-2017 Torstein Honsi
                             *
                             * License: www.highcharts.com/license
                             * 
                             * Sand-Signika theme for Highcharts JS
                             * @author Torstein Honsi
                             */

                            'use strict';
                            //import Highcharts from '../parts/Globals.js';
                            /* global document */
                            // Load the fonts
                            Highcharts.createElement('link', {
                                href: 'https://fonts.googleapis.com/css?family=Signika:400,700',
                                rel: 'stylesheet',
                                type: 'text/css'
                            }, null, document.getElementsByTagName('head')[0]);

                            // Add the background image to the container
                            Highcharts.wrap(Highcharts.Chart.prototype, 'getContainer', function (proceed) {
                                proceed.call(this);
                                this.container.style.background =
                                   'url(http://www.highcharts.com/samples/graphics/sand.png)';
                            });


                            Highcharts.theme = {
                                colors: ['#f45b5b', '#8085e9', '#8d4654', '#7798BF', '#aaeeee',
                                   '#ff0066', '#eeaaee', '#55BF3B', '#DF5353', '#7798BF', '#aaeeee'],
                                chart: {
                                    backgroundColor: null,
                                    style: {
                                        fontFamily: 'Signika, serif'
                                    }
                                },
                                title: {
                                    style: {
                                        color: 'black',
                                        fontSize: '16px',
                                        fontWeight: 'bold'
                                    }
                                },
                                subtitle: {
                                    style: {
                                        color: 'black'
                                    }
                                },
                                tooltip: {
                                    borderWidth: 0
                                },
                                legend: {
                                    itemStyle: {
                                        fontWeight: 'bold',
                                        fontSize: '13px'
                                    }
                                },
                                xAxis: {
                                    labels: {
                                        style: {
                                            color: '#6e6e70'
                                        }
                                    }
                                },
                                yAxis: {
                                    labels: {
                                        style: {
                                            color: '#6e6e70'
                                        }
                                    }
                                },
                                plotOptions: {
                                    series: {
                                        shadow: true
                                    },
                                    candlestick: {
                                        lineColor: '#404048'
                                    },
                                    map: {
                                        shadow: false
                                    }
                                },

                                // Highstock specific
                                navigator: {
                                    xAxis: {
                                        gridLineColor: '#D0D0D8'
                                    }
                                },
                                rangeSelector: {
                                    buttonTheme: {
                                        fill: 'white',
                                        stroke: '#C0C0C8',
                                        'stroke-width': 1,
                                        states: {
                                            select: {
                                                fill: '#D0D0D8'
                                            }
                                        }
                                    }
                                },
                                scrollbar: {
                                    trackBorderColor: '#C0C0C8'
                                },

                                // General
                                background2: '#E0E0E8'

                            };

                            // Apply the theme
                            Highcharts.setOptions(Highcharts.theme);
                            //function executeAfter() {
                            //    alert("execute after");
                            //}

                            Highcharts.chart('container', {
                                chart: {
                                    type: 'column'
                                },
                                title: {
                                    text: "<%=TrendTitle%>"
                            },
                            subtitle: {
                                text: '<%=TrendSubTitle%>'
                    },
                            xAxis: {
                                categories: <%=monthData%>,
                        crosshair: true
                    },
                            yAxis: {
                                min: 0,
                                title: {
                                    text: '<%=yAxisTitle%>'
                        }
                    },
                            tooltip: {
                                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                    '<td style="padding:0"><b>{point.y:.1f} </b></td></tr>',
                                footerFormat: '</table>',
                                shared: true,
                                useHTML: true
                            },
                            plotOptions: {
                                column: {
                                    pointPadding: 0.2,
                                    borderWidth: 0
                                }
                            },
                            series: [
                                {              
                                    name: '<%=SeriesTitle1%>',
                            data: <%=Seriesdata1%>,

                        }
                , {
                    name: '<%=SeriesTitle2%>',
                    data: <%=Seriesdata2%>,

                }, <% if (count == 3)
                            {%>{
                    name: '<%=SeriesTitle3%>',
                    data: <%=Seriesdata3%>,}
            <% }%>
                

                    ]
                        });
                        </script>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
