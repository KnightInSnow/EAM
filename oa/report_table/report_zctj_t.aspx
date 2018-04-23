<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_zctj_t.aspx.cs" Inherits="FCSystem.OA.report_table.report_zctj_t" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <title>资产统计表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

    <script type="text/javascript" src="../../csjs/print.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
        <div class="PageHead">资产统计表</div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td>选择纸张宽度：
                            </td>
                            <td>
                                <asp:DropDownList ID="papersize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ChangeSize_Selected">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>资产类型：</td>
                            <td>
                                <asp:TextBox ID="zclx" runat="server"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td colspan="6" align="right">
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" CssClass="mybutton"  OnClick="Query_Click" Text="查询" />
                                <asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="mybutton"  OnClick="Clear_Click" Text="清空" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="mybutton"  OnClick="Query_Click" Text="刷新" />
                                <asp:Button ID="Printbt" runat="server" AccessKey="p" CausesValidation="False" CssClass="mybutton"  OnClick="Printbt_Click" Text="打印报表" />
                                <asp:Button ID="grtoexcl" runat="server" AccessKey="e" CausesValidation="False" CssClass="mybutton"  OnClick="Export_Click" Text="导出Excel表" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <div class="Page-EmptyLine-Normal"></div>
                <!--startprint-->
                <asp:Panel ID="Panel2" runat="server" align="center">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td>
                                <h3 align="center">资产统计表</h3>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:GridView ID="GridView1" runat="server"  CssClass="GridViewStyle"
                                    OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="False"
                                    AllowPaging="false"
                                    DataKeyNames="fl_mc"
                                    EmptyDataText="暂时没有登记任何物品入库信息"
                                    ShowFooter="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fl_mc" HeaderText="资产类型">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zsl" HeaderText="数量">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zje" HeaderText="金额">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                                    <RowStyle CssClass="GridViewRowStyle" />
                                    <FooterStyle CssClass="GridViewFooterStyle" />
                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <!--endprint-->
            </div>

            <div class="PageBody-Bottom-Pager">
                <tr>
                    <td style="height: 22px">
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
            </div>

        </div>

        <div class="PageFoot">
            <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label runat="server" ID="rq_end" Visible="false" />
        </div>
    </form>
</body>
</html>
