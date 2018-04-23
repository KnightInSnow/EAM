<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpgh_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.wpgh_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>物品归还信息</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td width="80%">物品归还信息</td>
                    <td class="td_oa"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <br />
                        <table style="table-layout: fixed">
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
                                                <td>申请部门：</td>
                                                <td>
                                                    <asp:DropDownList ID="sqbm" Width="450" runat="server" AutoPostBack="True" OnSelectedIndexChanged="sqbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator5"
                                                        runat="server"
                                                        ControlToValidate="sqbm"
                                                        ErrorMessage="请选择申请部门">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>申请人员：</td>
                                                <td>
                                                    <asp:DropDownList ID="sqry" Width="450" runat="server">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator4"
                                                        runat="server"
                                                        ControlToValidate="sqry"
                                                        ErrorMessage="请选择申请人员">&nbsp;
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
                                                <td colspan="2">
                                                    <asp:Label ID="lbltip" runat="server" ForeColor="Red" Text="送审前请重新选择相应信息！" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 30px">
                                                    <asp:Button ID="SongShen" runat="server" Text="送审" cssclass="mybutton" OnClick="SongShen_Click" /><input type="button" name="BackBtn" value=" 关闭 " class="mybtn_d1" onclick="javascript: window.close()" accesskey="q" />
                                                    <asp:ValidationSummary
                                                        ID="ValidationSummary2"
                                                        runat="server"
                                                        EnableClientScript="true"
                                                        ShowMessageBox="true"
                                                        ShowSummary="false"></asp:ValidationSummary>
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
        <asp:Label ID="lblghid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblghdh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="rkmxid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblghzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblindex" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
