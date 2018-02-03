<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="MapTrial.aspx.cs" Inherits="InventoryWebApp.Store.MapTrial" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        na g,
        .as g {
            fill: white;
        }

        /*.na:hover g {
            fill: blue;
        }*/
        .na:hover g {
            fill: blue;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <ul class="breadcrumb">
        <li><a href="#">Home</a></li>
        <li class="breadcrumb-item active">Store Map</li>
    </ul>
    <div class="container-fluid" id="mainContainer">
        <?xml version="1.0" standalone="no" ?>
        <!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
        <svg xmlns="http://www.w3.org/2000/svg" version="1.1" width="100%" height="100%" xmlns:xlink="http://www.w3.org/1999/xlink" xlink="http://www.w3.org/1999/xlink" style="position: relative; overflow: hidden;" viewBox="-10.087 -3.667 3008.007 3001.667">
            <defs>
                <filter id="8edf5187-1e3b-4d90-88a0-6866207a8d58" x="-0.5" y="-0.5" width="2" height="2">
                    <feMerge>
                        <feMergeNode in="SourceGraphic" />
                    </feMerge>
                </filter>
            </defs>
            <g>
                <g width="2978.667" height="2978.667" transform="scale(1,1) translate(8.333,9.333)">
                    <g stroke="#4F81BD" opacity="1" stroke-width="2" stroke-dasharray="none" width="2978.667" height="2978.667" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="2978.667" height="2978.667" />
                    </g>
                </g>
                <g width="2981.507" height="88" transform="scale(1,1) translate(6.913,2900)">
                    <g stroke="#4F81BD" opacity="1" stroke-width="1" stroke-dasharray="none" width="2981.507" height="88" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="2981.507" height="88" />
                    </g>
                    <g transform="scale(1,1) translate(0,0)" fill="#FFFFFF" opacity="0.01" stroke="#FFFFFF">
                        <path d="M0.5,0.5 L152.508,0.5 L152.508,39.83 L0.5,39.83 z M152.508,0.5 L1042.145,0.5 L1042.145,39.83 L152.508,39.83 z M1042.145,0.5 L1426.675,0.5 L1426.675,39.83 L1042.145,39.83 z M1426.675,0.5 L1802.085,0.5 L1802.085,39.83 L1426.675,39.83 z M1802.085,0.5 L2109.608,0.5 L2109.608,39.83 L1802.085,39.83 z M2109.608,0.5 L2444.995,0.5 L2444.995,39.83 L2109.608,39.83 z M2444.995,0.5 L2981.007,0.5 L2981.007,39.83 L2444.995,39.83 z M0.5,39.83 L152.508,39.83 L152.508,87.5 L0.5,87.5 z M152.508,39.83 L1042.145,39.83 L1042.145,87.5 L152.508,87.5 z M1042.145,39.83 L1426.675,39.83 L1426.675,87.5 L1042.145,87.5 z M1426.675,39.83 L1802.085,39.83 L1802.085,87.5 L1426.675,87.5 z M1802.085,39.83 L2109.608,39.83 L2109.608,87.5 L1802.085,87.5 z M2109.608,39.83 L2444.995,39.83 L2444.995,87.5 L2109.608,87.5 z M2444.995,39.83 L2981.007,39.83 L2981.007,87.5 L2444.995,87.5 z" stroke-width="0" stroke-dasharray="none" />
                    </g>
                    <g width="147.0078866955612" height="28.330309761961367" transform="scale(1,1) translate(5.5,5.5)">
                        <text width="147.0078866955612" height="12.499999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="33.3387565612793" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Site:</tspan>
                        </text>
                    </g>
                    <g width="883.6370372180768" height="28.330309761961367" transform="scale(1,1) translate(157.508,5.5)">
                        <text width="883.6370372180768" height="15.277776718139648" transform="scale(1,1) translate(0,6.526266521910859)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="11.111" textLength="133.35501098632812" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Stationery Store</tspan>
                        </text>
                    </g>
                    <g width="378.5299039000686" height="28.330309761961367" transform="scale(1,1) translate(1047.145,5.5)">
                        <text width="378.5299039000686" height="27.777775764465332" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="53.342010498046875" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Drawing:</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="23.611" textLength="50.00813674926758" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">801506</tspan>
                        </text>
                    </g>
                    <g width="369.4106176415685" height="28.330309761961367" transform="scale(1,1) translate(1431.675,5.5)">
                        <text width="369.4106176415685" height="27.777775764465332" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="53.342010498046875" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Project:</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="23.611" textLength="58.34282684326172" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">0000416</tspan>
                        </text>
                    </g>
                    <g width="301.52259771718263" height="28.330309761961367" transform="scale(1,1) translate(1807.085,5.5)">
                        <text width="301.52259771718263" height="27.777775764465332" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="40.006507873535156" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Drawn:</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="23.611" textLength="33.3387565612793" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Name</tspan>
                        </text>
                    </g>
                    <g width="324.38708350704337" height="77" transform="scale(1,1) translate(2114.608,5.5)">
                        <text width="324.38708350704337" height="12.499999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="40.006507873535156" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Notes:</tspan>
                        </text>
                    </g>
                    <g width="525.0113811940341" height="77" transform="scale(1,1) translate(2449.995,5.5)">
                        <text width="525.0113811940341" height="15.277776718139648" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="11.111" textLength="266.7099914550781" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Logic University Store Floorplan</tspan>
                        </text>
                    </g>
                    <g width="147.0078866955612" height="37.66969023803863" transform="scale(1,1) translate(5.5,44.83)">
                        <text width="147.0078866955612" height="12.499999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="40.006507873535156" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Title:</tspan>
                        </text>
                    </g>
                    <g width="883.6370372180768" height="37.66969023803863" transform="scale(1,1) translate(157.508,44.83)">
                        <text width="883.6370372180768" height="19.444442749023438" transform="scale(1,1) translate(0,9.112623744507598)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="15.278" textLength="8.334689140319824" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">1</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.111111111111112" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="8.335" text-anchor="start" y="9.722" textLength="13.335502624511719" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">st</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="28.338" text-anchor="start" y="15.278" textLength="166.69375610351562" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Floor Office Remodel</tspan>
                        </text>
                    </g>
                    <g width="378.5299039000686" height="37.66969023803863" transform="scale(1,1) translate(1047.145,44.83)">
                        <text width="378.5299039000686" height="27.777775764465332" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="40.006507873535156" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Scale:</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="23.611" textLength="75.01219940185547" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">1/4":1'0"</tspan>
                        </text>
                    </g>
                    <g width="369.4106176415685" height="37.66969023803863" transform="scale(1,1) translate(1431.675,44.83)">
                        <text width="369.4106176415685" height="27.777775764465332" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="33.3387565612793" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Date:</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="23.611" textLength="83.34688568115234" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">01/30/2017</tspan>
                        </text>
                    </g>
                    <g width="301.52259771718263" height="37.66969023803863" transform="scale(1,1) translate(1807.085,44.83)">
                        <text width="301.52259771718263" height="27.777775764465332" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="11.11111111111111" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="9.722" textLength="26.671005249023438" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">Rev:</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="bold" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="23.611" textLength="8.334689140319824" style="font-family: Courier New, Courier, Lucida Sans Typewriter, Lucida Typewriter, monospace;">A</tspan>
                        </text>
                    </g>
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M0.5,39.33 L2109.608,39.33" fill="none" stroke-width="1" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M-0.5,38.33L1.5,38.33L1.5,40.33L-0.5,40.33z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="0">
                        <path d="M152.508,0.5 L152.508,87.5" fill="none" stroke-width="1" stroke-dasharray="1,1" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M151.508,-0.5L153.508,-0.5L153.508,1.5L151.508,1.5z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M1041.645,0.5 L1041.645,87.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M1040.645,-0.5L1042.645,-0.5L1042.645,1.5L1040.645,1.5z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M1426.175,0.5 L1426.175,87.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M1425.175,-0.5L1427.175,-0.5L1427.175,1.5L1425.175,1.5z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M1801.585,0.5 L1801.585,87.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M1800.585,-0.5L1802.585,-0.5L1802.585,1.5L1800.585,1.5z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M2109.108,0.5 L2109.108,87.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M2108.108,-0.5L2110.108,-0.5L2110.108,1.5L2108.108,1.5z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M2444.495,0.5 L2444.495,87.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M2443.495,-0.5L2445.495,-0.5L2445.495,1.5L2443.495,1.5z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g stroke="white" fill="none" stroke-opacity="0" stroke-width="3" stroke-dasharray="none" width="3" height="87" transform="scale(1,1) translate(3.5,0.5)">
                        <rect width="3" height="87" />
                    </g>
                    <g stroke="white" fill="none" stroke-opacity="0" stroke-width="3" stroke-dasharray="none" width="2980.507" height="3" transform="scale(1,1) translate(0.5,3.5)">
                        <rect width="2980.507" height="3" />
                    </g>
                </g>
                <g width="2425.667" height="2001.667" transform="scale(1,1) translate(287.5,112.5)">
                    <g transform="scale(1,1) translate(0,0)" fill="none" stroke="#000000" stroke-opacity="1">
                        <path d="M0,2001.667 L0,0 L2425.667,0 L2425.667,1459.667 L1867.5,1459.667 L1867.5,2001.667 L1159.5,2001.667 L1159.5,1852 L867.833,1852 L867.833,2001.667 L0,2001.667 z" stroke-width="8.333" stroke-dasharray="none" />
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,114.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,247.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,380.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,514.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,647.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,780.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,1115.833)">
                    <g class="na" width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,1249.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(297.167,1383.333)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="198" height="13.833" transform="rotate(90,287.5,1021.417) scale(1,1) translate(188.5,1014.5)">
                    <g width="198" height="13.833">
                        <g transform="scale(1.9571595534102384,0.9326058351687343) translate(0,0)">
                            <g>
                                <g width="84.167" height="12.833" transform="scale(1,1) translate(8.167,0.667)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="84.167" height="12.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="84.167" height="12.833" />
                                    </g>
                                </g>
                                <g width="6.667" height="12.833" transform="scale(1,1) translate(92,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M6.667,12.833 L0,12.833 L0,0 L6.667,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M5.667,11.833L7.667,11.833L7.667,13.833L5.667,13.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="7.5" height="12.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,12.833 L7.5,12.833 L7.5,0 L0,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,11.833L1,11.833L1,13.833L-1,13.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M78.302,-17.719 L78.302,-9.906 L70.49,-13.812 L78.302,-17.719 M119.698,-17.719 L119.698,-9.906 L127.51,-13.812 L119.698,-17.719 M215.719,-10.434 L207.906,-10.434 L211.812,-18.247 L215.719,-10.434 M215.719,24.268 L207.906,24.268 L211.812,32.08 L215.719,24.268" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M78.302,-17.719L78.302,-17.719L78.302,-17.719L78.302,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(180,115.791,-6) scale(1,1) translate(115.791,-6)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">7' 11"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,204,20.361) scale(1,1) translate(204,20.361)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">0' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(611.167,118.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(611.167,251.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(611.167,384.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(611.167,518.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(611.167,651.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(611.167,784.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(631.167,1115.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(631.167,1249.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(631.167,1382.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(966.5,1115.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(966.5,1249.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(1276.5,1115.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(1276.5,1249.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="512.167" height="52.833" transform="scale(1,1) translate(305.833,1034.833)">
                    <g width="512.167" height="52.833">
                        <g transform="scale(2.4007848703776133,1.0601865274051117) translate(0,0)">
                            <g>
                                <g width="212.333" height="48.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,48.833 L212.333,48.833 L0,48.833 L0,0 L212.333,0 L212.333,48.833 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="212.333" height="4.667" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,4.667 L212.333,4.667 L0,4.667 L0,0 L212.333,0 L212.333,4.667 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="212.333" height="4.667" transform="scale(1,1) translate(0.5,44.667)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,4.667 L212.333,4.667 L0,4.667 L0,0 L212.333,0 L212.333,4.667 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M234.87,-17.719 L234.87,-9.906 L227.058,-13.812 L234.87,-17.719 M277.296,-17.719 L277.296,-9.906 L285.109,-13.812 L277.296,-17.719 M529.885,9.066 L522.073,9.066 L525.979,1.253 L529.885,9.066 M529.885,43.768 L522.073,43.768 L525.979,51.58 L529.885,43.768" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M234.87,-17.719L234.87,-17.719L234.87,-17.719L234.87,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="34.613712310791016" height="15.624999046325684" transform="scale(1,1) translate(238.776,-21.625)" opacity="0">
                        <text width="34.613712310791016" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="34.613712310791016" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">20' 6"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,518.167,39.861) scale(1,1) translate(518.167,39.861)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 1"</tspan>
                        </text>
                    </g>
                </g>
                <g width="72.833" height="72.833" transform="scale(1,1) translate(814.167,1035.833)">
                    <g width="72.833" height="72.833">
                        <g transform="scale(0.9886833798453903,0.9909297266445402) translate(0,0)">
                            <g>
                                <g width="72.667" height="72.5" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <path d="M72.457,68.828 L72.247,65.103 L71.828,61.536 L71.251,57.916 L70.36,54.454 L69.416,50.939 L68.21,47.581 L67.004,44.329 L65.589,41.181 L63.963,37.981 L62.181,34.834 L58.249,29.115 L53.792,23.764 L51.276,21.141 L48.811,18.833 L46.19,16.525 L43.569,14.427 L40.633,12.433 L37.696,10.597 L34.708,8.813 L31.562,7.187 L28.259,5.666 L25.009,4.354 L21.496,3.253 L18.14,2.308 L14.628,1.521 L11.115,0.734 L7.288,0.315 L3.722,0.105 L0,0 L0,48.998 L1.206,48.998 L2.307,49.103 L4.771,49.418 L5.662,49.627 L9.28,50.834 L10.171,51.254 L11.01,51.831 L13.107,53.037 L14.942,54.349 L16.568,55.87 L18.245,57.601 L19.556,59.385 L20.762,61.431 L21.286,62.428 L21.706,63.372 L22.177,64.421 L22.492,65.418 L23.016,67.726 L23.488,70.244 L23.593,71.346 L23.593,72.5 L72.667,72.5 L72.457,68.828 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="68.333" height="68.167" transform="scale(1,1) translate(0.5,4.833)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <path d="M0,0 L0,40.302 L1.416,40.302 L2.832,40.459 L4.248,40.669 L5.664,40.879 L6.975,41.194 L8.286,41.614 L9.597,42.086 L10.908,42.453 L12.114,43.031 L13.321,43.66 L15.628,45.077 L17.778,46.599 L19.771,48.488 L21.607,50.43 L23.285,52.634 L24.596,54.89 L25.225,56.097 L25.75,57.304 L26.326,58.564 L26.746,59.875 L27.061,61.187 L27.428,62.499 L27.638,63.916 L27.847,65.333 L27.952,66.75 L27.952,68.167 L68.333,68.167 L68.228,64.703 L68.019,61.187 L67.547,57.881 L67.022,54.47 L66.236,51.217 L65.292,47.911 L64.19,44.762 L62.984,41.614 L61.673,38.675 L60.152,35.736 L58.474,32.798 L56.639,30.069 L54.803,27.34 L52.705,24.874 L50.66,22.355 L48.405,19.941 L45.993,17.737 L43.475,15.585 L40.958,13.486 L38.231,11.65 L35.504,9.97 L32.672,8.291 L29.683,6.769 L26.641,5.353 L23.599,4.146 L20.295,3.044 L17.149,2.204 L13.74,1.417 L10.489,0.787 L6.975,0.315 L3.619,0.105 L0,0 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M15.719,-17.719 L15.719,-9.906 L7.906,-13.812 L15.719,-17.719 M57.114,-17.719 L57.114,-9.906 L64.927,-13.812 L57.114,-17.719 M90.552,15.719 L82.74,15.719 L86.646,7.906 L90.552,15.719 M90.552,57.114 L82.74,57.114 L86.646,64.927 L90.552,57.114" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M15.719,-17.719L15.719,-17.719L15.719,-17.719L15.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(19.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,78.833,53.208) scale(1,1) translate(78.833,53.208)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="276.333" height="50.333" transform="rotate(270,863.333,1244.833) scale(1,1) translate(725.167,1219.667)">
                    <g width="276.333" height="50.333">
                        <g transform="scale(1.295314453330974,1.0100199724805794) translate(0,0)">
                            <g>
                                <g width="212.333" height="48.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,48.833 L212.333,48.833 L0,48.833 L0,0 L212.333,0 L212.333,48.833 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="212.333" height="4.667" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,4.667 L212.333,4.667 L0,4.667 L0,0 L212.333,0 L212.333,4.667 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="212.333" height="4.667" transform="scale(1,1) translate(0.5,44.667)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,4.667 L212.333,4.667 L0,4.667 L0,0 L212.333,0 L212.333,4.667 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M117.469,-17.719 L117.469,-9.906 L109.656,-13.812 L117.469,-17.719 M158.864,-17.719 L158.864,-9.906 L166.677,-13.812 L158.864,-17.719 M294.052,7.816 L286.24,7.816 L290.146,0.003 L294.052,7.816 M294.052,42.518 L286.24,42.518 L290.146,50.33 L294.052,42.518" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M117.469,-17.719L117.469,-17.719L117.469,-17.719L117.469,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(121.375,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">11' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(90,297.958,11.722) scale(1,1) translate(297.958,11.722)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 0"</tspan>
                        </text>
                    </g>
                </g>
                <g width="73" height="73" transform="rotate(180,874.667,1415) scale(1,1) translate(838.167,1378.5)">
                    <g width="73" height="73">
                        <g transform="scale(0.990945813208881,0.9931973003897222) translate(0,0)">
                            <g>
                                <g width="72.667" height="72.5" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <path d="M72.457,68.828 L72.247,65.103 L71.828,61.536 L71.251,57.916 L70.36,54.454 L69.416,50.939 L68.21,47.581 L67.004,44.329 L65.589,41.181 L63.963,37.981 L62.181,34.834 L58.249,29.115 L53.792,23.764 L51.276,21.141 L48.811,18.833 L46.19,16.525 L43.569,14.427 L40.633,12.433 L37.696,10.597 L34.708,8.813 L31.562,7.187 L28.259,5.666 L25.009,4.354 L21.496,3.253 L18.14,2.308 L14.628,1.521 L11.115,0.734 L7.288,0.315 L3.722,0.105 L0,0 L0,48.998 L1.206,48.998 L2.307,49.103 L4.771,49.418 L5.662,49.627 L9.28,50.834 L10.171,51.254 L11.01,51.831 L13.107,53.037 L14.942,54.349 L16.568,55.87 L18.245,57.601 L19.556,59.385 L20.762,61.431 L21.286,62.428 L21.706,63.372 L22.177,64.421 L22.492,65.418 L23.016,67.726 L23.488,70.244 L23.593,71.346 L23.593,72.5 L72.667,72.5 L72.457,68.828 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="68.333" height="68.167" transform="scale(1,1) translate(0.5,4.833)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <path d="M0,0 L0,40.302 L1.416,40.302 L2.832,40.459 L4.248,40.669 L5.664,40.879 L6.975,41.194 L8.286,41.614 L9.597,42.086 L10.908,42.453 L12.114,43.031 L13.321,43.66 L15.628,45.077 L17.778,46.599 L19.771,48.488 L21.607,50.43 L23.285,52.634 L24.596,54.89 L25.225,56.097 L25.75,57.304 L26.326,58.564 L26.746,59.875 L27.061,61.187 L27.428,62.499 L27.638,63.916 L27.847,65.333 L27.952,66.75 L27.952,68.167 L68.333,68.167 L68.228,64.703 L68.019,61.187 L67.547,57.881 L67.022,54.47 L66.236,51.217 L65.292,47.911 L64.19,44.762 L62.984,41.614 L61.673,38.675 L60.152,35.736 L58.474,32.798 L56.639,30.069 L54.803,27.34 L52.705,24.874 L50.66,22.355 L48.405,19.941 L45.993,17.737 L43.475,15.585 L40.958,13.486 L38.231,11.65 L35.504,9.97 L32.672,8.291 L29.683,6.769 L26.641,5.353 L23.599,4.146 L20.295,3.044 L17.149,2.204 L13.74,1.417 L10.489,0.787 L6.975,0.315 L3.619,0.105 L0,0 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M15.802,-17.719 L15.802,-9.906 L7.99,-13.812 L15.802,-17.719 M57.198,-17.719 L57.198,-9.906 L65.01,-13.812 L57.198,-17.719 M90.719,15.802 L82.906,15.802 L86.812,7.99 L90.719,15.802 M90.719,57.198 L82.906,57.198 L86.812,65.01 L90.719,57.198" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M15.802,-17.719L15.802,-17.719L15.802,-17.719L15.802,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(180,53.291,-6) scale(1,1) translate(53.291,-6)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(90,94.625,19.709) scale(1,1) translate(94.625,19.709)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="1293.167" height="58.167" transform="scale(1,1) translate(907.167,1404.5)">
                    <g width="1293.167" height="58.167">
                        <g transform="scale(6.061727891070582,1.1672085112441135) translate(0,0)">
                            <g>
                                <g width="212.333" height="48.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,48.833 L212.333,48.833 L0,48.833 L0,0 L212.333,0 L212.333,48.833 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="212.333" height="4.667" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,4.667 L212.333,4.667 L0,4.667 L0,0 L212.333,0 L212.333,4.667 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="212.333" height="4.667" transform="scale(1,1) translate(0.5,44.667)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#7F7F7F" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <path d="M212.333,4.667 L212.333,4.667 L0,4.667 L0,0 L212.333,0 L212.333,4.667 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M625.37,-17.719 L625.37,-9.906 L617.558,-13.812 L625.37,-17.719 M667.796,-17.719 L667.796,-9.906 L675.609,-13.812 L667.796,-17.719 M1310.885,11.732 L1303.073,11.732 L1306.979,3.92 L1310.885,11.732 M1310.885,46.434 L1303.073,46.434 L1306.979,54.247 L1310.885,46.434" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M625.37,-17.719L625.37,-17.719L625.37,-17.719L625.37,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="34.613712310791016" height="15.624999046325684" transform="scale(1,1) translate(629.276,-21.625)" opacity="0">
                        <text width="34.613712310791016" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="34.613712310791016" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">51' 9"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,1299.167,42.528) scale(1,1) translate(1299.167,42.528)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 4"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1568.167,1059.833)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1668.167,1059.833)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1568.167,593.167)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1668.167,593.167)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1568.167,359.833)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1668.167,359.833)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1568.167,126.5)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1668.167,126.5)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1863.833,1301.5)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1969.333,1301.5)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(2074.833,1301.5)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(966.833,1509.833)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1075.833,1509.833)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1184.833,1509.833)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1458.5,1509.833)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1568.833,1509.833)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1679.167,1509.833)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1789.5,1509.833)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1568.167,826.5)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1668.167,826.5)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1568.167,1293.167)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="98.833" height="98.667" transform="scale(1,1) translate(1668.167,1293.167)">
                    <g width="98.833" height="98.667">
                        <g transform="scale(0.9966352433711462,0.9966330574370492) translate(0,0)">
                            <g>
                                <g width="98.167" height="98" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="98.167" height="98" transform="scale(1,1) translate(0,0)" fill="#D8D8D8" fill-opacity="1" stroke-opacity="1">
                                        <rect width="98.167" height="98" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,65.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,78.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(65.667,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(33.333,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.5" transform="scale(1,1) translate(1,33.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.5" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,46.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(65.667,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(65.667,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(33.333,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(33.333,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                                <g width="30.5" height="30.667" transform="scale(1,1) translate(1,0.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="30.5" height="30.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="30.667" />
                                    </g>
                                </g>
                                <g width="30.5" height="5" transform="scale(1,1) translate(1,13.667)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="30.5" height="5" transform="scale(1,1) translate(0,0)" fill="#A5A5A5" fill-opacity="1" stroke-opacity="1">
                                        <rect width="30.5" height="5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M28.719,-17.719 L28.719,-9.906 L20.906,-13.812 L28.719,-17.719 M70.114,-17.719 L70.114,-9.906 L77.927,-13.812 L70.114,-17.719 M116.552,28.636 L108.74,28.636 L112.646,20.823 L116.552,28.636 M116.552,70.031 L108.74,70.031 L112.646,77.844 L116.552,70.031" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M28.719,-17.719L28.719,-17.719L28.719,-17.719L28.719,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(32.625,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="rotate(270,104.833,66.125) scale(1,1) translate(104.833,66.125)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">3' 11"</tspan>
                        </text>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1863.833,1176.5)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(1969.333,1176.5)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="115.333" height="68.667" transform="scale(1,1) translate(2074.833,1176.5)">
                    <g width="115.333" height="68.667">
                        <g transform="scale(1.0000029437201392,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="284.619" height="37.5" transform="scale(1,1) translate(1206.833,743)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="284.619" height="37.5" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="284.619" height="37.5" />
                    </g>
                    <g width="284.6191101074219" height="37.5" transform="scale(1,1) translate(0,0)">
                        <text width="284.6191101074219" height="37.5" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="30.208" textLength="284.6191101074219" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">TRACK STORAGE</tspan>
                        </text>
                    </g>
                </g>
                <g width="137.061" height="75" transform="scale(1,1) translate(1929.303,712.833)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="137.061" height="75" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="137.061" height="75" />
                    </g>
                    <g width="137.060546875" height="75" transform="scale(1,1) translate(0,0)">
                        <text width="137.060546875" height="75" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="3.711" text-anchor="start" y="30.208" textLength="120.37759399414062" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">ORDER</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="67.708" textLength="137.060546875" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">PICKING</tspan>
                        </text>
                    </g>
                </g>
                <g width="129.753" height="75" transform="scale(1,1) translate(1113.207,159.667)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="129.753" height="75" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="129.753" height="75" />
                    </g>
                    <g width="129.75257873535156" height="75" transform="scale(1,1) translate(0,0)">
                        <text width="129.75257873535156" height="75" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#A5A5A5" opacity="1" x="0" text-anchor="start" y="30.208" textLength="120.49151611328125" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">Inbound</tspan>
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#A5A5A5" opacity="1" x="15.771" text-anchor="start" y="67.708" textLength="98.20962524414062" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">Goods</tspan>
                        </text>
                    </g>
                </g>
                <g width="253.89" height="37.5" transform="scale(1,1) translate(2326.5,1309.667)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="253.89" height="37.5" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="253.89" height="37.5" />
                    </g>
                    <g width="253.8899383544922" height="37.5" transform="scale(1,1) translate(0,0)">
                        <text width="253.8899383544922" height="37.5" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#A5A5A5" opacity="1" x="0" text-anchor="start" y="30.208" textLength="253.8899383544922" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">Outbound Goods</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(926.5,118.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(926.5,251.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(926.5,384.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(926.5,518.167)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(926.5,651.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(926.5,784.833)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="0" height="187.833" transform="scale(1,1) translate(1178,234.667)">
                    <g transform="scale(1,1) translate(0,0)" fill="#BFBFBF" stroke="#BFBFBF" stroke-opacity="1">
                        <path d="M 0 0 L 0 144.337" fill="none" stroke-width="15.748" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M21.748,144.337L0,187.833L-21.748,144.337z" stroke="none" fill-opacity="1" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="0" height="146.333" transform="scale(1,1) translate(2453.445,1347.167)">
                    <g transform="scale(1,1) translate(0,0)" fill="#BFBFBF" stroke="#BFBFBF" stroke-opacity="1">
                        <path d="M 0 0 L 0 102.837" fill="none" stroke-width="15.748" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M21.748,102.837L0,146.333L-21.748,102.837z" stroke="none" fill-opacity="1" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="362.484" height="37.5" transform="scale(1,1) translate(314.841,984.667)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="362.484" height="37.5" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="362.484" height="37.5" />
                    </g>
                    <g width="362.4837341308594" height="37.5" transform="scale(1,1) translate(0,0)">
                        <text width="362.4837341308594" height="37.5" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#A5A5A5" opacity="1" x="0" text-anchor="start" y="30.208" textLength="362.4837341308594" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">Work in Progress Goods</tspan>
                        </text>
                    </g>
                </g>
                <g width="69.167" height="0" transform="scale(1,1) translate(677.325,1003.417)">
                    <g transform="scale(1,1) translate(0,0)" fill="#BFBFBF" stroke="#BFBFBF" stroke-opacity="1">
                        <path d="M 0 0 L 25.671 0" fill="none" stroke-width="15.748" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M25.671,-21.748L69.167,0L25.671,21.748z" stroke="none" fill-opacity="1" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="215.667" height="494.5" transform="rotate(180,2338.167,1916.25) scale(1,1) translate(2230.333,1669)">
                    <g width="215.667" height="494.5">
                        <g transform="scale(0.9928109767145499,0.9959717063278092) translate(0,0)">
                            <g>
                                <g width="178.5" height="388" transform="scale(1,1) translate(18.77,108)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="178.5" height="388" transform="scale(1,1) translate(0,0)" fill="#545454" fill-opacity="1" stroke-opacity="1">
                                        <rect width="178.5" height="388" />
                                    </g>
                                </g>
                                <g width="20.333" height="8.333" transform="scale(1,1) translate(23.603,482.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="url(#8245abd8-dbe9-44b0-8200-817afe32f443)" stroke-opacity="1" filter="url(#8edf5187-1e3b-4d90-88a0-6866207a8d58)">
                                        <linearGradient id="8245abd8-dbe9-44b0-8200-817afe32f443" x1="10.166666666666666" y1="0" x2="10.166666666666666" y2="8.333333333333332" gradientUnits="userSpaceOnUse">
                                            <stop offset="0%" style="stop-color: #F49F00; stop-opacity: 1;" />
                                            <stop offset="100%" style="stop-color: #B90000; stop-opacity: 1;" />
                                        </linearGradient>
                                        <path d="M0,0 L20.333,0 L14,8.333 L6.333,8.333 L0,0 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="20.333" height="8.333" transform="scale(1,1) translate(169.603,482.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="url(#358dcdca-3f9d-471b-8bdd-abd204a97977)" stroke-opacity="1" filter="url(#8edf5187-1e3b-4d90-88a0-6866207a8d58)">
                                        <linearGradient id="358dcdca-3f9d-471b-8bdd-abd204a97977" x1="10.166666666666666" y1="0" x2="10.166666666666666" y2="8.333333333333332" gradientUnits="userSpaceOnUse">
                                            <stop offset="0%" style="stop-color: #F49F00; stop-opacity: 1;" />
                                            <stop offset="100%" style="stop-color: #B90000; stop-opacity: 1;" />
                                        </linearGradient>
                                        <path d="M0,0 L20.333,0 L14,8.333 L6.333,8.333 L0,0 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="27.333" height="6.167" transform="rotate(341.3,14.103,89.417) scale(1,1) translate(0.437,86.333)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <path d="M0,1.233 a1.233,1.233 0 0,1 1.233,-1.233 l24.867,0 a1.233,1.233 0 0,1 1.233,1.233 l0,3.7 a1.233,1.233 0 0,1 -1.233,1.233 l-24.867,0 a1.233,1.233 0 0,1 -1.233,-1.233 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="27.167" height="6" transform="rotate(30.7,203.187,92.667) scale(1,1) translate(189.603,89.667)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <path d="M0,1.2 a1.2,1.2 0 0,1 1.2,-1.2 l24.767,0 a1.2,1.2 0 0,1 1.2,1.2 l0,3.6 a1.2,1.2 0 0,1 -1.2,1.2 l-24.767,0 a1.2,1.2 0 0,1 -1.2,-1.2 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="5.833" height="317.167" transform="scale(1,1) translate(196.77,165.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="5.833" height="317.167" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="5.833" height="317.167" />
                                    </g>
                                </g>
                                <g width="165.167" height="107.167" transform="scale(1,1) translate(25.77,2.167)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <path d="M0,106.301 L0,106.301 L11.774,22.087 L11.774,22.087 L11.774,22.087 L11.901,21.61 L12.03,21.138 L12.162,20.671 L12.296,20.209 L12.432,19.753 L12.571,19.302 L12.713,18.856 L12.857,18.415 L13.004,17.98 L13.153,17.55 L13.304,17.124 L13.458,16.705 L13.615,16.29 L13.773,15.88 L13.935,15.476 L14.099,15.077 L14.265,14.683 L14.434,14.295 L14.605,13.911 L14.779,13.533 L14.955,13.16 L15.134,12.793 L15.315,12.43 L15.498,12.073 L15.684,11.721 L15.873,11.374 L16.064,11.032 L16.258,10.695 L16.453,10.364 L16.652,10.038 L16.853,9.717 L17.056,9.402 L17.262,9.091 L17.47,8.786 L17.681,8.486 L17.895,8.191 L18.11,7.902 L18.329,7.617 L18.549,7.338 L18.772,7.064 L18.998,6.795 L19.226,6.532 L19.457,6.274 L19.69,6.02 L19.925,5.773 L20.163,5.53 L20.404,5.292 L20.647,5.06 L20.892,4.833 L21.14,4.611 L21.391,4.395 L21.644,4.183 L21.899,3.977 L22.157,3.776 L22.417,3.58 L22.68,3.39 L22.945,3.204 L23.213,3.024 L23.483,2.849 L23.755,2.679 L24.03,2.515 L24.308,2.356 L24.588,2.202 L24.871,2.053 L25.156,1.909 L25.443,1.771 L25.733,1.637 L26.025,1.509 L26.32,1.387 L26.618,1.269 L26.918,1.156 L27.22,1.049 L27.525,0.947 L27.832,0.851 L28.142,0.759 L28.454,0.673 L28.768,0.592 L29.086,0.516 L29.405,0.445 L29.727,0.379 L30.052,0.319 L30.379,0.264 L30.708,0.214 L31.04,0.17 L31.375,0.13 L31.712,0.096 L32.051,0.067 L32.393,0.043 L32.737,0.025 L33.084,0.011 L33.433,0.003 L33.785,0 L34.139,0.002 L34.496,0.01 L34.855,0.022 L35.217,0.04 L35.581,0.063 L35.948,0.092 L36.317,0.125 L36.317,0.125 L36.317,0.125 L138.136,0.125 L138.136,0.125 L138.136,0.125 L138.496,0.176 L138.853,0.232 L139.207,0.292 L139.558,0.358 L139.906,0.428 L140.252,0.503 L140.595,0.583 L140.935,0.668 L141.272,0.758 L141.606,0.853 L141.938,0.952 L142.267,1.057 L142.593,1.166 L142.916,1.281 L143.237,1.4 L143.554,1.524 L143.869,1.653 L144.181,1.787 L144.491,1.925 L144.797,2.069 L145.101,2.218 L145.402,2.371 L145.7,2.529 L145.995,2.692 L146.288,2.861 L146.578,3.033 L146.865,3.211 L147.149,3.394 L147.43,3.582 L147.709,3.774 L147.985,3.971 L148.258,4.174 L148.528,4.381 L148.795,4.593 L149.06,4.81 L149.322,5.032 L149.581,5.258 L149.837,5.49 L150.091,5.726 L150.341,5.968 L150.589,6.214 L150.834,6.465 L151.077,6.721 L151.316,6.982 L151.553,7.248 L151.787,7.518 L152.018,7.794 L152.247,8.074 L152.472,8.36 L152.695,8.65 L152.915,8.945 L153.132,9.245 L153.347,9.55 L153.558,9.86 L153.767,10.174 L153.973,10.494 L154.176,10.818 L154.377,11.148 L154.574,11.482 L154.769,11.821 L154.961,12.165 L155.151,12.514 L155.337,12.868 L155.521,13.226 L155.702,13.59 L155.88,13.958 L156.055,14.331 L156.228,14.71 L156.397,15.093 L156.564,15.481 L156.729,15.873 L156.89,16.271 L157.048,16.674 L157.204,17.081 L157.357,17.494 L157.507,17.911 L157.655,18.333 L157.799,18.76 L157.941,19.192 L158.08,19.629 L158.217,20.071 L158.35,20.517 L158.481,20.969 L158.609,21.425 L158.734,21.886 L158.856,22.353 L158.975,22.824 L159.092,23.299 L159.206,23.78 L159.317,24.266 L159.426,24.757 L159.531,25.252 L159.634,25.752 L159.734,26.258 L159.831,26.768 L159.925,27.283 L160.017,27.803 L160.106,28.327 L160.192,28.857 L160.192,28.857 L160.192,28.857 L165.167,107.292 L165.167,107.292 L165.167,107.292 L0,106.301 L0,106.301 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="157" height="35.833" transform="scale(1,1) translate(33.437,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="#545454" fill-opacity="1" stroke-opacity="1">
                                        <path d="M0,24.321 L0,24.321 L0.127,23.849 L0.256,23.382 L0.388,22.919 L0.522,22.46 L0.659,22.007 L0.797,21.557 L0.938,21.113 L1.082,20.673 L1.228,20.238 L1.376,19.807 L1.527,19.381 L1.68,18.96 L1.835,18.543 L1.992,18.131 L2.152,17.724 L2.315,17.321 L2.48,16.923 L2.647,16.529 L2.816,16.14 L2.988,15.756 L3.162,15.376 L3.339,15.001 L3.517,14.63 L3.699,14.265 L3.882,13.903 L4.068,13.547 L4.257,13.195 L4.447,12.847 L4.64,12.505 L4.836,12.166 L5.033,11.833 L5.234,11.504 L5.436,11.18 L5.641,10.86 L5.848,10.545 L6.058,10.235 L6.269,9.929 L6.484,9.628 L6.7,9.331 L6.919,9.039 L7.141,8.752 L7.364,8.469 L7.59,8.191 L7.819,7.918 L8.05,7.649 L8.283,7.385 L8.518,7.126 L8.756,6.871 L8.996,6.62 L9.239,6.375 L9.484,6.134 L9.731,5.897 L9.981,5.665 L10.233,5.438 L10.487,5.216 L10.744,4.998 L11.003,4.784 L11.264,4.576 L11.528,4.372 L11.794,4.172 L12.063,3.977 L12.334,3.787 L12.607,3.602 L12.882,3.421 L13.16,3.244 L13.441,3.073 L13.723,2.906 L14.008,2.743 L14.296,2.585 L14.585,2.432 L14.877,2.284 L15.172,2.14 L15.469,2 L15.768,1.866 L16.069,1.735 L16.373,1.61 L16.68,1.489 L16.988,1.373 L17.299,1.261 L17.612,1.154 L17.928,1.052 L18.246,0.954 L18.567,0.861 L18.889,0.773 L19.214,0.689 L19.542,0.609 L19.872,0.535 L20.204,0.465 L20.538,0.399 L20.875,0.339 L21.215,0.283 L21.556,0.231 L21.9,0.184 L22.247,0.142 L22.595,0.104 L22.946,0.071 L23.3,0.043 L23.656,0.019 L24.014,0 L24.014,0 L24.014,0 L132.324,0 L132.324,0 L132.324,0 L132.678,0.036 L133.029,0.078 L133.379,0.123 L133.726,0.174 L134.071,0.229 L134.414,0.288 L134.755,0.353 L135.094,0.422 L135.431,0.495 L135.766,0.573 L136.098,0.656 L136.428,0.744 L136.756,0.836 L137.083,0.933 L137.406,1.034 L137.728,1.14 L138.048,1.251 L138.365,1.366 L138.681,1.486 L138.994,1.61 L139.305,1.74 L139.614,1.873 L139.921,2.012 L140.226,2.155 L140.528,2.303 L140.829,2.455 L141.127,2.612 L141.423,2.774 L141.717,2.94 L142.009,3.111 L142.299,3.287 L142.587,3.467 L142.872,3.652 L143.155,3.841 L143.437,4.035 L143.716,4.234 L143.993,4.438 L144.268,4.646 L144.54,4.858 L144.811,5.076 L145.079,5.298 L145.346,5.524 L145.61,5.755 L145.872,5.991 L146.132,6.232 L146.39,6.477 L146.645,6.727 L146.899,6.981 L147.15,7.24 L147.399,7.504 L147.647,7.772 L147.892,8.045 L148.134,8.323 L148.375,8.605 L148.614,8.892 L148.85,9.183 L149.085,9.479 L149.317,9.78 L149.547,10.086 L149.775,10.396 L150,10.71 L150.224,11.03 L150.446,11.354 L150.665,11.682 L150.882,12.016 L151.097,12.353 L151.31,12.696 L151.521,13.043 L151.73,13.395 L151.937,13.751 L152.141,14.112 L152.343,14.478 L152.544,14.848 L152.742,15.223 L152.938,15.603 L153.131,15.987 L153.323,16.376 L153.513,16.77 L153.7,17.168 L153.885,17.571 L154.068,17.978 L154.249,18.39 L154.428,18.807 L154.605,19.228 L154.78,19.654 L154.952,20.085 L155.122,20.52 L155.291,20.96 L155.457,21.404 L155.621,21.854 L155.782,22.307 L155.942,22.766 L156.1,23.229 L156.255,23.697 L156.408,24.169 L156.559,24.646 L156.708,25.128 L156.855,25.614 L157,26.105 L157,26.105 L157,26.105 L153.522,35.833 L153.522,35.833 L153.522,35.833 L153.458,35.364 L153.391,34.899 L153.319,34.438 L153.244,33.981 L153.165,33.528 L153.081,33.08 L152.994,32.636 L152.903,32.195 L152.808,31.759 L152.709,31.327 L152.606,30.9 L152.499,30.476 L152.388,30.057 L152.274,29.642 L152.155,29.231 L152.032,28.824 L151.906,28.421 L151.776,28.023 L151.641,27.628 L151.503,27.238 L151.361,26.852 L151.215,26.47 L151.065,26.092 L150.911,25.719 L150.753,25.349 L150.591,24.984 L150.426,24.623 L150.256,24.266 L150.082,23.913 L149.905,23.565 L149.724,23.22 L149.538,22.88 L149.349,22.544 L149.156,22.212 L148.959,21.884 L148.758,21.561 L148.553,21.241 L148.344,20.926 L148.131,20.615 L147.914,20.308 L147.694,20.005 L147.469,19.706 L147.241,19.412 L147.008,19.122 L146.772,18.836 L146.532,18.554 L146.288,18.276 L146.04,18.002 L145.788,17.733 L145.532,17.467 L145.272,17.206 L145.008,16.949 L144.74,16.696 L144.469,16.448 L144.193,16.203 L143.913,15.963 L143.63,15.727 L143.343,15.495 L143.051,15.267 L142.756,15.043 L142.457,14.824 L142.154,14.608 L141.847,14.397 L141.536,14.19 L141.222,13.987 L140.903,13.788 L140.58,13.594 L140.254,13.403 L139.923,13.217 L139.589,13.035 L139.25,12.857 L138.908,12.683 L138.562,12.514 L138.212,12.348 L137.858,12.187 L137.5,12.03 L137.138,11.877 L136.772,11.728 L136.402,11.584 L136.029,11.443 L135.651,11.307 L135.27,11.175 L134.884,11.047 L134.495,10.923 L134.101,10.804 L133.704,10.688 L133.303,10.577 L132.898,10.47 L132.489,10.367 L132.076,10.268 L131.659,10.174 L131.239,10.083 L130.814,9.997 L130.385,9.915 L129.953,9.837 L129.516,9.763 L129.076,9.693 L128.632,9.628 L128.184,9.566 L128.184,9.566 L128.184,9.566 L22.358,9.566 L22.358,9.566 L22.358,9.566 L22.066,9.582 L21.777,9.603 L21.489,9.629 L21.203,9.66 L20.919,9.696 L20.636,9.736 L20.355,9.782 L20.076,9.832 L19.798,9.887 L19.522,9.947 L19.247,10.012 L18.975,10.082 L18.704,10.157 L18.434,10.236 L18.167,10.321 L17.901,10.41 L17.636,10.505 L17.374,10.604 L17.113,10.708 L16.853,10.817 L16.596,10.93 L16.34,11.049 L16.085,11.173 L15.833,11.301 L15.582,11.435 L15.333,11.573 L15.085,11.716 L14.839,11.864 L14.595,12.017 L14.352,12.175 L14.111,12.337 L13.872,12.505 L13.635,12.677 L13.399,12.855 L13.164,13.037 L12.932,13.224 L12.701,13.416 L12.472,13.613 L12.244,13.815 L12.019,14.021 L11.794,14.233 L11.572,14.449 L11.351,14.67 L11.132,14.897 L10.914,15.128 L10.699,15.364 L10.484,15.604 L10.272,15.85 L10.061,16.101 L9.852,16.356 L9.645,16.617 L9.439,16.882 L9.235,17.152 L9.032,17.427 L8.832,17.707 L8.633,17.992 L8.435,18.282 L8.24,18.576 L8.046,18.876 L7.853,19.18 L7.662,19.489 L7.473,19.803 L7.286,20.122 L7.1,20.446 L6.916,20.775 L6.734,21.109 L6.553,21.447 L6.374,21.791 L6.197,22.139 L6.021,22.492 L5.848,22.85 L5.675,23.213 L5.505,23.581 L5.336,23.954 L5.168,24.332 L5.003,24.714 L4.839,25.101 L4.677,25.494 L4.516,25.891 L4.357,26.293 L4.2,26.7 L4.044,27.112 L3.891,27.529 L3.738,27.95 L3.588,28.377 L3.439,28.808 L3.292,29.244 L3.146,29.685 L3.002,30.131 L2.86,30.582 L2.72,31.038 L2.581,31.499 L2.444,31.964 L2.308,32.435 L2.175,32.91 L2.042,33.39 L1.912,33.876 L1.783,34.366 L1.656,34.86 L1.656,34.86 L1.656,34.86 L0,24.321 L0,24.321 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="5.167" height="23.167" transform="scale(1,1) translate(105.437,21.667)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <path d="M2.418,23.167 L2.418,23.167 L0.324,5.911 L0.324,5.911 L0.324,5.911 L0.298,5.823 L0.274,5.735 L0.251,5.648 L0.228,5.561 L0.207,5.475 L0.187,5.389 L0.168,5.304 L0.15,5.22 L0.133,5.136 L0.116,5.053 L0.101,4.97 L0.087,4.888 L0.075,4.806 L0.063,4.725 L0.052,4.645 L0.042,4.565 L0.033,4.486 L0.025,4.408 L0.019,4.33 L0.013,4.252 L0.008,4.176 L0.005,4.1 L0.002,4.024 L0.001,3.949 L0,3.874 L0.001,3.801 L0.002,3.727 L0.005,3.655 L0.008,3.583 L0.013,3.511 L0.019,3.44 L0.025,3.37 L0.033,3.3 L0.042,3.231 L0.052,3.163 L0.063,3.095 L0.075,3.027 L0.088,2.961 L0.102,2.894 L0.117,2.829 L0.133,2.764 L0.15,2.699 L0.168,2.636 L0.187,2.572 L0.207,2.51 L0.229,2.448 L0.251,2.386 L0.274,2.325 L0.299,2.265 L0.324,2.205 L0.35,2.146 L0.378,2.088 L0.406,2.03 L0.436,1.972 L0.466,1.915 L0.498,1.859 L0.531,1.804 L0.564,1.749 L0.599,1.694 L0.635,1.64 L0.672,1.587 L0.709,1.535 L0.748,1.482 L0.788,1.431 L0.829,1.38 L0.871,1.33 L0.914,1.28 L0.958,1.231 L1.003,1.182 L1.049,1.134 L1.096,1.087 L1.145,1.04 L1.194,0.994 L1.244,0.949 L1.295,0.904 L1.348,0.859 L1.401,0.815 L1.455,0.772 L1.511,0.729 L1.567,0.687 L1.625,0.646 L1.683,0.605 L1.743,0.565 L1.804,0.525 L1.865,0.486 L1.928,0.447 L1.992,0.409 L2.056,0.372 L2.122,0.335 L2.189,0.299 L2.257,0.264 L2.326,0.229 L2.396,0.194 L2.467,0.16 L2.539,0.127 L2.612,0.094 L2.686,0.062 L2.761,0.031 L2.837,0 L2.837,0 L2.837,0 L2.905,0.013 L2.973,0.026 L3.039,0.041 L3.105,0.056 L3.169,0.072 L3.233,0.09 L3.296,0.108 L3.358,0.127 L3.419,0.148 L3.48,0.169 L3.539,0.191 L3.598,0.214 L3.655,0.238 L3.712,0.263 L3.768,0.289 L3.823,0.316 L3.877,0.344 L3.931,0.373 L3.983,0.403 L4.035,0.434 L4.086,0.466 L4.135,0.498 L4.184,0.532 L4.232,0.567 L4.28,0.602 L4.326,0.639 L4.371,0.677 L4.416,0.715 L4.46,0.755 L4.503,0.795 L4.545,0.836 L4.586,0.879 L4.626,0.922 L4.665,0.967 L4.704,1.012 L4.741,1.058 L4.778,1.105 L4.814,1.153 L4.849,1.202 L4.883,1.253 L4.916,1.304 L4.949,1.356 L4.98,1.409 L5.011,1.463 L5.041,1.517 L5.07,1.573 L5.098,1.63 L5.125,1.688 L5.151,1.747 L5.176,1.806 L5.201,1.867 L5.225,1.929 L5.247,1.991 L5.269,2.055 L5.29,2.119 L5.31,2.185 L5.33,2.251 L5.348,2.319 L5.366,2.387 L5.382,2.456 L5.398,2.527 L5.413,2.598 L5.427,2.67 L5.44,2.743 L5.452,2.818 L5.464,2.893 L5.474,2.969 L5.484,3.046 L5.493,3.124 L5.501,3.203 L5.508,3.283 L5.514,3.364 L5.519,3.445 L5.524,3.528 L5.527,3.612 L5.53,3.697 L5.532,3.782 L5.533,3.869 L5.533,3.957 L5.532,4.045 L5.53,4.135 L5.528,4.225 L5.524,4.317 L5.52,4.409 L5.515,4.503 L5.509,4.597 L5.502,4.692 L5.494,4.789 L5.485,4.886 L5.476,4.984 L5.465,5.083 L5.454,5.184 L5.442,5.285 L5.429,5.387 L5.415,5.49 L5.4,5.594 L5.385,5.699 L5.368,5.805 L5.351,5.911 L5.351,5.911 L5.351,5.911 L2.418,23.167 L2.418,23.167 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="146.167" height="66.5" transform="scale(1,1) translate(34.937,16.667)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="none" stroke-opacity="1">
                                        <path d="M6.694,66.006 L6.694,66.006 L141.122,66.006 L141.122,66.006 L141.122,66.006 L141.291,66.056 L141.457,66.104 L141.62,66.15 L141.781,66.193 L141.939,66.233 L142.094,66.271 L142.247,66.307 L142.396,66.341 L142.543,66.371 L142.687,66.4 L142.829,66.426 L142.967,66.45 L143.103,66.471 L143.236,66.49 L143.366,66.506 L143.494,66.52 L143.619,66.532 L143.74,66.541 L143.86,66.548 L143.976,66.552 L144.09,66.554 L144.201,66.553 L144.309,66.55 L144.414,66.545 L144.517,66.537 L144.617,66.527 L144.714,66.515 L144.808,66.5 L144.899,66.482 L144.988,66.462 L145.074,66.44 L145.157,66.415 L145.238,66.388 L145.316,66.359 L145.391,66.327 L145.463,66.293 L145.532,66.256 L145.599,66.217 L145.663,66.175 L145.724,66.131 L145.782,66.085 L145.837,66.036 L145.89,65.985 L145.94,65.931 L145.987,65.875 L146.032,65.816 L146.074,65.755 L146.113,65.692 L146.149,65.626 L146.182,65.558 L146.213,65.488 L146.241,65.415 L146.266,65.339 L146.288,65.261 L146.308,65.181 L146.324,65.098 L146.339,65.013 L146.35,64.926 L146.358,64.836 L146.364,64.744 L146.367,64.649 L146.367,64.552 L146.365,64.452 L146.359,64.35 L146.351,64.246 L146.34,64.139 L146.327,64.03 L146.31,63.918 L146.291,63.804 L146.269,63.687 L146.244,63.568 L146.217,63.447 L146.187,63.323 L146.154,63.197 L146.118,63.068 L146.079,62.937 L146.038,62.804 L145.994,62.668 L145.947,62.53 L145.897,62.389 L145.845,62.246 L145.79,62.101 L145.732,61.953 L145.671,61.802 L145.608,61.65 L145.541,61.495 L145.472,61.337 L145.401,61.177 L145.326,61.015 L145.249,60.85 L145.169,60.682 L145.086,60.513 L145,60.341 L144.912,60.166 L144.821,59.989 L144.727,59.81 L144.63,59.628 L144.531,59.444 L144.428,59.257 L144.428,59.257 L144.428,59.257 L108.879,0 L108.879,0 L108.879,0 L45.386,0 L45.386,0 L45.386,0 L2.892,56.788 L2.892,56.788 L2.892,56.788 L2.746,56.993 L2.604,57.196 L2.466,57.397 L2.332,57.595 L2.202,57.791 L2.075,57.984 L1.952,58.175 L1.833,58.365 L1.718,58.551 L1.606,58.736 L1.498,58.918 L1.394,59.098 L1.294,59.275 L1.197,59.451 L1.104,59.624 L1.015,59.794 L0.93,59.963 L0.848,60.129 L0.77,60.293 L0.696,60.455 L0.625,60.614 L0.559,60.771 L0.496,60.926 L0.437,61.078 L0.381,61.229 L0.33,61.376 L0.282,61.522 L0.238,61.665 L0.197,61.807 L0.161,61.945 L0.128,62.082 L0.099,62.216 L0.073,62.348 L0.052,62.478 L0.034,62.605 L0.02,62.73 L0.009,62.853 L0.003,62.973 L0,63.092 L0.001,63.208 L0.006,63.321 L0.014,63.433 L0.026,63.542 L0.042,63.648 L0.062,63.753 L0.085,63.855 L0.112,63.955 L0.143,64.053 L0.178,64.148 L0.216,64.241 L0.258,64.332 L0.304,64.421 L0.354,64.507 L0.407,64.591 L0.465,64.673 L0.525,64.752 L0.59,64.829 L0.659,64.904 L0.731,64.977 L0.807,65.047 L0.886,65.115 L0.97,65.181 L1.057,65.244 L1.148,65.305 L1.243,65.364 L1.341,65.421 L1.443,65.475 L1.549,65.527 L1.659,65.577 L1.772,65.624 L1.89,65.669 L2.011,65.712 L2.135,65.753 L2.264,65.791 L2.396,65.827 L2.532,65.861 L2.672,65.892 L2.815,65.921 L2.962,65.948 L3.113,65.973 L3.268,65.995 L3.426,66.015 L3.589,66.033 L3.755,66.048 L3.924,66.061 L4.098,66.072 L4.275,66.081 L4.456,66.087 L4.641,66.091 L4.829,66.093 L5.022,66.093 L5.218,66.09 L5.417,66.085 L5.621,66.077 L5.828,66.068 L6.039,66.056 L6.254,66.041 L6.472,66.025 L6.694,66.006 L6.694,66.006 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="26.167" height="21.5" transform="scale(1,1) translate(152.77,14.167)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="url(#0ae7a758-985e-46df-84bc-b334ed1b70f0)" stroke-opacity="1" filter="url(#8edf5187-1e3b-4d90-88a0-6866207a8d58)">
                                        <linearGradient id="0ae7a758-985e-46df-84bc-b334ed1b70f0" x1="13.163499905879666" y1="0" x2="13.163499905879666" y2="21.6121957566781" gradientUnits="userSpaceOnUse">
                                            <stop offset="0%" style="stop-color: #FFFFFF; stop-opacity: 1;" />
                                            <stop offset="100%" style="stop-color: #A0A0A0; stop-opacity: 1;" />
                                        </linearGradient>
                                        <path d="M0,0.433 L0,0.433 L0.328,0.384 L0.654,0.338 L0.978,0.295 L1.301,0.255 L1.622,0.218 L1.942,0.184 L2.259,0.153 L2.575,0.124 L2.889,0.099 L3.202,0.076 L3.513,0.057 L3.822,0.04 L4.129,0.026 L4.435,0.015 L4.739,0.007 L5.041,0.002 L5.342,0 L5.641,0.001 L5.938,0.004 L6.233,0.011 L6.527,0.02 L6.819,0.033 L7.11,0.048 L7.398,0.066 L7.685,0.088 L7.97,0.112 L8.254,0.139 L8.536,0.169 L8.816,0.201 L9.094,0.237 L9.371,0.276 L9.646,0.317 L9.92,0.362 L10.191,0.409 L10.461,0.459 L10.729,0.513 L10.996,0.569 L11.261,0.628 L11.524,0.69 L11.785,0.755 L12.045,0.822 L12.303,0.893 L12.559,0.967 L12.814,1.043 L13.067,1.123 L13.318,1.205 L13.567,1.29 L13.815,1.378 L14.061,1.469 L14.305,1.563 L14.548,1.66 L14.789,1.76 L15.028,1.863 L15.266,1.969 L15.502,2.077 L15.736,2.189 L15.968,2.303 L16.199,2.42 L16.428,2.541 L16.655,2.664 L16.881,2.79 L17.105,2.919 L17.327,3.051 L17.548,3.185 L17.766,3.323 L17.984,3.464 L18.199,3.607 L18.413,3.754 L18.625,3.903 L18.835,4.055 L19.043,4.211 L19.25,4.369 L19.456,4.53 L19.659,4.694 L19.861,4.86 L20.061,5.03 L20.259,5.203 L20.456,5.378 L20.651,5.557 L20.844,5.738 L21.036,5.923 L21.225,6.11 L21.413,6.3 L21.6,6.493 L21.785,6.689 L21.968,6.888 L22.149,7.09 L22.329,7.295 L22.506,7.502 L22.683,7.713 L22.857,7.926 L23.03,8.143 L23.201,8.362 L23.37,8.584 L23.538,8.809 L23.704,9.037 L23.868,9.268 L24.031,9.502 L24.192,9.739 L24.192,9.739 L24.192,9.739 L24.255,9.853 L24.317,9.966 L24.379,10.08 L24.439,10.194 L24.499,10.308 L24.557,10.422 L24.615,10.536 L24.672,10.65 L24.727,10.765 L24.782,10.88 L24.836,10.994 L24.889,11.109 L24.941,11.224 L24.991,11.34 L25.041,11.455 L25.09,11.57 L25.139,11.686 L25.186,11.802 L25.232,11.917 L25.277,12.033 L25.321,12.149 L25.365,12.266 L25.407,12.382 L25.448,12.499 L25.489,12.615 L25.528,12.732 L25.567,12.849 L25.604,12.966 L25.641,13.083 L25.677,13.2 L25.711,13.318 L25.745,13.435 L25.778,13.553 L25.81,13.671 L25.841,13.789 L25.871,13.907 L25.9,14.025 L25.928,14.143 L25.955,14.262 L25.981,14.38 L26.006,14.499 L26.031,14.618 L26.054,14.737 L26.076,14.856 L26.098,14.975 L26.118,15.095 L26.137,15.214 L26.156,15.334 L26.174,15.454 L26.19,15.574 L26.206,15.694 L26.221,15.814 L26.234,15.934 L26.247,16.055 L26.259,16.175 L26.27,16.296 L26.28,16.417 L26.289,16.538 L26.297,16.659 L26.304,16.78 L26.31,16.902 L26.315,17.023 L26.32,17.145 L26.323,17.267 L26.325,17.389 L26.327,17.511 L26.327,17.633 L26.326,17.755 L26.325,17.878 L26.323,18 L26.319,18.123 L26.315,18.246 L26.31,18.369 L26.303,18.492 L26.296,18.615 L26.288,18.738 L26.279,18.862 L26.269,18.985 L26.258,19.109 L26.246,19.233 L26.233,19.357 L26.219,19.481 L26.204,19.606 L26.188,19.73 L26.172,19.855 L26.154,19.979 L26.135,20.104 L26.116,20.229 L26.095,20.354 L26.074,20.479 L26.051,20.605 L26.028,20.73 L26.004,20.856 L25.978,20.982 L25.952,21.107 L25.925,21.233 L25.897,21.36 L25.868,21.486 L25.838,21.612 L25.838,21.612 L25.838,21.612 L25.703,21.378 L25.567,21.145 L25.431,20.915 L25.293,20.686 L25.155,20.46 L25.016,20.235 L24.875,20.013 L24.734,19.792 L24.591,19.574 L24.448,19.357 L24.303,19.143 L24.158,18.93 L24.012,18.72 L23.864,18.511 L23.716,18.305 L23.567,18.101 L23.416,17.898 L23.265,17.698 L23.113,17.499 L22.96,17.303 L22.805,17.109 L22.65,16.916 L22.494,16.726 L22.337,16.538 L22.178,16.351 L22.019,16.167 L21.859,15.985 L21.698,15.804 L21.536,15.626 L21.373,15.45 L21.209,15.275 L21.043,15.103 L20.877,14.933 L20.71,14.764 L20.542,14.598 L20.373,14.434 L20.203,14.272 L20.032,14.111 L19.86,13.953 L19.687,13.797 L19.513,13.643 L19.338,13.491 L19.162,13.34 L18.985,13.192 L18.807,13.046 L18.628,12.902 L18.449,12.76 L18.268,12.62 L18.086,12.481 L17.903,12.345 L17.719,12.211 L17.534,12.079 L17.348,11.949 L17.162,11.821 L16.974,11.695 L16.785,11.571 L16.595,11.449 L16.405,11.329 L16.213,11.21 L16.02,11.094 L15.826,10.98 L15.632,10.868 L15.436,10.758 L15.239,10.65 L15.042,10.544 L14.843,10.44 L14.643,10.338 L14.443,10.238 L14.241,10.14 L14.039,10.044 L13.835,9.95 L13.631,9.858 L13.425,9.768 L13.219,9.68 L13.011,9.595 L12.803,9.511 L12.593,9.429 L12.383,9.349 L12.171,9.271 L11.959,9.195 L11.745,9.121 L11.531,9.049 L11.315,8.979 L11.099,8.911 L10.882,8.846 L10.663,8.782 L10.444,8.72 L10.224,8.66 L10.002,8.602 L9.78,8.547 L9.557,8.493 L9.332,8.441 L9.107,8.391 L8.881,8.343 L8.654,8.298 L8.425,8.254 L8.196,8.212 L7.966,8.172 L7.735,8.135 L7.735,8.135 L7.735,8.135 L7.588,8.079 L7.442,8.022 L7.298,7.965 L7.156,7.908 L7.014,7.85 L6.874,7.792 L6.736,7.734 L6.599,7.674 L6.463,7.615 L6.329,7.555 L6.196,7.495 L6.065,7.434 L5.935,7.372 L5.806,7.311 L5.679,7.248 L5.553,7.186 L5.428,7.123 L5.305,7.059 L5.184,6.995 L5.063,6.931 L4.945,6.866 L4.827,6.801 L4.711,6.735 L4.596,6.669 L4.483,6.602 L4.371,6.535 L4.261,6.467 L4.152,6.399 L4.044,6.331 L3.938,6.262 L3.833,6.193 L3.73,6.123 L3.628,6.053 L3.527,5.982 L3.428,5.911 L3.33,5.839 L3.234,5.767 L3.139,5.695 L3.046,5.622 L2.953,5.549 L2.863,5.475 L2.773,5.401 L2.685,5.326 L2.599,5.251 L2.514,5.175 L2.43,5.099 L2.348,5.023 L2.267,4.946 L2.187,4.869 L2.109,4.791 L2.032,4.713 L1.957,4.634 L1.883,4.555 L1.81,4.475 L1.739,4.395 L1.67,4.315 L1.601,4.234 L1.534,4.152 L1.469,4.071 L1.405,3.988 L1.342,3.906 L1.281,3.823 L1.221,3.739 L1.162,3.655 L1.105,3.57 L1.05,3.486 L0.995,3.4 L0.943,3.314 L0.891,3.228 L0.841,3.141 L0.792,3.054 L0.745,2.967 L0.699,2.879 L0.655,2.79 L0.612,2.701 L0.57,2.612 L0.53,2.522 L0.491,2.432 L0.454,2.341 L0.418,2.25 L0.383,2.158 L0.35,2.066 L0.318,1.974 L0.288,1.881 L0.259,1.787 L0.231,1.694 L0.205,1.599 L0.18,1.505 L0.157,1.409 L0.135,1.314 L0.114,1.218 L0.095,1.121 L0.077,1.024 L0.061,0.927 L0.046,0.829 L0.032,0.731 L0.02,0.632 L0.009,0.533 L0,0.433 L0,0.433 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="26.167" height="21.5" transform="scale(1,1) translate(43.603,15.833)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="url(#a51e65fd-6f46-4d43-8908-a274e2e7c989)" stroke-opacity="1" filter="url(#8edf5187-1e3b-4d90-88a0-6866207a8d58)">
                                        <linearGradient id="a51e65fd-6f46-4d43-8908-a274e2e7c989" x1="13.170858879903589" y1="0" x2="13.170858879903589" y2="21.632992906883825" gradientUnits="userSpaceOnUse">
                                            <stop offset="0%" style="stop-color: #FFFFFF; stop-opacity: 1;" />
                                            <stop offset="100%" style="stop-color: #A0A0A0; stop-opacity: 1;" />
                                        </linearGradient>
                                        <path d="M26.342,0.614 L26.342,0.614 L26.012,0.554 L25.684,0.497 L25.358,0.443 L25.034,0.392 L24.712,0.344 L24.391,0.299 L24.072,0.258 L23.755,0.219 L23.439,0.184 L23.126,0.151 L22.814,0.122 L22.504,0.096 L22.195,0.073 L21.889,0.053 L21.584,0.037 L21.281,0.023 L20.98,0.013 L20.68,0.005 L20.382,0.001 L20.086,0 L19.792,0.002 L19.5,0.007 L19.209,0.015 L18.92,0.027 L18.633,0.041 L18.348,0.059 L18.064,0.079 L17.782,0.103 L17.502,0.13 L17.224,0.16 L16.947,0.193 L16.672,0.23 L16.399,0.269 L16.128,0.312 L15.859,0.357 L15.591,0.406 L15.325,0.458 L15.061,0.513 L14.799,0.571 L14.538,0.632 L14.279,0.697 L14.022,0.764 L13.767,0.835 L13.513,0.908 L13.261,0.985 L13.011,1.065 L12.763,1.148 L12.516,1.234 L12.272,1.323 L12.029,1.416 L11.787,1.511 L11.548,1.61 L11.31,1.712 L11.074,1.816 L10.84,1.924 L10.608,2.035 L10.377,2.15 L10.149,2.267 L9.922,2.387 L9.696,2.511 L9.473,2.638 L9.251,2.767 L9.031,2.9 L8.813,3.036 L8.596,3.175 L8.382,3.318 L8.169,3.463 L7.957,3.611 L7.748,3.763 L7.54,3.918 L7.335,4.076 L7.13,4.237 L6.928,4.401 L6.728,4.568 L6.529,4.738 L6.332,4.911 L6.137,5.088 L5.943,5.268 L5.751,5.45 L5.561,5.636 L5.373,5.825 L5.187,6.017 L5.002,6.213 L4.819,6.411 L4.638,6.612 L4.459,6.817 L4.281,7.025 L4.105,7.235 L3.931,7.449 L3.759,7.666 L3.588,7.886 L3.42,8.11 L3.253,8.336 L3.087,8.566 L2.924,8.798 L2.762,9.034 L2.602,9.273 L2.444,9.515 L2.288,9.76 L2.288,9.76 L2.288,9.76 L2.217,9.872 L2.148,9.985 L2.08,10.098 L2.012,10.211 L1.946,10.324 L1.881,10.437 L1.817,10.551 L1.754,10.664 L1.693,10.778 L1.632,10.892 L1.573,11.006 L1.514,11.12 L1.457,11.234 L1.401,11.349 L1.346,11.464 L1.292,11.578 L1.239,11.693 L1.187,11.808 L1.136,11.924 L1.087,12.039 L1.038,12.155 L0.991,12.27 L0.945,12.386 L0.9,12.502 L0.856,12.618 L0.813,12.735 L0.771,12.851 L0.73,12.968 L0.691,13.084 L0.652,13.201 L0.615,13.318 L0.578,13.436 L0.543,13.553 L0.509,13.67 L0.476,13.788 L0.444,13.906 L0.413,14.024 L0.384,14.142 L0.355,14.26 L0.328,14.379 L0.301,14.497 L0.276,14.616 L0.252,14.735 L0.229,14.854 L0.207,14.973 L0.186,15.092 L0.166,15.212 L0.148,15.331 L0.13,15.451 L0.114,15.571 L0.099,15.691 L0.084,15.811 L0.071,15.932 L0.059,16.052 L0.048,16.173 L0.039,16.294 L0.03,16.415 L0.022,16.536 L0.016,16.657 L0.01,16.779 L0.006,16.9 L0.003,17.022 L0.001,17.144 L0,17.266 L0,17.388 L0.001,17.511 L0.004,17.633 L0.007,17.756 L0.012,17.879 L0.017,18.002 L0.024,18.125 L0.032,18.248 L0.041,18.371 L0.051,18.495 L0.062,18.619 L0.075,18.742 L0.088,18.866 L0.103,18.991 L0.118,19.115 L0.135,19.239 L0.153,19.364 L0.172,19.489 L0.192,19.614 L0.213,19.739 L0.235,19.864 L0.259,19.989 L0.283,20.115 L0.309,20.241 L0.335,20.366 L0.363,20.492 L0.392,20.619 L0.422,20.745 L0.453,20.871 L0.485,20.998 L0.518,21.125 L0.553,21.251 L0.588,21.378 L0.625,21.506 L0.663,21.633 L0.663,21.633 L0.663,21.633 L0.789,21.391 L0.916,21.152 L1.044,20.914 L1.173,20.679 L1.304,20.446 L1.436,20.215 L1.568,19.986 L1.702,19.76 L1.837,19.535 L1.973,19.313 L2.11,19.093 L2.249,18.875 L2.388,18.659 L2.529,18.445 L2.67,18.234 L2.813,18.024 L2.957,17.817 L3.102,17.612 L3.248,17.409 L3.395,17.208 L3.543,17.01 L3.693,16.813 L3.843,16.619 L3.995,16.427 L4.148,16.237 L4.301,16.049 L4.456,15.863 L4.613,15.68 L4.77,15.498 L4.928,15.319 L5.088,15.142 L5.248,14.967 L5.41,14.794 L5.573,14.624 L5.736,14.455 L5.901,14.289 L6.068,14.125 L6.235,13.963 L6.403,13.803 L6.573,13.645 L6.743,13.49 L6.915,13.336 L7.088,13.185 L7.261,13.036 L7.437,12.889 L7.613,12.744 L7.79,12.602 L7.968,12.461 L8.148,12.323 L8.328,12.187 L8.51,12.053 L8.693,11.921 L8.877,11.791 L9.062,11.664 L9.248,11.539 L9.435,11.415 L9.624,11.294 L9.813,11.175 L10.004,11.059 L10.195,10.944 L10.388,10.832 L10.582,10.721 L10.777,10.613 L10.973,10.507 L11.171,10.403 L11.369,10.302 L11.569,10.202 L11.769,10.105 L11.971,10.01 L12.174,9.917 L12.378,9.826 L12.583,9.737 L12.789,9.65 L12.996,9.566 L13.205,9.484 L13.414,9.404 L13.625,9.326 L13.837,9.25 L14.049,9.176 L14.263,9.105 L14.479,9.035 L14.695,8.968 L14.912,8.903 L15.13,8.84 L15.35,8.779 L15.571,8.721 L15.792,8.664 L16.015,8.61 L16.239,8.558 L16.464,8.508 L16.691,8.46 L16.918,8.415 L17.146,8.371 L17.376,8.33 L17.607,8.291 L17.838,8.254 L18.071,8.219 L18.305,8.186 L18.54,8.155 L18.54,8.155 L18.54,8.155 L18.668,8.101 L18.794,8.046 L18.92,7.99 L19.044,7.934 L19.167,7.878 L19.29,7.821 L19.411,7.763 L19.532,7.706 L19.651,7.647 L19.77,7.589 L19.887,7.53 L20.004,7.47 L20.119,7.41 L20.234,7.35 L20.347,7.289 L20.46,7.228 L20.571,7.166 L20.682,7.104 L20.791,7.041 L20.9,6.978 L21.007,6.915 L21.114,6.851 L21.219,6.787 L21.324,6.722 L21.428,6.657 L21.53,6.591 L21.632,6.525 L21.732,6.458 L21.832,6.391 L21.931,6.324 L22.028,6.256 L22.125,6.188 L22.221,6.119 L22.315,6.05 L22.409,5.981 L22.502,5.91 L22.593,5.84 L22.684,5.769 L22.774,5.698 L22.862,5.626 L22.95,5.554 L23.037,5.481 L23.123,5.408 L23.207,5.334 L23.291,5.26 L23.374,5.186 L23.456,5.111 L23.537,5.036 L23.616,4.96 L23.695,4.884 L23.773,4.807 L23.85,4.73 L23.926,4.653 L24,4.575 L24.074,4.497 L24.147,4.418 L24.219,4.338 L24.29,4.259 L24.36,4.179 L24.429,4.098 L24.496,4.017 L24.563,3.936 L24.629,3.854 L24.694,3.772 L24.758,3.689 L24.821,3.606 L24.883,3.522 L24.944,3.438 L25.004,3.353 L25.063,3.268 L25.121,3.183 L25.178,3.097 L25.234,3.011 L25.289,2.924 L25.343,2.837 L25.396,2.75 L25.448,2.662 L25.499,2.573 L25.549,2.484 L25.598,2.395 L25.646,2.305 L25.693,2.215 L25.739,2.124 L25.784,2.033 L25.828,1.942 L25.872,1.85 L25.914,1.757 L25.955,1.664 L25.995,1.571 L26.034,1.477 L26.072,1.383 L26.109,1.289 L26.146,1.194 L26.181,1.098 L26.215,1.002 L26.248,0.906 L26.28,0.809 L26.312,0.712 L26.342,0.614 L26.342,0.614 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="160.833" height="0" transform="scale(1,1) translate(27.603,89)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,0 L160.833,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,-1L1,-1L1,1L-1,1z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="69.833" height="16" transform="scale(1,1) translate(34.937,92.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="69.833" height="16" transform="scale(1,1) translate(0,0)" fill="url(#7580d7af-0215-43b8-8ace-647591a4a5bf)" stroke-opacity="1" filter="url(#8edf5187-1e3b-4d90-88a0-6866207a8d58)">
                                        <linearGradient id="7580d7af-0215-43b8-8ace-647591a4a5bf" x1="0" y1="8" x2="69.833" y2="8" gradientUnits="userSpaceOnUse">
                                            <stop offset="0%" style="stop-color: #A5A5A5; stop-opacity: 1;" />
                                            <stop offset="50%" style="stop-color: #C3C3C3; stop-opacity: 1;" />
                                            <stop offset="100%" style="stop-color: #A5A5A5; stop-opacity: 1;" />
                                        </linearGradient>
                                        <rect width="69.833" height="16" />
                                    </g>
                                </g>
                                <g width="69.833" height="16" transform="scale(1,1) translate(112.437,92.167)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="69.833" height="16" transform="scale(1,1) translate(0,0)" fill="url(#eee55064-5064-4919-81f6-1cdd630bbfda)" stroke-opacity="1" filter="url(#8edf5187-1e3b-4d90-88a0-6866207a8d58)">
                                        <linearGradient id="eee55064-5064-4919-81f6-1cdd630bbfda" x1="0" y1="8" x2="69.833" y2="8" gradientUnits="userSpaceOnUse">
                                            <stop offset="0%" style="stop-color: #A5A5A5; stop-opacity: 1;" />
                                            <stop offset="50%" style="stop-color: #C3C3C3; stop-opacity: 1;" />
                                            <stop offset="100%" style="stop-color: #A5A5A5; stop-opacity: 1;" />
                                        </linearGradient>
                                        <rect width="69.833" height="16" />
                                    </g>
                                </g>
                                <g width="4.667" height="13.333" transform="scale(1,1) translate(98.27,90.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="4.667" height="13.333" transform="scale(1,1) translate(0,0)" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <rect width="4.667" height="13.333" />
                                    </g>
                                </g>
                                <g width="4.667" height="13.333" transform="scale(1,1) translate(174.77,90.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="4.667" height="13.333" transform="scale(1,1) translate(0,0)" fill="#000000" fill-opacity="1" stroke-opacity="1">
                                        <rect width="4.667" height="13.333" />
                                    </g>
                                </g>
                                <g width="27.167" height="11" transform="scale(1,1) translate(73.27,86)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,0 L27.167,11" fill="none" stroke-width="1.1666666666666665" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1.167,-1.167L1.167,-1.167L1.167,1.167L-1.167,1.167z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="27.167" height="10.833" transform="scale(1,1) translate(148.103,86.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,0 L27.167,10.833" fill="none" stroke-width="1.1666666666666665" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1.167,-1.167L1.167,-1.167L1.167,1.167L-1.167,1.167z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="7.667" height="26.833" transform="scale(1,1) translate(35.603,41.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,26.833 L7.667,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,25.833L1,25.833L1,27.833L-1,27.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="5.5" height="31.5" transform="scale(1,1) translate(177.437,40.167)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,0 L5.5,31.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,-1L1,-1L1,1L-1,1z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="0" height="35.333" transform="scale(1,1) translate(108.27,43.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,0 L0,35.333" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,-1L1,-1L1,1L-1,1z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="177.667" height="373.667" transform="scale(1,1) translate(19.103,108.833)">
                                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="177.667" height="373.667" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="177.667" height="373.667" />
                                    </g>
                                </g>
                                <g width="0" height="135.333" transform="scale(1,1) translate(107.103,165.667)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,0 L0,135.333" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,-1L1,-1L1,1L-1,1z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="12" height="43.333" transform="scale(1,1) translate(101.937,122.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <path d="M5.41,43.333 L5.41,43.333 L0.398,11.241 L0.398,11.241 L0.398,11.241 L0.359,11.067 L0.322,10.895 L0.287,10.725 L0.254,10.555 L0.223,10.387 L0.194,10.22 L0.167,10.054 L0.142,9.889 L0.119,9.726 L0.098,9.563 L0.079,9.402 L0.062,9.243 L0.047,9.084 L0.035,8.927 L0.024,8.77 L0.015,8.616 L0.008,8.462 L0.003,8.309 L0.001,8.158 L0,8.008 L0.001,7.859 L0.005,7.711 L0.01,7.565 L0.017,7.42 L0.027,7.276 L0.038,7.133 L0.052,6.992 L0.067,6.851 L0.084,6.712 L0.104,6.574 L0.125,6.438 L0.149,6.302 L0.174,6.168 L0.202,6.035 L0.232,5.903 L0.263,5.772 L0.297,5.643 L0.332,5.515 L0.37,5.388 L0.41,5.262 L0.451,5.138 L0.495,5.015 L0.541,4.892 L0.588,4.772 L0.638,4.652 L0.69,4.534 L0.744,4.416 L0.8,4.3 L0.857,4.186 L0.917,4.072 L0.979,3.96 L1.043,3.849 L1.109,3.739 L1.177,3.63 L1.247,3.523 L1.319,3.416 L1.393,3.311 L1.469,3.208 L1.547,3.105 L1.627,3.004 L1.709,2.904 L1.793,2.805 L1.879,2.707 L1.967,2.61 L2.057,2.515 L2.149,2.421 L2.243,2.328 L2.339,2.237 L2.438,2.146 L2.538,2.057 L2.64,1.969 L2.744,1.882 L2.851,1.797 L2.959,1.712 L3.069,1.629 L3.181,1.547 L3.296,1.467 L3.412,1.387 L3.53,1.309 L3.651,1.232 L3.773,1.156 L3.898,1.082 L4.024,1.008 L4.153,0.936 L4.283,0.865 L4.416,0.795 L4.55,0.727 L4.687,0.66 L4.825,0.594 L4.966,0.529 L5.108,0.465 L5.253,0.403 L5.4,0.342 L5.548,0.282 L5.699,0.223 L5.852,0.165 L6.006,0.109 L6.163,0.054 L6.322,0 L6.322,0 L6.322,0 L6.471,0.044 L6.619,0.09 L6.765,0.137 L6.909,0.185 L7.051,0.235 L7.191,0.286 L7.33,0.339 L7.466,0.393 L7.601,0.449 L7.734,0.506 L7.865,0.564 L7.994,0.624 L8.121,0.685 L8.247,0.747 L8.37,0.811 L8.492,0.877 L8.611,0.944 L8.729,1.012 L8.845,1.082 L8.96,1.153 L9.072,1.225 L9.182,1.299 L9.291,1.374 L9.398,1.451 L9.503,1.529 L9.606,1.609 L9.707,1.69 L9.806,1.772 L9.904,1.856 L9.999,1.941 L10.093,2.028 L10.185,2.116 L10.275,2.205 L10.363,2.296 L10.449,2.389 L10.533,2.482 L10.616,2.578 L10.697,2.674 L10.775,2.772 L10.852,2.871 L10.927,2.972 L11.001,3.074 L11.072,3.178 L11.141,3.283 L11.209,3.39 L11.275,3.497 L11.339,3.607 L11.401,3.717 L11.461,3.83 L11.519,3.943 L11.576,4.058 L11.63,4.174 L11.683,4.292 L11.734,4.411 L11.783,4.532 L11.83,4.654 L11.875,4.778 L11.919,4.902 L11.96,5.029 L12,5.156 L12.038,5.286 L12.074,5.416 L12.108,5.548 L12.14,5.681 L12.17,5.816 L12.199,5.952 L12.225,6.09 L12.25,6.229 L12.273,6.369 L12.294,6.511 L12.313,6.654 L12.331,6.799 L12.346,6.945 L12.36,7.093 L12.371,7.242 L12.381,7.392 L12.389,7.544 L12.395,7.697 L12.4,7.852 L12.402,8.008 L12.403,8.165 L12.401,8.324 L12.398,8.484 L12.393,8.646 L12.386,8.809 L12.377,8.973 L12.367,9.139 L12.354,9.307 L12.34,9.475 L12.324,9.645 L12.306,9.817 L12.286,9.99 L12.264,10.164 L12.24,10.34 L12.215,10.517 L12.187,10.696 L12.158,10.876 L12.127,11.058 L12.094,11.241 L12.094,11.241 L12.094,11.241 L5.41,43.333 L5.41,43.333 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="5.667" height="317.167" transform="scale(1,1) translate(13.437,165.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="5.667" height="317.167" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="5.667" height="317.167" />
                                    </g>
                                </g>
                                <g width="18.833" height="4.167" transform="rotate(86.7,189.52,55.417) scale(1,1) translate(180.103,53.333)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="url(#b7b0773c-abe5-4bd2-86dc-8f084ad4c80a)" stroke-opacity="1" filter="url(#8edf5187-1e3b-4d90-88a0-6866207a8d58)">
                                        <linearGradient id="b7b0773c-abe5-4bd2-86dc-8f084ad4c80a" x1="9.416666666666666" y1="0" x2="9.416666666666666" y2="4.166666666666666" gradientUnits="userSpaceOnUse">
                                            <stop offset="0%" style="stop-color: #F49F00; stop-opacity: 1;" />
                                            <stop offset="100%" style="stop-color: #B90000; stop-opacity: 1;" />
                                        </linearGradient>
                                        <path d="M6.333,0 L12.5,0 L18.833,4.167 L0,4.167 L6.333,0 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="18.833" height="4.167" transform="rotate(277.7,31.853,55.583) scale(1,1) translate(22.437,53.5)">
                                    <g transform="scale(1,1) translate(0,0)" stroke="#000000" fill="url(#06900889-4a99-4f0f-8899-dffb4f9465f2)" stroke-opacity="1" filter="url(#8edf5187-1e3b-4d90-88a0-6866207a8d58)">
                                        <linearGradient id="06900889-4a99-4f0f-8899-dffb4f9465f2" x1="9.416666666666666" y1="0" x2="9.416666666666666" y2="4.166666666666666" gradientUnits="userSpaceOnUse">
                                            <stop offset="0%" style="stop-color: #F49F00; stop-opacity: 1;" />
                                            <stop offset="100%" style="stop-color: #B90000; stop-opacity: 1;" />
                                        </linearGradient>
                                        <path d="M6.333,0 L12.5,0 L18.833,4.167 L0,4.167 L6.333,0 z" stroke-width="1" stroke-dasharray="none" />
                                    </g>
                                </g>
                                <g width="166.167" height="364.833" transform="scale(1,1) translate(24.27,112.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="166.167" height="364.833" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                                        <rect width="166.167" height="364.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M90.482,-17.719 L90.482,-9.906 L82.67,-13.812 L90.482,-17.719 M125.184,-17.719 L125.184,-9.906 L132.997,-13.812 L125.184,-17.719 M233.385,226.037 L225.573,226.037 L229.479,218.224 L233.385,226.037 M233.385,268.463 L225.573,268.463 L229.479,276.276 L233.385,268.463" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M90.482,-17.719L90.482,-17.719L90.482,-17.719L90.482,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(180,121.278,-6) scale(1,1) translate(121.278,-6)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">8' 8"</tspan>
                        </text>
                    </g>
                    <g width="34.613712310791016" height="15.624999046325684" transform="rotate(90,237.292,229.943) scale(1,1) translate(237.292,229.943)" opacity="0">
                        <text width="34.613712310791016" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="34.613712310791016" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">19' 9"</tspan>
                        </text>
                    </g>
                </g>
                <g width="0" height="650" transform="scale(1,1) translate(2207.833,116.667)">
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M0,0 L0,650" fill="none" stroke-width="8.333" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M-8.333,-8.333L8.333,-8.333L8.333,8.333L-8.333,8.333z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="500" height="0" transform="scale(1,1) translate(2207.833,766.667)">
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M0,0 L500,0" fill="none" stroke-width="8.333" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M-8.333,-8.333L8.333,-8.333L8.333,8.333L-8.333,8.333z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="500" height="0" transform="scale(1,1) translate(2207.833,426.5)">
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M0,0 L500,0" fill="none" stroke-width="8.333" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M-8.333,-8.333L8.333,-8.333L8.333,8.333L-8.333,8.333z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="123.833" height="68.667" transform="scale(1,1) translate(2583.667,428.5)">
                    <g width="123.833" height="68.667">
                        <g transform="scale(1.0737025826359297,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="123.833" height="68.667" transform="scale(1,1) translate(2461.333,428.5)">
                    <g width="123.833" height="68.667">
                        <g transform="scale(1.0737025826359297,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="124" height="68.667" transform="scale(1,1) translate(2338.667,428.5)">
                    <g width="124" height="68.667">
                        <g transform="scale(1.075147673595063,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="123.833" height="68.667" transform="scale(1,1) translate(2216.167,428.5)">
                    <g width="123.833" height="68.667">
                        <g transform="scale(1.0737025826359297,1.0000097359058904) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="189.833" height="69" transform="rotate(270,2669.25,663.667) scale(1,1) translate(2574.333,629.167)">
                    <g width="189.833" height="69">
                        <g transform="scale(1.6459586024526567,1.0048641520996084) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="189.833" height="69" transform="rotate(270,2549.583,663.667) scale(1,1) translate(2454.667,629.167)">
                    <g width="189.833" height="69">
                        <g transform="scale(1.6459586024526567,1.0048641520996084) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="189.833" height="69" transform="rotate(270,2311.083,663.5) scale(1,1) translate(2216.167,629)">
                    <g width="189.833" height="69">
                        <g transform="scale(1.6459586024526567,1.0048641520996084) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="189.833" height="69" transform="rotate(270,2430.25,663.667) scale(1,1) translate(2335.333,629.167)">
                    <g width="189.833" height="69">
                        <g transform="scale(1.6459586024526567,1.0048641520996084) translate(0,0)">
                            <g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,34.333)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                                <g width="114.333" height="33.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g stroke="#000000" opacity="1" stroke-width="1" stroke-dasharray="none" width="114.333" height="33.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="114.333" height="33.833" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                </g>
                <g width="140.771" height="37.5" transform="scale(1,1) translate(2390.114,251.333)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="140.771" height="37.5" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="140.771" height="37.5" />
                    </g>
                    <g width="140.771484375" height="37.5" transform="scale(1,1) translate(0,0)">
                        <text width="140.771484375" height="37.5" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="30.208" textLength="140.771484375" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">LOUNGE</tspan>
                        </text>
                    </g>
                </g>
                <g width="356.901" height="37.5" transform="scale(1,1) translate(2297.549,518)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="356.901" height="37.5" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="356.901" height="37.5" />
                    </g>
                    <g width="356.9010314941406" height="37.5" transform="scale(1,1) translate(0,0)">
                        <text width="356.9010314941406" height="37.5" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="30.208" textLength="356.9010314941406" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">QUALITY ASSURANCE</tspan>
                        </text>
                    </g>
                </g>
                <g width="0" height="250" transform="scale(1,1) translate(1446.833,1710.333)">
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M0,0 L0,250" fill="none" stroke-width="8.333" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M-8.333,-8.333L8.333,-8.333L8.333,8.333L-8.333,8.333z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="700" height="0" transform="scale(1,1) translate(1450.833,1712.5)">
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M0,0 L700,0" fill="none" stroke-width="8.333" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M-8.333,-8.333L8.333,-8.333L8.333,8.333L-8.333,8.333z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="0" height="250" transform="scale(1,1) translate(1156.667,1710.333)">
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M0,0 L0,250" fill="none" stroke-width="8.333" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M-8.333,-8.333L8.333,-8.333L8.333,8.333L-8.333,8.333z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="860.333" height="0" transform="scale(1,1) translate(291.667,1715.667)">
                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                        <path d="M0,0 L860.333,0" fill="none" stroke-width="8.333" stroke-dasharray="none" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M-8.333,-8.333L8.333,-8.333L8.333,8.333L-8.333,8.333z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(295.833,1514.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="152.833" height="140.5" transform="scale(1,1) translate(631.167,1514.5)">
                    <g width="152.833" height="140.5">
                        <g transform="scale(0.9945813437138565,0.9929329938024662) translate(0,0)">
                            <g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="150.5" height="7.667" transform="scale(1,1) translate(0.5,133.333)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="150.5" height="7.667" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="150.5" height="7.667" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(1.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                                <g width="7.833" height="140.5" transform="scale(1,1) translate(145.333,0.5)">
                                    <g stroke="#7F7F7F" opacity="1" stroke-width="1" stroke-dasharray="none" width="7.833" height="140.5" transform="scale(1,1) translate(0,0)" fill="#BFBFBF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="7.833" height="140.5" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M59.066,-17.719 L59.066,-9.906 L51.253,-13.812 L59.066,-17.719 M93.768,-17.719 L93.768,-9.906 L101.58,-13.812 L93.768,-17.719 M170.552,52.899 L162.74,52.899 L166.646,45.087 L170.552,52.899 M170.552,87.601 L162.74,87.601 L166.646,95.413 L170.552,87.601" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M59.066,-17.719L59.066,-17.719L59.066,-17.719L59.066,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(62.972,-21.625)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">6' 1"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,158.833,83.695) scale(1,1) translate(158.833,83.695)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">5' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="150.033" height="37.5" transform="scale(1,1) translate(2398.067,1607.667)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="150.033" height="37.5" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="150.033" height="37.5" />
                    </g>
                    <g width="150.0325469970703" height="37.5" transform="scale(1,1) translate(0,0)">
                        <text width="150.0325469970703" height="37.5" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="30.208" textLength="150.0325469970703" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">LOADING</tspan>
                        </text>
                    </g>
                </g>
                <g width="338.314" height="37.5" transform="scale(1,1) translate(531.926,1898.167)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="338.314" height="37.5" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="338.314" height="37.5" />
                    </g>
                    <g width="338.31378173828125" height="37.5" transform="scale(1,1) translate(0,0)">
                        <text width="338.31378173828125" height="37.5" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="30.208" textLength="338.31378173828125" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">STATIONERY OFFICE</tspan>
                        </text>
                    </g>
                </g>
                <g width="338.314" height="37.5" transform="scale(1,1) translate(1606.926,1898)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="338.314" height="37.5" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="338.314" height="37.5" />
                    </g>
                    <g width="338.31378173828125" height="37.5" transform="scale(1,1) translate(0,0)">
                        <text width="338.31378173828125" height="37.5" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="33.333333333333336" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="30.208" textLength="338.31378173828125" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">STATIONERY OFFICE</tspan>
                        </text>
                    </g>
                </g>
                <g width="57.667" height="57.333" transform="rotate(90,2229.127,163.833) scale(1,1) translate(2200.294,135.167)">
                    <g width="57.667" height="57.333">
                        <g transform="scale(0.9857553071531118,0.9773838756051784) translate(0,0)">
                            <g>
                                <g width="56.5" height="43.993" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M56.5,43.993 L56.5,43.993 L56.392,41.736 L56.187,39.609 L55.897,37.594 L55.534,35.676 L55.106,33.845 L54.619,32.092 L54.079,30.41 L53.49,28.793 L52.855,27.236 L52.178,25.736 L51.461,24.29 L50.705,22.893 L49.914,21.545 L49.088,20.244 L48.228,18.986 L47.337,17.771 L46.414,16.598 L45.46,15.465 L44.477,14.371 L43.465,13.317 L42.424,12.3 L41.355,11.322 L40.258,10.38 L39.132,9.476 L37.979,8.608 L36.798,7.778 L35.59,6.985 L34.353,6.229 L33.088,5.511 L31.794,4.831 L30.471,4.189 L29.118,3.587 L27.734,3.026 L26.32,2.506 L24.873,2.029 L23.393,1.596 L21.879,1.21 L20.328,0.871 L18.739,0.583 L17.11,0.348 L15.439,0.17 L13.722,0.052 L11.956,0 L10.136,0.019 L8.258,0.115 L6.315,0.298 L4.299,0.578 L2.199,0.97 L0,1.493 L0,1.493 L0,43.326" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M55.5,42.993L57.5,42.993L57.5,44.993L55.5,44.993z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="56.833" height="14.167" transform="scale(1,1) translate(0.167,44.493)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="56.833" height="14.167" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="56.833" height="14.167" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M11.482,-17.719 L11.482,-9.906 L3.67,-13.812 L11.482,-17.719 M46.184,-17.719 L46.184,-9.906 L53.997,-13.812 L46.184,-17.719 M75.385,11.316 L67.573,11.316 L71.479,3.503 L75.385,11.316 M75.385,46.018 L67.573,46.018 L71.479,53.83 L75.385,46.018" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M11.482,-17.719L11.482,-17.719L11.482,-17.719L11.482,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(180,42.278,-6) scale(1,1) translate(42.278,-6)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 4"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,63.667,42.111) scale(1,1) translate(63.667,42.111)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 3"</tspan>
                        </text>
                    </g>
                </g>
                <g width="57.667" height="57.333" transform="rotate(90,2229.127,538.667) scale(1,1) translate(2200.294,510)">
                    <g width="57.667" height="57.333">
                        <g transform="scale(0.9857553071531118,0.9773838756051784) translate(0,0)">
                            <g>
                                <g width="56.5" height="43.993" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M56.5,43.993 L56.5,43.993 L56.392,41.736 L56.187,39.609 L55.897,37.594 L55.534,35.676 L55.106,33.845 L54.619,32.092 L54.079,30.41 L53.49,28.793 L52.855,27.236 L52.178,25.736 L51.461,24.29 L50.705,22.893 L49.914,21.545 L49.088,20.244 L48.228,18.986 L47.337,17.771 L46.414,16.598 L45.46,15.465 L44.477,14.371 L43.465,13.317 L42.424,12.3 L41.355,11.322 L40.258,10.38 L39.132,9.476 L37.979,8.608 L36.798,7.778 L35.59,6.985 L34.353,6.229 L33.088,5.511 L31.794,4.831 L30.471,4.189 L29.118,3.587 L27.734,3.026 L26.32,2.506 L24.873,2.029 L23.393,1.596 L21.879,1.21 L20.328,0.871 L18.739,0.583 L17.11,0.348 L15.439,0.17 L13.722,0.052 L11.956,0 L10.136,0.019 L8.258,0.115 L6.315,0.298 L4.299,0.578 L2.199,0.97 L0,1.493 L0,1.493 L0,43.326" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M55.5,42.993L57.5,42.993L57.5,44.993L55.5,44.993z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="56.833" height="14.167" transform="scale(1,1) translate(0.167,44.493)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="56.833" height="14.167" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="56.833" height="14.167" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M11.482,-17.719 L11.482,-9.906 L3.67,-13.812 L11.482,-17.719 M46.184,-17.719 L46.184,-9.906 L53.997,-13.812 L46.184,-17.719 M75.385,11.316 L67.573,11.316 L71.479,3.503 L75.385,11.316 M75.385,46.018 L67.573,46.018 L71.479,53.83 L75.385,46.018" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M11.482,-17.719L11.482,-17.719L11.482,-17.719L11.482,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(180,42.278,-6) scale(1,1) translate(42.278,-6)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 4"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,63.667,42.111) scale(1,1) translate(63.667,42.111)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 3"</tspan>
                        </text>
                    </g>
                </g>
                <g width="123.833" height="69.333" transform="scale(1,1) translate(1244.167,1903.977)">
                    <g width="123.833" height="69.333">
                        <g transform="scale(0.9841084762416055,0.9765258172240017) translate(0,0)">
                            <g>
                                <g width="122.833" height="14.5" transform="scale(1,1) translate(1,56.5)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="122.833" height="14.5" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="122.833" height="14.5" />
                                    </g>
                                </g>
                                <g width="61.333" height="54.5" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,54.5 L0,0 L0,0 L2.101,0.157 L4.148,0.374 L6.144,0.648 L8.093,0.976 L9.996,1.355 L11.857,1.781 L13.677,2.254 L15.459,2.77 L17.202,3.329 L18.91,3.928 L20.583,4.566 L22.221,5.243 L23.827,5.957 L25.401,6.706 L26.943,7.492 L28.455,8.311 L29.936,9.165 L31.388,10.052 L32.811,10.972 L34.204,11.925 L35.569,12.91 L36.905,13.927 L38.213,14.976 L39.493,16.057 L40.745,17.169 L41.968,18.313 L43.164,19.488 L44.331,20.696 L45.469,21.935 L46.579,23.207 L47.66,24.511 L48.712,25.849 L49.734,27.22 L50.726,28.624 L51.687,30.064 L52.616,31.538 L53.514,33.049 L54.379,34.597 L55.209,36.183 L56.005,37.808 L56.765,39.474 L57.487,41.182 L58.17,42.934 L58.813,44.732 L59.412,46.578 L59.967,48.475 L60.474,50.425 L60.931,52.432 L61.333,54.5 L61.333,54.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,53.5L1,53.5L1,55.5L-1,55.5z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="61.333" height="54.5" transform="scale(1,1) translate(62,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M61.333,54.5 L61.333,0 L61.333,0 L59.198,0.118 L57.121,0.301 L55.097,0.545 L53.124,0.845 L51.198,1.199 L49.317,1.603 L47.479,2.055 L45.682,2.553 L43.923,3.095 L42.202,3.679 L40.517,4.304 L38.868,4.968 L37.252,5.671 L35.67,6.411 L34.12,7.187 L32.601,7.999 L31.114,8.846 L29.657,9.728 L28.23,10.643 L26.833,11.592 L25.465,12.574 L24.127,13.588 L22.818,14.635 L21.537,15.715 L20.285,16.828 L19.062,17.972 L17.869,19.149 L16.704,20.359 L15.568,21.602 L14.461,22.878 L13.385,24.187 L12.338,25.53 L11.322,26.908 L10.337,28.32 L9.384,29.768 L8.463,31.253 L7.575,32.774 L6.722,34.335 L5.903,35.934 L5.12,37.574 L4.376,39.257 L3.67,40.984 L3.004,42.756 L2.382,44.576 L1.804,46.447 L1.274,48.371 L0.794,50.352 L0.368,52.394 L0,54.5 L0,54.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M60.333,53.5L62.333,53.5L62.333,55.5L60.333,55.5z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M41.219,-17.719 L41.219,-9.906 L33.406,-13.812 L41.219,-17.719 M82.614,-17.719 L82.614,-9.906 L90.427,-13.812 L82.614,-17.719 M141.552,17.316 L133.74,17.316 L137.646,9.503 L141.552,17.316 M141.552,52.018 L133.74,52.018 L137.646,59.83 L141.552,52.018" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M41.219,-17.719L41.219,-17.719L41.219,-17.719L41.219,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(45.125,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">4' 11"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,129.833,48.111) scale(1,1) translate(129.833,48.111)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 9"</tspan>
                        </text>
                    </g>
                </g>
                <g width="57.667" height="57.333" transform="rotate(90,1468.127,1773.333) scale(1,1) translate(1439.294,1744.667)">
                    <g width="57.667" height="57.333">
                        <g transform="scale(0.9857553071531118,0.9773838756051784) translate(0,0)">
                            <g>
                                <g width="56.5" height="43.993" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M56.5,43.993 L56.5,43.993 L56.392,41.736 L56.187,39.609 L55.897,37.594 L55.534,35.676 L55.106,33.845 L54.619,32.092 L54.079,30.41 L53.49,28.793 L52.855,27.236 L52.178,25.736 L51.461,24.29 L50.705,22.893 L49.914,21.545 L49.088,20.244 L48.228,18.986 L47.337,17.771 L46.414,16.598 L45.46,15.465 L44.477,14.371 L43.465,13.317 L42.424,12.3 L41.355,11.322 L40.258,10.38 L39.132,9.476 L37.979,8.608 L36.798,7.778 L35.59,6.985 L34.353,6.229 L33.088,5.511 L31.794,4.831 L30.471,4.189 L29.118,3.587 L27.734,3.026 L26.32,2.506 L24.873,2.029 L23.393,1.596 L21.879,1.21 L20.328,0.871 L18.739,0.583 L17.11,0.348 L15.439,0.17 L13.722,0.052 L11.956,0 L10.136,0.019 L8.258,0.115 L6.315,0.298 L4.299,0.578 L2.199,0.97 L0,1.493 L0,1.493 L0,43.326" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M55.5,42.993L57.5,42.993L57.5,44.993L55.5,44.993z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="56.833" height="14.167" transform="scale(1,1) translate(0.167,44.493)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="56.833" height="14.167" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="56.833" height="14.167" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M11.482,-17.719 L11.482,-9.906 L3.67,-13.812 L11.482,-17.719 M46.184,-17.719 L46.184,-9.906 L53.997,-13.812 L46.184,-17.719 M75.385,11.316 L67.573,11.316 L71.479,3.503 L75.385,11.316 M75.385,46.018 L67.573,46.018 L71.479,53.83 L75.385,46.018" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M11.482,-17.719L11.482,-17.719L11.482,-17.719L11.482,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(180,42.278,-6) scale(1,1) translate(42.278,-6)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 4"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,63.667,42.111) scale(1,1) translate(63.667,42.111)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 3"</tspan>
                        </text>
                    </g>
                </g>
                <g width="57.333" height="57.333" transform="rotate(90,1135.207,1783) scale(1,1) translate(1106.54,1754.333)">
                    <g width="57.333" height="57.333">
                        <g transform="scale(0.9772671564868979,1.0016130765148559) translate(0,0)">
                            <g>
                                <g width="56.667" height="43.908" transform="scale(1,1) translate(0.5,12.833)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M56.667,0 L56.667,0 L56.536,2.235 L56.311,4.344 L56.004,6.345 L55.627,8.25 L55.186,10.072 L54.687,11.816 L54.137,13.492 L53.538,15.102 L52.894,16.654 L52.209,18.149 L51.484,19.592 L50.721,20.984 L49.923,22.329 L49.09,23.629 L48.225,24.884 L47.328,26.097 L46.4,27.269 L45.441,28.4 L44.453,29.492 L43.437,30.546 L42.391,31.562 L41.318,32.54 L40.217,33.481 L39.088,34.385 L37.932,35.252 L36.748,36.083 L35.536,36.877 L34.296,37.633 L33.028,38.352 L31.732,39.033 L30.407,39.676 L29.053,40.279 L27.668,40.842 L26.252,41.364 L24.805,41.843 L23.324,42.278 L21.81,42.668 L20.259,43.01 L18.671,43.302 L17.044,43.541 L15.374,43.725 L13.66,43.849 L11.898,43.908 L10.083,43.898 L8.212,43.812 L6.276,43.641 L4.27,43.375 L2.182,43 L0,42.5 L0,42.5 L0,0.5" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M55.667,-1L57.667,-1L57.667,1L55.667,1z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="57" height="14" transform="scale(1,1) translate(0.667,0)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="57" height="14" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="57" height="14" />
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M11.316,-17.719 L11.316,-9.906 L3.503,-13.812 L11.316,-17.719 M46.018,-17.719 L46.018,-9.906 L53.83,-13.812 L46.018,-17.719 M75.052,11.316 L67.24,11.316 L71.146,3.503 L75.052,11.316 M75.052,46.018 L67.24,46.018 L71.146,53.83 L75.052,46.018" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M11.316,-17.719L11.316,-17.719L11.316,-17.719L11.316,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(180,42.111,-6) scale(1,1) translate(42.111,-6)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 3"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,63.333,42.111) scale(1,1) translate(63.333,42.111)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">2' 3"</tspan>
                        </text>
                    </g>
                </g>
                <g width="247.333" height="13.5" transform="scale(1,1) translate(2197,1565.417)">
                    <g width="247.333" height="13.5">
                        <g transform="scale(2.444802001061274,0.9101334054056324) translate(0,0)">
                            <g>
                                <g width="84.167" height="12.833" transform="scale(1,1) translate(8.167,0.667)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="84.167" height="12.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="84.167" height="12.833" />
                                    </g>
                                </g>
                                <g width="6.667" height="12.833" transform="scale(1,1) translate(92,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M6.667,12.833 L0,12.833 L0,0 L6.667,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M5.667,11.833L7.667,11.833L7.667,13.833L5.667,13.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="7.5" height="12.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,12.833 L7.5,12.833 L7.5,0 L0,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,11.833L1,11.833L1,13.833L-1,13.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M102.969,-17.719 L102.969,-9.906 L95.156,-13.812 L102.969,-17.719 M144.364,-17.719 L144.364,-9.906 L152.177,-13.812 L144.364,-17.719 M265.052,-10.601 L257.24,-10.601 L261.146,-18.413 L265.052,-10.601 M265.052,24.101 L257.24,24.101 L261.146,31.913 L265.052,24.101" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M102.969,-17.719L102.969,-17.719L102.969,-17.719L102.969,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(106.875,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">9' 11"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,253.333,20.195) scale(1,1) translate(253.333,20.195)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">0' 6"</tspan>
                        </text>
                    </g>
                </g>
                <g width="247.333" height="13.5" transform="scale(1,1) translate(2437.333,1565.417)">
                    <g width="247.333" height="13.5">
                        <g transform="scale(2.444802001061274,0.9101334054056324) translate(0,0)">
                            <g>
                                <g width="84.167" height="12.833" transform="scale(1,1) translate(8.167,0.667)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="84.167" height="12.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="84.167" height="12.833" />
                                    </g>
                                </g>
                                <g width="6.667" height="12.833" transform="scale(1,1) translate(92,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M6.667,12.833 L0,12.833 L0,0 L6.667,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M5.667,11.833L7.667,11.833L7.667,13.833L5.667,13.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="7.5" height="12.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,12.833 L7.5,12.833 L7.5,0 L0,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,11.833L1,11.833L1,13.833L-1,13.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M102.969,-17.719 L102.969,-9.906 L95.156,-13.812 L102.969,-17.719 M144.364,-17.719 L144.364,-9.906 L152.177,-13.812 L144.364,-17.719 M265.052,-10.601 L257.24,-10.601 L261.146,-18.413 L265.052,-10.601 M265.052,24.101 L257.24,24.101 L261.146,31.913 L265.052,24.101" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M102.969,-17.719L102.969,-17.719L102.969,-17.719L102.969,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(106.875,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">9' 11"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,253.333,20.195) scale(1,1) translate(253.333,20.195)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">0' 6"</tspan>
                        </text>
                    </g>
                </g>
                <g width="198" height="13.833" transform="scale(1,1) translate(1077.667,105.5)">
                    <g width="198" height="13.833">
                        <g transform="scale(1.9571595534102384,0.9326058351687343) translate(0,0)">
                            <g>
                                <g width="84.167" height="12.833" transform="scale(1,1) translate(8.167,0.667)">
                                    <g stroke="#BFBFBF" opacity="1" stroke-width="0" stroke-dasharray="none" width="84.167" height="12.833" transform="scale(1,1) translate(0,0)" fill="#FFFFFF" fill-opacity="1" stroke-opacity="1">
                                        <rect width="84.167" height="12.833" />
                                    </g>
                                </g>
                                <g width="6.667" height="12.833" transform="scale(1,1) translate(92,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M6.667,12.833 L0,12.833 L0,0 L6.667,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M5.667,11.833L7.667,11.833L7.667,13.833L5.667,13.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                                <g width="7.5" height="12.833" transform="scale(1,1) translate(0.5,0.5)">
                                    <g transform="scale(1,1) translate(0,0)" fill="#000000" stroke="#000000" stroke-opacity="1">
                                        <path d="M0,12.833 L7.5,12.833 L7.5,0 L0,0" fill="none" stroke-width="1" stroke-dasharray="none" />
                                        <g>
                                            <g stroke-dasharray="none">
                                                <path d="M-1,11.833L1,11.833L1,13.833L-1,13.833z" stroke-width="0" fill="none" />
                                            </g>
                                        </g>
                                    </g>
                                </g>
                            </g>
                        </g>
                    </g>
                    <g fill="#0000FF" stroke="#9999FF" stroke-opacity="1" transform="scale(1,1) translate(0,0)" opacity="0">
                        <path fill="none" stroke-width="0" stroke-dasharray="none" d="M78.302,-17.719 L78.302,-9.906 L70.49,-13.812 L78.302,-17.719 M119.698,-17.719 L119.698,-9.906 L127.51,-13.812 L119.698,-17.719 M215.719,-10.434 L207.906,-10.434 L211.812,-18.247 L215.719,-10.434 M215.719,24.268 L207.906,24.268 L211.812,32.08 L215.719,24.268" />
                        <g>
                            <g stroke-dasharray="none">
                                <path d="M78.302,-17.719L78.302,-17.719L78.302,-17.719L78.302,-17.719z" stroke-width="0" fill="none" />
                            </g>
                        </g>
                    </g>
                    <g width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(82.209,-21.625)" opacity="0">
                        <text width="33.5828971862793" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="33.5828971862793" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">7' 11"</tspan>
                        </text>
                    </g>
                    <g width="26.889375686645508" height="15.624999046325684" transform="rotate(270,204,20.361) scale(1,1) translate(204,20.361)" opacity="0">
                        <text width="26.889375686645508" height="15.624999046325684" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="13.88888888888889" font-weight="normal" font-style="normal" fill="#000" opacity="1" x="0" text-anchor="start" y="12.5" textLength="26.889375686645508" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">0' 7"</tspan>
                        </text>
                    </g>
                </g>
                <g width="176.187" height="21.875" transform="scale(1,1) translate(300,1675)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="176.187" height="21.875" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="176.187" height="21.875" />
                    </g>
                    <g width="176.18678283691406" height="21.875" transform="scale(1,1) translate(0,0)">
                        <text width="176.18678283691406" height="21.875" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="19.444444444444443" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="17.708" textLength="176.18678283691406" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">SHELVES A1 TO A4</tspan>
                        </text>
                    </g>
                </g>
                <g width="181.589" height="21.875" transform="scale(1,1) translate(613.966,1675)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="181.589" height="21.875" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="181.589" height="21.875" />
                    </g>
                    <g width="181.5890655517578" height="21.875" transform="scale(1,1) translate(0,0)">
                        <text width="181.5890655517578" height="21.875" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="19.444444444444443" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="17.708" textLength="181.5890655517578" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">SHELVES A5 TO  A8</tspan>
                        </text>
                    </g>
                </g>
                <g width="178.333" height="21.875" transform="scale(1,1) translate(306.074,944.792)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="178.333" height="21.875" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="178.333" height="21.875" />
                    </g>
                    <g width="178.33250427246094" height="21.875" transform="scale(1,1) translate(0,0)">
                        <text width="178.33250427246094" height="21.875" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="19.444444444444443" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="17.708" textLength="178.33250427246094" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">SHELVES B1 TO B4</tspan>
                        </text>
                    </g>
                </g>
                <g width="180.478" height="21.875" transform="scale(1,1) translate(597.854,941.667)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="180.478" height="21.875" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="180.478" height="21.875" />
                    </g>
                    <g width="180.4782257080078" height="21.875" transform="scale(1,1) translate(0,0)">
                        <text width="180.4782257080078" height="21.875" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="19.444444444444443" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="17.708" textLength="180.4782257080078" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">SHELVES C1 TO C4</tspan>
                        </text>
                    </g>
                </g>
                <g width="180.478" height="21.875" transform="scale(1,1) translate(914.521,941.667)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="180.478" height="21.875" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="180.478" height="21.875" />
                    </g>
                    <g width="180.4782257080078" height="21.875" transform="scale(1,1) translate(0,0)">
                        <text width="180.4782257080078" height="21.875" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="19.444444444444443" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="17.708" textLength="180.4782257080078" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">SHELVES D1 TO D4</tspan>
                        </text>
                    </g>
                </g>
                <g width="178.333" height="21.875" transform="scale(1,1) translate(1114.407,1069.792)">
                    <g stroke="#000000" opacity="1" stroke-width="0" stroke-dasharray="none" width="178.333" height="21.875" transform="scale(1,1) translate(0,0)" fill="none" stroke-opacity="1">
                        <rect width="178.333" height="21.875" />
                    </g>
                    <g width="178.33250427246094" height="21.875" transform="scale(1,1) translate(0,0)">
                        <text width="178.33250427246094" height="21.875" transform="scale(1,1) translate(0,0)" xml:space="preserve">
                            <tspan xml:space="preserve" text-rendering="optimizeSpeed" font-size="19.444444444444443" font-weight="normal" font-style="normal" fill="#000000" opacity="1" x="0" text-anchor="start" y="17.708" textLength="178.33250427246094" style="font-family: Arial, Helvetica Neue, Helvetica, sans-serif;">SHELVES E1 TO E4</tspan>
                        </text>
                    </g>
                </g>
            </g>
        </svg>
    </div>
</asp:Content>
