<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcbmrule.aspx.cs" Inherits="FCSystem.BAS.csxx.zcbmrule" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>资产编码规则</title>
</head>
<body class="main">
    <form id="sform1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">资产编码规则</div>
        </div>
        <div class="Page-EmptyLine-Large"></div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:300px; padding-top:10px;">
                    <table>
                        <tr>
                            <td>
                                <font color="red">注：资产编码通过分类简码或者商品简码加上后5位数字编码组成并保证唯一</font>
                            </td>
                        </tr>
                        <tr>
                            <td><font color="red">&nbsp;&nbsp;&nbsp;&nbsp;建议勾选分类简码或者商品简码加五位编码做为资产编号</font></td>
                        </tr>
                        <tr>
                            <td class="td_q_space"></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:CheckBoxList ID="CheckBoxList1" runat="server">
                                    <asp:ListItem Text="机构代码/部门编码" Value="0"></asp:ListItem>
                                    <asp:ListItem Text="分类简码" Value="1"></asp:ListItem>
                                    <asp:ListItem Text="商品简码" Value="2"></asp:ListItem>
                                    <asp:ListItem Text="不低于5位编码" Value="3"></asp:ListItem>
                                </asp:CheckBoxList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td_q_space"></td>
                        </tr>
                        <tr>
                            <td align="center">
                                <asp:Button ID="btn_save" runat="server" CssClass="btn btn-primary active" Text="保存" OnClick="btn_save_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td>设置默认打印机名称(<font color="red">注：建议从打印机与传真处复制打印机名称</font>)
                            </td>
                        </tr>
                        <tr>
                            <td>默认单据打印机:
                                <asp:TextBox ID="tbxReportPrinterName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btnSetReportPrinterName" runat="server" Text="保存" OnClick="btnSetReportPrinterName_OnClick" CssClass="btn btn-primary active"/>
                            </td>
                        </tr>
                        <tr>
                            <td>默认标签打印机:
                                <asp:TextBox ID="tbxLabelPrinterName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btnSetLabelPrinterName" runat="server" Text="保存" OnClick="btnSetLabelPrinterName_OnClick" CssClass="btn btn-primary active"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
