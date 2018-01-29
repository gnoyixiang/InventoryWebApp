<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="TrendAnalysis.aspx.cs" Inherits="InventoryWebApp.TrendAnalysis" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>

    <div class="container-fluid">
        <h1>Trend Reporting and Analysis</h1>
        <h3><small class="text-muted">Trend Analysis for Different Comparison</small></h3>


        <div class="row">
            <div class="col-md-4">
                <asp:Label ID="lblAnalysisType" runat="server" Text="Please kindly Select Type of Analysis:">
                </asp:Label>
                <asp:RadioButtonList ID="rblAnalysisType" runat="server"></asp:RadioButtonList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="rblAnalysisType"
                    runat="server" ForeColor="Red" ErrorMessage="Please select Analysis Type!"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6">
                <asp:Label ID="lblCount" runat="server" Text="No. of Dept to be compared: "></asp:Label>
                <asp:DropDownList ID="ddlCount" runat="server"></asp:DropDownList>
                <asp:Label ID="lblMonthsCount" runat="server" Text="No. of Months/Year to be compared: "></asp:Label>
                <asp:DropDownList ID="ddlmonthsCount" runat="server"></asp:DropDownList>

                <asp:Button ID="btnAnalysis"
                    class="btn btn-primary" runat="server" Text="Click" OnClick="btnAnalysis_Click" />
            </div>
        </div>
        <br />
        <asp:Panel ID="PanelDept" runat="server" Visible="false">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblDept" runat="server" Text="Department1" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlDept" runat="server" Visible="false"></asp:DropDownList>
                    <asp:Label ID="lblDept2" runat="server" Text="Department2" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlDept2" runat="server" Visible="false"></asp:DropDownList>
                    <asp:Label ID="lblDept3" runat="server" Text="Department3" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlDept3" runat="server" Visible="false"></asp:DropDownList>
                    <asp:CustomValidator ID="cvalidDept"  OnServerValidate="cvalidDept_ServerValidate" 
                         Display="Dynamic" runat="server" forecolor="Red" ErrorMessage="Department contains duplicate!!">
                    </asp:CustomValidator>
                </div>
            </div>
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblCatCode" runat="server" Text="Item Requested"></asp:Label>
                    <asp:DropDownList ID="ddlCatCode" runat="server"></asp:DropDownList>
                </div>
            </div>
            <br />
        </asp:Panel>
        <br />
        <asp:Panel ID="PanelSupplier" runat="server"  Visible="false">
            <div class="row">
                <div class="col-md-12">
                    <asp:Label ID="lblSupplier" runat="server" Text="Supplier Name1" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlSupplier" runat="server" Visible="false"></asp:DropDownList>
                    <asp:Label ID="lblSupplier2" runat="server" Text="Supplier Name2" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlSupplier2" runat="server" Visible="false"></asp:DropDownList>
                    <asp:Label ID="lblSupplier3" runat="server" Text="Supplier Name3" Visible="false"></asp:Label>
                    <asp:DropDownList ID="ddlSupplier3" runat="server" Visible="false"></asp:DropDownList>
                    <asp:CustomValidator ID="cvalidSup"  OnServerValidate="cvSupplier_ServerValidate" 
                         Display="Dynamic" runat="server" forecolor="Red" ErrorMessage="Supplier contains duplicate!!">
                    </asp:CustomValidator>
                </div>
                </div>
                <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Label ID="lblItemCode" runat="server" Text="ItemCode"></asp:Label>
                    <asp:DropDownList ID="ddlItemCode" runat="server"></asp:DropDownList>
                </div>
            </div>
        </asp:Panel>
        <asp:Panel ID="panelMonth" runat="server" Visible="false">
        <asp:Label ID="lblMonth" runat="server" Text="Month1" Visible="false"></asp:Label>
        <asp:TextBox ID="tbMonth" runat="server" TextMode="Month" Visible="false"></asp:TextBox>
        <asp:Label ID="lblMonth2" runat="server" Text="Month2" Visible="false"></asp:Label>
        <asp:TextBox ID="tbMonth2" runat="server" TextMode="Month" Visible="false"></asp:TextBox>
        <asp:Label ID="lblMonth3" runat="server" Text="Month3" Visible="false"></asp:Label>
        <asp:TextBox ID="tbMonth3" runat="server" TextMode="Month" Visible="false"></asp:TextBox>
        <asp:CustomValidator ID="cvMonth"  OnServerValidate="cvMonth_ServerValidate" 
                         runat="server" forecolor="Red" Display="Dynamic" ErrorMessage="Month contains duplicate!!">
                    </asp:CustomValidator>
        </asp:Panel>
        <asp:Panel ID="pYear" runat="server" Visible="false">
        <asp:Label ID="lblYear" runat="server" Text="Year1" Visible="false"></asp:Label>
        <asp:DropDownList ID="ddlYear" runat="server" Visible="false"></asp:DropDownList>
        <asp:Label ID="lblYear2" runat="server" Text="Year2" Visible="false"></asp:Label>
        <asp:DropDownList ID="ddlYear2" runat="server" Visible="false"></asp:DropDownList>
        <asp:Label ID="lblYear3" runat="server" Text="Year3" Visible="false"></asp:Label>
        <asp:DropDownList ID="ddlYear3" runat="server" Visible="false"></asp:DropDownList>
            </asp:Panel>
        <asp:CustomValidator ID="cvYear"  OnServerValidate="cvYear_ServerValidate" 
                         runat="server"  forecolor="Red" Display="Dynamic" ErrorMessage="Year contains duplicate!!">
                    </asp:CustomValidator>
        <br />
        <div class="row">
            <br />
            <div class="row">
                <div class="col-md-4">
                    <asp:Button ID="btnGenerateGraph" class="btn btn-primary" runat="server" Text="Generate Graph" OnClick="btnGenerateGraph_Click" Visible="false" />
                </div>
            </div>


        </div>
    </div>
    <br />
    <asp:Panel ID="PanelGraph" runat="server" Visible="true">
   <asp:Table id="tblAnalysis" 
       class="table"
        GridLines="Both" 
        HorizontalAlign="Center" 
        Runat="server"/>
    </asp:Panel>
    <br />



    <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto">

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

                }, <% if(count==3){%>{
                    name: '<%=SeriesTitle3%>',
                    data: <%=Seriesdata3%>,}
            <% }%>
                

                ]
            });
        </script>

    </div>

</asp:Content>
