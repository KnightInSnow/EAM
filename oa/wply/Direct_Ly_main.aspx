<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Direct_Ly_main.aspx.cs" Inherits="FCSystem.OA.wply.Direct_Ly_main" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>领用登记</title>

</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">领用登记</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <td style="text-align:right;padding-right:10px;">快速检索：</td>

                        <td>
                            <asp:DropDownList ID="query_tj" runat="server" CssClass="form-control">
                                <asp:ListItem Value="lybt" Selected="True">领用标题</asp:ListItem>
                                <asp:ListItem Value="jjcd">紧急程度</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="query_content" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                        <td style="text-align:right;padding-right:10px;">状态：</td>
                        <td>
                            <asp:DropDownList ID="lyzt" runat="server" CssClass="form-control">
                                <asp:ListItem Value="" Text="" Selected="True"></asp:ListItem>
                                <asp:ListItem Value="申请中" Text="申请中"></asp:ListItem>
                        <%--        <asp:ListItem Text="已审批" Value="已审批"></asp:ListItem>--%>
                                <asp:ListItem Value="已结单" Text="已结单"></asp:ListItem>
                                <asp:ListItem Value="已退回" Text="已退回"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </table>
                </div>
                <!--按钮部分--->
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="查询" />
                                <input type="button" name="AddBtn1" value="申请" class="btn btn-primary active" onclick="javascript: popAdd2('Direct_Ly_add.aspx');" accesskey="a" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="刷新" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="Page-EmptyLine-Normal"></div>
            <!--页面表格部分-->
            <div class="PageBody-Middle-MinHeight">
                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False"
                        DataKeyNames="lyid"
                        EmptyDataText="没有查到符合条件的数据！">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>

                            <asp:BoundField DataField="lyid" HeaderText="领用编号">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="领用单编号">
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popAdd2('/oa/wply/Direct_Ly_mod.aspx?id=<%# Eval("lyid") %>')">
                                        <font color="#3366ff"><asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("lydh") %>'></asp:Label></font>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="lybt" HeaderText="领用标题">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mc" HeaderText="出库方式">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="jjcd" HeaderText="紧急程度">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lx" HeaderText="资产类型">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sqsj" HeaderText="申请时间" HtmlEncode="False">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sqr_name" HeaderText="申请人">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sqr_bmmc" HeaderText="申请部门">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lyzt" HeaderText="领用状态">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="单据图片">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:HyperLink ID="cktp" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看图片" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="spr" HeaderText="审批人">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spsj" HeaderText="审批时间">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spyj" HeaderText="审批意见">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lydh" HeaderText="领用单号">
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
                    SubmitButtonClass="“AspNetPagerButton”"
                    SubmitButtonText="Go">
                </webdiyer:AspNetPager>
            </div>

        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
