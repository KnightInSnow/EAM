<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcstatechange.aspx.cs" Inherits="FCSystem.OA.wpcx.zcstatechange" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产状态变更</title>

    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <script src="../../Scripts/jquery-1.9.1.min.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">

    <script type="text/javascript">
        //获取控件
        var selects;
        var maxLength;
        //异步请求计数
        var requestIndex = 0;

        $(document).ready(function () {
            //获取参数设置当前默认状态值
            getParam();
        });
    </script>
</head>

<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="_Script" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

        <div class="PageHead">资产状态变更</div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">

                        <tr>
                            <td>仓库名称： 
                            </td>
                            <td>
                                <asp:DropDownList ID="ddl_ck" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td>开始日期：</td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td>结束日期：</td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" MaxLength="10"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>商品分类：</td>
                            <td>
                                <asp:DropDownList ID="ddl_fl" runat="server">
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
                                <asp:DropDownList ID="ddl_query" runat="server">
                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                    <asp:ListItem Value="1" Text="在库"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="使用中"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="已报废"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="归还到期"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="保修到期"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="维修中"></asp:ListItem>
                                    <asp:ListItem Value="7" Text="延保到期"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="盘亏出库"></asp:ListItem>
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
                                <asp:DropDownList ID="lyr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lyr_SelectedIndexChanged">
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
                                <asp:DropDownList ID="ddl_pp" runat="server">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed">
                        <tr>
                            <td colspan="3">
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" DisplayMode="SingleParagraph" />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="输入开始时间有误"
                                    ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="输入结束时间有误"
                                    ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                            </td>
                            <td colspan="3" align="right">
                                <asp:Button ID="QueryBtn" runat="server" Text="查询" CssClass="mybutton" AccessKey="f" CausesValidation="true" Height="21px" OnClick="Query_Click" />
                                <asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="mybutton" Height="21px" OnClick="Clear_Click" Text="清空" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="mybutton" Height="21px" OnClick="Query_Click" Text="刷新" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <table style="table-layout: fixed;">
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                    OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="false"
                                    DataKeyNames="rkmxid"
                                    EmptyDataText="没有查到符合条件的数据！">
                                    <Columns>
                                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="资产编码">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <%--              <asp:LinkButton ID="lbtn_zcbm" runat="server" Text='<%#Eval("zcbmfull") %>' CommandArgument='<%# Eval("rkmxid")%>' OnClick="lbtn_zcbm_Click"></asp:LinkButton>--%>
                                                <a href="#" onclick="javascript:popMiniMod('/oa/wprk/rkshqr_mx_mod.aspx?id=<%# Eval("rkmxid") %>');">
                                                    <font color="#3366ff"><asp:Label ID="lblzcbm" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label></font>
                                                </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
                                        <asp:TemplateField HeaderText="状态变更">
                                            <ItemStyle Width="120px" HorizontalAlign="Center"></ItemStyle>
                                            <ItemTemplate>
                                                <select id="select_zt" style="width: 100px" onchange="statechange(this);">
                                                    <option value="0">正常</option>
                                                    <option value="1">故障</option>
                                                    <option value="2">待报废</option>
                                                </select>
                                                <%--     <asp:DropDownList ID="ddl_zt" runat="server" Width="100px" OnSelectedIndexChanged="ddl_zt_OnSelectedIndexChanged" AutoPostBack="True">
                                                            <asp:ListItem Value="0" Text="正常"></asp:ListItem> 
                                                            <asp:ListItem Value="1" Text="故障"></asp:ListItem> 
                                                            <asp:ListItem Value="2" Text="待报废"></asp:ListItem> 
                                                        </asp:DropDownList>--%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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
            </div>
        </div>

        <div class="PageFoot">
            <asp:Label ID="lblMindate" runat="server" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
