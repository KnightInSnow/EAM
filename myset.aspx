<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="myset.aspx.cs" Inherits="FCSystem.myset" %>

<!DOCTYPE HTML>

<html>
<head>
    <link href="Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="css/Main.css" type="text/css" rel="stylesheet" />
    <title>个人设置</title>
    <script language="javascript">
        function SetCookie(sName, sValue) {
            this.document.cookie = sName + "=" + escape(sValue) + "; ";
        }

        function GetCookie(sName) {
            var aCookie = this.document.cookie.split("; ");
            for (var i = 0; i < aCookie.length; i++) {

                var aCrumb = aCookie[i].split("=");
                if (sName == aCrumb[0])
                    return unescape(aCrumb[1]);
            }

        }

        function SetInit() {
            if (GetCookie("UDS_RefreshTime") == null) {
                document.getElementsByName("radiobutton")[0].checked = true;
                //this.document.all.Setup.radiobutton[0].checked = true;
            }
            else {
                for (i = 0; i < this.document.all.Setup.radiobutton.length; i++) {
                    if (GetCookie("UDS_RefreshTime") == this.document.all.Setup.radiobutton[i].value * 60000) {
                        this.document.all.Setup.radiobutton[i].checked = true;
                    }
                }
            }


            if (GetCookie("UDS_RemindType") == null) {
                document.getElementsByName("radiobutton1")[0].checked = true;
            }
            else {
                for (i = 0; i < this.document.all.Setup.radiobutton1.length; i++) {
                    if (GetCookie("UDS_RemindType") == this.document.all.Setup.radiobutton1[i].value) {
                        this.document.all.Setup.radiobutton1[i].checked = true;
                    }
                }
            }

        }

        function FinishSetup() {
            for (i = 0; i < this.document.all.Setup.radiobutton.length; i++) {
                if (this.document.all.Setup.radiobutton[i].checked == true) {
                    SetCookie("UDS_RefreshTime", this.document.all.Setup.radiobutton[i].value * 60000);

                }
            }

            for (i = 0; i < this.document.all.Setup.radiobutton1.length; i++) {
                if (this.document.all.Setup.radiobutton1[i].checked == true) {
                    SetCookie("UDS_RemindType", this.document.all.Setup.radiobutton1[i].value);
                }
            }
            alert('消息设置保存成功！')
        }
    </script>
</head>

