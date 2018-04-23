<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpmxcx_out.aspx.cs" Inherits="FCSystem.OA.wpcx.wpmxcx_out" %>

<!DOCTYPE HTML>

<html>
<head>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<title>物品明细查询</title>
</head>
<body onload="self.status='提示：为节省服务器资源，系统己限制最大可导出记录数为<%=Session["dcsize"].ToString()%>条！请留意'">
<form id="form1" runat="server">
<table border ="0" cellspacing ="0" cellpadding ="0" width ="100%">
<tr>
<td align="right" style="width:60%;background-color:#ecece8"><asp:label ID="label1" runat="server" Text="物品明细报表" Font-Bold="true" Font-Size="Medium" /></td>
<td align="right" style="width:40%;background-color:#ecece8"><asp:Button ID="btn" OnClick="Out_Click" runat="server" Text="导出EXCEL" AccessKey="o" cssclass="mybutton" />&nbsp;&nbsp;<input type="button" name="BackBtn" class="mybutton" value="关闭" onclick="javascript:window.close()" accesskey ="q" /></td>
</tr>
<tr><td colspan="2">
<asp:Panel ID="Panel1" runat="server"  ScrollBars="Auto" Width="750px" Height="500px">
  <asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" 
            CellSpacing="1" 
            DataKeyNames="Kcmxid" 
            BorderStyle="None" 
            BorderWidth="1px"
            AllowPaging="false"
            EmptyDataText = "没有查到符合条件的数据！"
            width="1000px"
            BorderColor="White">
            <Columns>                        
                        <asp:BoundField DataField="jzrq" HeaderText="记帐日期"  DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                            <HeaderStyle Width="80px" ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpbm" HeaderText="物品编码">
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="物品名称">
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ywlx" HeaderText="业务类型">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="jzsl" HeaderText="记帐数量">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="jykcsl" HeaderText="结余库存">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bm_mc" HeaderText="领用部门">
                            <HeaderStyle  ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="领用人">
                            <HeaderStyle  ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mc" HeaderText="品牌">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="型号">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckmc" HeaderText="仓库">
                            <HeaderStyle  ForeColor="black" />
                        </asp:BoundField>
                        </Columns>
    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
    </asp:GridView>
</asp:Panel>
</td></tr>
</table> 
</form>
</body>
</html>