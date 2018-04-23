<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="initialpwd.aspx.cs" Inherits="FCSystem.BAS.xtrz.initialpwd" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>初始化用户密码</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <!--页头部分--->
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">初始化用户密码</div>
        </div>
        <div class="Page-EmptyLine-Large"></div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="left">
                                <font color="red">请先勾选需要初始化密码的用户(注:密码初始化后均为1 )</font>
                            </td>
                            <!--开始初始化按钮--->
                            <td align="right">
                                <asp:Button ID="btnInitialpwd" runat="server" Text="开始初始化" CssClass="btn btn-primary active" OnClick="btnInitialpwd_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    AutoGenerateColumns="False"
                    DataKeyNames="yh_tid"
                    EmptyDataText="暂时没有物品信息"
                    OnRowDataBound="GridView1_RowDataBound">
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
                            <HeaderTemplate>
                                <input type="checkbox" id="chkall" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkevery" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_id" HeaderText="使用人代码">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bm_mc" HeaderText="所属部门">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </div>
            <div class="PageBody-Bottom-Pager"  style="text-align:right;">
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
