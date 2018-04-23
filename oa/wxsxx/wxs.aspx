<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wxs.aspx.cs" Inherits="FCSystem.OA.wxsxx.wxs" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <title>维修商信息维护</title>
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
                                <td align="center" style="background-image: url(../../images/bg.gif);">维修商信息维护</td>
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
                                        <td width="10%">快速检索：</td>
                                        <td width="10%">
                                            <asp:DropDownList ID="query_tj" runat="server" Width="90%">
                                                <asp:ListItem Value="a.ui_id" Selected="True">登录名</asp:ListItem>
                                                <asp:ListItem Value="a.ui_desc">姓名</asp:ListItem>
                                                <asp:ListItem Value="a.ui_status">状态</asp:ListItem>
                                                <asp:ListItem Value="a.ui_yddh">移动电话</asp:ListItem>
                                                <asp:ListItem Value="c.gysmc">所属单位</asp:ListItem>
                                            </asp:DropDownList></td>
                                        <td width="10%">
                                            <asp:TextBox ID="query_content" runat="server" Width="90%"></asp:TextBox>
                                        </td>
                                        <td align="right" width="70%">
                                            <asp:Button CssClass="mybutton" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click" CausesValidation="False" AccessKey="f" /><input type="button" name="AddBtn" value="新增" class="mybutton" onclick="javascript: popAdd('wxs_view.aspx');" accesskey="a" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d"></asp:Button><asp:Button CssClass="mybutton" ID="RefBtn" runat="server" Text="刷新" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
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
                                                    EmptyDataText="没有查到符合条件的数据！"
                                                    Width="100%">
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

                                                        <asp:BoundField DataField="ui_id" HeaderText="登录名">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="姓名">
                                                            <HeaderStyle ForeColor="Black"  />
                                                            <ItemTemplate>
                                                                <a href="#" onclick="javascript:popMod('/oa/wxsxx/wxs_view.aspx?id=<%# Eval("ui_id") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label></font></a>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="gysmc" HeaderText="所属单位">
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
