<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="role_view.aspx.cs" Inherits="FCSystem.BAS.gwjs.role_view" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>角色维护</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("jsmc");  //初始化设置光标焦点
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
            <table style="table-layout: fixed;">
                <tr>
                    <td class="td_oa" width="80%" height="25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>角色信息</td>
                    <td class="td_oa" width="20%"><span style="color:red;">*为必填信息</span></td>
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
                    <td>角色名称：<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:TextBox CssClass="form-control" ID="jsmc" runat="server" MaxLength="30"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>角色类型：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_rolelx" runat="server" CssClass="form-control">
                            <asp:ListItem Value="企业" Text="企业" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="维修" Text="维修"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td>备注：</td>
                    <td colspan="4">
                        <asp:TextBox ID="bz" runat="server" CssClass="form-control" TextMode="multiLine" Rows="6"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><br /></td>
                </tr>

                <tr>
                    <td colspan="1"></td>
                    <td colspan="4" align="center">
                        <asp:Button CssClass="btn btn-primary active" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click" Visible="false"></asp:Button>
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
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            ControlToValidate="jsmc"
                            Display="none"
                            ValidationExpression="^[\u4e00-\u9fa5]+$"
                            ErrorMessage="角色名称必需为汉字"
                            runat="server">
                        </asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator9"
                            ControlToValidate="bz"
                            Display="none"
                            ErrorMessage="备注内容不能超过100个字"
                            ValidationExpression="^(\s|\S){0,100}$"
                            runat="server">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="jsmc"
                            ErrorMessage="请输入角色名称">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
