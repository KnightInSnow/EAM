<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wxs.aspx.cs" Inherits="FCSystem.OA.wxsxx.wxs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <title>ά������Ϣά��</title>
    <style type="text/css">
        .auto-style1 {
            height: 40px;
            width: 680px;
        }
    </style>
</head>

<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">ά������Ϣά��</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <br />
                        <asp:Panel ID="Panel2" runat="server">
                            <table id="search" cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                                <tbody>
                                    <tr>
                                        <td width="10%">���ټ�����</td>
                                        <td width="10%">
                                            <asp:DropDownList ID="query_tj" runat="server" Width="90%">
                                                <asp:ListItem Value="a.ui_id" Selected="True">��¼��</asp:ListItem>
                                                <asp:ListItem Value="a.ui_desc">����</asp:ListItem>
                                                <asp:ListItem Value="a.ui_status">״̬</asp:ListItem>
                                                <asp:ListItem Value="a.ui_yddh">�ƶ��绰</asp:ListItem>
                                                <asp:ListItem Value="c.gysmc">������λ</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td width="10%">
                                            <asp:TextBox ID="query_content" runat="server" Width="90%"></asp:TextBox>
                                        </td>
                                        <td align="right" width="70%">
                                            <asp:Button CssClass="mybutton" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click" CausesValidation="False" AccessKey="f" /><input type="button" name="AddBtn" value="����" class="mybutton" onclick="javascript: popAdd('wxs_view.aspx');" accesskey="a" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:Button><asp:Button CssClass="mybutton" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_q_space"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                    OnRowDataBound="OnRow_Bound"
                                                    AutoGenerateColumns="False"
                                                    
                                                   DataKeyNames=   "ui_id"
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
                                                        <asp:TemplateField>
                                                            <HeaderStyle Width="30px"></HeaderStyle>
                                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                            <HeaderTemplate>
                                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>

                                                        <asp:BoundField DataField="ui_id" HeaderText="��¼��">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="����">
                                                            <HeaderStyle ForeColor="Black"  />
                                                            <ItemTemplate>
                                                                <a href="#" onclick="javascript:popMod('/oa/wxsxx/wxs_view.aspx?id=<%# Eval("ui_id") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label></font></a>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="gysmc" HeaderText="������λ">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ui_yddh" HeaderText="�ƶ��绰">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ui_status" HeaderText="״̬">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ui_edate" HeaderText="�ʺŽ�ֹ��" HtmlEncode="False">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
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
                                        <td colspan="4" style="height: 22px">
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
