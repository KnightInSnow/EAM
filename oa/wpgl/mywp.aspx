<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mywp.aspx.cs" Inherits="FCSystem.OA.wpgl.mywp" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <title>我的物品</title>
</head>
<body class="main">
    <form id="myzc" runat="server">
        <table style="width: 100%; height: 100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td style="height: 20px; background-color: #8CA1AE;">
                    <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" style="background-image: url(../../images/bg.gif);">我的物品</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td align="center">
                    <asp:Panel ID="panel2" runat="server">
                        <table cellspacing="1" cellpadding="1" border="0" width="98%" align="center">
                            <tr>
                                <td align="left" style="width: 60%">&nbsp;&nbsp;<asp:Label ID="lblzcall" runat="server" ForeColor="Red" Font-Size="Small" Font-Bold="True">您领用的物品信息：</asp:Label>
                                </td>
                                <td style="background-color: #4579B5" align="center">&nbsp;<asp:LinkButton ID="lbtn_ly" runat="server" Font-Bold="True" Font-Names="仿宋" Font-Size="Small" Font-Underline="True" ForeColor="White">领用物品</asp:LinkButton>
                                    &nbsp;<asp:LinkButton ID="lbtn_gh" runat="server" Visible="false" Font-Bold="True" Font-Names="仿宋" Font-Size="Small" Font-Underline="True" ForeColor="White">归还物品</asp:LinkButton>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:Panel ID="panel1" runat="server" ScrollBars="auto">
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="GridView1_RowDataBound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="lymx_tid"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="暂时没有物品信息"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="lymx_tid" HeaderText="领用明细单号">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle CssClass="hidden" />
                                                    <ItemStyle CssClass="hidden" />
                                                    <FooterStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpbm" HeaderText="物品编码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="物品名称">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpxh" HeaderText="物品型号">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sqsl" HeaderText="领用数量">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lysj" HeaderText="领用时间">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
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
                                                <asp:BoundField DataField="bz" HeaderText="备注说明">
                                                    <HeaderStyle ForeColor="black" />
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
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
