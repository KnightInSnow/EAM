<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_zcsybm_t.aspx.cs" Inherits="FCSystem.OA.report_table.report_zcsybm_t" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <title>资产使用一览表</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
        </asp:ScriptManager>

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">资产使用一览表</div>
        </div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">选择纸张宽度：
                            </td>
                            <td>
                                <asp:DropDownList ID="papersize" runat="server" AutoPostBack="true" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;padding-right:10px;">领用部门：</td>
                            <td>
                                <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">人员:</td>
                            <td>
                                <asp:DropDownList ID="ddl_bmry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BMry_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">资产分类名称：</td>
                            <td>
                                <asp:TextBox ID="zclx" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="查询" />
                                <asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="btn btn-primary active" OnClick="Clear_Click" Text="清空" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="刷新" />
                                <asp:Button ID="Printbt" runat="server" AccessKey="p" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Printbt_Click" Text="打印报表" />
                                <asp:Button ID="grtoexcl" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Export_Click" Text="导出Excel表" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <div class="Page-EmptyLine-Normal"></div>

                <!--startprint-->
                <asp:Panel ID="Panel2" runat="server" align="center" Width="100%">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td>
                                <h3 align="center">资产使用一览表</h3>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle"
                                    OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="False"
                                    EmptyDataText="暂时没有资产信息"
                                    ShowFooter="True">
                                    <Columns>
                                        <asp:BoundField DataField="ProductKindName" HeaderText="资产分类">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ProductName" HeaderText="资产名称">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DepartmentName" HeaderText="所属部门">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EmployeeName" HeaderText="使用人">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Quantity" HeaderText="数量">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Amount" HeaderText="金额">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                                    <RowStyle CssClass="GridViewRowStyle" />
                                    <FooterStyle CssClass="GridViewFooterStyle" />
                                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <!--endprint-->

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


        <div class="PageFoot">
            <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label runat="server" ID="rq_end" Visible="false" />
        </div>
    </form>
</body>
</html>
