<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcbmrule.aspx.cs" Inherits="FCSystem.BAS.csxx.zcbmrule" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�ʲ��������</title>
</head>
<body class="main">
    <form id="sform1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�ʲ��������</div>
        </div>
        <div class="Page-EmptyLine-Large"></div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:300px; padding-top:10px;">
                    <table>
                        <tr>
                            <td>
                                <font color="red">ע���ʲ�����ͨ��������������Ʒ������Ϻ�5λ���ֱ�����ɲ���֤Ψһ</font>
                            </td>
                        </tr>
                        <tr>
                            <td><font color="red">&nbsp;&nbsp;&nbsp;&nbsp;���鹴ѡ������������Ʒ�������λ������Ϊ�ʲ����</font></td>
                        </tr>
                        <tr>
                            <td class="td_q_space"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                                    <asp:ListItem Text="��������/���ű���" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="�������" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="��Ʒ����" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="������5λ����" Value="3"></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_q_space"></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btn_save" runat="server" CssClass="btn btn-primary active" Text="����" OnClick="btn_save_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>����Ĭ�ϴ�ӡ������(<font color="red">ע������Ӵ�ӡ���봫�洦���ƴ�ӡ������</font>)
                            </td>
                        </tr>
                        <tr>
                            <td>Ĭ�ϵ��ݴ�ӡ��:
                                <asp:TextBox ID="tbxReportPrinterName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btnSetReportPrinterName" runat="server" Text="����" OnClick="btnSetReportPrinterName_OnClick" CssClass="btn btn-primary active"/>
                            </td>
                        </tr>
                        <tr>
                            <td>Ĭ�ϱ�ǩ��ӡ��:
                                <asp:TextBox ID="tbxLabelPrinterName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btnSetLabelPrinterName" runat="server" Text="����" OnClick="btnSetLabelPrinterName_OnClick" CssClass="btn btn-primary active"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
