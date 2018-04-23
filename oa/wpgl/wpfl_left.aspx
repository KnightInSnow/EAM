<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wpfl_left.aspx.cs" Inherits="FCSystem.OA.wpgl.wpfl_left" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="Form1" runat="server">
        <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="8px" height="8px"></td>
                <td></td>
            </tr>
            <tr>
                <td height="22px"></td>
                <td background="../images/smallbg.jpg">&nbsp;<b>物品分类</b></td>
            </tr>
            <tr>
                <td></td>
                <td valign="top">
                    <asp:TreeView ID="TreeView1" runat="server"
                        Font-Size="10pt"
                        BorderStyle="None"
                        ForeColor="Black"
                        NodeWrap="True"
                        ExpandDepth="2"
                        OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ImageSet="Arrows" Width="798px">
                        <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                        <NodeStyle Font-Names="Tahoma" Font-Size="10pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                        <ParentNodeStyle Font-Bold="False" />
                        <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" HorizontalPadding="0px" VerticalPadding="0px" />
                    </asp:TreeView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
