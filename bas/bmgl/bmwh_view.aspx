<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="bmwh_view.aspx.cs" Inherits="FCSystem.BAS.bmgl.bmwh_view" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
     <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>部门维护</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("bmmc");  //初始化设置光标焦点
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

        <div class="PopHead">
            <table>
                <tr>
                    <td class="td_oa" width="80%" height="25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>部门档案</td>
                    <td class="td_oa" style="width: 20%"><span style="color:red;">*为必填信息</span></td>
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="bm_id" runat="server" Visible="False"></asp:TextBox></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="bm_sjbm" runat="server" Visible="False"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>部门代码:</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="bmdm" runat="server" Visible="true"></asp:TextBox></td>

                </tr>

                <tr>
                    <td>部门名称：<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:TextBox CssClass="form-control" ID="bmmc" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>上级部门：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="bmsjbm" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>负责人：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="fzr" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>部门类型：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="bmlx" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2" style="text-align:left;">
                        <asp:CheckBox ID="ynffbm" runat="server" Text="是否为发放部门" /></td>
                </tr>
                <tr>
                    <td>电话：</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="bmdh" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>传真：</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="bmcz" runat="server"></asp:TextBox></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>备注：</td>
                    <td colspan="4">
                        <asp:TextBox ID="bmbz" runat="server" CssClass="form-control" TextMode="multiLine" Rows="5"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4" align="center">
                        <asp:Button CssClass="btn btn-primary active" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click" Visible="false" />
                        <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s"></asp:Button>
                        <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" AccessKey="d" Visible="false" OnClientClick="return confirm('确认要执行删除吗？')"></asp:Button>
                        <input type="button" name="CloseBtn" value="关闭" class="btn btn-primary active" onclick="javascript: window.close()" accesskey="q" />
                    </td>
                </tr>
            </table>
        </div>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="bmmc"
            ErrorMessage="请输入部门名称">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator7"
            ControlToValidate="bmdh"
            Display="none"
            ErrorMessage="电话格式错误，参考格式010-62288888、62288888、010-62288888-815"
            ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
            runat="server">
        </asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator8"
            ControlToValidate="bmcz"
            Display="none"
            ErrorMessage="传真格式错误，参考格式010-62222222、62222222、010-62222222-832"
            ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
            runat="server">
        </asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator9"
            ControlToValidate="bmbz"
            Display="none"
            ErrorMessage="备注内容不能超过50个字"
            ValidationExpression="^(\s|\S){0,50}$"
            runat="server">
        </asp:RegularExpressionValidator>

    </form>
</body>
</html>
