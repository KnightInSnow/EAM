<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkcx_view_prn2_new.aspx.cs" Inherits="FCSystem.OA.wprk.rkcx_view_prn2_new" %>

<!DOCTYPE html>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>��ӡ�ʲ���ǩ</title>
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
                    <td>��ǩ�Ŀ�ȣ�</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="txtLabelWidth" runat="server" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>��߾ࣺ</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="leftPosition" runat="server" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>��ǩ�ĸ߶ȣ�</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="txtLabelHeight" runat="server" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>�ϱ߾ࣺ</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="upPosition" runat="server" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>ѡ���ǩģ�壺</td>
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
                        <asp:TextBox CssClass="InputQuarterWidth" ID="QRsize" runat="server" Text="25" ToolTip="��λΪ����" Visible="false"></asp:TextBox>
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
                        <asp:Button ID="Reset" class="mybutton" runat="server" Text="�ָ�Ĭ��" Visible="false" OnClick="ResetButton_Click" />
                        <asp:Button ID="PrintButton" runat="server" class="mybutton" OnClick="PrintButton_Click" Style="display: none" Text="��ӡ" />
                        <asp:Button ID="CreatButton" runat="server" class="mybutton" OnClick="CreatButton_Click" Text="��������" Width="90px" />
                        <input class="mybutton" name="printtest" onclick="printx(1)" style="cursor: hand" type="button" value=" ��ӡ ">
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
                    <td>&nbsp;<asp:Label ID="PrintMessage" runat="server" Text="��ӡ��ǩ������"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="PrintNumber" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                    </td>
                    <td></td>

                    <td>&nbsp;
                        <asp:Label ID="Explain" runat="server" Text="��ӡʵ����"></asp:Label></td>
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

                    //���׼��� ���ñ�ǩ�ĳ���                
                    var Width = 70, Heigth = 50;  //��������Ĭ��ֵ   75 40
                    Width = "<%=nWidth%>";
                Heigth = "<%=nHeigth%>";

                //������߾ࡢ�ϱ߾�              
                var LeftMargin = 0, TopMargin = 0;
                LeftMargin = "<%=left%>";
                TopMargin = "<%=up%>";

                //���ö�ά���ӡ�����/�ұ�
                var nTemplateType = "<%=nQRPos%>";

                //��ȡ�ַ��������ɶ�ά��
                var QRText = null; //�������򴫵ݹ�������Ϣ����ҪΪ�˲�����ά��

                //���ô�ӡ��������
                var strPrinterName = "<%=sPrinterName%>";


                var sMessageArray = new Array(100);��//����һ������
                var sShowMessageArray = new Array(100);��//����һ������
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

                var BodyTextFontName = "����";
                var BodyTextFontSize = 10;
                var j;
                var BodyText = null;    //��ʾ����

                if (nPrint == 1) {
                    for (j = 0; j < nprintnumber; j++) {
                        QRText = sMessageArray[j];
                        BodyText = sShowMessageArray[j];


                        print.TemplateType = nTemplateType;
                        print.BarcodeType = 0;
                        print.IconIndex = 2;
                        print.SetHeadText("�廪��Ժ�豸�ʲ���Ƭ");
                        print.SetFootText("�����ʲ�������������");
                        //print.SetHeadText("�Ͼ���ʿͨ�ʲ���Ƭ");
                        //print.SetFootText("��˾�Ʋ�������������");
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
                    print.SetHeadText("�廪��Ժ�豸�ʲ���Ƭ");
                    print.SetFootText("�����ʲ�������������");
                    //print.SetHeadText("�Ͼ���ʿͨ�ʲ���Ƭ");
                    //print.SetFootText("��˾�Ʋ�������������");
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
