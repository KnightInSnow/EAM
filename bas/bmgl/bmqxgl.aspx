<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bmqxgl.aspx.cs" Inherits="FCSystem.bas.bmgl.bmqxgl" %>


<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
     <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>部门查看权限管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">部门查看权限管理</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">人员部门：</td>
                            <td>
                                <asp:DropDownList ID="rybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BM_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Value="" Text=""></asp:ListItem>
                                </asp:DropDownList></td>

                            <td style="text-align:right;padding-right:10px;">人员:</td>
                            <td>
                                <asp:DropDownList ID="ddl_cksyr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Cksyr_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">查看部门:</td>
                            <td>
                                <asp:DropDownList ID="ckbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Ckbm_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <td align="right">
                            <%--  <asp:Button ID="UpBtn" runat="server" CssClass="mybutton" OnClick="UpBtn_Click" Text="更新权限"  Visible="false"/>--%>
                            <asp:Button ID="AddBtn" runat="server" CssClass="btn btn-primary active" OnClick="AddBtn_Click" Text="添加权限" Visible="false" />
                            <asp:Button ID="DelBtn" runat="server" CausesValidation="False" CssClass="btn btn-primary active" OnClick="DelBtn_Click" Text="删除权限" />
                        </td>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="bmqxtid"
                    EmptyDataText="暂时没有查看部门信息">
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
                        <asp:BoundField DataField="bmqxtid" HeaderText="编号">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <%--  <asp:BoundField DataField="yhtid" HeaderText="用户tid">
                                                                <HeaderStyle CssClass="hidden" />
                                                                <ItemStyle CssClass="hidden" />
                                                                <FooterStyle CssClass="hidden" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>--%>
                        <asp:BoundField DataField="rybm" HeaderText="人员部门">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="人员名称">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="ckbm" HeaderText="可查看部门">
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
            <!--隐藏label-->
            <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="ID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblCktid" runat="server" Visible="False"></asp:Label>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
