<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="initmain.aspx.cs" Inherits="FCSystem.initmain" Debug="true" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <title>我的首页</title>
    <script type="text/javascript" src="csjs/myjs.js"></script>
    
    <link href="css/Main.css" type="text/css" rel="stylesheet" />
    <link href="css/Layout.css" type="text/css" rel="stylesheet" />
    
</head>

<body class="main">
    <form id="Form1" method="post" runat="server">
        <table id="table1" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td style="height: 28" background="/images/t-11.gif">&nbsp;<asp:Label ID="tpdc" runat="server" ForeColor="#000099"></asp:Label>
                    <a href="/oa/tpgl/tp.aspx" target="mainframe">
                        <asp:Label ID="cytp" runat="server" ForeColor="#000099" Font-Underline="true"></asp:Label></a>
                    <a href="/oa/tpgl/fxdcjg.aspx" target="mainframe">
                        <asp:Label ID="dcjg" runat="server" ForeColor="#000099" Font-Underline="true"></asp:Label></a>
                </td>
                <td align="right" background="/images/t-11.gif"></td>
            </tr>
        </table>

        <!--我的邮件-->
        <div class="DesktopDiv">
            <div class="DesktopDivLeft">
                <table style="table-layout: fixed;">
                    <tr>
                        <td height="24" background="/images/head_bg.png" align="left">
                            <%--<img src="/images/expand_arrow.png" />--%>
                            <a href="/oa/yjgl/sjx.aspx" target="mainframe" title="更多邮件信息" class="black">
                                <font color="Highlight">&nbsp;我的邮件</font>
                            </a>&nbsp;&nbsp;
                                     <asp:Label ID="mail_count" runat="server" ForeColor="Highlight" Font-Underline="true" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:GridView ID="GridViewc1" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="id"
                                    EmptyDataText="暂无未读邮件！"
                                    ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="标题">
                                            <ItemTemplate>
                                                · <a href="/oa/yjgl/viewyj.aspx?type=s&id=<%# Eval("id") %>" target="mainframe"><font color="#3366FF">
                                        <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("bt") %>' />
                                    </font></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fssj" HeaderText="日期" DataFormatString="{0:MM月dd日}" HtmlEncode="False">
                                            <ItemStyle Width="70" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle BackColor="#FFFFFF" />
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>

            <!--我的申请-->
            <div class="DesktopDivRight">
                <table style="width: 100%">
                    <tr>
                        <td height="24" background="/images/head_bg.png" align="left">
                            <%--<img src="/images/expand_arrow.png" />--%>
                            <a href="/oa/wpgl/myzc.aspx" target="mainframe" title="更多物品信息" class="black">
                                <font color="Highlight">&nbsp;我的申请</font>
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:GridView ID="GridViewc4" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="lyid"
                                    EmptyDataText="暂无任何物品信息！"
                                    ShowHeader="false"
                                    OnRowDataBound="GridViewc4_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="标题">
                                            <ItemTemplate>
                                                ·<asp:Label ID="Labelnr" runat="server" Text='<%# Bind("lybt") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="lyzt" HeaderText="申请状态">
                                            <ItemStyle Width="80" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sqsj" HeaderText="申请时间" DataFormatString="{0:MM月dd日}" HtmlEncode="False">
                                            <ItemStyle Width="70" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle BackColor="#FFFFFF" />
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="DesktopDivLeft2">
                <!--待办事宜-->
                <table style="table-layout: fixed;">
                    <tr>
                        <td height="24" background="/images/head_bg.png" align="left">
                            <%--<img src="/images/expand_arrow.png" />--%>
                            <font color="Highlight">&nbsp;待办事宜</font>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:DataGrid ID="datagridc3" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="内容">
                                            <ItemTemplate>
                                                ·<asp:Label ID="lblnr" runat="server" Text='<%# Bind("nr") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="链接">
                                            <HeaderStyle HorizontalAlign="center" />
                                            <ItemTemplate>
                                                ·<asp:HyperLink CssClass="navigate" ID="HyperLink1" runat="server" Text='点击查看' NavigateUrl='<%# Eval("lj")%>'></asp:HyperLink>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:TemplateColumn>
                                    </Columns>
                                </asp:DataGrid>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="DesktopDivRight2">
                <!--企业公告-->
                <table style="table-layout: fixed;">
                    <tr>

                        <td height="24" background="/images/head_bg.png" align="left">
                            <a href="/oa/xzgl/qygg.aspx" target="mainframe" title="全部公司公告" class="black">
                                <%--<img src="/images/expand_arrow.png" />--%>
                                <font color="Highlight">&nbsp;企业公告</font>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel6" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                            <script language="JavaScript">
                                document.write('<marquee style="color:#ecece8;font-size:10pt;line-height:17px;" direction="up" height="100" scrollamount="1" scrolldelay="100" onMouseOver="this.scrollDelay=500" onMouseOut="this.scrollDelay=1"><%= showmsg()%></td></marquee>');
                            </script>
                                </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <!--规章制度-->
            <div class="DesktopDivLeft3">
                <table style="table-layout: fixed;">
                    <tr>
                        <td height="24" background="/images/head_bg.png" align="left">
                            <a href="/oa/xzgl/gzzd.aspx" target="mainframe" title="查看全部规章制度" class="black">
                                <%--<img src="/images/expand_arrow.png" />--%>
                                <font color="Highlight">&nbsp;规章制度</font>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel5" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:GridView ID="GridViewc11" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    EmptyDataText="暂无任何规章制度！"
                                    ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="标题">
                                            <ItemTemplate>
                                                ·<a href="#" onclick="window.open('/oa/xzgl/gzzd_view.aspx?url=index&id=<%# Eval("zdid") %>')"><font color="#3366FF"><asp:Label ID="Label1" runat="server" Text='<%# Bind("zdbt") %>'></asp:Label>
                                    </font></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="cjsj" HeaderText="创建时间" DataFormatString="{0:MM-dd}" HtmlEncode="False">
                                            <ItemStyle HorizontalAlign="Center" Width="50px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle BackColor="#FFFFFF" />
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>

            <!--仓库提醒-->
            <div class="DesktopDivRight3">
                <table style="table-layout: fixed;">
                    <tr>
                        <td height="24" background="/images/head_bg_490.png" align="left">
                            <%--<img src="/images/expand_arrow.png" />--%>
                            <font color="Highlight">&nbsp;库存余量提醒</font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    EmptyDataText="暂无任何信息！"
                                    ShowHeader="false"
                                    OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="仓库名称">
                                            <ItemTemplate>
                                                ·<asp:Label ID="lblckmc" runat="server" Text='<%# Bind("ckmc") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="kcsl" HeaderText="剩余数量">
                                            <ItemStyle HorizontalAlign="Center" Width="80px" />
                                        </asp:BoundField>
                                    </Columns>
                                    <RowStyle BackColor="#FFFFFF" />
                                </asp:GridView>
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
            </div>

        </div>

        <asp:ValidationSummary
            ID="ValidationSummary1"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <asp:Label ID="lblyy" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
