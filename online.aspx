<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="online.aspx.cs" Inherits="FCSystem.online" %>


<!DOCTYPE HTML>

<html>
<head>
    <title>短讯中心</title>
    <meta name="GENERATOR" content="Microsoft Visual Studio 7.0" />
    <meta name="vs_defaultClientScript" content="JavaScript" />
    <meta name="vs_targetSchema" content="http://schemas.microsoft.com/intellisense/ie5" />
    <link href="../css/Main.css" type="text/css" rel="stylesheet" />
    <script language="javascript">
        function SetCookie(sName, sValue)
        {
            document.cookie = sName + "=" + escape(sValue) + "; ";
        }
	
        function GetCookie(sName)
        {
            var aCookie = document.cookie.split("; ");
            for (var i=0; i < aCookie.length; i++)
            {
                var aCrumb = aCookie[i].split("=");
                if (sName == aCrumb[0]) 
                    return unescape(aCrumb[1]);
            }
        }

        function show_sm()
        {
            if (typeof(msgwin)!="undefined" && msgwin.open && !meizz.closed)
            {
                msgwin.focus();
            }
            else
            {
                mytop=screen.availHeight-246;
                myleft=0;
                var msgwin = window.open("../sm/msgmanage.aspx","auto_call_show","height=200,width=370,status=0,toolbar=no,menubar=no,location=no,scrollbars=no,top="+mytop+",left="+myleft+",resizable=no");
            }
        }

        function re()
        {
            location.reload();
        }
    </script>
    <script language="javascript" id="clientEventHandlersJS"> 
<!-- 
    function document_oncontextmenu() { 
        //禁止右键菜单
        return false; 
    } 
    //--> 
    </script>
    <script language="javascript" event="oncontextmenu" for="document"> 
<!--         return document_oncontextmenu() ;    --> 
    </script>
</head>
<body leftmargin="0" topmargin="0" style="background-image: url(images/leftbg.gif);" onload='setInterval("re()",(GetCookie("UDS_RefreshTime"))==null?300000:GetCookie("UDS_RefreshTime"))'>
    <form id="Online" method="post" runat="server">
        <table style="table-layout: fixed">
            <tr>
                <td style="height: 20px" align="center">
                    <!--<a href="left_qy.aspx" target="lefttopframe" class="top_text"><img src="/images/systemmenu.gif" border="0" alt="系统默认提供的菜单" /></a>
					    <a href="left_qy.aspx" target="lefttopframe" class="top_text"><img src="/images/mymenu.gif" border="0" alt="属于您自己的自定义菜单" /></a>&nbsp;&nbsp;
					    <a href="/bas/xtrz/onlineyh.aspx" target="mainframe" class="top_text"><img src="/images/online.gif" border="0" alt="当前在线的用户" /></a>-->
                    <asp:Literal ID="lit" runat="server" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
