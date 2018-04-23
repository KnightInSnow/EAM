<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="bmleft.aspx.cs" Inherits="FCSystem.BAS.bmgl.bmleft" %>


<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="Form1" runat="server">
        <table width="100px" align="center" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="8px" height="8px"></td>
                <td></td>
            </tr>

            <tr>
                <td height="22px"></td>
                <td background="../images/smallbg.jpg">&nbsp;<b>部门</b></td>
            </tr>

            <tr>
                <td></td>
                <td valign="top">
                    <asp:TreeView ID="TreeView1" runat="server"
                        Font-Size="10pt"
                        BorderStyle="None"
                        ForeColor="Black"
                        NodeWrap="True"
                        ShowLines="True"
                        ExpandDepth="2"
                        OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ExpandImageUrl="~" NoExpandImageUrl="~/images/dept.gif">
                    </asp:TreeView>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
