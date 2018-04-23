<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ckwh.aspx.cs" Inherits="FCSystem.OA.ckgl.ckwh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>仓库信息维护</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    
</head>

<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">仓库信息维护</div>
        </div>
        <!--快速检索按钮--->
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="padding-top:20px;">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">快速检索：</td>
                            <td>
                                <asp:DropDownList ID="query_tj" runat="server" Width="95%" CssClass="form-control">
                                    <asp:ListItem Value="ckmc">仓库名称</asp:ListItem>
                                    <asp:ListItem Value="ui_desc">管理人员</asp:ListItem>
                                    <asp:ListItem Value="cksm">仓库说明</asp:ListItem>
                                    <asp:ListItem Value="ckzt">仓库状态</asp:ListItem>
                                    <asp:ListItem Value="bm_mc">所属部门</asp:ListItem>
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
                <!--按钮部分--->
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed">
                        <tr>
                            <td align="right">
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="查询" />
                                <input type="button" name="AddBtn" value="新增" class="btn btn-primary active" onclick="javascript: popAdd('ckwh_view.aspx');" accesskey="a" />
                                <asp:Button ID="UseBtn" runat="server" CssClass="btn btn-primary active" OnClick="Use_Click" Text="启用" />
                                <asp:Button ID="StopBtn" runat="server" CssClass="btn btn-primary active" OnClick="Stop_Click" Text="禁用" />
                                <asp:Button ID="DelBtn" runat="server" AccessKey="d" CssClass="btn btn-primary active" OnClick="Del_Click" OnClientClick="return confirm('确认要执行删除吗？')" Text="删除" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="刷新" />
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
                    EmptyDataText="没有查到符合条件的数据！"
                    OnRowDataBound="OnRow_Bound">
                    <Columns>
                        <asp:TemplateField HeaderImageUrl="~/images/refresh.gif" HeaderText="序号">
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
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="ckid" HeaderText="仓库代码">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="仓库名称">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <a href="#" onclick='javascript:popMod(&#039;/oa/ckgl/ckwh_view.aspx?id=<%# Eval("ckid") %>&#039;)'><font color="#3366ff">
                                                        <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("ckmc") %>'></asp:Label>
                                                        </font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="cklx" HeaderText="仓库类型">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckzt" HeaderText="状态">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bm_mc" HeaderText="仓库所属部门">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle ForeColor="Black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="仓库管理人员">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bmmc" HeaderText="管理人员所属部门">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cksm" HeaderText="仓库说明">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ck_tid" HeaderText="仓库id">
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
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="true" CssClass="page_text" CustomInfoHTML="&lt;font color='#333333'&gt;共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页&lt;/font&gt;" CustomInfoSectionWidth="250px" FirstPageText="首页" InputBoxClass="AspNetPagerInputBox" LastPageText="末页" NextPageText="下页" NumericButtonCount="10" OnPageChanged="AspNetPager1_PageChanged" PrevPageText="上页" ShowBoxThreshold="11" ShowCustomInfoSection="left" ShowInputBox="Auto" SubmitButtonClass=“AspNetPagerButton” SubmitButtonText="Go"></webdiyer:AspNetPager>
            </div>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>
</html>
