<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bmlyxd.aspx.cs" Inherits="FCSystem.OA.pgjc.bmlyxd" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产配比查询</title>
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
                                <td align="center" style="background-image: url(../../images/bg.gif);">资产配比查询</td>
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
                                        <td colspan="8" style="height: 5px"></td>
                                    </tr>
                                    <tr>
                                        <td align="left" width="10%">部门名称：</td>
                                        <td width="22%">
                                            <asp:DropDownList ID="ddl_bm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_bm_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td width="5%"></td>
                                        <td>领用人：</td>
                                        <td width="22%">
                                            <asp:DropDownList ID="ddl_lyr" runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ddl_lyr_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td width="3%"></td>
                                        <td>资产分类：</td>
                                        <td width="22%">
                                            <asp:DropDownList ID="ddl_wpfl" runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="ddl_wpfl_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" width="10%">领用日期:</td>
                                        <td width="22%">
                                            <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10" Height="19px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtbegintime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td width="5%"></td>
                                        <td>结束日期：</td>
                                        <td width="22%">
                                            <asp:TextBox ID="txtendtime" runat="server" MaxLength="10" Height="19px"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txtendtime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td width="5%"></td>
                                        <td width="8%"></td>
                                        <td width="22%"></td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td colspan="8" align="right">
                                            <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Height="21px" OnClick="Query_Click" Text="查询" /><asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" cssclass="mybutton" Height="21px" OnClick="Clear_Click" Text="清空" /><asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" cssclass="mybutton" Height="21px" OnClick="Query_Click" Text="刷新" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
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
                                                    
                                                   DataKeyNames=   "ffckid"
                                                    BorderStyle="None"
                                                    BorderWidth="0px"
                                                    BackColor="Silver"
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
                                                        <asp:BoundField DataField="lybm" HeaderText="领用部门">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="分类">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle ForeColor="black" />
                                                        </asp:BoundField>
                                                        <%-- <asp:BoundField DataField="wpmc" HeaderText="物品名称">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle ForeColor="black" />
                                                        </asp:BoundField>                                                      
                                                        <asp:BoundField DataField="ppmc" HeaderText="品牌">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle ForeColor="black" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="wpxh" HeaderText="型号">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>--%>
                                                        <asp:BoundField DataField="ffwpsl" HeaderText="领用数量">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="xdsl" HeaderText="领用上限">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <%-- <asp:TemplateField HeaderText="领用人">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Labellyrname" runat="server" Text='<%# Bind("lyrmc") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>--%>
                                                        <asp:BoundField DataField="ckmc" HeaderText="发放仓库">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ffbm" HeaderText="发放部门">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spr" HeaderText="审批人">
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
                                </tbody>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
