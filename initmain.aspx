<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="initmain.aspx.cs" Inherits="FCSystem.initmain" Debug="true" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="Expires" content="0" />

    <title>�ҵ���ҳ</title>
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

        <!--�ҵ��ʼ�-->
        <div class="DesktopDiv">
            <div class="DesktopDivLeft">
                <table style="table-layout: fixed;">
                    <tr>
                        <td height="24" background="/images/head_bg.png" align="left">
                            <%--<img src="/images/expand_arrow.png" />--%>
                            <a href="/oa/yjgl/sjx.aspx" target="mainframe" title="�����ʼ���Ϣ" class="black">
                                <font color="Highlight">&nbsp;�ҵ��ʼ�</font>
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
                                    EmptyDataText="����δ���ʼ���"
                                    ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                �� <a href="/oa/yjgl/viewyj.aspx?type=s&id=<%# Eval("id") %>" target="mainframe"><font color="#3366FF">
                                        <asp:Label ID="Labelnr" runat="server" Text='<%# Bind("bt") %>' />
                                    </font></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fssj" HeaderText="����" DataFormatString="{0:MM��dd��}" HtmlEncode="False">
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

            <!--�ҵ�����-->
            <div class="DesktopDivRight">
                <table style="width: 100%">
                    <tr>
                        <td height="24" background="/images/head_bg.png" align="left">
                            <%--<img src="/images/expand_arrow.png" />--%>
                            <a href="/oa/wpgl/myzc.aspx" target="mainframe" title="������Ʒ��Ϣ" class="black">
                                <font color="Highlight">&nbsp;�ҵ�����</font>
                            </a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:GridView ID="GridViewc4" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="lyid"
                                    EmptyDataText="�����κ���Ʒ��Ϣ��"
                                    ShowHeader="false"
                                    OnRowDataBound="GridViewc4_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                ��<asp:Label ID="Labelnr" runat="server" Text='<%# Bind("lybt") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="lyzt" HeaderText="����״̬">
                                            <ItemStyle Width="80" HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sqsj" HeaderText="����ʱ��" DataFormatString="{0:MM��dd��}" HtmlEncode="False">
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
                <!--��������-->
                <table style="table-layout: fixed;">
                    <tr>
                        <td height="24" background="/images/head_bg.png" align="left">
                            <%--<img src="/images/expand_arrow.png" />--%>
                            <font color="Highlight">&nbsp;��������</font>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <asp:Panel ID="Panel4" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:DataGrid ID="datagridc3" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateColumn HeaderText="����">
                                            <ItemTemplate>
                                                ��<asp:Label ID="lblnr" runat="server" Text='<%# Bind("nr") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn HeaderText="����">
                                            <HeaderStyle HorizontalAlign="center" />
                                            <ItemTemplate>
                                                ��<asp:HyperLink CssClass="navigate" ID="HyperLink1" runat="server" Text='����鿴' NavigateUrl='<%# Eval("lj")%>'></asp:HyperLink>
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
                <!--��ҵ����-->
                <table style="table-layout: fixed;">
                    <tr>

                        <td height="24" background="/images/head_bg.png" align="left">
                            <a href="/oa/xzgl/qygg.aspx" target="mainframe" title="ȫ����˾����" class="black">
                                <%--<img src="/images/expand_arrow.png" />--%>
                                <font color="Highlight">&nbsp;��ҵ����</font>
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

            <!--�����ƶ�-->
            <div class="DesktopDivLeft3">
                <table style="table-layout: fixed;">
                    <tr>
                        <td height="24" background="/images/head_bg.png" align="left">
                            <a href="/oa/xzgl/gzzd.aspx" target="mainframe" title="�鿴ȫ�������ƶ�" class="black">
                                <%--<img src="/images/expand_arrow.png" />--%>
                                <font color="Highlight">&nbsp;�����ƶ�</font>
                            </a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel5" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:GridView ID="GridViewc11" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    EmptyDataText="�����κι����ƶȣ�"
                                    ShowHeader="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                ��<a href="#" onclick="window.open('/oa/xzgl/gzzd_view.aspx?url=index&id=<%# Eval("zdid") %>')"><font color="#3366FF"><asp:Label ID="Label1" runat="server" Text='<%# Bind("zdbt") %>'></asp:Label>
                                    </font></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="cjsj" HeaderText="����ʱ��" DataFormatString="{0:MM-dd}" HtmlEncode="False">
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

            <!--�ֿ�����-->
            <div class="DesktopDivRight3">
                <table style="table-layout: fixed;">
                    <tr>
                        <td height="24" background="/images/head_bg_490.png" align="left">
                            <%--<img src="/images/expand_arrow.png" />--%>
                            <font color="Highlight">&nbsp;�����������</font>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" CssClass="DesktopPanel">
                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                    AutoGenerateColumns="False"
                                    EmptyDataText="�����κ���Ϣ��"
                                    ShowHeader="false"
                                    OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="�ֿ�����">
                                            <ItemTemplate>
                                                ��<asp:Label ID="lblckmc" runat="server" Text='<%# Bind("ckmc") %>' />
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Left" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                            <ItemStyle HorizontalAlign="Center" Width="120px" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="kcsl" HeaderText="ʣ������">
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
