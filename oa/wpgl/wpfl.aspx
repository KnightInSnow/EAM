<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wpfl.aspx.cs" Inherits="FCSystem.OA.wpgl.wpfl" %>

<!DOCTYPE HTML>

<html>
<head>
<meta HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312" />
<title>物品分类</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>

<frameset border="0" framespacing="0" name="full" cols="*" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" rows="20,*">
  <frame border="0" frameborder="no" marginheight="0" marginwidth="0" name="tframe" noresize scrolling="no" src="wpfl_top.aspx" leftmargin="0" topmargin="0">
  <frameset border="1" frameborder="yes" framespacing="0" cols="200,*">
    <frame src="wpfl_left.aspx" name="lframe" frameborder="yes" scrolling="auto" noresize>
    <frame src="wpfl_right.aspx" name="rframe" frameborder="yes" scrolling="auto"></frameset>
</frameset>

<noframes>
  <body>
  <p><font color="red">抱歉！本系统使用了框架技术，但您的浏览器不支持框架。</font></p>
  </body>
</noframes>
</html>
