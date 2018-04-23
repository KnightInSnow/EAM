<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pkclyj.aspx.cs" Inherits="FCSystem.OA.pd.pkclyj" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>盘亏处理说明</title>
      <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function refreshParentWin() {
            window.opener.location.href = window.opener.location.href;
        }
    </script>
</head>
<body class="main" onbeforeunload="refreshParentWin();">
    <form id="form1" runat="server">
        <table width="500px" border="0" cellpadding="0" cellspacing="0" align="center">
            </br>
            <tr style="height:80px">
                <td class="td_d3" width="20%">
                    盘亏说明：
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
                    <asp:Button ID="btn_qr" runat="server" Text="提交" cssclass="mybutton" OnClick="btn_qr_Click" /></td>
            </tr>
        </table>
        <asp:Label ID="lbl_pdqdtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_planid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_maxlyindex" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
