<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yh_view.aspx.cs" Inherits="FCSystem.BAS.yhgl.yh_view" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>职员维护</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("xm");  //初始化设置光标焦点
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
</head>

<body class="main" onload="SetFocus();">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true">
        </asp:ScriptManager>
        <div class="PopHead">
            <table>
                <tr>
                    <td class="td_oa" width="80%" height="25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>职员信息</td>
                    <td class="td_oa" width="20%"><span style="color:red;">*为必填信息</span></td>
                </tr>
            </table>
        </div>

        <div class="PopBodyInputs">
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
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
                        <td>职员代码：<span style="color:red;">*</span></td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="zydm" runat="server"></asp:TextBox>
                        </td>
                        <td></td>

                        <td>机构代码：</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="jgdm" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>登录名：<span style="color:red;">*</span></td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="yhbm" runat="server"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>姓名：<span style="color:red;">*</span></td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="xm" runat="server" MaxLength="8"></asp:TextBox>
                        </td>
                    </tr>

                    <asp:Panel ID="mm" runat="server">
                        <tr>
                            <td>登录密码：</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="dlmm" runat="server" TextMode="password" MaxLength="20"></asp:TextBox>
                            </td>
                            <td></td>
                            <td>确认密码：</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="Rnewpwd" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:Panel>

                    <tr>
                        <td>所属部门：<span style="color:red;">*</span></td>
                        <td colspan="4">
                            <asp:DropDownList CssClass="form-control" ID="bm" runat="server">
                                <asp:ListItem Value="" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>职位：</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="zwmc" runat="server">
                                <asp:ListItem Value="" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                        <td>页面角色：<span style="color:red;">*</span></td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="gwjs" runat="server">
                                <asp:ListItem Value="" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>电子邮件：</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="mail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>移动电话：</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="yddh" runat="server" MaxLength="12"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>有效开始日期：</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtbegintime" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtbegintime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator15"
                                runat="server"
                                ControlToValidate="txtbegintime"
                                ErrorMessage="有效开始日期">&nbsp;
                            </asp:RequiredFieldValidator></td>

                        <td class="td_no"></td>
                        <td>
                            <%--<asp:CheckBox ID="yn_sl" Text="是否需求受理人员" runat="server" />--%></td>
                    </tr>
                    <tr>
                        <td>有效截止日期：</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtendtime" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtendtime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator13"
                                runat="server"
                                ControlToValidate="txtendtime"
                                ErrorMessage="有效截止日期">&nbsp;
                            </asp:RequiredFieldValidator></td>
                        <td class="td_no"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>出生日期：</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="csrq" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="csrq"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4" align="left">
                            <asp:RadioButtonList ID="ynck_ynxt" runat="server" Visible="false" RepeatDirection="horizontal">
                                <asp:ListItem Text="系统管理员与仓库管理员" Value="xtck"></asp:ListItem>
                                <asp:ListItem Text="系统管理员" Value="xtgly"></asp:ListItem>
                                <asp:ListItem Text="仓库管理人员" Value="ckgly"></asp:ListItem>
                                <asp:ListItem Text="普通员工" Value="ptyg" Selected="true"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>

                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4">
                            <!--<hr />-->
                        </td>
                    </tr>
                    <tr>
                        <td>办公电话：</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="bgdh" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>传真电话：</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="czdh" runat="server" MaxLength="20"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>性别：</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="xb" runat="server">
                                <asp:ListItem Text="男" Value="男"></asp:ListItem>
                                <asp:ListItem Text="女" Value="女"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>

                        <td>状态：</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="zt" runat="server">
                                <asp:ListItem Text="正常" Value="正常"></asp:ListItem>
                                <asp:ListItem Text="禁用" Value="禁用"></asp:ListItem>
                                <asp:ListItem Text="建档" Value="建档"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>备注：</td>
                        <td colspan="4">
                            <asp:TextBox ID="bz" runat="server" CssClass="form-control" TextMode="multiLine" Rows="3"></asp:TextBox></td>
                    </tr>


                    <tr>
                        <td></td>
                        <td colspan="4" style="height: 30px">
                            <asp:Button CssClass="btn btn-primary active" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click" Visible="false" />
                            <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s"></asp:Button>
                            <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" Visible="false" OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d"></asp:Button>
                            <input type="button" name="BackBtn" value="关闭" class="btn btn-primary active" onclick="javascript: window.close()" accesskey="q" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="6">
                            <asp:ValidationSummary
                                ID="ValidationSummary2"
                                runat="server"
                                EnableClientScript="true"
                                ShowMessageBox="true"
                                ShowSummary="false"></asp:ValidationSummary>

                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5"
                                runat="server"
                                ControlToValidate="zydm"
                                ErrorMessage="请输入职员代码">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator4"
                                runat="server"
                                ControlToValidate="yhbm"
                                ErrorMessage="请输入登录名">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2"
                                runat="server"
                                ControlToValidate="xm"
                                ErrorMessage="请输入姓名">&nbsp;
                            </asp:RequiredFieldValidator>

                            <asp:CompareValidator
                                ID="Compare1"
                                runat="server"
                                ControlToValidate="dlmm"
                                Type="String"
                                ControlToCompare="rnewpwd"
                                ErrorMessage="登录密码与确认密码不符！">&nbsp;</asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator10"
                                runat="server"
                                ControlToValidate="bm"
                                ErrorMessage="请选择所属部门">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3"
                                runat="server"
                                ControlToValidate="gwjs"
                                ErrorMessage="请选择角色">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator3"
                                ControlToValidate="dlmm"
                                Display="none"
                                ErrorMessage="登录密码必需为数字、字母或二者组合"
                                ValidationExpression="^\w+$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator4"
                                ControlToValidate="Rnewpwd"
                                Display="none"
                                ErrorMessage="确认密码必需为数字、字母或二者组合"
                                ValidationExpression="^\w+$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator5"
                                ControlToValidate="mail"
                                Display="none"
                                ErrorMessage="电子邮件格式错误"
                                ValidationExpression="[\w-]+@[\w-]+\.(com|net|net.cn|org|edu|mil|com.cn|cn)$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator6"
                                ControlToValidate="yddh"
                                Display="none"
                                ErrorMessage="移动电话格式错误！手机号码前不要加0、小灵通格式为『区号加电话号码』中间不要加任何符号"
                                ValidationExpression="\S{0,10}\d{12}|\S{0,10}\d{11}"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator7"
                                ControlToValidate="bgdh"
                                Display="none"
                                ErrorMessage="办公电话格式错误，参考格式010-62288888、62288888、010-62288888-815"
                                ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator8"
                                ControlToValidate="czdh"
                                Display="none"
                                ErrorMessage="传真电话格式错误，参考格式010-62222222、62222222、010-62222222-832"
                                ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator9"
                                ControlToValidate="bz"
                                Display="none"
                                ErrorMessage="备注内容不能超过50个字"
                                ValidationExpression="^(\s|\S){0,50}$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>


        <asp:Label ID="lblbmtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblyhid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
