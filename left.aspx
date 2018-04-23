<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="left.aspx.cs" Inherits="FCSystem.left" %>

<!DOCTYPE HTML>

<html>
<head>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />--%>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <%
        Response.Expires = 0;
        Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1);
        Response.CacheControl = "no-cache";
    %>
    <link href="../css/Main.css" type="text/css" rel="stylesheet" />
    <title>菜单</title>
</head>

<frameset rows="22,95%" frameborder="0" border="0" framespacing="0">
    <frame  name="onlineframe" scrolling="no" noresize border="0" src="Online.aspx" border="0">
    <frame  noresize border="0" frameborder="0" target="mainframe" scrolling="yes" marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" name="lefttopframe" src="<%=Link_File %>">
</frameset>

<noframes>
    <body bgcolor="#FFFFFF" text="#000000">
        对不起，您的浏览器不支持框架技术！
    </body>
  </noframes>
</html>
