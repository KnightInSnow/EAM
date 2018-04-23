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
    <title>职员维护</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">职员维护</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">快速检索：</td>
                            <td>
                                <asp:DropDownList ID="query_tj" runat="server" Width="95%" CssClass="form-control">
                                    <asp:ListItem Value="a.ui_id" Selected="True">登录名</asp:ListItem>
                                    <asp:ListItem Value="a.ui_desc">姓名</asp:ListItem>
                                    <asp:ListItem Value="a.ui_status">状态</asp:ListItem>
                                    <asp:ListItem Value="a.ui_yddh">移动电话</asp:ListItem>
                                    <asp:ListItem Value="a.yn_kg">是否仓库管理人员</asp:ListItem>
                                    <asp:ListItem Value="c.bm_mc">所属部门</asp:ListItem>
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
                                <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click" CausesValidation="False" AccessKey="f" />
                                <input type="button" name="AddBtn" value="新增" class="btn btn-primary active" onclick="javascript: popAdd('yh_view.aspx');" accesskey="a" />
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="StopBtn" runat="server" Text="禁用" OnClick="Stop_Click" OnClientClick="return confirm('确认要执行禁用吗？')" AccessKey="i" />
                                <asp:Button CssClass="btn btn-primary active" ID="PassBtn" runat="server" Text="启用" OnClick="Pass_Click" OnClientClick="return confirm('确认要执行启用吗？')" AccessKey="u" />
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="刷新" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
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
                            EmptyDataText="没有查到符合条件的数据！">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
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
                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="登录名">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemTemplate>
                                        <a href="#" onclick="javascript:popMod('/bas/yhgl/yh_view.aspx?id=<%# Eval("ui_id") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ui_id") %>'></asp:Label></font></a>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="navigate" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ui_zydm" HeaderText="职员编码">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="ui_desc" HeaderText="姓名">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="qy_id" HeaderText="机构代码">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>

                                <asp:BoundField DataField="bm_mc" HeaderText="部门">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="zwmc" HeaderText="职位">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="role_name" HeaderText="角色">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_yddh" HeaderText="移动电话">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_status" HeaderText="状态">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <%--    <asp:ImageField DataImageUrlField="yn_kg" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="库管人员">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle ForeColor="black" />
                                                        </asp:ImageField>--%>
                                <%-- <asp:ImageField DataImageUrlField="yn_lysp" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="审批人员">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="60px" ForeColor="black" />
                                                        </asp:ImageField>--%>
                                <asp:BoundField DataField="ui_edate" HeaderText="帐号截止日" HtmlEncode="False">
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
                        SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
            </div>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>

</html>
