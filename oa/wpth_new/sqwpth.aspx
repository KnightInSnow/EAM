<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sqwpth.aspx.cs" Inherits="FCSystem.OA.wpth_new.sqwpth" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title></title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">������Ʒ�黹</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td width="100%" align="center">
                        <br />
                        <asp:Panel ID="Panel2" runat="server">
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr>
                                        <td width="8%">���ټ�����</td>
                                        <td width="12%">
                                            <asp:DropDownList ID="query_tj" runat="server" Width="98%">
                                                <asp:ListItem Value="thbt" Selected="True">�黹����</asp:ListItem>
                                                <asp:ListItem Value="thsm">�黹˵��</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td width="10%">
                                            <asp:TextBox ID="query_content" runat="server" Width="98%"></asp:TextBox>
                                        </td>
                                        <td widht="8%">״̬��</td>
                                        <td width="12%">
                                            <asp:DropDownList ID="ghzt" runat="server" Width="98%">
                                                <asp:ListItem Value="" Text="" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="¼��" Text="¼��"></asp:ListItem>
                                                <asp:ListItem Value="������" Text="������"></asp:ListItem>
                                                <asp:ListItem Value="�ѽᵥ" Text="�ѽᵥ"></asp:ListItem>
                                                <asp:ListItem Value="�ѻ���" Text="�ѻ���"></asp:ListItem>
                                                <asp:ListItem Value="���ջ�" Text="���ջ�"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td width="8%"></td>
                                        <td width="12%">                                         
                                        </td>
                                        <td width="30%" align="right">
                                            <asp:Button cssclass="mybutton" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click" CausesValidation="False" AccessKey="f" /><input type="button" name="AddBtn" value="����黹��Ʒ" class="qq_btn_100px" onclick="javascript: popAdd2('sqwpth_add.aspx');" accesskey="a" /><asp:Button CssClass="mybutton" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="8">
                                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                    OnRowDataBound="OnRow_Bound"
                                                    AutoGenerateColumns="False"
                                                    
                                                   DataKeyNames=   "ghid"
                                                    BorderStyle="None"
                                                    BorderWidth="0px"
                                                    BackColor="Silver"
                                                    EmptyDataText="û�в鵽�������������ݣ�"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ghid" HeaderText="�黹id��">
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            <FooterStyle CssClass="hidden" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="�黹����">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <ItemTemplate>
                                                                <a href="#" onclick="javascript:popMod('/oa/wpth_new/wpgh_mod.aspx?id=<%# Eval("ghid") %>')">
                                                                    <font color="#3366ff"><asp:Label ID="Label2" runat="server" Text='<%# Bind("ghdh") %>'></asp:Label></font></a>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="�黹����">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ghbt") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="�ʲ�">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="30px" ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:ImageField>
                                                        <asp:BoundField DataField="bm_mc" HeaderText="���벿��">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sqsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                            <HeaderStyle Width="80px" ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ghzt" HeaderText="״̬">
                                                            <HeaderStyle ForeColor="black" Width="50px" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ghsl" HeaderText="��������">
                                                            <HeaderStyle ForeColor="black" Width="60" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                           <asp:BoundField DataField="sprs" HeaderText="������">
                                                            <HeaderStyle ForeColor="black" Width="60px" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                         <asp:BoundField DataField="spsj" HeaderText="����ʱ��">
                                                            <HeaderStyle ForeColor="black" Width="60px" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                         <asp:BoundField DataField="spyj" HeaderText="�������">
                                                            <HeaderStyle ForeColor="black" Width="60px" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <RowStyle CssClass="GridViewRowStyle" />
                                                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                                                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                                </asp:GridView>
                                            </asp:Panel>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="8" style="height: 22px">
                                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                                OnPageChanged="AspNetPager1_PageChanged"
                                                ShowCustomInfoSection="left"
                                                ShowInputBox="Auto"
                                                AlwaysShow="true"
                                                CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                                NumericButtonCount="10"
                                                FirstPageText="��ҳ"
                                                LastPageText="ĩҳ"
                                                NextPageText="��ҳ"
                                                PrevPageText="��ҳ"
                                                CustomInfoSectionWidth="250px"
                                                CssClass="page_text"
                                                ShowBoxThreshold="11"
                                                InputBoxClass="AspNetPagerInputBox"
                                                SubmitButtonClass=��AspNetPagerButton��
                                                SubmitButtonText="Go"></webdiyer:AspNetPager>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
