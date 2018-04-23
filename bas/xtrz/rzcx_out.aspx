<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rzcx_out.aspx.cs"  Inherits="FCSystem.BAS.xtrz.rzcx_out" EnableEventValidation = "false"%>

<!DOCTYPE HTML>

<html>
<head>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<title>登录日志查询</title>
</head>
<body onload="self.status='提示：为节省服务器资源，系统已限制最大可导出记录数为<%=Session["dcsize"].ToString()%>条！请留意'">
<form id="form1" runat="server">
<table border ="0" cellspacing ="0" cellpadding ="0" width ="100%">
<tr>
<td align="right" style="width:60%" class="td_oa_al"><asp:label ID="label1" runat="server" Text="登录日志导出报表" Font-Bold="true" Font-Size="Medium" /></td>
<td align="right" style="width:40%" class="td_oa_al"><input type="button" name="BackBtn" value="关闭" onclick="javascript:window.close()" accesskey ="q" class="mybutton" /></td>
</tr>
    <tr>
        <td class="td_q_space"></td>
    </tr>
<tr><td colspan="2">
<asp:Panel ID="Panel1" runat="server"  ScrollBars="Auto" Width="100%">
  <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            cellspacing="1" 
            DataKeyNames="dl_rq" 
            BorderStyle="None" 
            BorderWidth="1px"
            AllowPaging="false"
            EmptyDataText = "没有查到符合条件的数据！"
            width="100%"
            BorderColor="White">
    <Columns>                        
                        <asp:BoundField DataField="dl_rq" HeaderText="操作日期" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" HtmlEncode="False">
                            <HeaderStyle Width="140px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="操作人员">
                            <HeaderStyle Width="100px" />
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("dl_id") %>'></asp:Label>-<asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="dl_ip" HeaderText="IP地址">
                        <HeaderStyle Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dl_jqm" HeaderText="机器名">
                        </asp:BoundField>
                        <asp:BoundField DataField="dl_zt" HeaderText="登录状态">
                        <HeaderStyle Width="60px" />
                        <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="进入模块">
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("open_mk") %>'></asp:Label>-<asp:Label ID="Label5" runat="server" Text='<%# Bind("modu_mc") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
    </asp:GridView>
</asp:Panel>
</td></tr>
</table> 
</form>
</body>
</html>
