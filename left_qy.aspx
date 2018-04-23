<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="left_qy.aspx.cs" Inherits="FCSystem.left_qy" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <link href="../css/Main.css" type="text/css" rel="stylesheet" />
    <title>菜单</title>
    <%--<style type="text/css">
        body {
            SCROLLBAR-FACE-COLOR: #132152;
            SCROLLBAR-HIGHLIGHT-COLOR: #FFFFFF;
            SCROLLBAR-SHADOW-COLOR: #1b3665;
            SCROLLBAR-3DLIGHT-COLOR: #1b3665;
            SCROLLBAR-ARROW-COLOR: #1b3665;
            SCROLLBAR-TRACK-COLOR: #70ADDE;
            SCROLLBAR-DARKSHADOW-COLOR: #9EC0DE;
        }
    </style>--%>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="self.status='登录人：<%=Server.UrlDecode(Session["yhxm"].ToString())%>  登录时间：<%=Session["dlsj"].ToString()%>   所属职位：<%=Server.UrlDecode(Session["bmmc"].ToString())%>   数据更新时间：<%=Session["uptime"].ToString()%>'">
    <form id="Form1" runat="server">
        <div style="overflow-y:scroll; height:100%; overflow-x:hidden;">
        <table width="100%" style="height: 100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#1C5A91">
            <tr>
                <td>
                    <table style="height: 100%">
                        <tr style="background-image: url(images/leftbg3.jpg);">
                            <td style="height: 10px; width: 100%"></td>
                        </tr>

                        <tr style="background-image: url(images/leftbg3.jpg);">
                            <td valign="top">
                                <asp:TreeView ID="TreeView1" runat="server"
                                    BorderStyle="None"
                                    NodeWrap="True"
                                    ShowLines="True"
                                    ExpandDepth="0"
                                    LineImagesFolder="~/TreeLineImages"
                                    NodeStyle-ForeColor="#FFFFFF"
                                    RootNodeStyle-ForeColor="#000000"
                                    RootNodeStyle-Font-Size="10.5pt"
                                    NodeStyle-Font-Size="10pt"
                                    HoverNodeStyle-ForeColor="#FFFF00"
                                    ParentNodeStyle-ForeColor="#000000"
                                    ParentNodeStyle-Font-Size="10.5pt">
                                </asp:TreeView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
            </div>
    </form>
</body>
</html>
