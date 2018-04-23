<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdzcbqbd.aspx.cs" Inherits="FCSystem.oa.pd.pdzcbqbd" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>资产标签补打</title>
</head>

<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
        <div class="PageHead">资产标签补打</div>
        <div class="PageBody">
            <div class="PageBody-Buttons">
                <table style="table-layout: fixed">
                    <tr>
                        <td>仓库名称： 
                        </td>
                        <td>
                            <asp:DropDownList ID="ddl_ck" runat="server" Width="95%">
                            </asp:DropDownList>
                        </td>
                        <td>开始日期：
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="输入开始时间有误"
                                ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator></td>
                        <td>
                            <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>结束日期：
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="输入结束时间有误"
                                ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator></td>
                        <td>
                            <asp:TextBox ID="txtendtime" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>商品分类：</td>
                        <td>
                            <asp:DropDownList ID="ddl_fl" runat="server" Width="95%">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>商品名称：</td>
                        <td>
                            <asp:TextBox ID="tbx_wpmc" runat="server"></asp:TextBox>
                        </td>
                        <td>商品型号：</td>
                        <td>
                            <asp:TextBox ID="tbx_wpxh" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>查询属性：
                        </td>
                        <td>
                            <asp:DropDownList ID="ddl_query" runat="server" Width="95%">

                                <asp:ListItem Value="10" Text="未补打标签"></asp:ListItem>
                                <asp:ListItem Value="11" Text="已补打标签"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>使用部门：</td>
                        <td>
                            <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>使用人：</td>
                        <td>
                            <asp:DropDownList ID="lyr" runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="lyr_SelectedIndexChanged">
                                <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>资产编码：</td>
                        <td>
                            <asp:TextBox ID="tbx_zcbmfull" runat="server"></asp:TextBox>
                        </td>
                        <td>商品唯一码： 
                        </td>
                        <td>
                            <asp:TextBox ID="tbx_spwym" runat="server"></asp:TextBox>
                        </td>
                        <td>商品品牌：</td>
                        <td>
                            <asp:DropDownList ID="ddl_pp" runat="server" Width="100%">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table style="table-layout:fixed;">
                    <tr>
                        <td align="right">
                            <asp:Button ID="btn_usedzc" runat="server" Text="曾经使用资产" CssClass="mybutton" Visible="false" /><asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="true" CssClass="mybutton" Height="21px" OnClick="Query_Click" Text="查询" /><asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="mybutton" Height="21px" OnClick="Clear_Click" Text="清空" /><asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="mybutton" Height="21px" OnClick="Query_Click" Text="刷新" /><asp:Button ID="btn_print" runat="server" Text="打印" CssClass="mybutton" Height="21px" OnClick="btn_print_Click" /><asp:Button ID="btn_out" runat="server" Enabled="false" Text="导出" CssClass="mybutton" /><asp:Button ID="delete" runat="server" Text="删除" CssClass="mybutton" Height="21px" OnClick="btn_delete_Click" /></td>
                    </tr>
                </table>
            </div>
            <div class="PageBody-Middle-MinHeight">
                <table style="table-layout:fixed;">
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                <asp:GridView ID="GridView1" runat="server"
                                    OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="false"
                                    CellSpacing="1"
                                    DataKeyNames="rkmxid"
                                    BorderStyle="None"
                                    BorderWidth="0px"
                                    BackColor="Silver"
                                    EmptyDataText="没有查到符合条件的数据！"
                                    Width="100%" OnRowCreated="GridView1_RowCreated">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px" />
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="资产编码">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn_zcbm" runat="server" Text='<%#Eval("zcbmfull") %>' CommandArgument='<%# Eval("rkmxid")%>' OnClick="lbtn_zcbm_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="spwym" HeaderText="商品唯一码">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fl_mc" HeaderText="商品分类">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wppp" HeaderText="商品品牌">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gzrq" HeaderText="购置日期">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zczt" HeaderText="资产状态">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="syr" HeaderText="使用人">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sybm" HeaderText="使用部门">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="spr" HeaderText="审批人">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="lysj" HeaderText="审批时间">
                                            <HeaderStyle Width="80px" ForeColor="Black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dqts" HeaderText="到期天数">
                                            <HeaderStyle Width="80px" ForeColor="Black" />
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
                        <td>
                            <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto">
                                <asp:GridView ID="GridView2" runat="server"
                                    OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="false"
                                    CellSpacing="1"
                                    DataKeyNames="rkmxid"
                                    BorderStyle="None"
                                    BorderWidth="0px"
                                    BackColor="Silver"
                                    EmptyDataText="没有查到符合条件的数据！"
                                    Width="100%" OnRowCreated="GridView2_RowCreated">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField>
                                            <HeaderStyle Width="30px" />
                                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                            <HeaderTemplate>
                                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="主资产编码">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn_zcbm" runat="server" Text='<%#Eval("zcbmfull") %>' CommandArgument='<%# Eval("rkmxid")%>' OnClick="lbtn_zcbm_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="cfzt" HeaderText="拆分或合并">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="spwym" HeaderText="商品唯一码">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fl_mc" HeaderText="商品分类">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wppp" HeaderText="商品品牌">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zczt" HeaderText="资产状态">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="syr" HeaderText="使用人">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sybm" HeaderText="使用部门">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ljzcbm" HeaderText="零件编码">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ljglzcbm" HeaderText="零件关联资产">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ljglzcsyr" HeaderText="关联资产使用人">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ljglzcsybm" HeaderText="关联资产使用部门">
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
                </table>
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
            <asp:Label ID="lblMindate" runat="server" Visible="False"></asp:Label>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
