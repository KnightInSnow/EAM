<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pkList.aspx.cs" Inherits="FCSystem.OA.pd.pkList" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>盘亏清单</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout:fixed;">
            <tbody>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr width="100%">
                                        <td align="left" width="12%">计划名称:</td>

                                        <td align="left" width="18%">
                                            <asp:TextBox ID="tbx_name" runat="server" Width="95%" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td align="left" width="5%"></td>
                                        <td width="12%">盘点单号：</td>
                                        <td align="left" class="" width="18%">
                                            <asp:TextBox ID="tbx_pddh" runat="server" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td width="5%"></td>
                                        <td width="12%">备注说明：</td>
                                        <td align="left" class="" width="18%">
                                            <asp:TextBox ID="tbx_bz" runat="server" Enabled="False" TextMode="MultiLine"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table id="search2" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="GridView1_RowDataBound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="pdqdtid"
                                                EmptyDataText="没有查到符合条件的数据！"
                                                Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                                        <HeaderTemplate>
                                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                                        </HeaderTemplate>
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="chkevery" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="fl_mc" HeaderText="所属分类">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="资产图片">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:HyperLink ID="cktp" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看图片" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="盘亏处理">
                                                        <HeaderStyle Width="70px" />
                                                        <ItemStyle Width="70px" Height="16px" />
                                                        <ItemTemplate>
                                                            <asp:Button ID="btn_pkcl" runat="server" Text="盘亏处理" Width="90%" CommandArgument='<%# Eval("yn_pkcl")%>' CommandName='<%# Eval("pdqdtid")%>' OnClick="btn_pkcl_Click" />
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="bm_mc" HeaderText="所属部门">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="使用人员">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zczt" HeaderText="资产状态">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pdzt" HeaderText="盘点状态">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="updatetime" HeaderText="更新时间">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="kgyj" HeaderText="库管说明">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="syryj" HeaderText="使用人说明">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="pkyj" HeaderText="盘亏说明">
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
                                    </td>
                                </tr>

                                <tr>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                            ShowCustomInfoSection="left"
                                            ShowInputBox="Auto"
                                            AlwaysShow="true"
                                            CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                            NumericButtonCount="10"
                                            FirstPageText="首页"
                                            LastPageText="末页"
                                            NextPageText="下页"
                                            PrevPageText="上页"
                                            CustomInfoSectionWidth="250px"
                                            CssClass="page_text"
                                            ShowBoxThreshold="11"
                                            InputBoxClass="AspNetPagerInputBox"
                                            SubmitButtonClass=“AspNetPagerButton”
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Label ID="lbl_planid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_uid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_maxlyindex" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
