<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="main.aspx.cs" Inherits="FCSystem.main1" %>

<!DOCTYPE HTML>

<html>
<head>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />--%>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <%
        Response.Expires = 0;
        Response.ExpiresAbsolute = DateTime.Now.AddSeconds(-1);
        Response.CacheControl = "no-cache";
    %>

    <title>固定资产管理系统</title>
    <link href="../css/Main.css" type="text/css" rel="stylesheet" />
    <%-- <script language="javascript" id="clientEventHandlersJS">  
        function document_oncontextmenu() { 
            //禁止右键菜单
            return false; 
        }  
    </script>
    <script language="javascript" event="oncontextmenu" for="document">  
        return document_oncontextmenu()  
    </script>--%>
</head>
<frameset border="0" bordercolor="#8CA1AE" framespacing="7" name="full" cols="*" id="fsTop" marginwidth="0" marginheight="0" leftmargin="0" topmargin="0" rows="82,*">
  <frame border="0" frameborder="no" marginheight="0" marginwidth="0" name="topframe" noresize scrolling="no" src="top.aspx" leftmargin="0" topmargin="0">
  <frameset border="1" frameborder="1" framespacing="7" marginwidth="0" marginheight="0" name="cen"  cols="185,*">
    <frame noresize border="0" frameborder="0" name="leftframe" src="<%=Link_File %>" scrolling="no" marginheight="0" marginwidth="0" leftmargin="0" topmargin="0">
    <frame border="0" frameborder="no" bordercolor="#8CA1AE"  name="mainframe" src="initmain.aspx" target="_blank" marginheight="0" marginwidth="0" leftmargin="0" topmargin="0" scrolling="yes">
  </frameset>      
<noframes>
  <body>
  <p>
      <font color=red>抱歉！本系统使用了框架技术，但您的浏览器不支持框架。
      </font>
  </p>
  </body>
</noframes>
</frameset>
</html>
