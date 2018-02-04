<%@ Page Title="" Language="C#" MasterPageFile="~/LayoutWithoutAjax.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="InventoryWebApp.Store.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Styles -->
    <style>
        .list {
            min-height: 5vh;
        }

        .top {
            min-height: 14vh;
        }

        .bottom {
            min-height: 50vh;
        }

        .box {
            height: inherit;
            text-align: right;
            background-color: #fff;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 5px;
        }

            .box a {
                color: #1369b3;
            }

        .floatleft {
            float: left;
        }

        .floatright {
            float: right;
        }

        .disburseDate {
            font-weight: 400;
            font-size: 1em;
            text-align: left;
        }

        .row {
            margin-bottom: 20px;
        }

        .carousel-control{
            background-image: none !important;
            width: 5%;
            height: 50px;
            top: 350px;
        }
        .carousel-control span{
            color:#4f61ac;
        }

        /*.blink {
            color:orangered;
            animation: blinker 2s linear infinite;
        }

        @keyframes blinker {  
          50% { opacity: 0; }
        }*/
    </style>

    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>
    <script src="https://code.highcharts.com/modules/series-label.js"></script>

    <script>
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
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row top">
        <!-- # Pending orders -->
        <div class="col-sm-12 col-md-3">
            <a href="ViewPurchaseOrders?search=5&q=Pending">
                <div class="col-xs-12 box" style="color:#777">
                    <div class="floatleft">
                        <h2><i class="fa fa-shopping-cart"></i></h2>
                    </div>
                    <div>
                        <h2>
                            <asp:Label ID="lblPendingOrderQty" runat="server"></asp:Label></h2>
                    </div>
                    <h5>Pending PO</h5>
                </div>
            </a>
        </div>
        <!-- # Pending adjustments -->
        <div class="col-sm-12 col-md-3">
            <% if (Context.User.IsInRole("Store Clerk"))
                { %>
            <a href="StockAdjustmentList">
                <%}
                    else if (Context.User.IsInRole("Store Supervisor"))
                    { %>
                <a href="AdjustmentByStoreSupervisor">
                    <%}
                        else if (Context.User.IsInRole("Store Manager"))
                        { %>
                    <a href="AdjustmentByStoreManager">
                        <%} %>
                        <div class="col-xs-12 box" style="color:#ef4f00">
                            <div class="floatleft">
                                <h2><i class="fa fa-edit"></i></h2>
                            </div>
                            <div>
                                <h2>
                                    <asp:Label ID="lblPendingAdjQty" runat="server"></asp:Label></h2>
                            </div>
                            <h5>Pending adjustments</h5>
                        </div>
                    </a>
        </div>
        <!-- # Items below reorder level -->
        <div class="col-sm-12 col-md-3">
            <a href="CreateNewOrder">
                <div class="col-xs-12 box" style="color:red">
                    <div class="floatleft">
                        <h2><i class="fa fa-exclamation-circle" ></i></h2>
                    </div>
                    <div>
                        <h2>
                            <asp:Label ID="lblItemsBelowReorderLvl" runat="server"></asp:Label></h2>
                    </div>

                    <h5>Items below reorder level</h5>
                </div>
            </a>
        </div>
        <!-- # Total items in store -->
        <div class="col-sm-12 col-md-3">
            <a href="StockCardSearch">
                <div class="col-xs-12 box" style="color:#263263">
                    <div class="floatleft">
                        <h2><i class="fa fa-inbox"></i></h2>
                    </div>
                    <div>
                        <h2>
                            <asp:Label ID="lblTotalItemsInStore" runat="server"></asp:Label></h2>
                    </div>

                    <h5>Types of item in store</h5>
                </div>
            </a>
        </div>
    </div>
    <% if (Context.User.IsInRole("Store Clerk"))
        { %>
    <div class="row list">
        <div class="col-md-12 disburseDate">
            <div class="col-md-12" style="padding: 0;">
                <div class="floatleft">
                    <h4>Next Disbursement Date :
                    <asp:Label runat="server" ID="lblDisbursementDate" CssClass="blink"></asp:Label></h4>
                </div>
                <div class="floatright">
                    <h5>
                        <a href="DisbursementFormPage">View disbursement form</a></h5>
                </div>
            </div>
            <div class="col-md-12" style="padding: 0;">
                <asp:ListView runat="server" ID="listDisbursements">
                    <LayoutTemplate>
                        <table class="table table-hover">
                            <thead>
                                <tr class="info">
                                    <th>Department</th>
                                    <th>Collection Point</th>
                                    <th style="text-align: right">Collection Time</th>
                                    <th style="text-align: right">
                                    Total Item Quantity</t>
                                </tr>
                            </thead>
                            <tbody>
                                <tr id="itemPlaceholder" runat="server"></tr>
                            </tbody>
                        </table>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <tr>
                            <td><%# GetDepartmentName(Eval("DepartmentCode").ToString()) %></td>
                            <td><%# GetCollectionPtName(Eval("CollectionPointCode").ToString()) %></td>
                            <td align="right"><%# GetCollectionTimeString(Eval("CollectionPointCode").ToString()) %></td>
                            <td align="right"><%# GetTotalQty(Eval("DisbursementCode").ToString()) %></td>
                        </tr>
                    </ItemTemplate>
                    <EmptyDataTemplate>
                        <p>No pending disbursements.</p>
                    </EmptyDataTemplate>
                </asp:ListView>
            </div>
        </div>
    </div>
    <%} %>
    <div class="row bottom">
        <!-- bar chart total order qty by items in each category from start to now by dept -->

        <div class="col-md-12">
            <div id="chartCarousel" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                    <li data-target="#chartCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#chartCarousel" data-slide-to="1"></li>
                </ol>

                <div class="carousel-inner">                    
                    <div class="item" style="min-width: 100%; height: 400px; margin: 0 auto" id="chartDeptCat">
                    </div>                    
                    <div class="item active" style="min-width: 100%; height: 400px; margin: 0 auto" id="chartAllCat">
                    </div>                    
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#chartCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#chartCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>

    <script type="text/javascript">        
        Highcharts.chart('chartDeptCat', {
            chart: {
                type: 'column'
            },
            title: {
                text: '<%="Total Request Amount per Department per Category (as of " + DateTime.Now.ToString("d MMM yyyy") + ")"%>'
            },
            xAxis: {
                categories: <%= Serialize(GetCategories()) %>
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Percentage of item quantity requested (%)'
                }
            },
            tooltip: {
                pointFormat: '<span style="color:{series.color}">{series.name}</span>: <b>{point.y}</b> ({point.percentage:.0f}%)<br/>',
                shared: true
            },
            plotOptions: {
                column: {
                    stacking: 'percent'
                }
            },
            series: [
                <% foreach(InventoryWebApp.Models.Entities.Department d in GetDepartments()) { %>
                {
                    name: '<%= d.DepartmentName %>',
                    data: <%= Serialize(GetCategoryDeptRequestQtySeries(d.DepartmentCode)) %>
                },<%}%>
            ]
        });

        Highcharts.chart('chartAllCat', {
            chart: {
                type: 'column'
            },
            title: {
                text: '<%="Total Request Quantity per Item Category (as of " + DateTime.Now.ToString("d MMM yyyy") + ")"%>'
            },
            xAxis: {
                categories: <%= Serialize(GetCategories()) %>,
                crosshair: true
            },
            yAxis: {
                min: 0,
                title: {
                    text: 'Item quantity (units)'
                }
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y:.1f} units</b></td></tr>',
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
                    name: 'Total Request Quantity',
                    data: <%= Serialize(GetCategoryTotalRequestQtySeries())  %>
                }
            ]
        });
        
    </script>
    <script>
    </script>
</asp:Content>
