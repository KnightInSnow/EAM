﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="syrdisagree.aspx.cs" Inherits="FCSystem.OA.pd.syrdisagree" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>不同意意见</title>
      <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table width="500px" border="0" cellpadding="0" cellspacing="0" align="center">
            </br>
            <tr style="height:80px">
                <td class="td_d3" width="20%">
                    意见说明：
                </td>
                <td width="80%">
                    <asp:TextBox ID="tbx_yj" runat="server" TextMode="MultiLine" Width="400px" Height="80px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td align="right" colspan="2">
                    <asp:Button ID="btn_qr" runat="server" Text="提交意见" cssclass="mybutton" OnClick="btn_qr_Click" /><asp:Button ID="btn_cancel" runat="server" Text="取消" cssclass="mybutton" OnClick="btn_cancel_Click"  OnClientClick="return confirm('确定退出吗？')"/></td>
            </tr>
        </table>
        <asp:Label ID="lbl_pdqdtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_planid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
