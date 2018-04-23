<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wxplan_Add.aspx.cs" Inherits="FCSystem.OA.wpwx.wxplan_Add" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>ά�޼ƻ�����</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tr>
                <td style="height: 20px; background-color: #8CA1AE;">
                    <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" style="background-image: url(../../images/bg.gif);">ά�޼ƻ�����</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%">
                    <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                        <br />
                        <table style="table-layout:fixed;">
                            <tr>
                                <td>
                                    �ƻ����ƣ�
                                </td>
                                <td width="22%">
                                    <asp:TextBox ID="tbx_name" runat="server" Width="95%" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>�������ƣ�</td>
                                <td width="22%">
                                    <asp:DropDownList ID="ddl_bm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_bm_SelectedIndexChanged">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td width="5%"></td>
                                <td class="td_d4" width="8%">ʹ���ˣ�</td>
                                <td width="22%">
                                    <asp:DropDownList ID="ddl_lyr" runat="server" Width="95%" AutoPostBack="True" OnSelectedIndexChanged="ddl_lyr_SelectedIndexChanged">
                                        <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td width="5%"></td>
                                <td class="td_d4" width="8%">�ʲ����룺</td>
                                <td width="22%">
                                    <asp:TextBox ID="tbx_zcbm" Width="95%" runat="server"></asp:TextBox></td>
                            </tr>
                            <tr>
                                <td class="td_q_space"></td>
                            </tr>
                            <tr>
                                <td colspan="7"><font color="red">�빴ѡ��Ҫά�޵��ʲ��������Ӧ˵��</font></td>
                                <td align="center">
                                    <asp:Button ID="btn_query" runat="server" Text="��ѯ" cssclass="mybutton" OnClick="btn_query_Click" /></td>
                            </tr>
                        </table>
                        <asp:Panel ID="Panel_zc" runat="server" ScrollBars="Auto">
                            <table id="wxzcmx" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                <tr>
                                    <td colspan="3">
                                        <asp:Panel ID="Panel1_zcmx" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="rkmxid"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                                        <HeaderTemplate>
                                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                        </HeaderTemplate>
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkevery" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zcmc" HeaderText="�ʲ�����">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zczt" HeaderText="�ʲ�״̬">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="bm_mc" HeaderText="��������">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
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
                                    <td style="height: 22px" colspan="3">
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
                                <tr>
                                    <td width="12%">��ѡ�ʲ���ά��˵����</td>
                                    <td width="70%">
                                        <asp:TextBox ID="tbx_wxsm" runat="server" TextMode="MultiLine" Width="90%"></asp:TextBox></td>
                                    <td width="18%" align="center">
                                        <asp:Button ID="btn_add" runat="server" Text="���" cssclass="mybutton" OnClick="btn_add_Click" /></td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <asp:Panel ID="Panel_wxzc" runat="server">
                            <table id="dwxzc" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                <tr>
                                    <td><font color="red">��ά���ʲ��б�</font></td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <asp:Panel ID="Panel_dwxzc" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView3" runat="server"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="wxzc_tid"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView3.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="selectEvery" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zcmc" HeaderText="�ʲ�����">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zczt" HeaderText="�ʲ�״̬">
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
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager3" runat="server"
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
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager3_PageChanged"></webdiyer:AspNetPager>
                                    </td>
                                    <td width="18%" align="center">
                                        <asp:Button ID="btn_del" runat="server" Text="ɾ��" cssclass="mybutton" OnClick="btn_del_Click" />
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                        <br />
                        <asp:Panel ID="Panel_gys" runat="server" ScrollBars="Auto">
                            <table id="wxgys" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                                <tr>
                                    <td colspan="2">
                                        <asp:Panel ID="Panel_wxgys" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView2" runat="server"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="gys_tid"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <ItemTemplate>
                                                                <asp:CheckBox ID="selectgys" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="gysmc" HeaderText="ά��������">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="lxr" HeaderText="��ϵ��">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="lxdh" HeaderText="��ϵ�绰">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="dz" HeaderText="��ַ">
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
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager2" runat="server"
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
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager2_PageChanged"></webdiyer:AspNetPager>
                                    </td>
                                    <td width="18%" align="center">
                                        <asp:Button ID="btn_xj" runat="server" Text="ѯ��" cssclass="mybutton" OnClick="btn_xj_Click" /></td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblplanmc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblwxdid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
