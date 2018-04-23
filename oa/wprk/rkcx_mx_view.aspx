<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkcx_mx_view.aspx.cs" Inherits="FCSystem.OA.wprk.rkcx_mx_view" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <title>入库查询 - 物品明细</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">查看入库物品明细</td>
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
                                                <td align="right" style="height: 25px">物品编码：</td>
                                                <td>
                                                    <asp:TextBox ID="wpbm" runat="server" Width="152"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">物品名称：</td>
                                                <td>
                                                    <asp:TextBox ID="wpmc" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">所属分类：</td>
                                                <td>
                                                    <asp:TextBox ID="ssfl" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">品牌：</td>
                                                <td>
                                                    <asp:TextBox ID="wppp" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">供应商：</td>
                                                <td>
                                                    <asp:TextBox ID="gys" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">条形码：</td>
                                                <td>
                                                    <asp:TextBox ID="txm" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">型号：</td>
                                                <td>
                                                    <asp:TextBox ID="wpxh" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">规格：</td>
                                                <td>
                                                    <asp:TextBox ID="wpgg" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="height: 25px">产地：</td>
                                                <td>
                                                    <asp:TextBox ID="wpcd" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">建议单价：</td>
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
                                                <td align="right" style="height: 25px">入库数量：</td>
                                                <td>
                                                    <asp:TextBox ID="rksl" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="right" style="height: 25px">入库单价：</td>
                                                <td>
                                                    <asp:TextBox ID="rkdj" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 30px">
                                                    <input type="button" name="BackBtn" value=" 关闭 " class="mybutton" onclick="javascript: window.close()" accesskey="q" />&nbsp;
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

