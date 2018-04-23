<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="auth.aspx.cs" Inherits="FCSystem.oa.sq.auth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true">
        </asp:ScriptManager>

        <div class="PageHead">授权</div>
        <div class="PageBody-Top-Inputs">
            <asp:HiddenField ID="hifID" runat="server" Value="0" />
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="width:40%; text-align:right;">ID号：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtID" ReadOnly="true" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">密钥：</td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="txtKey" runat="server" Height="85px" TextMode="MultiLine" Width="372px"></asp:TextBox>
                            </td>

                        </tr>
                        <tr>
                            <td colspan="2" style="height:50px;">
                                <asp:Button ID="btnLogin" CssClass="mybutton" runat="server" Text="验证" OnClick="btnLogin_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
    </div>
    </form>
</body>
</html>
