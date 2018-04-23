<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="top.aspx.cs" Inherits="FCSystem.top" %>


<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>页面顶部导航条部分</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript">
        function shleft() {
            if (parent.cen.cols == "0,*") {
                parent.cen.cols = "180,*,"
                document.getElementById("shleft").src = "/images/maxsize.gif"
                document.getElementById("shleft").alt = "收缩菜单栏";
            }
            else {
                parent.cen.cols = "0,*"
                document.getElementById("shleft").src = "/images/rest.gif"
                document.getElementById("shleft").alt = "还原菜单栏";
            }
        }
    </script>
    <link href="../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../css/Layout.css" type="text/css" rel="stylesheet" />

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <%-- 导航条主体--%>
    <div class="nvatop">
        <%-- 导航条管理员部分--%>
        <div style="float:left;margin-right:16px;width:146px;">
            <img src="images/admin.png" style="float:left;margin-right:15px;"></>
            <span style="float:left;color:#ffffff;font-size:12px;font-weight:bold;margin-top:10px;width:75px;">
                <%=Server.UrlDecode(Session["yhxm"].ToString())%>&nbsp;
            </span><br />
            <span style="color:#ffffff;font-size:12px;">管理员</span>
        </div>
        <%-- 导航条log--%>
            <img src="images/newlog.png" style="float:left;"></>
        <%-- 导航条右侧功能按钮--%>
        <div style="width:42%;float:right;height:24px;">
             <%-- 退出系统--%>
            <a href="#" class="top_text" onclick="javascript:if(confirm('确认要退出系统吗？这将会导致任何未存储的数据遗失！')){ location.href='logout.aspx?id=1';top.window.close();}">
                <img src="/images/newlogout.png" border="0" alt="退出系统" />
            </a>
              <%-- 个人设置--%>
            <a href="myset.aspx" target="mainframe" class="top_text">
                <img src="/images/newset.png" border="0" alt="查看人员通讯信息" />
            </a>
             <%-- 通讯录--%>
            <a href="#" onclick="javascript:popAdd('/oa/txl/txl.aspx');" class="top_text">
                <img src="/images/newphbook.png" border="0" alt="查看人员通讯信息" />
            </a>
             <%-- 修改资料--%>
            <a href="mod_zl.aspx" target="mainframe" class="top_text">
                <img src="/images/newcode.png" border="0" alt="修改资料" />
            </a>
              <%-- 回到主页--%>
            <a href="initmain.aspx" target="mainframe" class="top_text">
                <img src="/images/newhome.png" border="0" alt="回到桌面" />
            </a>
           
        </div>
         <%--<div id="viewdate" style="width:28%;float:right;color:#ffffff;margin-top:16px; font-size:15px;text-align:right;"></div>--%>
    </div>
    <%--<form id="form1" runat="server">--%>
       <%-- <table width="80%" height="82" border="0" cellpadding="0" cellspacing="0">--%>
            <%-- <tr>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="400px">
                                <img src="images/newlog.png" border="0" style="width: 400px; height: 57px"></>
                            </td>
                            <td align="right" valign="top" style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr=#132152, endColorStr=#2B73B8, gradientType=1)">
                                <%--   <td align="right" valign="top"  style="FILTER: progid:DXImageTransform.Microsoft.Gradient(startColorStr=#ffffff, endColorStr=#2B73B8, gradientType=1)">--%>
                               <%--  <table width="100%" border="0" cellspacing="0" cellpadding="0" background="red" class="nvatop">
                                    <tr>
                                        <td align="right" class="baise" style="height:55px;">
                                            <a class="top_text" href='javascript:shleft();'>
                                                <img src="/images/maxsize.gif" name="shleft" id="shleft" border="0" value="隐藏" alt="收缩菜单栏"></a>
                                            <font color="white">您好！<%=Server.UrlDecode(Session["yhxm"].ToString())%>&nbsp;</font>
                                            <a href="myset.aspx" target="mainframe"><font color="black">个人设定</font></a>&nbsp;<font color="black">|</font>
                                            <a href="mod_pwd.aspx" target="mainframe"><font color="black">修改密码</font></a>&nbsp;<font color="black">|</font>
                                            <a href="mod_zl.aspx" target="mainframe"><font color="black">修改资料</font></a>&nbsp;<font color="black">|</font>
                                            <a href="logout.aspx" target="_parent"><font color="black">注销登出</font></a>&nbsp;<font color="black">|</font>
                                            <a href="#" onclick="javascript:if(confirm('确认要退出系统吗？这将会导致任何未存储的数据遗失！')){ location.href='logout.aspx?id=1';top.window.close();}"><font color="red">退出系统</font></a>&nbsp;
                    <p>
                        <%-- <font color="#ffffff">--%>
                           <%-- <div id="viewdate"></div>--%>
                        <%--</font>--%>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td height="27" background="images/topbg.jpg">
                    <table width="80%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="12">
                                <img src="images/topbg0.gif"></td>
                            <td valign="bottom">&nbsp;&nbsp;</td>
                            <td align="right" style="vertical-align:top;">
                                <a href="initmain.aspx" target="mainframe" class="top_text">
                                    <img src="/images/index.gif" border="0" alt="回到桌面" />回桌面</a>
                                <%--  <a href="/quick.aspx" target="mainframe"  class="top_text"><img src="/images/face.gif" border="0" alt="进入我的快捷方式" />快捷方式</a>--%>
                                <%-- <a href="dbsy.aspx" target="mainframe" class="top_text"><img src="/images/work.gif" border="0" alt="您待办的工作列表" />待办事宜</a>--%>
                                <%--      <a href="#" onclick="javascript:popAdd('/bas/bmgl/gwzz_view.aspx?url=index');" class="top_text">
                                    <img src="/images/zhize.gif" border="0" alt="您目前所处岗位的具体职责" />我的职责</a>--%>
                                <% if (Session["ui_yndx"].ToString() == "Y")
                                   { %>
                                <%--     <a href="#" onclick="javascript:MiniX('/oa/dxgl/mini_xdx.aspx');" class="top_text">
                                    <img src="/images/group.gif" border="0" alt="发送手机短信" />发短信</a>--%>
                                <%}%>
                                <%-- <a href="#" onclick="javascript:MiniX('/oa/xxgl/minixx.aspx')" class="top_text"><img src="/images/mess.gif" border="0" alt="发送站内消息" />发消息</a>
		    <a href="#" onclick="javascript:popAdd('/oa/yjgl/mini_xyj.aspx');" class="top_text"><img src="/images/mail.gif" border="0" alt="发送站内邮件" />发邮件</a>--%>
                                <%-- <a href="#" onclick="javascript:popAdd('/oa/txl/txl.aspx');" class="top_text">
                                    <img src="/images/book.gif" border="0" alt="查看人员通讯信息" />通讯录</a>
                                <%--      <a href="/oa/jsb/wdjsb.aspx" target="mainframe" class="top_text">
                                    <img src="/images/thing.gif" border="0" alt="记录个人的日常事件" />记事本</a>&nbsp;--%>
                            <%-- </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>--%>
