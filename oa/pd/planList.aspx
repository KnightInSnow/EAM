<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="planList.aspx.cs" Inherits="FCSystem.OA.pd.planList" EnableEventValidation="false" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>盘点清单</title>
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
                        <td>计划名称:</td>
                        <td>
                            <asp:TextBox ID="tbx_name" runat="server" Enabled="False" CssClass="form-control" Width="150px"></asp:TextBox>
                        </td>

                        <td>备注说明：</td>
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
                            <asp:Button CssClass="btn btn-primary active" ID="btn_QrALL" runat="server" Text="全部存在" OnClick="btn_QrALL_Click" />
                            <asp:Button CssClass="btn btn-primary active" ID="btn_excel" runat="server" Text="导出表格" />
                            <asp:Button CssClass="btn btn-primary active" ID="btn_tjrw" runat="server" Text="通知使用人" Visible="False" OnClick="btn_tjrw_Click" />
                            <asp:Button CssClass="btn btn-primary active" ID="btn_refresh" runat="server" Text="刷新" OnClick="btn_refresh_Click" />
                            <asp:Button CssClass="btn btn-primary active" ID="btn_finish" runat="server" Text="完成计划" OnClick="btn_finish_Click" />
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
                    EmptyDataText="没有查到符合条件的数据！">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="2px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle HorizontalAlign="Center" Width="30px" />
                            <HeaderTemplate>
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px"/>
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
                        <asp:TemplateField HeaderText="库管人员确认">
                            <HeaderStyle Width="120px" />
                            <ItemStyle Width="126px" Height="16px" />
                            <ItemTemplate>
                                <asp:Button ID="btn_kg" runat="server" Text="存在" Width="45%" CommandArgument='<%# Eval("kgqr")%>' CommandName='<%# Eval("pdqdtid")%>' OnClick="btn_kg_Click" CssClass="btn btn-xs btn-default"/>
                                <asp:Button ID="btn_kgyj" runat="server" Text="不存在" Width="45%" CommandArgument='<%# Eval("pdqdtid") %>' OnClick="btn_kgyj_Click" CssClass="btn btn-xs btn-default"/>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
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
                        <asp:TemplateField HeaderText="库管说明">
                            <HeaderStyle Width="80px" />
                            <ItemStyle Width="78px" Height="16px" />
                            <ItemTemplate>
                                <asp:TextBox ID="tbx_bz" runat="server" Text='<%# Bind("kgyj")%>' OnTextChanged="tbx_bz_TextChanged" AutoPostBack="True" CssClass="form-control"></asp:TextBox>
                                <asp:Button ID="btn_refresh" runat="server" Text="Refresh" CommandArgument='<%# Eval("pdqdtid") %>' CommandName='<%# Container.DataItemIndex %>' Visible="false" OnClick="btn_refresh_Click1" />
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
                        <%--  <asp:BoundField DataField="kgyj" HeaderText="库管说明">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>--%>
                        <asp:BoundField DataField="syryj" HeaderText="使用人说明">
                            <HeaderStyle ForeColor="Black" />
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="电子签名">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="ckqm" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看签名" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="存放地点" ItemStyle-Width="30px">
                            <ItemStyle Height="16px" />
                            <ItemTemplate>
                                <asp:TextBox ID="tbx_cfdd" runat="server" Text='<%# Bind("cfdd")%>' OnTextChanged="tbx_cfdd_TextChanged" AutoPostBack="True" CssClass="form-control"></asp:TextBox>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="zcbz" HeaderText="备注" ItemStyle-Width="80px">
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
                SubmitButtonClass="“AspNetPagerButton”"
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
