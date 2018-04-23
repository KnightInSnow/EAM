<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="mod_pwd.aspx.cs" Inherits="FCSystem.BAS.xtrz.mod_pwd" %>


<!DOCTYPE HTML>

<html>
<head runat="server">
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>修改密码</title>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("oldpwd");  //设置初始光标焦点
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
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">修改密码</div>
        </div>
        <!--页面输入框部分-->
        <div class="Page-EmptyLine-Large"></div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:170px; padding-top:5px;">
                    <table style="margin-bottom:50px;">
                        <tr style="line-height:4;">
                            <td></td>
                            <td></td>
                            <td style="text-align:right;padding-right:10px;">原登陆密码：</td>
                            <td>
                                <asp:TextBox ID="oldpwd" runat="server" TextMode="password" MaxLength="20" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator4"
                                    runat="server"
                                    ControlToValidate="oldpwd"
                                    ErrorMessage="请输入原登陆密码">&nbsp;
                                </asp:RequiredFieldValidator>
                            </td>
                            <td></td>
                        </tr>
                        <tr style="line-height:4;">
                            <td></td>
                            <td></td>
                            <td style="text-align:right;padding-right:10px; line-height:5px;">新登陆密码：</td>
                            <td>
                                <asp:TextBox  ID="newpwd" runat="server" TextMode="Password" MaxLength="20" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator5"
                                    runat="server"
                                    ControlToValidate="newpwd"
                                    ErrorMessage="请输入新登陆密码">&nbsp; </asp:RequiredFieldValidator></td>
                            <td></td>
                        </tr>
                        <tr style="line-height:4;">
                            <td></td>
                            <td></td>
                            <td style="text-align:right;padding-right:10px; line-height:5px;">确认新密码：</td>
                            <td>
                                <asp:TextBox  ID="Rnewpwd" runat="server" TextMode="Password" MaxLength="20" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1"
                                    runat="server"
                                    ControlToValidate="Rnewpwd"
                                    ErrorMessage="请输入确认新密码">&nbsp; </asp:RequiredFieldValidator>
                                <asp:CompareValidator
                                    ID="Compare1"
                                    runat="server"
                                    ControlToValidate="newpwd"
                                    Type="String"
                                    ControlToCompare="rnewpwd"
                                    ErrorMessage="新登陆密码与确认密码不符！">&nbsp;</asp:CompareValidator></td>
                            <td></td>
                        </tr>
                    </table>
                    <table style="table-layout: fixed">                        
                        <tr>
                            <td></td>
                            <td></td>
                            <td colspan="2" align="center">
                                <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s" Width="180px"></asp:Button>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                    <table style="table-layout:fixed;">
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:ValidationSummary
                              ID="ValidationSummary1"
                              runat="server"
                              EnableClientScript="true"
                              ShowMessageBox="true"
                              ShowSummary="false"></asp:ValidationSummary>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator3"
                                ControlToValidate="oldpwd"
                                Display="none"
                                ErrorMessage="原登陆密码必需为数字、字母或二者组合"
                                ValidationExpression="^\w+$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator4"
                                ControlToValidate="newpwd"
                                Display="none"
                                ErrorMessage="新登陆密码必需为数字、字母或二者组合"
                                ValidationExpression="^\w+$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator5"
                                ControlToValidate="Rnewpwd"
                                Display="none"
                                ErrorMessage="确认新密码必需为数字、字母或二者组合"
                                ValidationExpression="^\w+$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                        </td>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
