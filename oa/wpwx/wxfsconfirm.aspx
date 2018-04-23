<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wxfsconfirm.aspx.cs" Inherits="FCSystem.OA.wpwx.wxfsconfirm" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <base target="_self" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <title>维修方式确认</title>
    <script type="text/javascript">
        function onbeforeclose() {
            var swxdid = '<%= lblwxdid.Text%>';
            window.dialogArguments.location.assign('wxqr_mod.aspx?id=' + swxdid); 
        }
    </script>
</head>
<body class="main" onunload="onbeforeclose()">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tr>
                <td class="td_q_space"></td>
            </tr>
            <tr>
                <td align="center">
                    <font size="3px">您选择的资产将以</font>
                    <asp:Label ID="lblTip" runat="server" Font-Size="14pt" Text=""></asp:Label><font size="3px">方式进行处理，系统会自动生成<asp:Label ID="lbldjmc" runat="server" Font-Size="14pt" Text=""></asp:Label>，是否确认？</font>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Label ID="lblZcxx" runat="server" Text=""></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="td_q_space"></td>
            </tr> 
            <tr>
                <td class="td_q_space"></td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Button ID="btn_qr" runat="server" Text="确定" cssclass="mybutton" OnClick="btn_qr_Click" />
                    <asp:Button ID="btn_cancel" runat="server" Text="取消" cssclass="mybutton" OnClick="btn_cancel_Click" />
                </td>
            </tr>
        </table>
        <asp:Label ID="lblWxfs" runat="server" Visible="False"></asp:Label><asp:Label ID="lblWxzctid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblwxdid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblbmcode" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblwxbz" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
