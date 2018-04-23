<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="bmwh.aspx.cs" Inherits="FCSystem.BAS.bmgl.bmwh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>部门维护</title>

</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PageHead">
        <div style="margin-top:57px;color:#70708f;">部门维护</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">选择机构：</td>
                            <td>
                                <asp:DropDownList ID="bmsjbm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="BmSelectChanged" Width="100%" CssClass="form-control"></asp:DropDownList>
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
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="StopBtn" runat="server" Text="禁用" OnClick="Stop_Click" OnClientClick="return confirm('确认要执行禁用吗？')" AccessKey="i" />
                                <asp:Button CssClass="btn btn-primary active" ID="PassBtn" runat="server" Text="启用" OnClick="Pass_Click" OnClientClick="return confirm('确认要执行启用吗？')" AccessKey="u" />
                                <input type="button" name="AddBtn" value="增加" class="btn btn-primary active" onclick="javascript: popAdd('bmwh_view.aspx');" accesskey="a" />
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="刷新" OnClick="Refresh" CausesValidation="False" AccessKey="e" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight"> 
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False" 
                    DataKeyNames="bm_tid" 
                    EmptyDataText="没有查到符合条件的数据！">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>

                        <asp:TemplateField>
                            <HeaderStyle Width="30px"></HeaderStyle>
                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                            <HeaderTemplate>
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="bm_code" HeaderText="机构编码">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                        </asp:BoundField>

                        <asp:BoundField DataField="bm_status" HeaderText="状态">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="机构名称">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:popMod('/bas/bmgl/bmwh_view.aspx?id=<%# Eval("bm_id") %>&bm_tid=<%# Eval("bm_tid") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label></font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="机构代码" DataField="bm_code">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ControlStyle CssClass="navigate" />
                        </asp:BoundField>

                        <asp:BoundField DataField="sjbmex_mc" HeaderText="上级部门">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="bm_dh" HeaderText="电话号码">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="bm_cz" HeaderText="传真号码">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:ImageField DataImageUrlField="ynffbm" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="物品发放部门">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:ImageField>
                        <%--   <asp:ImageField DataImageUrlField="ynslbm" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="需求受理部门">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle Width="100px" ForeColor="black" />
                                                    </asp:ImageField>--%>
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
                    SubmitButtonClass=“AspNetPagerButton”
                    SubmitButtonText="Go">
                </webdiyer:AspNetPager>
            </div>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>
</html>
