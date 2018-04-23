<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="myzc.aspx.cs" Inherits="FCSystem.OA.wpgl.myzc" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的资产</title>

    <script type="text/javascript" src="../../csjs/myjs.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    
</head>

<body class="main">
    <form runat="server">

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">我的资产</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="left">
                                <asp:Label ID="lblzcall" runat="server" ForeColor="Red" Font-Bold="True" Font-Names="微软雅黑">您领用的资产信息：</asp:Label>
                            </td>
                            <td></td>
                            <td align="right">&nbsp;<asp:LinkButton ID="lbtn_ly" runat="server" Font-Bold="True" Font-Names="微软雅黑" Font-Underline="True">领用资产</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtn_jj" runat="server" Font-Bold="True" Font-Names="微软雅黑" Font-Underline="True">交接资产</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtn_gh" runat="server" Font-Bold="True" Font-Names="微软雅黑" Font-Underline="True">归还资产</asp:LinkButton>
                                &nbsp;<asp:LinkButton ID="lbtn_bf" runat="server" Font-Bold="True" Font-Names="微软雅黑" Font-Underline="True">报废资产</asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <asp:Panel ID="panel1" runat="server">
                <div class="PageBody-Middle-MinHeight">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="GridView1_RowDataBound"
                        AutoGenerateColumns="False"
                        DataKeyNames="lymx_tid"
                        EmptyDataText="暂时没有资产信息">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="lymx_tid" HeaderText="领用明细单号">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zczt" HeaderText="资产状态">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpxh" HeaderText="资产型号">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lyrq" HeaderText="领用时间">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="syr" HeaderText="使用人">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_id" HeaderText="使用人代码">
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sybm" HeaderText="所属部门">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bzsm" HeaderText="备注说明">
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
                    <webdiyer:AspNetPager ID="AspNetPager2" runat="server"
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
                        SubmitButtonText="Go" OnPageChanged="AspNetPager2_PageChanged">
                    </webdiyer:AspNetPager>
                </div>
            </asp:Panel>

            <asp:Panel ID="panel3" runat="server">
                <div class="PageBody-Middle-MinHeight">
                    <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="GridView1_RowDataBound"
                        AutoGenerateColumns="False"
                        DataKeyNames="planid"
                        EmptyDataText="没有查到符合条件的数据！">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="5%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-ForeColor="Black" HeaderText="计划名称">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popPlan('/oa/pd/syrplanList.aspx?id=<%#Eval("planid")%>')"><font color="#3366ff"><asp:Label ID="lbljhmc" runat="server" Text='<%#Bind("planname") %>'></asp:Label></font></a>
                                </ItemTemplate>
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="zxr" HeaderText="计划执行人员">
                                <HeaderStyle ForeColor="Black" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_desc" HeaderText="计划设定人员">
                                <HeaderStyle ForeColor="Black" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bm_mc" HeaderText="设定人员所属部门">
                                <HeaderStyle ForeColor="Black" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="tjsj" HeaderText="添加时间">
                                <HeaderStyle ForeColor="Black" />
                                <HeaderStyle HorizontalAlign="Center" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="pdsm" HeaderText="备注说明">
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
                        SubmitButtonClass=“AspNetPagerButton”
                        SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
                    </webdiyer:AspNetPager>
                </div>
            </asp:Panel>
        </div>

        <div class="PageFoot">
            <asp:Label ID="lbl_dlrytid" runat="server" Visible="False"></asp:Label>
        </div>

    </form>
</body>
</html>
