<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkcx_view_prn2_new.aspx.cs" Inherits="FCSystem.OA.wprk.rkcx_view_prn2_new" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>打印资产标签</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>


<body>
    <form id="form1" runat="server" align="center">


        <div class="PopHead"></div>


        <div class="PopBodyInputs">
            <table style="table-layout: fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" Style="display: none">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" Style="display: none">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td>标签的宽度：</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="txtLabelWidth" runat="server" Text="0" ToolTip="单位为毫米"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>左边距：</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="leftPosition" runat="server" Text="0" ToolTip="单位为毫米"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>标签的高度：</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="txtLabelHeight" runat="server" Text="0" ToolTip="单位为毫米"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>上边距：</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="upPosition" runat="server" Text="0" ToolTip="单位为毫米"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>选择标签模板：</td>
                    <td>
                        <asp:DropDownList CssClass="SelectQuarterWidth" ID="QrPositionselect" runat="server" AutoPostBack="True" OnSelectedIndexChanged="QrPositionselect_SelectedIndexChanged">
                            <asp:ListItem Value="0" Selected="True">0</asp:ListItem>
                            <asp:ListItem Value="1">1</asp:ListItem>
                            <asp:ListItem Value="2">2</asp:ListItem>
                            <asp:ListItem Value="3">3</asp:ListItem>
                            <asp:ListItem Value="4">4</asp:ListItem>
                            <asp:ListItem Value="5">5</asp:ListItem>
                            <asp:ListItem Value="6">6</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="QRsize" runat="server" Text="25" ToolTip="单位为毫米" Visible="false"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:DropDownList ID="selectprinter" runat="server" Style="display: none">
                        </asp:DropDownList>
                    </td>
                </tr>


                <tr>
                    <td></td>
                    <td colspan="4" style="align-items: center;">
                        <asp:Button ID="Reset" class="mybutton" runat="server" Text="恢复默认" Visible="false" OnClick="ResetButton_Click" />
                        <asp:Button ID="PrintButton" runat="server" class="mybutton" OnClick="PrintButton_Click" Style="display: none" Text="打印" />
                        <asp:Button ID="CreatButton" runat="server" class="mybutton" OnClick="CreatButton_Click" Text="重新生成" Width="90px" />
                        <input class="mybutton" name="printtest" onclick="printx(1)" style="cursor: hand" type="button" value=" 打印 ">
                    </td>
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
                    <td>&nbsp;<asp:Label ID="PrintMessage" runat="server" Text="打印标签个数："></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="PrintNumber" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                    </td>
                    <td></td>

                    <td>&nbsp;
                        <asp:Label ID="Explain" runat="server" Text="打印实例："></asp:Label></td>
                </tr>

                <tr>

                    <td class="auto-style3"></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>

            <table style="table-layout: fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="4">
                        <!--startprint-->

                        <table style="background-color: #CCCCCC" cellspacing="0" cellpadding="0" border="0">
                            <tr style="background-color: #ffffff">
                                <td>
                                    <object id='prt' type="application/x-oleobject" style="color: Background" classid='Clsid:868B7CE6-0891-420D-9292-CC414D50349D'></object>
                                </td>
                            </tr>
                        </table>

                        <!--endprint-->

                    </td>
                </tr>

            </table>

            <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>

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


                        print.TemplateType = nTemplateType;
                        print.BarcodeType = 0;
                        print.IconIndex = 2;
                        print.SetHeadText("五华法院设备资产卡片");
                        print.SetFootText("国有资产，请您爱护！");
                        //print.SetHeadText("南京富士通资产卡片");
                        //print.SetFootText("公司财产，请您爱护！");
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
                } else {
                    QRText = sMessageArray[0];
                    BodyText = sShowMessageArray[0];

                    print.TemplateType = nTemplateType;
                    print.BarcodeType = 0;
                    print.IconIndex = 2;
                    print.SetHeadText("五华法院设备资产卡片");
                    print.SetFootText("国有资产，请您爱护！");
                    //print.SetHeadText("南京富士通资产卡片");
                    //print.SetFootText("公司财产，请您爱护！");
                    print.BarcodeText = QRText;
                    print.BodyText = BodyText;
                    print.PrinterName = strPrinterName;
                    print.BodyTextFontName = BodyTextFontName;
                    print.BodyTextFontSize = BodyTextFontSize;
                    print.SetLabelWidth(Width);
                    print.SetLabelHeight(Heigth);
                    print.SetMargin(LeftMargin, TopMargin);
                    print.DisplayLabel0();
                }
                }
            </script>
    </form>

</body>
</html>
