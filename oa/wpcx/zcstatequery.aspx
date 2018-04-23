<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcstatequery.aspx.cs" Inherits="FCSystem.OA.wpcx.zcstatequery" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产状况查询</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>

    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
</head>

<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="_Script" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">资产状况查询</div>
        </div>
        <!--页面输入框部分-->
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:170px;">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">资产编码：</td>
                            <td>
                                <asp:TextBox ID="tbx_zcbmfull" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                开始日期：</td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10"  CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                结束日期：</td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" MaxLength="10"  CssClass="form-control"></asp:TextBox>

                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:right;padding-right:10px;">商品分类：</td>
                            <td>
                                <asp:DropDownList ID="ddl_fl" runat="server"  CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">商品名称：</td>
                            <td>
                                <asp:TextBox ID="tbx_wpmc" runat="server"  CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">商品型号：</td>
                            <td>
                                <asp:TextBox ID="tbx_wpxh" runat="server"  CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:right;padding-right:10px;">查询属性：</td>
                            <td>
                                <asp:DropDownList ID="ddl_query" runat="server"  CssClass="form-control"> 
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">使用部门：</td>
                            <td>
                                <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged"  CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">使用人：</td>
                            <td>
                                <asp:DropDownList ID="lyr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lyr_SelectedIndexChanged"  CssClass="form-control">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:right;padding-right:10px;">商品品牌：</td>
                            <td>
                                <asp:DropDownList ID="ddl_pp" runat="server"  CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">单价范围：</td>
                            <td align="left">
                                <table style="table-layout: fixed;">
                                    <tr>
                                        <td width="40%" align="left">
                                            <asp:TextBox ID="tbxmindj" runat="server" CssClass="form-control"></asp:TextBox>
                                        </td>
                                        <td align="center">
                                            <asp:Label ID="lbltext" runat="server" Text="至"></asp:Label>
                                        </td>
                                        <td width="40%" align="right">
                                            <asp:TextBox ID="tbxmaxdj" runat="server"  CssClass="form-control"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="1" align="left">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="输入开始时间有误"
                                    ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="输入结束时间有误"
                                    ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="tbxmindj" Display="none" ErrorMessage="单价最小值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}">
                                </asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="tbxmaxdj" Display="none" ErrorMessage="单价最大值必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}">
                                </asp:RegularExpressionValidator>
                            </td>
                            <!--页面按钮部分--->
                            <td colspan="5" align="right">
                                <asp:Button ID="btn_usedzc" runat="server" Text="曾经使用资产" CssClass="btn btn-primary active" Visible="false" />
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="true" CssClass="btn btn-primary active" OnClick="Query_Click" Text="查询" />
                                <asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="btn btn-primary active" OnClick="Clear_Click" Text="清空" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="刷新" />
                                <asp:Button ID="btn_print" runat="server" Text="打印标签" CssClass="btn btn-primary active" OnClick="btn_print_Click" />
                                <asp:Button ID="btn_out" runat="server" Enabled="false" Text="导出" CssClass="btn btn-primary active" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False"
                        DataKeyNames="rkmxid"
                        EmptyDataText="没有查到符合条件的数据！"
                        OnRowCreated="GridView1_RowCreated" AllowSorting="True" OnSorting="GridView1_Sorting">
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
                                    <%--              <asp:LinkButton ID="lbtn_zcbm" runat="server" Text='<%#Eval("zcbmfull") %>' CommandArgument='<%# Eval("rkmxid")%>' OnClick="lbtn_zcbm_Click"></asp:LinkButton>--%>
                                    <a href="#" onclick="javascript:popMiniMod('/oa/wprk/rkshqr_mx_mod.aspx?id=<%# Eval("rkmxid") %>')">
                                        <font color="#3366ff"><asp:Label ID="lblzcbm" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label></font>
                                    </a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="spwym" HeaderText="商品唯一码">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
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
                            <asp:BoundField DataField="dqts" HeaderText="保修剩余天数" SortExpression="dqts">
                                <HeaderStyle Width="80px" ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bfdqts" HeaderText="报废剩余天数" SortExpression="bfdqts">
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

                <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto">
                    <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="false"
                        DataKeyNames="rkmxid"
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
            <asp:Label ID="lblMindate" runat="server" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
