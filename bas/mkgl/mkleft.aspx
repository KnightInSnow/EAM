<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mkleft.aspx.cs"  Inherits="FCSystem.BAS.mkgl.mkleft" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
<form id="Form1" runat="server">
<table width="100%" align=center border="0" cellpadding="0" cellspacing="0">
<tr>
<td width="8px" height="8px"></td>
<td></td>
</tr>
<tr>
<td height="22px"></td>
<td background="../images/smallbg.jpg">&nbsp;<b>模块</b></td>
</tr>
<tr>
<td></td>
  <td valign="top">
    <asp:TreeView  ID="TreeView1" runat="server" 
        Font-Size="10px" 
        BorderStyle="None" 
        ForeColor="Black" 
        NodeWrap="True" 
        ShowLines="True" 
        ExpandDepth="1" 
        Font-Bold="true" 
        OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" CssClass="TreeView2">
    </asp:TreeView>
  </td>
</tr>
</table>
</form>
</body>
</html>
