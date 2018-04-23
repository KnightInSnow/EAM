<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="planList.aspx.cs" Inherits="FCSystem.OA.pd.planList" EnableEventValidation="false" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�̵��嵥</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PopHead"></div>

        <div class="PageBody-Top">
            <div class="PageBody-Top-Inputs">
                <table style="table-layout: fixed">
                    <tr>
                            <td></td>
                        <td>�ƻ�����:</td>
                        <td>
                            <asp:TextBox ID="tbx_name" runat="server" Enabled="False" CssClass="form-control" Width="150px"></asp:TextBox>
                        </td>

                        <td>��ע˵����</td>
                        <td>
                            <asp:TextBox ID="tbx_bz" runat="server" Enabled="False" CssClass="form-control" Width="150px"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td></td>
                    </tr>
                </table>
            </div>

            <div class="PageBody-Top-Buttons">
                <table style="table-layout: fixed">
                    <tr>
                        <td colspan="6" align="right">
                            <asp:Button CssClass="btn btn-primary active" ID="btn_QrALL" runat="server" Text="ȫ������" OnClick="btn_QrALL_Click" />
                            <asp:Button CssClass="btn btn-primary active" ID="btn_excel" runat="server" Text="�������" />
                            <asp:Button CssClass="btn btn-primary active" ID="btn_tjrw" runat="server" Text="֪ͨʹ����" Visible="False" OnClick="btn_tjrw_Click" />
                            <asp:Button CssClass="btn btn-primary active" ID="btn_refresh" runat="server" Text="ˢ��" OnClick="btn_refresh_Click" />
                            <asp:Button CssClass="btn btn-primary active" ID="btn_finish" runat="server" Text="��ɼƻ�" OnClick="btn_finish_Click" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="Page-EmptyLine-Normal"></div>

        <div class="PageBody-Middle-AutoHeight">

            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="GridView1_RowDataBound"
                    AutoGenerateColumns="False"
                    DataKeyNames="pdqdtid"
                    EmptyDataText="û�в鵽�������������ݣ�">
                    <Columns>
                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="2px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" Width="30px" />
                            <HeaderTemplate>
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px"/>
                            </HeaderTemplate>
                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:CheckBox ID="chkevery" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="�����Աȷ��">
                            <HeaderStyle Width="120px" />
                            <ItemStyle Width="126px" Height="16px" />
                            <ItemTemplate>
                                <asp:Button ID="btn_kg" runat="server" Text="����" Width="45%" CommandArgument='<%# Eval("kgqr")%>' CommandName='<%# Eval("pdqdtid")%>' OnClick="btn_kg_Click" CssClass="btn btn-xs btn-default"/>
                                <asp:Button ID="btn_kgyj" runat="server" Text="������" Width="45%" CommandArgument='<%# Eval("pdqdtid") %>' OnClick="btn_kgyj_Click" CssClass="btn btn-xs btn-default"/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="fl_mc" HeaderText="��������">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="�ʲ�����">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="�ʲ�ͼƬ">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="cktp" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ͼƬ" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="���˵��">
                            <HeaderStyle Width="80px" />
                            <ItemStyle Width="78px" Height="16px" />
                            <ItemTemplate>
                                <asp:TextBox ID="tbx_bz" runat="server" Text='<%# Bind("kgyj")%>' OnTextChanged="tbx_bz_TextChanged" AutoPostBack="True" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btn_refresh" runat="server" Text="Refresh" CommandArgument='<%# Eval("pdqdtid") %>' CommandName='<%# Container.DataItemIndex %>' Visible="false" OnClick="btn_refresh_Click1" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="bm_mc" HeaderText="��������">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="ʹ����Ա">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zczt" HeaderText="�ʲ�״̬">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="pdzt" HeaderText="�̵�״̬">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="updatetime" HeaderText="����ʱ��">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <%--  <asp:BoundField DataField="kgyj" HeaderText="���˵��">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>--%>
                        <asp:BoundField DataField="syryj" HeaderText="ʹ����˵��">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="����ǩ��">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="ckqm" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ǩ��" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="��ŵص�" ItemStyle-Width="30px">
                            <ItemStyle Height="16px" />
                            <ItemTemplate>
                                <asp:TextBox ID="tbx_cfdd" runat="server" Text='<%# Bind("cfdd")%>' OnTextChanged="tbx_cfdd_TextChanged" AutoPostBack="True" CssClass="form-control"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="zcbz" HeaderText="��ע" ItemStyle-Width="80px">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </asp:Panel>
        </div>

        <div class="PageBody-Bottom-Pager">
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
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
                SubmitButtonClass="��AspNetPagerButton��"
                SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
            </webdiyer:AspNetPager>
        </div>

        <asp:Label ID="lbl_planid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_uid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_maxlyindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_ynzxr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_yndownload" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
