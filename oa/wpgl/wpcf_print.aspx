<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpcf_print.aspx.cs" Inherits="FCSystem.OA.wpgl.wpcf_print" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>打印资产标签</title>
    <style type="text/css">
        .auto-style1 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: #FFFFFF;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #33A1C9;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
        }

        .auto-style2 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: #FFFFFF;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #33A1C9;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
            width: 21%;
        }

        .auto-style3 {
            height: 24px;
            width: 21%;
        }

        .auto-style4 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: #FFFFFF;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #33A1C9;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
            width: 20%;
        }

        .auto-style5 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: #FFFFFF;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #33A1C9;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
            width: 20%;
        }

        .auto-style6 {
            height: 24px;
            width: 20%;
        }

        .auto-style7 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: #FFFFFF;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #33A1C9;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
            width: 9%;
        }

        .auto-style8 {
            width: 9%;
        }

        .auto-style9 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: #FFFFFF;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #33A1C9;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
            width: 17%;
        }

        .auto-style10 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: #FFFFFF;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #33A1C9;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 44px;
            width: 17%;
        }

        .auto-style11 {
            height: 24px;
            width: 17%;
        }
    </style>

    <script language="javascript" type="text/javascript">
        function printx(nPrint) {
            //document.getElementById("PrintButton").click();
            var print = document.getElementById("prt");

            //毫米计算 设置标签的长宽                
            var Width = 70, Heigth = 50;  //程序中有默认值   75 40
            Width = "<%=nWidth%>";
                Heigth = "<%=nHeigth%>";
            
                //设置左边距、上边距              
                var LeftMargin = 0, TopMargin = 0;
                LeftMargin = "<%=left%>";
                TopMargin = "<%=up%>";

                //设置二维码打印在左边/右边
            var nTemplateType = "<%=nQRPos%>";

                //获取字符串，生成二维码
                var QRText = null; //有主程序传递过来的信息，主要为了产生二维码

                //设置打印机的名称
                var strPrinterName = "<%=sPrinterName%>";


                var sMessageArray = new Array(100);　//创建一个数组
                var sShowMessageArray = new Array(100);　//创建一个数组
                var nprintnumber = "<%=nPrintNumber%>";


                var k = 0;
                <%
                for (int i = 0; i < nPrintNumber; i++)
                {
                    %>
                sMessageArray[k] = ("<%=sMessage[i]%>");
                sShowMessageArray[k] = ("<%=sShowMessage[i]%>");
                k++;
                    <%
                }
                %>

                var BodyTextFontName = "黑体";
                var BodyTextFontSize = 10;
                var j;
                var BodyText = null;    //显示测试

                if (nPrint == 1) {
                    for (j = 0; j < nprintnumber; j++) {
                        QRText = sMessageArray[j];
                        BodyText = sShowMessageArray[j];

                        //print.setIconIndex(3);
                        //print.setIconLocate(15, 0, 45, 45);
                        //print.SetHeadText("济南槐荫国税局资产卡");
                        //print.SetFootText("国家财产，请您爱护！");
                        //print.setIconIndex(0);
                        //print.setIconLocate(5, 0, 65, 45);
                        //print.SetHeadText("南京富士通资产卡片");
                        //print.SetFootText("公司财产，请您爱护！");
                        //print.PrintLabel(QRText, BodyText, strPrinterName, QRPos, Width, Heigth, LeftMargin, TopMargin, BodyTextFontName, BodyTextFontSize);
                        print.TemplateType = nTemplateType;
                        print.BarcodeType = 0;
                        print.IconIndex = 2;
                        print.SetHeadText("五华法院设备资产卡片");
                        print.SetFootText("国有资产，请您爱护！");
                        print.BarcodeText = QRText;
                        print.BodyText = BodyText;
                        print.PrinterName = strPrinterName;
                        print.BodyTextFontName = BodyTextFontName;
                        print.BodyTextFontSize = BodyTextFontSize;
                        print.SetLabelWidth(Width);
                        print.SetLabelHeight(Heigth);
                        print.SetMargin(LeftMargin, TopMargin);
                        print.PrintLabel0();
                    }
                }
                else {
                    QRText = sMessageArray[0];
                    BodyText = sShowMessageArray[0];

                    //print.setIconIndex(3);
                    //print.setIconLocate(15, 0, 45, 45);
                    //print.SetHeadText("济南槐荫国税局资产卡");
                    //print.SetFootText("国家财产，请您爱护！");
                    //print.setIconIndex(0);
                    //print.setIconLocate(5, 0, 65, 45);
                    //print.SetHeadText("南京富士通资产卡片");
                    //print.SetFootText("公司财产，请您爱护！");
                    //print.DisplayLabel(QRText, BodyText, strPrinterName, QRPos, Width, Heigth, LeftMargin, TopMargin, BodyTextFontName, BodyTextFontSize);
                    print.TemplateType = nTemplateType;
                    print.BarcodeType = 0;
                    print.IconIndex = 2;
                    print.SetHeadText("五华法院设备资产卡片");
                    print.SetFootText("国有资产，请您爱护！");
                    print.BarcodeText = QRText;
                    print.BodyText = BodyText;
                    print.PrinterName = strPrinterName;
                    print.BodyTextFontName = BodyTextFontName;
                    print.BodyTextFontSize = BodyTextFontSize;
                    print.SetLabelWidth(Width);
                    print.SetLabelHeight(Heigth);
                    print.SetMargin(LeftMargin, TopMargin);
                    print.PrintLabel0();
                }
            }
        </script>
