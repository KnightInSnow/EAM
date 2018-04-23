<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wpwh.aspx.cs" Inherits="FCSystem.OA.wpgl.wpwh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>商品信息维护</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />  
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    
</head>

<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">商品信息维护</div>
        </div>
        <!--快速检索输入框按钮部分--->
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="padding-top:20px;">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">快速检索：</td>
                            <td>
                                <asp:DropDownList ID="query_tj" CssClass="form-control" runat="server" Width="95%">
                                    <%-- <asp:ListItem Value="a.wpbm">商品编码</asp:ListItem>--%>
                                    <asp:ListItem Value="a.wpmc">商品名称</asp:ListItem>
                                    <asp:ListItem Value="b.fl_mc">所属分类</asp:ListItem>
                                    <asp:ListItem Value="a.wpzt">商品状态</asp:ListItem>
                                    <asp:ListItem Value="c.mc">商品品牌</asp:ListItem>
                                    <asp:ListItem Value="a.wpxh">商品型号</asp:ListItem>
                                    <asp:ListItem Value="a.wptxm">商品条形码</asp:ListItem>
                                    <asp:ListItem Value="d.mc">商品产地</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="query_content" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>

                            <td style="text-align:right;padding-right:10px;">由此供应商提供：</td>
                            <td>
                                <asp:DropDownList ID="ddl_gys" runat="server" CssClass="form-control"></asp:DropDownList>
                            </td>
							<td style="margin-top:5px;">
                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="btn_addgys_Click" CssClass="btn btn-primary active">加入</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed">
                        <tr>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click" CausesValidation="False" AccessKey="f" />
                                <input type="button" name="AddBtn" value="增加" class="btn btn-primary active" onclick="javascript: popAdd('wpwh_view.aspx');" accesskey="a" />
                                <asp:Button CssClass="btn btn-primary active" ID="UseBtn" runat="server" Text="启用" OnClick="Use_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="StopBtn" runat="server" Text="禁用" OnClick="Stop_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" AccessKey="d" OnClientClick="return confirm('确认要执行删除吗？')"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="刷新" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="Page-EmptyLine-Normal"></div>
            <div class="PageBody-Middle-MinHeight">
                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Width="100%">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False" 
                        DataKeyNames="wp_tid" 
                        EmptyDataText="没有查到符合条件的数据！">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count + 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="30px"></HeaderStyle>
                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="height: 16px; width: 16px;" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="wp_tid" HeaderText="商品id">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="商品名称">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popMod('/oa/wpgl/wpwh_view.aspx?id=<%# Eval("wp_tid") %>');">
                                        <font color="#3366ff">
                                                            <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("wpmc") %>'></asp:Label>
                                                        </font>
                                    </a>
                                </ItemTemplate>
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="fl_mc" HeaderText="分类">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--     <asp:BoundField DataField="gysmc" HeaderText="供应商">
                                                        <HeaderStyle ForeColor="Black" />
                                                    </asp:BoundField>--%>
                            <asp:BoundField DataField="wpzt" HeaderText="状态">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zdy_ppmc" HeaderText="品牌">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpxh" HeaderText="型号">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zdy_wpcd" HeaderText="产地">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <%--   <asp:BoundField DataField="wpdj" HeaderText="单价">
                                                        <HeaderStyle ForeColor="Black" Width="80" />
                                                        <ItemStyle HorizontalAlign="right" />
                                                    </asp:BoundField>--%>
                            <asp:BoundField DataField="wptxm" HeaderText="条形码">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle CssClass="GridViewRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                    </asp:GridView>
                </asp:Panel>
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
