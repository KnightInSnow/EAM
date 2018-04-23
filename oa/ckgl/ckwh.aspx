<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ckwh.aspx.cs" Inherits="FCSystem.OA.ckgl.ckwh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ֿ���Ϣά��</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    
</head>

<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�ֿ���Ϣά��</div>
        </div>
        <!--���ټ�����ť--->
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="padding-top:20px;">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">���ټ�����</td>
                            <td>
                                <asp:DropDownList ID="query_tj" runat="server" Width="95%" CssClass="form-control">
                                    <asp:ListItem Value="ckmc">�ֿ�����</asp:ListItem>
                                    <asp:ListItem Value="ui_desc">������Ա</asp:ListItem>
                                    <asp:ListItem Value="cksm">�ֿ�˵��</asp:ListItem>
                                    <asp:ListItem Value="ckzt">�ֿ�״̬</asp:ListItem>
                                    <asp:ListItem Value="bm_mc">��������</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="query_content" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>

                        </tr>
                    </table>
                </div>
                <!--��ť����--->
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed">
                        <tr>
                            <td align="right">
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="��ѯ" />
                                <input type="button" name="AddBtn" value="����" class="btn btn-primary active" onclick="javascript: popAdd('ckwh_view.aspx');" accesskey="a" />
                                <asp:Button ID="UseBtn" runat="server" CssClass="btn btn-primary active" OnClick="Use_Click" Text="����" />
                                <asp:Button ID="StopBtn" runat="server" CssClass="btn btn-primary active" OnClick="Stop_Click" Text="����" />
                                <asp:Button ID="DelBtn" runat="server" AccessKey="d" CssClass="btn btn-primary active" OnClick="Del_Click" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" Text="ɾ��" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="ˢ��" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    AutoGenerateColumns="False"
                    DataKeyNames="ckid"
                    EmptyDataText="û�в鵽�������������ݣ�"
                    OnRowDataBound="OnRow_Bound">
                    <Columns>
                        <asp:TemplateField HeaderImageUrl="~/images/refresh.gif" HeaderText="���">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle Width="30px" />
                            <ItemStyle Height="18px" HorizontalAlign="Center" Width="30px" />
                            <HeaderTemplate>
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="ckid" HeaderText="�ֿ����">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="�ֿ�����">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <a href="#" onclick='javascript:popMod(&#039;/oa/ckgl/ckwh_view.aspx?id=<%# Eval("ckid") %>&#039;)'><font color="#3366ff">
                                                        <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("ckmc") %>'></asp:Label>
                                                        </font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="cklx" HeaderText="�ֿ�����">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckzt" HeaderText="״̬">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bm_mc" HeaderText="�ֿ���������">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="�ֿ������Ա">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bmmc" HeaderText="������Ա��������">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cksm" HeaderText="�ֿ�˵��">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ck_tid" HeaderText="�ֿ�id">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </div>

            <div class="PageBody-Bottom-Pager" style="text-align:right;">
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="true" CssClass="page_text" CustomInfoHTML="&lt;font color='#333333'&gt;�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ&lt;/font&gt;" CustomInfoSectionWidth="250px" FirstPageText="��ҳ" InputBoxClass="AspNetPagerInputBox" LastPageText="ĩҳ" NextPageText="��ҳ" NumericButtonCount="10" OnPageChanged="AspNetPager1_PageChanged" PrevPageText="��ҳ" ShowBoxThreshold="11" ShowCustomInfoSection="left" ShowInputBox="Auto" SubmitButtonClass=��AspNetPagerButton�� SubmitButtonText="Go"></webdiyer:AspNetPager>
            </div>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>
</html>
