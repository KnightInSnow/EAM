<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rzcx.aspx.cs" Inherits="FCSystem.BAS.xtrz.rzcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>登录日志查询</title>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">登录日志查询</div>
        </div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:200px;">
                    <table style="table-layout:fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">操作部门：</td>
                            <td>
                                <asp:DropDownList ID="czbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="czbm_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td style="text-align:right;padding-right:10px;">操作人员</td>
                            <td>
                                <asp:DropDownList ID="czry" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td style="text-align:right;padding-right:10px;">模块名称：</td>
                            <td>
                                <asp:DropDownList ID="mkbm" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;padding-right:10px;">登录状态：</td>
                            <td>
                                <asp:DropDownList ID="dlzt" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="登陆系统" Value="登陆系统"></asp:ListItem>
                                    <asp:ListItem Text="注销系统" Value="注销系统"></asp:ListItem>
                                    <asp:ListItem Text="退出系统" Value="退出系统"></asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td style="text-align:right;padding-right:10px;"><ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtbegintime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtbegintime" ErrorMessage="*" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbegintime" ErrorMessage="请输入领用时间(自)">&nbsp;
                                </asp:RequiredFieldValidator>开始日期：
                            </td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>

                            <td style="text-align:right;padding-right:10px;"><ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtendtime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtendtime" ErrorMessage="*" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtendtime" ErrorMessage="请输入领用时间(至)">&nbsp;
                                </asp:RequiredFieldValidator>结束日期：
                            </td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:right;padding-right:10px;">IP地址：</td>
                            <td>
                                <asp:TextBox ID="ipdz" runat="server" CssClass="form-control" />
                            </td>
                            <td></td>
                            <td style="text-align:center;">
                                <asp:RadioButton ID="rbtnthisweek" 
                                    onclick="quickseldate('week');"
                                    runat="server"
                                    GroupName="quickdate"
                                    Text="本周"></asp:RadioButton>
                                <asp:RadioButton ID="rbtnthismonth"   
                                    onclick="quickseldate('month');"
                                    runat="server"
                                    GroupName="quickdate"
                                    Text="本月"></asp:RadioButton>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator8"
                                    runat="server"
                                    ControlToValidate="txtbegintime"
                                    ErrorMessage="请输入开始日期">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator9"
                                    runat="server"
                                    ControlToValidate="txtendtime"
                                    ErrorMessage="请输入结束日期">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td align="center">
                                <asp:ValidationSummary
                                    ID="ValidationSummary2"
                                    runat="server"
                                    EnableClientScript="true"
                                    ShowMessageBox="true"
                                    ShowSummary="false"></asp:ValidationSummary>
                            </td>
                        </tr>
                    </table>
                    <table style="table-layout:fixed;">
                        <td align="right">
                            <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="查询" AccessKey="f" CausesValidation="true" OnClick="Query_Click"></asp:Button>
                            <asp:Button CssClass="btn btn-primary active" ID="ClearBtn" runat="server" Text="清空" AccessKey="r" CausesValidation="true" OnClick="Clear_Click"></asp:Button>
                            <asp:Button ID="OutBtn" runat="server" CssClass="btn btn-primary active" Text="导出" /></td>

                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="dl_id"
                    EmptyDataText="没有查到符合条件的数据！">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="dl_rq" HeaderText="操作日期" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" HtmlEncode="False">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="操作人员">
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:MiniX('/oa/xxgl/minixx.aspx?id=<%# Eval("dl_id") %>&mc=<%# Eval("ui_desc") %>')"><font color="#3366FF">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                </font></a>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="dl_id" HeaderText="登录帐号">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dl_ip" HeaderText="IP地址">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dl_jqm" HeaderText="机器名">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dl_zt" HeaderText="登录状态">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="进入模块">
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("open_mk") %>'></asp:Label>-<asp:Label ID="Label5" runat="server" Text='<%# Bind("modu_mc") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
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
                        SubmitButtonClass=“AspNetPagerButton” SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
            </div>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
