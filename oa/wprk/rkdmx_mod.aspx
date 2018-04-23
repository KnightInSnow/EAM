<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rkdmx_mod.aspx.cs" Inherits="FCSystem.OA.wprk.rkdmx_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>入库登记 - 物品明细</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">修改入库物品明细</td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
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
                                        <table style="table-layout: fixed;">
                                            <tr>
                                                <td align="left">物品信息：</td>
                                                <td>
                                                    <asp:DropDownList ID="ddl_wpxx" runat="server" AutoPostBack="true" Width="152px" OnSelectedIndexChanged="ddl_wpxx_SelectedIndexChanged"></asp:DropDownList><%--<img src="/images/fd.gif" onclick="openA('/choose/spview.aspx?id=t2')" alt="选择要查询的商品编码" />--%>
                                                </td>
                                                <td align="left">供应商：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_wpgysmc" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">所属分类：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_flmc" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="left">品牌：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_ppmc" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="left">物品编码：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_wpbm" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="left">物品名称：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_wpmc" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">型号：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_wpxh" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="left">规格：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_wpgg" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left">产地：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_wpcd" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td align="left">建议单价：</td>
                                                <td>
                                                    <asp:TextBox ID="tbx_wpdj" runat="server" Width="152" ReadOnly="true"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3">
                                                    <hr size="1" noshade />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right">入库数量：</td>
                                                <td>
                                                    <asp:TextBox ID="rksl" runat="server" Width="152"></asp:TextBox>
                                                </td>
                                                <td align="right">入库单价：</td>
                                                <td>
                                                    <asp:TextBox ID="rkdj" runat="server" Width="152"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 30px">
                                                    <asp:Button cssclass="mybutton" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s"></asp:Button>
                                                    <input type="button" name="BackBtn" value="关闭" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" />&nbsp;
                          <asp:ValidationSummary
                              ID="ValidationSummary2"
                              runat="server"
                              EnableClientScript="true"
                              ShowMessageBox="true"
                              ShowSummary="false"></asp:ValidationSummary>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator2"
                                                        runat="server"
                                                        ControlToValidate="ddl_wpxx"
                                                        ErrorMessage="请选择物品信息">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="rksl"
                                                        ErrorMessage="请输入入库数量">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator3"
                                                        runat="server"
                                                        ControlToValidate="rkdj"
                                                        ErrorMessage="请输入入库单价">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator
                                                        ID="RegularExpressionValidator1"
                                                        ControlToValidate="rksl"
                                                        Display="none"
                                                        ErrorMessage="入库数量必须为正整数"
                                                        ValidationExpression="^[1-9]\d*"
                                                        runat="server">
                                                    </asp:RegularExpressionValidator>
                                                    <asp:RegularExpressionValidator
                                                        ID="RegularExpressionValidator17"
                                                        ControlToValidate="rkdj"
                                                        Display="none"
                                                        ErrorMessage="入库单价必须为数值型"
                                                        ValidationExpression="\d+\.\d+|\d{0,9}"
                                                        runat="server">
                                                    </asp:RegularExpressionValidator>
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
        <asp:Label ID="lblrkdid" runat="server" Visible="False"></asp:Label><asp:Label ID="lblgystid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblrkmxid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
