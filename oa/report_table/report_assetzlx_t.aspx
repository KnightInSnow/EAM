<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_assetzlx_t.aspx.cs" Inherits="FCSystem.OA.report_table.report_assetzlx_t" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>资产总账（资产）报表</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
        </asp:ScriptManager>

        <div class="PageHead">资产总账（类型）</div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td>选择纸张宽度：
                            </td>
                            <td>
                                <asp:DropDownList ID="papersize" runat="server" AutoPostBack="true">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtbegintime" ErrorMessage="*" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtbegintime" ErrorMessage="请输入领用时间(自)">&nbsp;
                                </asp:RequiredFieldValidator>开始日期：
                            </td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtendtime" ErrorMessage="*" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtendtime" ErrorMessage="请输入领用时间(至)">&nbsp;
                                </asp:RequiredFieldValidator>结束日期：
                            </td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" MaxLength="10"></asp:TextBox></td>
                            <td>资产类型：</td>
                            <td>
                                <asp:TextBox ID="zclx" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="right">
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
                <table style="table-layout:fixed;">
                    <tr>
                        <td>
                            <h3 align="center">资产总账（类型）
                            </h3>
                        </td>
                    </tr>
                    <tr align="center">
                        <td>
                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"                                    
                                OnRowDataBound="OnRow_Bound"
                                AutoGenerateColumns="False"
                                AllowPaging="false"
                                DataKeyNames="fl_tid"
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
                                    <asp:BoundField DataField="fl_tid" HeaderText="类型代码">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fl_mc" HeaderText="资产类型">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="qcslz" HeaderText="数量">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="qcjez" HeaderText="金额">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zjsl" HeaderText="数量">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zjje" HeaderText="金额">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="jsslz" HeaderText="数量">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="jsjez" HeaderText="金额">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="qmslz" HeaderText="数量">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="qmjez" HeaderText="金额">
                                        <HeaderStyle ForeColor="black" />
                                    </asp:BoundField>
                                </Columns>
                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                <RowStyle CssClass="GridViewRowStyle" />
                                <FooterStyle  CssClass="GridViewFooterStyle" />
                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
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

            <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>
</html>

