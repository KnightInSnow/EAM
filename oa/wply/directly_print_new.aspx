<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print805.aspx.cs" Inherits="FCSystem.OA.wply.print805" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>��ӡ�ʲ���ǩ</title>

    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />

</head>

<body>
    <form id="form1" runat="server" align="center">

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true">
        </asp:ScriptManager>

        <div class="PopHead"></div>

        <div class="PopBodyInputs">
            <table style="table-layout: fixed">
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
                    <td>��ǩ�Ŀ�ȣ�</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="txtLabelWidth" runat="server" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                    <td>��߾ࣺ</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="leftPosition" runat="server" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                </tr>


                <tr>
                    <td></td>
                    <td>��ǩ�ĸ߶ȣ�</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="txtLabelHeight" runat="server" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                    <td>�ϱ߾ࣺ</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="upPosition" runat="server" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>
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
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth" ID="QRsize" runat="server" Text="25" ToolTip="��λΪ����" Visible="false"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:DropDownList CssClass="SelectQuarterWidth" ID="selectprinter" Visible="False" runat="server">
                        </asp:DropDownList>
                    </td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td><br /></td>
                </tr>


                <tr>
                    <td></td>
                    <td colspan="4" align="center">
                        <asp:Button ID="Reset" runat="server" Text="�ָ�Ĭ��" Visible="false" OnClick="ResetButton_Click" />
                        <asp:Button ID="PrintButton" runat="server" OnClick="PrintButton_Click" Text="��ӡ" Visible="false" />
                        <asp:Button ID="CreatButton" runat="server" OnClick="CreatButton_Click" Text="��������" />
                        <input name="printtest" onclick="bclick()" style="cursor: hand" type="button" value=" ��ӡ "></input>
                    </td>
                </tr>
                 

                <tr>
                    <td><br /></td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="PrintMessage" runat="server" Width="100%" Text="��ӡ��ǩ������"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="PrintNumber" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                    </td>
                    </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="Explain" runat="server" Text="��ӡʵ����"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>


        <div class="PopBodyInputs" style="background-color: white; border-style: none;">
            <table style="table-layout: fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="2">
                        <asp:Panel ID="panel2" runat="server">
                            <!--startprint-->
                            <table style="background-color: #CCCCCC" cellspacing="0" cellpadding="0" width="240px" border="0">
                                <tr style="background-color: #ffffff">
                                    <td align="left">
                                        <object id='prt' type="application/x-oleobject" style="color: Background" classid='Clsid:868B7CE6-0891-420D-9292-CC414D50349D'></object>

                                    </td>
                                </tr>
                            </table>
                            <!--endprint-->
                        </asp:Panel>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>





        <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>

        <script language="javascript" type="text/javascript">
            function printx(nPrint) {
                //document.getElementById("PrintButton").click();
                var print = document.getElementById("prt");

                //���׼��� ���ñ�ǩ�ĳ���                
                var Width = 70, Heigth = 50;  //��������Ĭ��ֵ   75 40
                Width = "<%=m_nLabelWidth%>";
                Heigth = "<%=m_nLabelHeight%>";

                //������߾ࡢ�ϱ߾�              
                var LeftMargin = 0, TopMargin = 0;
                LeftMargin = "<%=left%>";
                TopMargin = "<%=up%>";

                //���ö�ά���ӡ�����/�ұ�
                var nTemplateType = "<%=m_nTemplateType%>";

                //��ȡ�ַ��������ɶ�ά��
                var QRText = ""; //�������򴫵ݹ�������Ϣ����ҪΪ�˲�����ά��

                //���ô�ӡ��������
                var strPrinterName = "<%=m_sPrinterName%>";


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

                        //print.setIconIndex(3);
                        //print.setIconLocate(15, 0, 45, 45);
                        //print.SetHeadText("���ϻ����˰���ʲ���");
                        //print.SetFootText("���ҲƲ�������������");
                        print.TemplateType = nTemplateType;
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
                    //0: fujitsu   1:nfet   2:hui
                    //print.setIconIndex(3);
                    //print.setIconLocate(15, 0, 45, 45);
                    //print.SetHeadText("���ϻ����˰���ʲ���");
                    //print.SetFootText("���ҲƲ�������������");\
                    print.TemplateType = nTemplateType;
                    print.IconIndex = 2;
                    print.SetHeadText("�廪��Ժ�豸�ʲ���Ƭ");
                    print.SetFootText("�����ʲ�������������");
                    //print.SetHeadText("�Ͼ���ʿͨ�ʲ���Ƭ");
                    //print.SetFootText("��˾�Ʋ�������������");
                    print.BarcodeText = QRText;
                    print.BodyText = BodyText;
                    //print.PrinterName = strPrinterName;
                    print.BodyTextFontName = BodyTextFontName;
                    print.BodyTextFontSize = BodyTextFontSize;
                    print.SetLabelWidth(Width);
                    print.SetLabelHeight(Heigth);
                    print.SetMargin(LeftMargin, TopMargin);
                    print.DisplayLabel0();
                }
            }

            function bclick() {

                var strzcbm = "<%=zcbmfull%>";
                var strPrtstate = "<%=printstate%>";
                printx(1);   //����ִ�д�ӡ����
                PageMethods.BdbqButton1(strzcbm, strPrtstate);  //���ú�̨���� ���Ĵ�ӡ��ǩ�ʲ��Ĳ���״̬ 
            }

        </script>
    </form>
</body>
</html>

