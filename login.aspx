<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="login.aspx.cs" Inherits="FCSystem.login" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <%
        Response.Expires = 0;
        Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1);
        Response.CacheControl = "no-cache";
    %>
    <link href="../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/jquery-1.4.4.min.js"></script>
    <title>固定资产管理系统</title>

    <script type="text/javascript">

        function SetFocus() {
            var obj = document.getElementById("UserName");  //设置光标焦点，使用时可在body中加入upload，目前禁用，避免和判断分辨率程序冲突
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
        if (parent.location.href.indexOf("Admin_Index") > 0) { top.location.href = "default.aspx" };

        function ref() {
            refresh;
        }

    </script>
</head>
<body id="MyBody" runat="server" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" style='overflow: scroll; overflow-y: hidden; overflow-x: hidden'>

    <form id="browserpeek" runat="server" method="post" name="_DominoForm">
        <%--绝对位置整个屏幕--%>
        <div id="div0" style="border: 0px none #000000; left: 0%; overflow: hidden; width: 100%; position: absolute; top: 0%; height: 100%; background-color: #1b3665;">

            <%--将图片区域在整个屏幕上居中--%>
            <div id="div1" style="border: 0px none #000000; overflow: hidden; width: 600px; height: 300px; position: relative; left: 30%; top: 30%; background-color: #3d7acd; background-image: url('images/login/登陆4.jpg'); background-repeat: no-repeat;">

                <%--在图片区域里显示登录信息--%>
                <div id="div2" style="border: 0px none #000000; left: 46%; overflow: hidden; width: 50%; position: absolute; top: 32%; height: 50%;">

                    <table style="table-layout: fixed;">
                        <tbody>
                            <tr>
                                <td style="font-family: 宋体; font-size: 10pt; color: #000000; text-align:right;">用户帐号：</td>
                                <td>
                                    <asp:TextBox ID="UserName" MaxLength="20" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator1" runat="server" ErrorMessage="*" Display="Static" ControlToValidate="UserName"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family: 宋体; font-size: 10pt; color: #000000; text-align:right;">登录密码：</td>
                                <td>
                                    <asp:TextBox ID="UserPass" runat="server" TextMode="Password" MaxLength="16" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server" ErrorMessage="*" Display="Static" ControlToValidate="UserPass"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                                <td>
                                    <asp:Label ID="Msg" runat="server" ForeColor="Red"></asp:Label></td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td>
                                    <asp:Button ID="LoginBtn" OnClick="LoginBtn_Click" runat="server" Text=" 登录 " CssClass="btn btn-primary active"></asp:Button>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                    <asp:HiddenField ID="hifDbStatus" runat="server" Value="0" />
                </div>
            </div>
        </div>
        <asp:Label ID="lblSW" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSH" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
