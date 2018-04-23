<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ckqxgl.aspx.cs" Inherits="FCSystem.oa.ckgl.ckqxgl" %>


<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <link href="../../css/Main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>仓库权限管理</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">仓库权限管理</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">仓库:</td>
                            <td>
                                <asp:DropDownList ID="ck" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Ck_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">部门：</td>
                            <td>
                                <asp:DropDownList ID="bm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BM_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Value="" Text=""></asp:ListItem>
                                </asp:DropDownList></td>
                            <td style="text-align:right;padding-right:10px;">人员:</td>
                            <td>
                                <asp:DropDownList ID="ddl_cksyr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="Cksyr_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button ID="UpBtn" runat="server" CssClass="btn btn-primary active" OnClick="UpBtn_Click" Text="更新权限" Visible="false" />
                                <asp:Button ID="AddBtn" runat="server" CssClass="btn btn-primary active" OnClick="AddBtn_Click" Text="添加权限" Visible="false" />
                                <asp:Button ID="DelBtn" runat="server" CausesValidation="False" CssClass="btn btn-primary active" OnClick="DelBtn_Click" Text="删除权限" />
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
                            <asp:CheckBoxList ID="CKQXList" runat="server" RepeatDirection="Horizontal" Font-Size="10pt" align="center" CellPadding="6" CellSpacing="1" RepeatColumns="9">
                                <asp:ListItem Text="入库查询" Value="p_rk_cx" />
                                <asp:ListItem Text="入库登记" Value="p_rk_dj" />
                                <asp:ListItem Text="入库确认" Value="p_rk_qr" />
                                <asp:ListItem Text="入库删除" Value="p_rk_sc" />
                                <%-- <asp:listitem text="领用查询" Value ="p_ly_cx"/> --%>
                                <asp:ListItem Text="领用申请" Value="p_ly_sq" />
                                <asp:ListItem Text="领用确认" Value="p_ly_qr" />
                                <%-- <asp:listitem text="领用删除" Value ="p_ly_sc" Enabled ="false"/> --%>
                                <%-- <asp:listitem text="调拨查询" Value ="p_db_cx" Enabled ="false"/>--%>
                                <asp:ListItem Text="调拨申请" Value="p_db_zx" />
                                <asp:ListItem Text="调拨确认" Value="p_db_qr" />
                                <%--   <asp:listitem text="调拨删除" Value ="p_db_sc" Enabled ="false"/>--%>
                                <%--   <asp:listitem text="报废查询" Value ="p_bf_cx" Enabled ="false"/> --%>
                                <asp:ListItem Text="报废申请" Value="p_bf_sq" />
                                <asp:ListItem Text="报废确认" Value="p_bf_qr" />
                                <%-- <asp:listitem text="报废删除" Value ="p_bf_sc" Enabled ="false"/> --%>
                                <%-- <asp:listitem text="归还查询" Value ="p_gh_cx" Enabled ="false"/> --%>
                                <asp:ListItem Text="归还申请" Value="p_gh_sq" />
                                <asp:ListItem Text="归还确认" Value="p_gh_qr" />
                                <%--     <asp:listitem text="归还删除" Value ="p_gh_sc" Enabled ="false"/> --%>
                                <asp:ListItem Text="盘点制定" Value="p_pd_zd" />
                                <asp:ListItem Text="盘点执行" Value="p_pd_zx" />
                                <asp:ListItem Text="维修确认" Value="p_wx_qr" Enabled="false" />
                                <asp:ListItem Text="维修删除" Value="p_wx_sc" Enabled="false" />
                                <asp:ListItem Text="移库权限" Value="p_yk_zx" Enabled="false" />
                                <asp:ListItem Text="拆分合并" Value="p_ch_zx" Enabled="false" />
                                <asp:ListItem Text="发放确认" Value="providePrivilege" Enabled="False" />
                            </asp:CheckBoxList></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                OnRowDataBound="OnRow_Bound"
                                AutoGenerateColumns="False"
                                DataKeyNames="cksyrtid"
                                EmptyDataText="暂时没有仓库使用人信息">
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
                                            <asp:CheckBox ID="del" runat="server" CssClass="mybox" OnCheckedChanged="del_CheckedChanged" AutoPostBack="true" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="cksyrtid" HeaderText="编号">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="yhtid" HeaderText="用户tid">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_zydm" HeaderText="职员代码">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_desc" HeaderText="职员名称">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <%--<asp:BoundField DataField="ui_id" HeaderText="职员编码">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>--%>
                                    <asp:BoundField DataField="bm_mc" HeaderText="所属部门">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_rk_cx" HeaderText="入库查询">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_rk_dj" HeaderText="入库登记">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_rk_qr" HeaderText="入库确认">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_rk_sc" HeaderText="入库删除">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_ly_sq" HeaderText="领用申请">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_ly_qr" HeaderText="领用确认">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ProvidePrivilege" HeaderText="发放确认">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <%--  <asp:BoundField DataField="p_ly_sc" HeaderText="领用删除">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>--%>
                                    <asp:BoundField DataField="p_wx_qr" HeaderText="维修确认" Visible="False">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_wx_sc" HeaderText="维修删除" Visible="False">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_db_zx" HeaderText="调拨申请">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_db_qr" HeaderText="调拨确认">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_bf_sq" HeaderText="报废申请">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_bf_qr" HeaderText="报废确认">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <%-- <asp:BoundField DataField="p_bf_sc" HeaderText="报废删除">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>--%>

                                    <asp:BoundField DataField="p_gh_sq" HeaderText="归还申请">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_gh_qr" HeaderText="归还确认">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <%--<asp:BoundField DataField="p_gh_sc" HeaderText="归还删除">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>--%>
                                    <asp:BoundField DataField="p_pd_zd" HeaderText="盘点制定">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_pd_zx" HeaderText="盘点执行">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_yk_zx" HeaderText="移库权限" Visible="False">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="p_ch_zx" HeaderText="拆分合并" Visible="False">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                    <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>

                                </Columns>
                                <RowStyle CssClass="GridViewRowStyle" />
                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                            </asp:GridView>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="PageBody-Bottom-Pager" style="text-align:right;">
                <tr>
                    <td style="height: 22px">
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
                            SubmitButtonClass="“AspNetPagerButton”"
                            SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
                        </webdiyer:AspNetPager>
                    </td>
                </tr>
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
