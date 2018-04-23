<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yh.aspx.cs" Inherits="FCSystem.BAS.yhgl.yh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <title>ְԱά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">ְԱά��</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">���ټ�����</td>
                            <td>
                                <asp:DropDownList ID="query_tj" runat="server" Width="95%" CssClass="form-control">
                                    <asp:ListItem Value="a.ui_id" Selected="True">��¼��</asp:ListItem>
                                    <asp:ListItem Value="a.ui_desc">����</asp:ListItem>
                                    <asp:ListItem Value="a.ui_status">״̬</asp:ListItem>
                                    <asp:ListItem Value="a.ui_yddh">�ƶ��绰</asp:ListItem>
                                    <asp:ListItem Value="a.yn_kg">�Ƿ�ֿ������Ա</asp:ListItem>
                                    <asp:ListItem Value="c.bm_mc">��������</asp:ListItem>
                                </asp:DropDownList></td>
                            <td>
                                <asp:TextBox ID="query_content" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click" CausesValidation="False" AccessKey="f" />
                                <input type="button" name="AddBtn" value="����" class="btn btn-primary active" onclick="javascript: popAdd('yh_view.aspx');" accesskey="a" />
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="StopBtn" runat="server" Text="����" OnClick="Stop_Click" OnClientClick="return confirm('ȷ��Ҫִ�н�����')" AccessKey="i" />
                                <asp:Button CssClass="btn btn-primary active" ID="PassBtn" runat="server" Text="����" OnClick="Pass_Click" OnClientClick="return confirm('ȷ��Ҫִ��������')" AccessKey="u" />
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">               
                        <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                            OnRowDataBound="OnRow_Bound"
                            AutoGenerateColumns="False"
                            DataKeyNames="ui_id"
                            EmptyDataText="û�в鵽�������������ݣ�">
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
                                <asp:TemplateField HeaderText="��¼��">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemTemplate>
                                        <a href="#" onclick="javascript:popMod('/bas/yhgl/yh_view.aspx?id=<%# Eval("ui_id") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ui_id") %>'></asp:Label></font></a>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="navigate" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ui_zydm" HeaderText="ְԱ����">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="ui_desc" HeaderText="����">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="qy_id" HeaderText="��������">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="bm_mc" HeaderText="����">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="zwmc" HeaderText="ְλ">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="role_name" HeaderText="��ɫ">
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
                                <%--    <asp:ImageField DataImageUrlField="yn_kg" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="�����Ա">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle ForeColor="black" />
                                                        </asp:ImageField>--%>
                                <%-- <asp:ImageField DataImageUrlField="yn_lysp" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="������Ա">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="60px" ForeColor="black" />
                                                        </asp:ImageField>--%>
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
            </div>

            <div class="PageBody-Bottom-Pager" style="text-align:right;">
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
            </div>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>

</html>
