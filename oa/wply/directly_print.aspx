<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="directly_print.aspx.cs" Inherits="FCSystem.OA.wply.directly_print" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>��ӡ�ʲ���ǩ</title>
    <style type="text/css">
        .auto-style1 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: black;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #CAE4FF;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
        }

        .auto-style2 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: black;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #CAE4FF;
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
            COLOR: black;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #CAE4FF;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
            width: 20%;
        }

        .auto-style5 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: black;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #CAE4FF;
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
            COLOR: black;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #CAE4FF;
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
            COLOR: black;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #CAE4FF;
            TEXT-ALIGN: left;
            TEXT-DECORATION: none;
            height: 24px;
            width: 17%;
        }

        .auto-style10 {
            PADDING-LEFT: 10px;
            FONT-WEIGHT: bold;
            FONT-SIZE: 12px;
            COLOR: black;
            LINE-HEIGHT: 20px;
            BACKGROUND-COLOR: #CAE4FF;
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



</head>









<body>
    <form id="form1" runat="server" align="center">









        <table style="table-layout:fixed;">
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
                    <td>��ǩ�Ŀ�ȣ�</td>
                    <td>
                        <asp:TextBox ID="txtLabelWidth" runat="server" Width="100%" Text="0" ToolTip="��λΪ����" align="left"></asp:TextBox>
                    </td>
                    <td>��߾ࣺ</td>
                    <td>
                        <asp:TextBox ID="leftPosition" runat="server" Width="44%" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>



                </tr>



                <tr>

                    <td class="auto-style2"></td>
                    <td>��ǩ�ĸ߶ȣ�</td>
                    <td>
                        <asp:TextBox ID="txtLabelHeight" runat="server" Width="100%" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>
                    <td>�ϱ߾ࣺ</td>
                    <td>
                        <asp:TextBox ID="upPosition" runat="server" Width="44%" Text="0" ToolTip="��λΪ����"></asp:TextBox>
                    </td>


                </tr>

                <tr>

                    <td class="auto-style2"></td>
                    <td>ѡ���ǩģ�壺</td>
                    <td>
                        <asp:DropDownList ID="QrPositionselect" runat="server" Width="96%" AutoPostBack="True" OnSelectedIndexChanged="QrPositionselect_SelectedIndexChanged">
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
                        <asp:TextBox ID="QRsize" runat="server" Width="40%" Text="25" ToolTip="��λΪ����" Visible="false"></asp:TextBox>
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
                        <asp:Button ID="Reset" class="mybutton" Width="90px" runat="server" Text="�ָ�Ĭ��" Visible="false" OnClick="ResetButton_Click" /></td>

                    <td>
                        <asp:Button ID="PrintButton" runat="server" class="mybutton" OnClick="PrintButton_Click" Style="display: none" Text="��ӡ" Width="0px" />
                        <asp:Button ID="CreatButton" runat="server" class="mybutton" OnClick="CreatButton_Click" Text="��������" Width="90px" />
                        <td>&nbsp;
                                              <input class="mybutton" name="printtest" onclick="printx(1)" style="cursor: hand" type="button" value=" ��ӡ "></input></td>
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
                    <td>&nbsp;<asp:Label ID="PrintMessage" runat="server" Width="100%" Text="���δ�ӡ��ǩ������"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="PrintNumber" runat="server" ForeColor="#ff0000" Text=""></asp:Label>
                    </td>
                    <td></td>

                    <td>&nbsp;
                        <asp:Label ID="Explain" runat="server" Text="����Ϊ��ӡʵ��"></asp:Label></td>
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

       <table style="table-layout:fixed;">
            <tr>
                <td></td>
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
                                                    <strong>

                                                        <object id='prt' type="application/x-oleobject" style="color: Background" classid='Clsid:868B7CE6-0891-420D-9292-CC414D50349D'></object>



                                                        <%--    <asp:GridView ID="GridView1" runat="server"
                                                            OnRowDataBound="OnRow_Bound"
                                                            AutoGenerateColumns="False"
                                                            CellSpacing="1"
                                                            DataKeyNames="lymx_tid"
                                                            BorderStyle="None"
                                                            BorderWidth="0px"
                                                            EmptyDataText="��ʱû�еǼ��κ���Ʒ�����Ϣ"
                                                            Width="100%" PageSize="500"
                                                             Height="700px">
                                                            <Columns>
                                                                <asp:TemplateField>
                                                                    <ItemTemplate>
                                                                        <asp:Panel ID="pnlLabel" runat="server">
                                                                            <table width="100%" cellspacing="0" cellpadding="0" border="0" style="font-size: x-small">
                                                                                <tr>
                                                                                    <td width="50px">��ţ�</td>

                                                                                    <td>
                                                                                        <asp:Label ID="lbl_zcbmfull" runat="server" Text='<%# Eval("zcbmfull").ToString() %>'></asp:Label>

                                                                                    </td>

                                                                                    <td width="250px" rowspan="5" valign="center">
                                                                                        <asp:Image ID="imgQR" runat="server" Width="200px" Height="200px" />
                                                                                   
                                                                                    </td>
                                                                                </tr>

                                                                                <tr>
                                                                                    <td>���ƣ�</td>
                                                                                    <td>
                                                                                        <asp:Label ID="lbl_wpmc" runat="server" Text='<%# Eval("wpmc").ToString() %>'></asp:Label>
                                                                                    </td>
                                                                                </tr>



                                                                                <tr>
                                                                                    <td>��Ա��</td>
                                                                                    <td>
                                                                                        <asp:Label ID="lbl_syr" runat="server" Text='<%# Eval("ui_desc").ToString() %>'></asp:Label>
                                                                                        <asp:Label ID="lbl_bmmc" runat="server" Text='<%# Eval("bm_mc").ToString() %>' Visible="False"></asp:Label>
                                                                                        <asp:Label ID="rkmxid" runat="server" Text='<%# Eval("rkmxid").ToString() %>' Visible="False"></asp:Label>
                                                                                        <asp:Label ID="lymx_tid" runat="server" Text='<%# Eval("lymx_tid").ToString() %>' Visible="False"></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td>���ţ�</td>
                                                                                    <td>
                                                                                        <asp:Label ID="lbl_wpxh" runat="server" Text='<%# Eval("bm_mc").ToString() %>'></asp:Label>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </asp:Panel>
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </asp:GridView>
                                                        --%>
                                                    </strong>
                                                    <br />
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

                        //print.setIconIndex(3);
                        //print.setIconLocate(15, 0, 45, 45);
                        //print.SetHeadText("���ϻ����˰���ʲ���");
                        //print.SetFootText("���ҲƲ�������������");
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

                    //print.setIconIndex(3);
                    //print.setIconLocate(15, 0, 45, 45);
                    //print.SetHeadText("���ϻ����˰���ʲ���");
                    //print.SetFootText("���ҲƲ�������������");\
                    print.TemplateType = nTemplateType;
                    print.BarcodeType = 0;
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
        </script>
    </form>
</body>
</html>
