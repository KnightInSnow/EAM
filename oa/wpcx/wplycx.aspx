<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wplycx.aspx.cs" Inherits="FCSystem.OA.wpcx.wplycx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <title>出库物品查询</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">出库物品查询</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel3" runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
                            <table style="table-layout:fixed;">
                                <tbody> 
                                    <tr>
                                        <td align="left" style="height: 25px" width="8%">仓库名称：</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_ck" runat="server" OnSelectedIndexChanged="ddl_ck_SelectedIndexChanged" AutoPostBack="True">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">开始日期：</td>
                                        <td>
                                            <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10" Height="20px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td>结束日期：</td>
                                        <td>
                                            <asp:TextBox ID="txtendtime" runat="server" MaxLength="10" Height="20px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="height: 25px" width="8%">商品分类：</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_fl" runat="server" OnSelectedIndexChanged="ddl_fl_SelectedIndexChanged" AutoPostBack="True">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" style="height: 25px" width="8%">商品名称：</td>
                                        <td>
                                            <asp:TextBox ID="tbx_wpmc" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="left" style="height: 25px" width="8%">商品编码：</td>
                                        <td>
                                            <asp:TextBox ID="tbx_wpbm" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>申请部门：</td>
                                        <td>
                                            <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>申请人：</td>
                                        <td>
                                            <asp:DropDownList ID="lyr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lyr_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="输入开始时间有误"
                                                ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="输入结束时间有误"
                                                ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                        </td>
                                        <td align="right" colspan="3">
                                            <asp:Button ID="btn_query" runat="server" AccessKey="f" CausesValidation="true" cssclass="mybutton" Height="21px" OnClick="Ref_Click" Text="查询" /><asp:Button ID="btn_refresh" runat="server" AccessKey="e" CausesValidation="true" cssclass="mybutton" Height="21px" OnClick="Ref_Click" Text="刷新" /><asp:Button ID="btn_out" runat="server" Text="导出" cssclass="mybutton" Height="21px" Enabled="False" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_q_space"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                    OnRowDataBound="OnRow_Bound"
                                                    AutoGenerateColumns="False"                                                    
                                                    DataKeyNames=   "lymx_tid"
                                                    EmptyDataText="没有查到符合条件的数据！">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="20px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="商品分类">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField> 
                                                        <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sqrmc" HeaderText="申请人">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="bmmc" HeaderText="所属部门">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                         <asp:BoundField DataField="lydh" HeaderText="领用单号">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                         <asp:BoundField DataField="lysm" HeaderText="备注">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sqsj" HeaderText="申请时间">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ffwpsl" HeaderText="申请数量">
                                                            <HeaderStyle ForeColor="black" />
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
                                </tbody>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Label ID="lblJgdm" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>
