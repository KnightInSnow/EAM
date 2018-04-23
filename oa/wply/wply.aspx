<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wply.aspx.cs" Inherits="FCSystem.OA.wply.wply" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Ʒ����Ǽ�</title>
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
                                <td align="center" style="background-image: url(../../images/bg.gif);">��Ʒ����Ǽ�</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr width="100%">
                                        <td align="left" width="10%">���ټ�����</td>

                                        <td align="left" width="15%">
                                            <asp:DropDownList ID="query_tj" runat="server" Height="21px" Width="90%">
                                                <asp:ListItem Value="lybt" Selected="True">���ñ���</asp:ListItem>
                                                <asp:ListItem Value="jjcd">�����̶�</asp:ListItem>
                                                <asp:ListItem Value="lysm">����˵��</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" width="20%">
                                            <asp:TextBox ID="query_content" runat="server" Width="90%" Height="21px"></asp:TextBox>
                                        </td>
                                        <td width="5%"></td>
                                        <td align="left" width="10%">״̬��</td>
                                        <td align="left" width="15%">
                                            <asp:DropDownList ID="lyzt" runat="server" Height="21px" Width="90%">
                                                <asp:ListItem Value="" Text="" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="������" Text="������"></asp:ListItem>
                                                <asp:ListItem Value="�ѽᵥ" Text="�ѽᵥ"></asp:ListItem>
                                                <asp:ListItem Value="���˻�" Text="���˻�"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" width="25%">
                                            <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" OnClick="Query_Click" Text="��ѯ" />
                                            <input type="button" name="AddBtn1" value="��������Ʒ" class="mybutton" onclick="javascript: popAdd2('wply_add.aspx');" accesskey="a" />
                                            <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" cssclass="mybutton" OnClick="Query_Click" Text="ˢ��" />
                                        </td>
                                        <%--<td width="15%" align="right">--%>
                                        <%--<asp:DropDownList ID="lx" runat="server" Height="21px" Width="90%">
                                                <asp:ListItem Value="" Text="" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="��" Text="��ͨ��Ʒ"></asp:ListItem>
                                                <asp:ListItem Value="��" Text="�̶��ʲ�"></asp:ListItem>
                                            </asp:DropDownList>--%>
                                        <%--</td>--%>
                                    </tr>

                                    <tr>
                                        <td class="td_q_space"></td>
                                    </tr>
                                </tbody>
                            </table>

                            <table id="search2" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="lyid"
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

                                                    <asp:BoundField DataField="lyid" HeaderText="���õ����">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <FooterStyle CssClass="hidden" />
                                                    </asp:BoundField>

                                                    <asp:TemplateField HeaderText="���õ����">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wply_mod.aspx?id=<%# Eval("lyid") %>')">
                                                                <font color="#3366ff"><asp:Label ID="Label2" runat="server" Text='<%# Bind("lydh") %>'></asp:Label></font>
                                                            </a>
                                                        </ItemTemplate>

                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>

                                                    <%--<asp:TemplateField HeaderText="���ñ���">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_mod.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("lybt") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>--%>
                                                    <asp:BoundField DataField="lybt" HeaderText="���ñ���">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="jjcd" HeaderText="�����̶�">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <%-- <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="�ʲ�">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle Width="30px" ForeColor="black" />
                                                    </asp:ImageField>
                                                    <asp:ImageField DataImageUrlField="yn_dlwp" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="����">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle Width="30px" ForeColor="black" />
                                                    </asp:ImageField>--%>
                                                    <asp:BoundField DataField="lx" HeaderText="����">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sqsj" HeaderText="����ʱ��" HtmlEncode="False">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sqr_name" HeaderText="������">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sqr_bmmc" HeaderText="���벿��">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="lyzt" HeaderText="����״̬">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="spr" HeaderText="������">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="spsj" HeaderText="����ʱ��">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="spyj" HeaderText="�������">
                                                        <HeaderStyle ForeColor="black" />
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
                                    <td class="td_q_space"></td>
                                </tr>

                                <tr>
                                    <td style="height: 22px">
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
                                            SubmitButtonText="Go">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
