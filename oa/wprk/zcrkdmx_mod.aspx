<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcrkdmx_mod.aspx.cs" Inherits="FCSystem.OA.wprk.zcrkdmx_mod" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>入库登记 - 物品明细</title>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("wpbm");  //初始化设置光标焦点
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>

<body class="main" onload="SetFocus();">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">修改入库物品明细</td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
            </table>
        </div>

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


                    <td>入库编码：</td>
                    <td>
                        <asp:TextBox ID="rkbm" runat="server" AutoPostBack="true"></asp:TextBox>
                    </td>
                    <td></td>

                    <td>入库编码向导：</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="wz_id " DataValueField="wz_id" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="left">商品编码：</td>
                    <td>
                        <asp:TextBox ID="wpbm" runat="server" AutoPostBack="true" OnTextChanged="Wpbm_Changed"></asp:TextBox>&nbsp;<img src="/images/fd.gif" onclick="openA('/choose/spview_zc.aspx?id=t2')" alt="选择要查询的物品编码" />&nbsp;<asp:ImageButton ID="RefBtn" runat="server" OnClick="Wpbm_Changed" ImageUrl="~/images/refresh.gif" ToolTip="刷新物品信息" CausesValidation="false" />
                    </td>
                    <td></td>

                    <td align="right">商品名称：</td>
                    <td>
                        <asp:TextBox ID="wpmc" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>所属分类：</td>
                    <td>
                        <asp:TextBox ID="ssfl" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>品牌：</td>
                    <td>
                        <asp:TextBox ID="wppp" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>供应商：</td>
                    <td>
                        <asp:TextBox ID="gys" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>条形码：</td>
                    <td>
                        <asp:TextBox ID="txm" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>型号：</td>
                    <td>
                        <asp:TextBox ID="wpxh" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>规格：</td>
                    <td>
                        <asp:TextBox ID="wpgg" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>产地：</td>
                    <td>
                        <asp:TextBox ID="wpcd" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>建议单价：</td>
                    <td>
                        <asp:TextBox ID="wpdj" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">
                        <hr size="1" noshade />
                    </td>
                </tr>
                <tr>
                    <td>入库数量：</td>
                    <td>
                        <asp:TextBox ID="rksl" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>入库单价：</td>
                    <td>
                        <asp:TextBox ID="rkdj" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3" style="height: 30px">
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="保存并关闭" OnClick="Save_Click" AccessKey="s"></asp:Button>
                        <input type="button" name="BackBtn" value="关闭" class="mybutton" onclick="javascript: window.close()" accesskey="q" />&nbsp;
                                                    <asp:ValidationSummary
                                                        ID="ValidationSummary2"
                                                        runat="server"
                                                        EnableClientScript="true"
                                                        ShowMessageBox="true"
                                                        ShowSummary="false"></asp:ValidationSummary>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="wpbm"
                            ErrorMessage="请输入物品编码">&nbsp;
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
                            ErrorMessage="入库数量必须为数值型"
                            ValidationExpression="\d+\.\d+|\d{0,9}"
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
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="wpmc"
                            ErrorMessage="物品编码不存在，无法继续保存">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