<body class="main">
    <form id="Setup" method="post" runat="server">

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">个人设定</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:380px;padding:10px 0 0 10px;">
                    <asp:Panel ID="panel1" runat="server" style="width:100%;">
                    <table style="table-layout: fixed; width:364px; text-align:left;">
                      <!--  <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>-->
                        <tr>
                            <td style="width: 91px;text-align:center;">
                                <asp:LinkButton ID="xxsz" runat="server" CssClass="black btn btn-primary active" OnClick="xxsz_Click" CausesValidation="false">消息设置</asp:LinkButton>
                            </td>
                            <td style="width: 91px;text-align:center;">
                                <asp:LinkButton ID="cgsd" runat="server" CssClass="black btn btn-primary active" OnClick="cgsd_Click" CausesValidation="false">常规设定</asp:LinkButton>
                            </td>
                            <td style="width: 91px; text-align:center;">
                                <asp:LinkButton ID="yxpz" runat="server" CssClass="black btn btn-primary active" OnClick="yxpz_Click" CausesValidation="false">邮箱配置</asp:LinkButton>
                            </td>
                            <td style="width: 91px;text-align:center;">
                                <asp:LinkButton ID="zdyzm" runat="server" CssClass="black btn btn-primary active" OnClick="zdyzm_Click" Enabled="false" CausesValidation="false">自定义桌面</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                        </asp:Panel>


                    <!--站内消息-->
                    <asp:Panel ID="panelznxx" runat="server" Visible="false" CssClass="panelznxx">
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
                                <td style="text-align:right; line-height:4;">提醒频率：</td>
                                <td colspan="4"style="text-align:left;">
                                    <input type="radio" value="0.5" name="radiobutton" checked="checked">30秒钟
					              <input type="radio" value="1" name="radiobutton">1分钟
						          <input type="radio" value="2" name="radiobutton">2分钟
						          <input type="radio" value="3" name="radiobutton">3分钟
						          <input type="radio" value="4" name="radiobutton">4分钟
						          <input type="radio" value="5" name="radiobutton">5分钟
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align:right; line-height:4;">提醒方式：</td>
                                <td colspan="4" style="text-align:left;">
                                    <input type="radio" value="1" name="radiobutton1" checked="checked">弹出窗口 
					                <input type="radio" value="2" name="radiobutton1">闪烁图标
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <input onclick="FinishSetup()" type="button" value="保存" name="yes" class="btn btn-primary active" style="width:180px;margin-top:30px;">
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <!--常规设定-->
                    <asp:Panel ID="panelcg" runat="server">
                        <table style="table-layout: fixed;align-items:center;">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td colspan="2" style="text-align:right;">[大页]每页行数：</td>
                                <td colspan="2" style="text-align:center;">
                                    <asp:TextBox CssClass="form-control" ID="bigpagesize" runat="server" MaxLength="4" Width="216px"></asp:TextBox>
                                </td>
                                <td colspan="2" style="text-align:left;">0代表不分页
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator4"
                                        runat="server"
                                        ControlToValidate="bigpagesize"
                                        ErrorMessage="请输入大页的分页行数！">
                                    </asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1"
                                        runat="server"
                                        ErrorMessage="请把大页的分页设为0-1000之间的正整数！"
                                        ControlToValidate="bigpagesize"
                                        MinimumValue="0"
                                        MaximumValue="1000"
                                        Type="integer">
                                    </asp:RangeValidator></td>
                            </tr>

                            <tr>
                                <td colspan="2" style="text-align:right;">[半页]每页行数：</td>
                                <td colspan="2" style="text-align:center;">
                                    <asp:TextBox ID="halfpagesize" runat="server" Width="216px" MaxLength="4" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td colspan="2" style="text-align:left;">0代表不分页
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator5"
                                        runat="server"
                                        ControlToValidate="halfpagesize"
                                        ErrorMessage="请输入半页分页行数！">
                                    </asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator5"
                                        runat="server"
                                        ErrorMessage="请把半页的分页设为0-1000之间的正整数！"
                                        ControlToValidate="halfpagesize"
                                        MinimumValue="0"
                                        MaximumValue="1000"
                                        Type="integer">
                                    </asp:RangeValidator></td>
                            </tr>

                            <tr>
                                <td colspan="2" style="text-align:right;">[弹出页]每页行数：</td>
                                <td colspan="2" style="text-align:center;">
                                    <asp:TextBox ID="smallpagesize" runat="server" Width="216px" MaxLength="4" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td colspan="2" style="text-align:left;">0代表不分页
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator1"
                                        runat="server"
                                        ControlToValidate="smallpagesize"
                                        ErrorMessage="请输入弹出页的分页行数！">
                                    </asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator2"
                                        runat="server"
                                        ErrorMessage="请把弹出页的分页设为0-1000之间的正整数！"
                                        ControlToValidate="smallpagesize"
                                        MinimumValue="0"
                                        MaximumValue="1000"
                                        Type="integer">
                                    </asp:RangeValidator></td>
                            </tr>

                            
                            <tr>
                                <td colspan="2" style="text-align:right;">自定义Panel宽度（像素）：</td>
                                <td colspan="2" style="text-align:center;">
                                    <asp:TextBox ID="panelw" runat="server" MaxLength="4" Width="216px" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td colspan="2" style="text-align:left;">
                                    <font color="red">建议不要随意修改此项！</font>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator2"
                                        runat="server"
                                        ControlToValidate="panelw"
                                        ErrorMessage="请输入自定义Panel的宽度！">
                                    </asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator3"
                                        runat="server"
                                        ErrorMessage="请把自定义Panel的宽度设为700-2000之间的正整数！"
                                        ControlToValidate="panelw"
                                        MinimumValue="700"
                                        MaximumValue="2000"
                                        Type="integer">
                                    </asp:RangeValidator></td>
                            </tr>

                            <tr>
                                <td colspan="2" style="text-align:right;">自定义Panel高度（像素）：</td>
                                <td colspan="2" style="text-align:center;">
                                    <asp:TextBox ID="panelh" runat="server" MaxLength="4" Width="216px" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td colspan="2" style="text-align:left;">
                                    <font color="red">建议不要随意修改此项！</font>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator3"
                                        runat="server"
                                        ControlToValidate="panelh"
                                        ErrorMessage="请输入自定义Panel的高度！">
                                    </asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator4"
                                        runat="server"
                                        ErrorMessage="请把自定义Panel的高度设为300-1500之间的正整数！"
                                        ControlToValidate="panelh"
                                        MinimumValue="300"
                                        MaximumValue="1500"
                                        Type="integer">
                                    </asp:RangeValidator></td>
                            </tr>

                            <tr>
                                <td colspan="2" style="text-align:right;">弹出信息设置：</td>
                                <td colspan="3" style="text-align:left;">
                                    <asp:RadioButtonList ID="tcsz" runat="server" RepeatDirection="Horizontal" >
                                        <asp:ListItem Text="不要提醒我" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="仅登录时弹出一次" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="每次返回主界面时均弹出" Value="2"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2"></td>
                                <td colspan="2">
                                    <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s" Width="180px"></asp:Button>
                                    <asp:Label ID="Msg" runat="server" ForeColor="red"></asp:Label>
                                </td>
                                <td colspan="2">
                                    <asp:ValidationSummary
                                        ID="ValidationSummary1"
                                        runat="server"
                                        EnableClientScript="true"
                                        ShowMessageBox="true"
                                        ShowSummary="false"></asp:ValidationSummary>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <!--邮箱-->
                    <asp:Panel ID="panelyx" runat="server" Visible="false">
                        <table style="table-layout: fixed;">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>

                            <tr>
                                <td style="text-align:right;">发送人邮箱地址：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="yxdz" runat="server" MaxLength="30" Width="216px" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator6"
                                        runat="server"
                                        ControlToValidate="yxdz"
                                        ErrorMessage="请输入邮箱地址！">&nbsp;
                                    </asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">SMTP地址：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="smtp" runat="server" Width="216px" MaxLength="30" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator7"
                                        runat="server"
                                        ControlToValidate="smtp"
                                        ErrorMessage="请输入邮箱SMTP地址！">&nbsp;
                                    </asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">您的签名：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="qm" runat="server" Width="216px" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator10"
                                        runat="server"
                                        ControlToValidate="qm"
                                        ErrorMessage="请输入您的签名！">&nbsp;
                                    </asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">SMTP端口：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="port" runat="server" Width="216px" MaxLength="8" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator11"
                                        runat="server"
                                        ControlToValidate="port"
                                        ErrorMessage="请输入SMTP端口！">&nbsp;
                                    </asp:RequiredFieldValidator></td>
                            </tr>
                            <!--<tr>
                                <td colspan="2">
                                    <hr style="vertical-align: middle; width: 100%; text-align: center" />
                                </td>
                            </tr>-->
                            <tr>
                                <td style="text-align:right;">请输入邮箱登录名：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="dlm" runat="server" Width="216px" MaxLength="10" CssClass="form-control"></asp:TextBox></td>
                                <td>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator8"
                                        runat="server"
                                        ControlToValidate="dlm"
                                        ErrorMessage="请输入邮箱登录名！">&nbsp;
                                    </asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">请输入登录密码：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="dlmm" runat="server" Width="216px" MaxLength="20" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator9"
                                        runat="server"
                                        ControlToValidate="dlmm"
                                        ErrorMessage="请输入邮箱登录密码！">&nbsp;
                                    </asp:RequiredFieldValidator></td>
                            </tr>
                            <tr>
                                <td style="text-align:right;">请输入确认密码：</td>
                                <td style="text-align:left;">
                                    <asp:TextBox ID="qrmm" runat="server" Width="216px" MaxLength="20" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator12"
                                        runat="server"
                                        ControlToValidate="qrmm"
                                        ErrorMessage="请输入确认密码">&nbsp; 
                                    </asp:RequiredFieldValidator>
                                    <asp:CompareValidator
                                        ID="Compare1"
                                        runat="server"
                                        ControlToValidate="dlmm"
                                        Type="String"
                                        ControlToCompare="qrmm"
                                        ErrorMessage="登录密码与确认密码不符！">&nbsp;
                                    </asp:CompareValidator></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:ValidationSummary
                                        ID="ValidationSummary2"
                                        runat="server"
                                        EnableClientScript="true"
                                        ShowMessageBox="true"
                                        ShowSummary="false"></asp:ValidationSummary>
                                    <asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator1"
                                        ControlToValidate="yxdz"
                                        Display="none"
                                        ErrorMessage="邮箱地址格式错误"
                                        ValidationExpression="[\w-]+@[\w-]+\.(com|net|org|edu|mil|com.cn|net.cn|cn)$"
                                        runat="server">
                                    </asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator2"
                                        ControlToValidate="dlm"
                                        Display="none"
                                        ErrorMessage="登录名必需为数字、字母或二者组合"
                                        ValidationExpression="^\w+$"
                                        runat="server">
                                    </asp:RegularExpressionValidator>
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
                                        ControlToValidate="port"
                                        Display="none"
                                        ErrorMessage="SMTP端口必需为数字"
                                        ValidationExpression="^\d+$"
                                        runat="server">
                                    </asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator
                                        ID="RegularExpressionValidator5"
                                        ControlToValidate="smtp"
                                        Display="none"
                                        ErrorMessage="SMTP地址格式不正确"
                                        ValidationExpression="^(smtp|SMTP)\.(\S|\s)+$"
                                        runat="server">
                                    </asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr style="line-height:4;">
                                <td></td>
                                <td style="text-align:left;">
                                    <asp:Button CssClass="btn btn-primary active" ID="Button1" runat="server" Text="保存" OnClick="SaveYx_Click" AccessKey="s" Width="180px"></asp:Button></td>
                            </tr>
                        </table>
                    </asp:Panel>

                    <!--自定义桌面-->
                    <asp:Panel ID="panelzm" runat="server" Visible="false">
                        <table style="table-layout: fixed; margin-top:40px;">
                            <tr>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align:left;">
                                    <asp:CheckBox ID="c1" runat="server" Text="显示邮件提示" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align:left;">
                                    <asp:CheckBox ID="c10" runat="server" Text="显示企业公告" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align:left;">
                                    <asp:CheckBox ID="c11" runat="server" Text="显示规章制度" /></td>
                            </tr>
                            <tr>
                                <td></td>
                                <td style="text-align:left;">
                                    <asp:CheckBox ID="c4" runat="server" Text="显示我的申请" /></td>
                            </tr>
                            <%--   <tr>
                                            <td></td>
                                            <td>
                                                <asp:CheckBox ID="cbx_c6" runat="server" Text="显示待审批单据" /></td>
                                        </tr>
                                        <tr>
                                            <td></td>
                                            <td>
                                                <asp:CheckBox ID="cbx_c7" runat="server" Text="显示库存余量提醒" /></td>
                                        </tr>--%>
                            <tr>
                                <td style="text-align:right;">菜单风格：</td>
                                <td colspan="0" style="text-align:left;">
                                    <asp:RadioButtonList ID="c13" runat="server" RepeatDirection="Horizontal">
                                        <asp:ListItem Text="分栏样式" Value="Y" Selected="true"></asp:ListItem>
                                        <asp:ListItem Text="树型样式" Value="N"></asp:ListItem>
                                    </asp:RadioButtonList></td>
                            </tr>
                            <tr style="line-height:4;">
                                <td></td>
                                <td style="text-align:left;">
                                    <asp:Button ID="Button2" runat="server" Text="保存" CausesValidation="true" CssClass="btn btn-primary active" OnClick="SaveZm_Click" Width="180px"/></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>
            </div>
        </div>

    </form>
</body>
</html>
