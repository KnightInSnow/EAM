<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ffmxcx_out.aspx.cs" Inherits="FCSystem.OA.wpcx.ffmxcx_out" %>

<!DOCTYPE HTML>

<html>
<head>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <title>仓库发放明细查询</title>
</head>
<body onload="self.status='提示：为节省服务器资源，系统己限制最大可导出记录数为<%=Session["dcsize"].ToString()%>条！请留意'">
    <form id="form1" runat="server">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <td width="100%" align="center">
                <asp:Panel id="Panel2" runat="server" scrollbar="Auto">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="30%"></td>
                            <td width="25%">
                                <asp:Label ID="label1" runat="server" Text="仓库发放明细报表" Font-Bold="true" Font-Size="Medium" /></td>
                            <td align="right" width="45%">
                                <asp:Button ID="btn" OnClick="Out_Click" runat="server" Text="导出EXCEL" AccessKey="o" cssclass="mybutton" /><input type="button" name="BackBtn" class="mybtn_d1" value="关闭" onclick="javascript: window.close()" accesskey="q" /></td>
                        </tr>
                           <tr>
                                <td class="td_q_space"></td>
                           </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                    <asp:GridView ID="GridView1" runat="server"
                                        AutoGenerateColumns="False"
                                        CellSpacing="0"
                                        DataKeyNames="ffckid"
                                        BorderStyle="none"
                                        BorderWidth="1px"
                                        AllowPaging="false"
                                        EmptyDataText="没有查到符合条件的数据！"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="物品编码">
                                                <HeaderStyle ForeColor="Black" Width="80" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ControlStyle CssClass="navigate" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="wpmc" HeaderText="物品名称">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fl_mc" HeaderText="分类">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="yn_gdzc" HeaderText="资产">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle Width="30px" ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="mc" HeaderText="品牌">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpxh" HeaderText="型号">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ffwpsl" HeaderText="发放数量">
                                                <HeaderStyle Width="70px" ForeColor="black" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpdj" HeaderText="单价">
                                                <HeaderStyle Width="70px" ForeColor="black" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ffje" HeaderText="发放金额">
                                                <HeaderStyle Width="70px" ForeColor="black" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ffsj" HeaderText="发放时间" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                <HeaderStyle Width="80px" ForeColor="Black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="bm_mc" HeaderText="申请部门">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="申请人">
                                                <HeaderStyle ForeColor="Black" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labellyrname" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ControlStyle CssClass="navigate" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ckmc" HeaderText="发放仓库">
                                                <HeaderStyle ForeColor="black" />
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
                    </table>
                </asp:Panel>

            </td>
        </table>
    </form>
</body>
</html>
