<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkcx_mx_view.aspx.cs" Inherits="FCSystem.OA.wprk.rkcx_mx_view" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <title>����ѯ - ��Ʒ��ϸ</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">�鿴�����Ʒ��ϸ</td>
                    <td class="td_oa" style="width: 20%"></td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table style="table-layout: fixed">
                            <tbody>
                                <tr>
                                    <td style="height: 25">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <table width="600" border="0" align="center" cellpadding="0" cellspacing="1">
                                            <tr>
                                                <td align="right" style="height: 25px">��Ʒ���룺</td>
                                                <td>
                                                    <asp:TextBox ID="wpbm" runat="server" Width="152"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">��Ʒ���ƣ�</td>
                                                <td>
                                                    <asp:TextBox ID="wpmc" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">�������ࣺ</td>
                                                <td>
                                                    <asp:TextBox ID="ssfl" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">Ʒ�ƣ�</td>
                                                <td>
                                                    <asp:TextBox ID="wppp" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">��Ӧ�̣�</td>
                                                <td>
                                                    <asp:TextBox ID="gys" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">�����룺</td>
                                                <td>
                                                    <asp:TextBox ID="txm" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">�ͺţ�</td>
                                                <td>
                                                    <asp:TextBox ID="wpxh" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">���</td>
                                                <td>
                                                    <asp:TextBox ID="wpgg" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">���أ�</td>
                                                <td>
                                                    <asp:TextBox ID="wpcd" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">���鵥�ۣ�</td>
                                                <td>
                                                    <asp:TextBox ID="wpdj" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3">
                                                    <hr size="1" noshade />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">���������</td>
                                                <td>
                                                    <asp:TextBox ID="rksl" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">��ⵥ�ۣ�</td>
                                                <td>
                                                    <asp:TextBox ID="rkdj" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 30px">
                                                    <input type="button" name="BackBtn" value=" �ر� " class="mybutton" onclick="javascript: window.close()" accesskey="q" />&nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>

