<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zwwh_view.aspx.cs" Inherits="FCSystem.BAS.bmgl.zwwh_view" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
    <title>职位维护</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet"/>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("zwmc");  //初始化设置光标焦点
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
            <table style="table-layout:fixed;">

                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>职位信息</td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
            </table>
        </div>

        <div class="PopBodyInputs">
            <table style="table-layout:fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td colspan="3" style="height: 80"></td>
                </tr>

                <tr>
                    <td>职位名称：</td>
                    <td colspan="4">
                        <asp:TextBox ID="zwmc" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>职位描述：</td>
                    <td colspan="4">
                        <asp:TextBox ID="zwms" runat="server" CssClass="form-control" TextMode="multiLine" Rows="5"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td colspan="1"></td>
                    <td colspan="4" align="center">
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
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="zwmc"
                            ErrorMessage="请输入职位名称">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator9"
                            ControlToValidate="zwms"
                            Display="none"
                            ErrorMessage="职位描述不能超过100个字"
                            ValidationExpression="^(\s|\S){0,100}$"
                            runat="server">
                        </asp:RegularExpressionValidator>

                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
