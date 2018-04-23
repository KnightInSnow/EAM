<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sqwpth_add.aspx.cs" Inherits="FCSystem.OA.wpth_new.sqwpth_add" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>申请物品归还</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("ghbt");  //初始化设置光标焦点
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
</head>
<body class="main" onload="SetFocus();" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td width="80%">新增物品归还</td>
                    <td class="td_oa" width="20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <br/>
                        <table id="search" cellspacing="1" cellpadding="1" width="95%" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <table style="table-layout: fixed;">
                                            <tr>
                                                <td>归还标题：</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="ghbt" runat="server" Width="450"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="ghbt"
                                                        ErrorMessage="请输入退回标题">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>                                                                                   
                                            <tr>
                                                <td>物品分类：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="wpfl" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator3"
                                                        runat="server"
                                                        ControlToValidate="wpfl"
                                                        ErrorMessage="请选择物品分类">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                                <tr>
                                                <td>物品名称：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="wpmc" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="wpmc_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator7"
                                                        runat="server"
                                                        ControlToValidate="wpmc"
                                                        ErrorMessage="请选择归还物品">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>收回部门</td>
                                                <td>
                                                    <asp:DropDownList ID="shbm" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="shbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator2"
                                                        runat="server"
                                                        ControlToValidate="shbm"
                                                        ErrorMessage="请选择物品收回部门">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>收回仓库</td>
                                                <td>
                                                    <asp:DropDownList ID="shck" Width="450" runat="server" AutoPostBack="true">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator8"
                                                        runat="server"
                                                        ControlToValidate="shck"
                                                        ErrorMessage="请选择物品收回仓库">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>归还数量：</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="ghsl" runat="server" Width="150" MaxLength="25"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator6"
                                                        runat="server"
                                                        ControlToValidate="ghsl"
                                                        ErrorMessage="请输入申请退回数量">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator
                                                        ID="RegularExpressionValidator1"
                                                        ControlToValidate="ghsl"
                                                        Display="none"
                                                        ErrorMessage="申退数量必须为大于0的整数"
                                                        ValidationExpression="^[1-9]{1}[\d]*$"
                                                        runat="server">
                                                    </asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90px">归还说明：</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="ghsm" runat="server" Width="450" Rows="3" TextMode="multiLine"></asp:TextBox>                                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90px" class="td_no"></td>
                                                <td colspan="3">
                                                    <hr size="1" noshade />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                            </tr>
                                            <%--   <tr>
                                                <td style="width: 90px" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="jsr" runat="server">
                                                        <asp:ListItem Text="选择下一步审批人" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator7"
                                                        runat="server"
                                                        ControlToValidate="jsr"
                                                        ErrorMessage="请选择下一步骤的审批人">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                    <asp:HyperLink ID="flsm" runat="server" Target="_blank" Enabled="false">点击查看分类流程说明</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90px" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知下一步审批人" Checked="true" />
                                                    <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知下一步审批人" />
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 30px">
                                                    <asp:Button ID="Qrgh" runat="server" Text="归还" cssclass="mybutton" OnClick="Qrgh_Click" /><asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false" class="mybtn_d1" AccessKey="r" /><input type="button" name="BackBtn" value=" 关闭 " class="mybtn_d1" onclick="javascript: window.close()" accesskey="q" />
                                                    <asp:ValidationSummary
                                                        ID="ValidationSummary2"
                                                        runat="server"
                                                        EnableClientScript="true"
                                                        ShowMessageBox="true"
                                                        ShowSummary="false"></asp:ValidationSummary>
                                                </td>
                                            </tr>
                                            <%--   <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 60px">
                                                    <font color="red">提示1：物品分类下拉框显示的是选定收回部门下的信息，带*号为固定资产分类！</font>
                                                    <br />
                                                    <font color="red">提示2：当选择的是普通物品分类时，[下一步审批人]显示您所在部门的管理者<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(并且是领用审批人员)！</font>
                                                    <br />
                                                    <font color="red">提示3：当选择了固定资产分类时，[下一步审批人]显示收回部门下的资产管理员！</font>
                                                </td>
                                            </tr>--%>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Label ID="lblmaxthid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblmaxindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="rkmxid" runat="server"></asp:Label>
    </form>
</body>
</html>