</body>
</html>
<script language="JavaScript"> 
<!-- Begin
    var bsYear;
    var bsDate;
    var bsWeek;
    var arrLen = 8;
    var sValue = 0;
    var dayiy = 0;
    var miy = 0;
    var iyear = 0;
    var dayim = 0;
    var spd = 86400;
    var year1999 = "30;29;29;30;29;29;30;29;30;30;30;29";
    var year2000 = "30;30;29;29;30;29;29;30;29;30;30;29";
    var year2001 = "30;30;29;30;29;30;29;29;30;29;30;29;30";
    var year2002 = "30;30;29;30;29;30;29;29;30;29;30;29";
    var year2003 = "30;30;29;30;30;29;30;29;29;30;29;30";
    var year2004 = "29;30;29;30;30;29;30;29;30;29;30;29;30";
    var year2005 = "29;30;29;30;29;30;30;29;30;29;30;29";
    var year2006 = "30;29;30;29;30;30;29;29;30;30;29;29;30";
    var month1999 = "正月;二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
    var month2001 = "正月;二月;三月;四月;闰四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
    var month2004 = "正月;二月;闰二月;三月;四月;五月;六月;七月;八月;九月;十月;十一月;十二月"
    var month2006 = "正月;二月;三月;四月;五月;六月;七月;闰七月;八月;九月;十月;十一月;十二月"
    var Dn = "初一;初二;初三;初四;初五;初六;初七;初八;初九;初十;十一;十二;十三;十四;十五;十六;十七;十八;十九;二十;廿一;廿二;廿三;廿四;廿五;廿六;廿七;廿八;廿九;三十";
    var Ys = new Array(arrLen);
    Ys[0] = 919094400; Ys[1] = 949680000; Ys[2] = 980265600;
    Ys[3] = 1013443200; Ys[4] = 1044028800; Ys[5] = 1074700800;
    Ys[6] = 1107878400; Ys[7] = 1138464000;
    var Yn = new Array(arrLen);
    Yn[0] = "己卯年"; Yn[1] = "庚辰年"; Yn[2] = "辛巳年";
    Yn[3] = "壬午年"; Yn[4] = "癸未年"; Yn[5] = "甲申年";
    Yn[6] = "乙酉年"; Yn[7] = "丙戌年";
    var D = new Date();
    var yy = D.getYear();
    var mm = D.getMonth() + 1;
    var dd = D.getDate();
    var ww = D.getDay();
    if (ww == 0) ww = "<font color=#ffffff>星期日";
    if (ww == 1) ww = "星期一";
    if (ww == 2) ww = "星期二";
    if (ww == 3) ww = "星期三";
    if (ww == 4) ww = "星期四";
    if (ww == 5) ww = "星期五";
    if (ww == 6) ww = "<font color=#ffffff>星期六";
    ww = ww;
    var ss = parseInt(D.getTime() / 1000);
    if (yy < 100) yy = "19" + yy;
    for (i = 0; i < arrLen; i++)
        if (ss >= Ys[i]) {
            iyear = i;
            sValue = ss - Ys[i];
        }
    dayiy = parseInt(sValue / spd) + 1;
    var dpm = year1999;
    if (iyear == 1) dpm = year2000;
    if (iyear == 2) dpm = year2001;
    if (iyear == 3) dpm = year2002;
    if (iyear == 4) dpm = year2003;
    if (iyear == 5) dpm = year2004;
    if (iyear == 6) dpm = year2005;
    if (iyear == 7) dpm = year2006;
    dpm = dpm.split(";");
    var Mn = month1999;
    if (iyear == 2) Mn = month2001;
    if (iyear == 5) Mn = month2004;
    if (iyear == 7) Mn = month2006;
    Mn = Mn.split(";");
    var Dn = "初一;初二;初三;初四;初五;初六;初七;初八;初九;初十;十一;十二;十三;十四;十五;十六;十七;十八;十九;二十;廿一;廿二;廿三;廿四;廿五;廿六;廿七;廿八;廿九;三十";
    Dn = Dn.split(";");
    dayim = dayiy;
    var total = new Array(13);
    total[0] = parseInt(dpm[0]);
    for (i = 1; i < dpm.length - 1; i++) total[i] = parseInt(dpm[i]) + total[i - 1];
    for (i = dpm.length - 1; i > 0; i--)
        if (dayim > total[i - 1]) {
            dayim = dayim - total[i - 1];
            miy = i;
        }
    bsWeek = ww;
    bsDate = yy + "年" + mm + "月";
    bsDate2 = dd;
    bsYear = "农历" + Yn[iyear];
    bsYear2 = Mn[miy] + Dn[dayim - 1];
    if (ss >= Ys[7] || ss < Ys[0]) bsYear = Yn[7];
    document.getElementById("viewdate").innerHTML = "今天是：" + bsDate + bsDate2 + "日 " + bsWeek + ".";

    // End -->
</script>
