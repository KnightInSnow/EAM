<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="left_qy_new.aspx.cs" Inherits="FCSystem.left_qy_new" %>
<%@ Register Assembly="NavMenu" Namespace="HeroBeastControls.NavMenu" TagPrefix="NavMenu" %>

<!DOCTYPE HTML>

<html style="760px;">
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="../css/Main.css" type="text/css" rel="stylesheet" />
<title>菜单</title> 
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="self.status='登录人：<%=Server.UrlDecode(Session["yhxm"].ToString())%>  登录时间：<%=Session["dlsj"].ToString()%>   所属职位：<%=Server.UrlDecode(Session["bmmc"].ToString())%>   数据更新时间：<%=Session["uptime"].ToString()%>'">
<form id="Form1" runat="server">
    <%----%>
    <div style="overflow-y:auto; height:100%; overflow-x:hidden;">
    <NavMenu:NavMenu ID="NavMenu1" runat="server" Width="162" BorderWidth="0"  BorderStyle="none" CssFilePath="css/NavMenu.css" ></NavMenu:NavMenu>
        </div>
</form>
</body>
</html>