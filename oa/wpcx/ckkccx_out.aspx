<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ckkccx_out.aspx.cs" Inherits="FCSystem.OA.wpcx.ckkccx_out" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <title>仓库库存明细查询</title>
</head>
<body onload="self.status='提示：为节省服务器资源，系统己限制最大可导出记录数为<%=Session["dcsize"].ToString()%>条！请留意'">
    <form id="form1" runat="server">
        <table border="0" cellspacing="0" cellpadding="0" width="100%">
            <td width="100%" align="center">
                <asp:Panel ID="Panel2" runat="server">
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td width="50%"></td>
                            <td width="20%" align="center">
                                <asp:Label ID="label1" runat="server" Text="仓库库存明细报表" Font-Bold="true" Font-Size="Medium" /></td>
                            <td align="right" width="30%">
        <%--                        <asp:Button ID="btn" runat="server" Text="导出EXCEL" AccessKey="o" cssclass="mybutton" /><input type="button" name="BackBtn" class="mybtn_d1" value="关闭" onclick="javascript: window.close()" accesskey="q" />--%></td>
                        </tr>
                        <tr>
                            <td class="td_q_space"></td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                        AutoGenerateColumns="False" 
                                        DataKeyNames="ssckid" 
                                        EmptyDataText="没有查到符合条件的数据！"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ssckid" HeaderText="仓库编码">
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                                <FooterStyle CssClass="hidden" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="部门名称">
                                                <HeaderStyle ForeColor="Black" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ControlStyle CssClass="navigate" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="仓库名称">
                                                <HeaderStyle ForeColor="Black" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("ckmc") %>'></asp:Label>
                                                </ItemTemplate>
                                                <ControlStyle CssClass="navigate" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="wpbm" HeaderText="物品编码">
                                                <HeaderStyle Width="100px" ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpmc" HeaderText="名称">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fl_mc" HeaderText="分类">
                                                <HeaderStyle Width="100px" ForeColor="Black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="yn_gdzc" HeaderText="资产">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle Width="30px" ForeColor="black" />
                                            </asp:BoundField>
                                            <%--  <asp:ImageField DataImageUrlField="kcbs" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="旧品">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="30px" ForeColor="black" />
                                                        </asp:ImageField>--%>
                                            <asp:BoundField DataField="mc" HeaderText="品牌">
                                                <HeaderStyle ForeColor="black" Width="70px" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpxh" HeaderText="型号">
                                                <HeaderStyle ForeColor="black" Width="60px" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="kcsl" HeaderText="库存数量">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="right" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="kcje" HeaderText="库存金额">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="right" />
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
