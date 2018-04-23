<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bfmxcx.aspx.cs" Inherits="FCSystem.OA.wpcx.bfmxcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>报废明细查询</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">报废明细查询</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody> 
                                    <tr>
                                        <td>仓库：</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_ck" runat="server">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">开始日期：</td>
                                        <td>
                                            <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10" Height="19px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtbegintime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td>结束日期：</td>
                                        <td>
                                            <asp:TextBox ID="txtendtime" runat="server" MaxLength="10" Height="19px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtendtime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>商品分类：</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_wpfl" runat="server">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>商品名称：</td>
                                        <td>
                                            <asp:TextBox ID="wpmc" runat="server"></asp:TextBox>
                                        </td>
                                        <td width="8%"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td class="td_q_space" colspan="6"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" />
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="输入开始时间有误"
                                                ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator8"
                                                runat="server"
                                                ControlToValidate="txtbegintime"
                                                ErrorMessage="请输入开始时间">&nbsp
                                            </asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="输入结束时间有误"
                                                ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator9"
                                                runat="server"
                                                ControlToValidate="txtendtime"
                                                ErrorMessage="请输入结束时间">&nbsp
                                            </asp:RequiredFieldValidator></td>
                    </td>
                    <td align="right" colspan="3">
                        <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="true" cssclass="mybutton" Height="21px" OnClick="Query_Click" Text="查询" /><asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" cssclass="mybutton" Height="21px" OnClick="Clear_Click" Text="清空" /><asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="true" cssclass="mybutton" Height="21px" OnClick="Query_Click" Text="刷新" />
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
                                DataKeyNames="bfid"
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
                                    <asp:TemplateField HeaderText="资产编码">
                                        <HeaderStyle ForeColor="Black" />
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="navigate" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="fl_mc" HeaderText="分类名称">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="资产">
                                        <ItemStyle HorizontalAlign="center" />
                                        <HeaderStyle Width="30px" ForeColor="black" />
                                    </asp:ImageField>
                                    <asp:BoundField DataField="sqsl" HeaderText="报废数量">
                                        <HeaderStyle Width="70px" ForeColor="black" />
                                        <ItemStyle HorizontalAlign="right" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="申请人">
                                        <HeaderStyle ForeColor="Black" />
                                        <ItemTemplate>
                                            <asp:Label ID="Labellyrname" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ControlStyle CssClass="navigate" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="shbm" HeaderText="收回部门">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ckmc" HeaderText="收回仓库">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="spr" HeaderText="审批人">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="spyj" HeaderText="审批意见">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="center" />
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
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
