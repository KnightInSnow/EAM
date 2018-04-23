<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rkshqr.aspx.cs" Inherits="FCSystem.OA.wprk.rkshqr" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet">
    <title>入库确认</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true">
        </asp:ScriptManager>

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">入库确认</div>
        </div>
        <!--输入框部分--->
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:130px;">
                    <asp:Panel ID="Panel2" runat="server">
                        <table style="table-layout: fixed">
                            <tr>
                                <td style="text-align:right;padding-right:10px;">入库单号：</td>
                                <td>
                                    <asp:TextBox ID="rkdh" runat="server" CssClass="form-control"></asp:TextBox></td>

                                <td style="text-align:right;padding-right:10px;">入库仓库：</td>
                                <td>
                                    <asp:DropDownList ID="rkck" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </td>

                                <td style="text-align:right;padding-right:10px;">入库单状态：</td>
                                <td>
                                    <asp:DropDownList ID="rkzt" runat="server" CssClass="form-control">
                                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                        <asp:ListItem Text="送审中" Value="送审中"></asp:ListItem>
                                        <asp:ListItem Text="已结单" Value="已结单"></asp:ListItem>
                                        <asp:ListItem Text="已退回" Value="已退回"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td style="text-align:right;padding-right:10px;"><ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>录入时间(自)：
                                </td>
                                <td>
                                    <asp:TextBox ID="txtbegintime" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>

                                <td style="text-align:right;padding-right:10px;"><ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>录入时间(至)：
                                </td>
                                <td>
                                    <asp:TextBox ID="txtendtime" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>

                                <td style="text-align:right;padding-right:10px;">录入人：</td>
                                <td>
                                    <asp:DropDownList ID="ddl_lrr" runat="server" CssClass="form-control"></asp:DropDownList>
                                </td>
                            </tr>

                            <tr>
                                <td style="text-align:right;padding-right:10px;">备注：</td>
                                <td>
                                    <asp:TextBox ID="rkbz" runat="server" CssClass="form-control"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </div>

                <div class="PageBody-Top-Buttons" style="margin-top:10px;">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="left" style="visibility: hidden">
                                <font color="red">只显示您负责管理的仓库下的入库登记信息！</font>
                            </td>
                            <td align="right" colspan="2">
                                <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="查询" AccessKey="f" OnClick="Ref_Click" CausesValidation="true"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="ClearBtn" runat="server" Text="清空" AccessKey="r" CausesValidation="true" OnClick="Clear_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="刷新" AccessKey="e" CausesValidation="true" OnClick="Ref_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="rkdid"
                    EmptyDataText="没有查到符合条件的数据！">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="rkdid" HeaderText="入库单ID">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="cklx" HeaderText="类型">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="入库单号">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:popMod('/oa/wprk/rkshqr_mod.aspx?id=<%# Eval("rkdid") %>')"><font color="#3366ff"><asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdh") %>'></asp:Label></font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="rkbz" HeaderText="入库单备注">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckmc" HeaderText="入库仓库">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rkzt" HeaderText="状态">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="合同">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="hl_ht" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看图片" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="付款凭证">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="hl_pz" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看图片" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="购买申请">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="hl_gmsq" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看图片" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="录入人">
                            <HeaderStyle ForeColor="black" />
                            <ItemTemplate>
                                <asp:Label ID="Labelsqr" runat="server" Text='<%# Bind("ui_desc") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="lrsj" HeaderText="录入时间" HtmlEncode="False">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="spsj" HeaderText="审批时间" HtmlEncode="False">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="spyj" HeaderText="审批意见">
                            <HeaderStyle ForeColor="black" />
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