</head>


<body>
    <form id="form1" runat="server" align="center">

        
            <tbody>

                <tr>
                    <td style="height: 24px"></td>
                </tr>
                <tr>
                    <td style="height: 24px"></td>
                </tr>
                <tr>

                    <td></td>
                    <td></td>
                    <td>

                        <asp:DropDownList ID="DropDownList2" runat="server" Width="320%" Style="display: none">
                        </asp:DropDownList>


                    </td>
                    <td></td>
                    <td></td>


                </tr>
                <tr>

                    <td></td>
                    <td></td>
                    <td>

                        <asp:DropDownList ID="DropDownList1" runat="server" Width="320%" Style="display: none">
                        </asp:DropDownList>


                    </td>
                    <td></td>
                    <td></td>


                </tr>
                <tr align="center">

                    <td class="auto-style2"></td>
                    <td>标签的宽度：</td>
                    <td>
                        <asp:TextBox ID="txtLabelWidth" runat="server" Width="100%" Text="70" ToolTip="单位为毫米" align="left"></asp:TextBox>
                    </td>
                    <td>左边距：</td>
                    <td>
                        <asp:TextBox ID="leftPosition" runat="server" Width="44%" Text="0" ToolTip="单位为毫米"></asp:TextBox>
                    </td>



                </tr>



                <tr>

                    <td class="auto-style2"></td>
                    <td>标签的高度：</td>
                    <td>
                        <asp:TextBox ID="txtLabelHeight" runat="server" Width="100%" Text="50" ToolTip="单位为毫米"></asp:TextBox>
                    </td>
                    <td>上边距：</td>
                    <td>
                        <asp:TextBox ID="upPosition" runat="server" Width="44%" Text="0" ToolTip="单位为毫米"></asp:TextBox>
                    </td>


                </tr>

                <tr>

                    <td class="auto-style2"></td>
                    <td>选择二维码位置：</td>
                    <td>
                        <asp:DropDownList ID="QrPositionselect" runat="server" Width="100%">
                            <asp:ListItem Value="0" Selected="True">靠左</asp:ListItem>
                            <asp:ListItem Value="1">靠右</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td></td>
                    <td>
                        <asp:TextBox ID="QRsize" runat="server" Width="40%" Text="25" ToolTip="单位为毫米" Visible="false"></asp:TextBox>
                    </td>


                </tr>

                <tr>

                    <td></td>
                    <td></td>
                    <td>

                        <asp:DropDownList ID="selectprinter" runat="server" Width="320%" Style="display: none">
                        </asp:DropDownList>


                    </td>
                    <td></td>
                    <td></td>


                </tr>


                <tr>

                    <td class="auto-style2"></td>




                    <td></td>
                    <td>
                        <asp:Button ID="Reset" class="mybutton" Width="90px" runat="server" Text="恢复默认" OnClick="ResetButton_Click" /></td>

                    <td>
                        <asp:Button ID="PrintButton" runat="server" class="mybutton" OnClick="PrintButton_Click" Style="display: none" Text="打印" Width="0px" />
                        <asp:Button ID="CreatButton" runat="server" class="mybutton" OnClick="CreatButton_Click" Text="重新生成" Width="90px" />
                        <td>&nbsp;
                                              <input class="mybutton" BodyTextFontName="printtest" onclick="printx(1)" style="cursor: hand" type="button" value=" 打印 "></input></td>
                </tr>
                <tr>

                    <td></td>
                    <td></td>
                    <td>

                        <asp:DropDownList ID="DropDownList3" runat="server" Width="320%" Style="display: none">
                        </asp:DropDownList>


                    </td>
                    <td></td>
                    <td></td>


                </tr>
                <tr>

                    <td class="auto-style3"></td>
                    <td></td>
                    <td></td>
                    <td></td>

                    <td></td>
                </tr>
                <tr>

                    <td class="auto-style3"></td>
                    <td>&nbsp;<asp:Label ID="PrintMessage" runat="server" Width="100%" Text="本次打印标签个数："></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="PrintNumber" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                    </td>
                    <td></td>

                    <td>&nbsp;
                        <asp:Label ID="Explain" runat="server" Text="以下为打印实例"></asp:Label></td>
                </tr>
                <tr>

                    <td class="auto-style3"></td>
                    <td></td>
                    <td></td>
                    <td></td>

                    <td></td>
                </tr>

            </tbody>
        </table>

       <table>
            <tr>
                <td>
                </td>

                <td>
                    <asp:Panel ID="panel2" runat="server">
                        <table id="search" cellspacing="0" cellpadding="0" width="240px" border="0" align="left">
                            <tbody>
                                <tr>
                                    <td>
                                        <!--startprint-->
                                        <table style="background-color: #CCCCCC" cellspacing="0" cellpadding="0" width="240px" border="0">
                                            <tr style="background-color: #ffffff">
                                                <td>
                                                    <object id='prt' type="application/x-oleobject" style="color: Background" classid='Clsid:868B7CE6-0891-420D-9292-CC414D50349D'></object>
                                                </td>
                                            </tr>
                                        </table>
                                        <!--endprint-->
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>

        <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>

        
    </form>

</body>
</html>

