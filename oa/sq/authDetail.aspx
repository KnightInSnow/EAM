<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="authDetail.aspx.cs" Inherits="FCSystem.oa.sq.authDetail" %>

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
                                <asp:Label ID="lblID" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">PC端同时在线用户数：</td>
                            <td style="text-align:left;">
                                <asp:Label ID="lblPC" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">APP端同时在线用户数：</td>
                            <td style="text-align:left;">
                                <asp:Label ID="lblAPP" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">开始日期：</td>
                            <td style="text-align:left;">
                                <asp:Label ID="lblStartEnd" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;">结束日期：</td>
                            <td style="text-align:left;">
                                <asp:Label ID="lblEndDate" runat="server" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>
    </div>
    </form>
</body>
</html>
