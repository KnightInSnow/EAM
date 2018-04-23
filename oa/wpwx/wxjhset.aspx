<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wxjhset.aspx.cs" Inherits="FCSystem.OA.wpwx.wxjhset" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>添加维修计划</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tr>
                <td style="height: 20px; background-color: #8CA1AE;">
                    <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" style="background-image: url(../../images/bg.gif);">添加维修计划</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%">
                    <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                        <br />
                        <table style="table-layout:fixed;">
                            <tr>
                                <td>维修单名称:</td>
                                <td width="70%">
                                    <asp:TextBox ID="txtbox_mc" runat="server" Width="90%"></asp:TextBox></td>
                                <td width="15%"></td>
                            </tr>
                            <tr style="height: 80px">
                                <td>维修计划说明:</td>
                                <td width="70%">
                                    <asp:TextBox ID="txtbox_sm" runat="server" Width="90%" Height="96%" TextMode="MultiLine"></asp:TextBox></td>
                                <td widht="15%"></td>
                            </tr>
                            <tr>
                                <td class="td_q_space"></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:Panel ID="Panel_zc" runat="server" ScrollBars="Auto">
            <table id="wxzcmx" cellspacing="1" cellpadding="1" width="100%" align="center" border="0">
                <tr>
                    <td colspan="2"><font color="red">请勾选需要维修的资产并添加相应维修说明</font></td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:Panel ID="Panel1_zcmx" runat="server" ScrollBars="Auto">
                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                OnRowDataBound="OnRow_Bound"
                                AutoGenerateColumns="False"
                                DataKeyNames="rkmxid"
                                EmptyDataText="没有查到符合条件的数据！"
                                Width="100%">
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
                                    <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zcmc" HeaderText="资产名称">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="维修说明" HeaderStyle-HorizontalAlign="Center">
                                        <ItemStyle Width="20%" />
                                        <ItemTemplate>
                                            <asp:TextBox ID="tbx_wxsm" runat="server" Width="90%"></asp:TextBox>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="zczt" HeaderText="资产状态">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ckmc" HeaderText="所属仓库">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="bm_mc" HeaderText="部门名称">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ck_tid" HeaderText="cktid"> 
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
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
                    <td style="height: 22px" colspan="3">
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
                <tr>
                    <td width="15%"></td>
                    <td width="70%">
                    <td align="center">
                        <asp:Button ID="btn_save" runat="server" Text="送审" CssClass="mybtn_d1" OnClick="btn_save_Click" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <asp:Label ID="lblwxjhtid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
