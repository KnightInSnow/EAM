<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_zcsybm_pande.aspx.cs" Inherits="FCSystem.OA.report_table.report_zcsybm_pande" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>资产使用一览表</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

        <!--startprint-->
        <table id="table1" cellspacing="0" cellpadding="0" width="100%" style="height: 100%" border="0">
            <tr>
                <td>
                    <asp:Panel ID="panel1" runat="server">
                        <table id="search" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td>
                                    <h3 align="center">
                                        <br />
                                        资产使用一览表</h3>
                                </td>
                            </tr>

                            <tr style="height: 30px">
                                <td align="right">查询日期：<asp:Label runat="server" ID="rq_end" Font-Underline="true" />&nbsp;&nbsp;打印人：<asp:Label runat="server" ID="dyr" Font-Underline="true" />&nbsp;&nbsp;</td>
                            </tr>

                            <asp:Panel ID="bmtj" runat="server" align="center" Width="100%" Visible="False">
                                <tr align="center">
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            CellSpacing="1"
                                            AllowPaging="false"
                                            DataKeyNames="fl_mc"
                                            BorderStyle="Solid"
                                            BorderWidth="1px"
                                            BackColor="#999999"
                                            EmptyDataText="暂时没有登记任何物品入库信息"
                                            Width="100%" ShowFooter="True">
                                            <Columns>
                                            </Columns>
                                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                                            <RowStyle CssClass="GridViewRowStyle" />
                                            <FooterStyle CssClass="GridViewFooterStyle" />
                                            <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                        </asp:GridView>
                                        <br />
                                    </td>
                                </tr>
                            </asp:Panel>

                            <asp:Panel ID="rytj" runat="server" align="center" Width="100%" Visible="False">
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView2" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="暂时没有资产信息"
                                            Width="100%">
                                            <Columns>
                                                <%--  <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>--%>
                                                <asp:BoundField DataField="fl_mc" HeaderText="资产分类">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sl" HeaderText="数量">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="je" HeaderText="金额">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="bm_mc" HeaderText="所属部门">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                            </Columns>
                                            <RowStyle CssClass="GridViewRowStyle" />
                                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                            <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </asp:Panel>

                            <tr>
                                <td style="height: 22px">
                                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                        OnPageChanged="AspNetPager1_PageChanged"
                                        ShowCustomInfoSection="left"
                                        ShowInputBox="Auto"
                                        AlwaysShow="false"
                                        CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                        NumericButtonCount="100"
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

                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <!--endprint-->

        <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lybm" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="zclx" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lyry" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>



