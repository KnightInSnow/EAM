<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pkcl.aspx.cs" Inherits="FCSystem.OA.pd.pkcl" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
      <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <title>盘亏处理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
           <div style="margin-top:57px;color:#70708f;"> 盘亏处理</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <td style="text-align:right;padding-right:10px;">计划名称:</td>
                        <td>
                            <asp:TextBox ID="tbx_name" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button ID="btn_query" runat="server" Text="查询" CssClass="btn btn-primary active" OnClick="btn_query_Click1" />
                                <asp:Button ID="btn_Refresh" runat="server" Text="刷新" CssClass="btn btn-primary active" OnClick="btn_Refresh_Click" />
                                <asp:Button ID="btnClear" runat="server" AccessKey="f" CausesValidation="False" CssClass="btn btn-primary active" Text="清空" OnClick="btnClear_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="Page-EmptyLine-Normal"></div>
            <div class="PageBody-Middle-MinHeight">
                <tr align="left">
                    <td colspan="5" align="left"><font color="red">点击计划名称可查看盘亏资产清单</font></td>
                </tr>
                <tr>
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                        <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                            OnRowDataBound="GridView1_RowDataBound"
                            AutoGenerateColumns="False"
                            DataKeyNames="planid"
                            EmptyDataText="没有查到符合条件的数据！">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                    <HeaderTemplate>
                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                    </HeaderTemplate>
                                    <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkevery" runat="server" CssClass="mybox" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="pddh" HeaderText="盘点单号">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderStyle-ForeColor="Black" HeaderText="计划名称">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <a href="#" onclick="javascript:popPlan('pkList.aspx?id=<%#Eval("planid")%>')"><font color="#3366ff"><asp:Label ID="lbljhmc" runat="server" Text='<%#Bind("planname") %>'></asp:Label></font></a>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="navigate" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ui_desc" HeaderText="添加人员">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="zxr" HeaderText="执行人员">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="bm_mc" HeaderText="添加人员所属部门">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="tjsj" HeaderText="添加时间">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="progress" HeaderText="完成情况">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="pdsm" HeaderText="备注说明">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle CssClass="GridViewRowStyle" />
                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                            <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                        </asp:GridView>
                    </asp:Panel>
                </tr>
            </div>
            <div class="PageBody-Bottom-Pager" style="text-align:right;">
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
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
                    SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
                </webdiyer:AspNetPager>
            </div>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
