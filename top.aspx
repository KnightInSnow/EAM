<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="top.aspx.cs" Inherits="FCSystem.top" %>


<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <title>ҳ�涥������������</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript">
        function shleft() {
            if (parent.cen.cols == "0,*") {
                parent.cen.cols = "180,*,"
                document.getElementById("shleft").src = "/images/maxsize.gif"
                document.getElementById("shleft").alt = "�����˵���";
            }
            else {
                parent.cen.cols = "0,*"
                document.getElementById("shleft").src = "/images/rest.gif"
                document.getElementById("shleft").alt = "��ԭ�˵���";
            }
        }
    </script>
    <link href="../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../css/Layout.css" type="text/css" rel="stylesheet" />

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <%-- ����������--%>
    <div class="nvatop">
        <%-- ����������Ա����--%>
        <div style="float:left;margin-right:16px;width:146px;">
            <img src="images/admin.png" style="float:left;margin-right:15px;"></>
            <span style="float:left;color:#ffffff;font-size:12px;font-weight:bold;margin-top:10px;width:75px;">
                <%=Server.UrlDecode(Session["yhxm"].ToString())%>&nbsp;
            </span><br />
            <span style="color:#ffffff;font-size:12px;">����Ա</span>
        </div>
        <%-- ������log--%>
            <img src="images/newlog.png" style="float:left;"></>
        <%-- �������Ҳ๦�ܰ�ť--%>
        <div style="width:42%;float:right;height:24px;">
             <%-- �˳�ϵͳ--%>
            <a href="#" class="top_text" onclick="javascript:if(confirm('ȷ��Ҫ�˳�ϵͳ���⽫�ᵼ���κ�δ�洢��������ʧ��')){ location.href='logout.aspx?id=1';top.window.close();}">
                <img src="/images/newlogout.png" border="0" alt="�˳�ϵͳ" />
            </a>
              <%-- ��������--%>
            <a href="myset.aspx" target="mainframe" class="top_text">
                <img src="/images/newset.png" border="0" alt="�鿴��ԱͨѶ��Ϣ" />
            </a>
             <%-- ͨѶ¼--%>
            <a href="#" onclick="javascript:popAdd('/oa/txl/txl.aspx');" class="top_text">
                <img src="/images/newphbook.png" border="0" alt="�鿴��ԱͨѶ��Ϣ" />
            </a>
             <%-- �޸�����--%>
            <a href="mod_zl.aspx" target="mainframe" class="top_text">
                <img src="/images/newcode.png" border="0" alt="�޸�����" />
            </a>
              <%-- �ص���ҳ--%>
            <a href="initmain.aspx" target="mainframe" class="top_text">
                <img src="/images/newhome.png" border="0" alt="�ص�����" />
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
                                                <img src="/images/maxsize.gif" name="shleft" id="shleft" border="0" value="����" alt="�����˵���"></a>
                                            <font color="white">���ã�<%=Server.UrlDecode(Session["yhxm"].ToString())%>&nbsp;</font>
                                            <a href="myset.aspx" target="mainframe"><font color="black">�����趨</font></a>&nbsp;<font color="black">|</font>
                                            <a href="mod_pwd.aspx" target="mainframe"><font color="black">�޸�����</font></a>&nbsp;<font color="black">|</font>
                                            <a href="mod_zl.aspx" target="mainframe"><font color="black">�޸�����</font></a>&nbsp;<font color="black">|</font>
                                            <a href="logout.aspx" target="_parent"><font color="black">ע���ǳ�</font></a>&nbsp;<font color="black">|</font>
                                            <a href="#" onclick="javascript:if(confirm('ȷ��Ҫ�˳�ϵͳ���⽫�ᵼ���κ�δ�洢��������ʧ��')){ location.href='logout.aspx?id=1';top.window.close();}"><font color="red">�˳�ϵͳ</font></a>&nbsp;
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
                                    <img src="/images/index.gif" border="0" alt="�ص�����" />������</a>
                                <%--  <a href="/quick.aspx" target="mainframe"  class="top_text"><img src="/images/face.gif" border="0" alt="�����ҵĿ�ݷ�ʽ" />��ݷ�ʽ</a>--%>
                                <%-- <a href="dbsy.aspx" target="mainframe" class="top_text"><img src="/images/work.gif" border="0" alt="������Ĺ����б�" />��������</a>--%>
                                <%--      <a href="#" onclick="javascript:popAdd('/bas/bmgl/gwzz_view.aspx?url=index');" class="top_text">
                                    <img src="/images/zhize.gif" border="0" alt="��Ŀǰ������λ�ľ���ְ��" />�ҵ�ְ��</a>--%>
                                <% if (Session["ui_yndx"].ToString() == "Y")
                                   { %>
                                <%--     <a href="#" onclick="javascript:MiniX('/oa/dxgl/mini_xdx.aspx');" class="top_text">
                                    <img src="/images/group.gif" border="0" alt="�����ֻ�����" />������</a>--%>
                                <%}%>
                                <%-- <a href="#" onclick="javascript:MiniX('/oa/xxgl/minixx.aspx')" class="top_text"><img src="/images/mess.gif" border="0" alt="����վ����Ϣ" />����Ϣ</a>
		    <a href="#" onclick="javascript:popAdd('/oa/yjgl/mini_xyj.aspx');" class="top_text"><img src="/images/mail.gif" border="0" alt="����վ���ʼ�" />���ʼ�</a>--%>
                                <%-- <a href="#" onclick="javascript:popAdd('/oa/txl/txl.aspx');" class="top_text">
                                    <img src="/images/book.gif" border="0" alt="�鿴��ԱͨѶ��Ϣ" />ͨѶ¼</a>
                                <%--      <a href="/oa/jsb/wdjsb.aspx" target="mainframe" class="top_text">
                                    <img src="/images/thing.gif" border="0" alt="��¼���˵��ճ��¼�" />���±�</a>&nbsp;--%>
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
    var month1999 = "����;����;����;����;����;����;����;����;����;ʮ��;ʮһ��;ʮ����"
    var month2001 = "����;����;����;����;������;����;����;����;����;����;ʮ��;ʮһ��;ʮ����"
    var month2004 = "����;����;�����;����;����;����;����;����;����;����;ʮ��;ʮһ��;ʮ����"
    var month2006 = "����;����;����;����;����;����;����;������;����;����;ʮ��;ʮһ��;ʮ����"
    var Dn = "��һ;����;����;����;����;����;����;����;����;��ʮ;ʮһ;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;��ʮ;إһ;إ��;إ��;إ��;إ��;إ��;إ��;إ��;إ��;��ʮ";
    var Ys = new Array(arrLen);
    Ys[0] = 919094400; Ys[1] = 949680000; Ys[2] = 980265600;
    Ys[3] = 1013443200; Ys[4] = 1044028800; Ys[5] = 1074700800;
    Ys[6] = 1107878400; Ys[7] = 1138464000;
    var Yn = new Array(arrLen);
    Yn[0] = "��î��"; Yn[1] = "������"; Yn[2] = "������";
    Yn[3] = "������"; Yn[4] = "��δ��"; Yn[5] = "������";
    Yn[6] = "������"; Yn[7] = "������";
    var D = new Date();
    var yy = D.getYear();
    var mm = D.getMonth() + 1;
    var dd = D.getDate();
    var ww = D.getDay();
    if (ww == 0) ww = "<font color=#ffffff>������";
    if (ww == 1) ww = "����һ";
    if (ww == 2) ww = "���ڶ�";
    if (ww == 3) ww = "������";
    if (ww == 4) ww = "������";
    if (ww == 5) ww = "������";
    if (ww == 6) ww = "<font color=#ffffff>������";
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
    var Dn = "��һ;����;����;����;����;����;����;����;����;��ʮ;ʮһ;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;ʮ��;��ʮ;إһ;إ��;إ��;إ��;إ��;إ��;إ��;إ��;إ��;��ʮ";
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
    bsDate = yy + "��" + mm + "��";
    bsDate2 = dd;
    bsYear = "ũ��" + Yn[iyear];
    bsYear2 = Mn[miy] + Dn[dayim - 1];
    if (ss >= Ys[7] || ss < Ys[0]) bsYear = Yn[7];
    document.getElementById("viewdate").innerHTML = "�����ǣ�" + bsDate + bsDate2 + "�� " + bsWeek + ".";

    // End -->
</script>
