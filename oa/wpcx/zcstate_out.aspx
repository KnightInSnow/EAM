<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcstate_out.aspx.cs" EnableEventValidation="false" Inherits="FCSystem.OA.wpcx.zcstate_out" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产状况查询</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tr>
                <td style="height: 20px; background-color: #8CA1AE;">
                    <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" style="background-image: url(../../images/bg.gif);">资产状况查询</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%">
                    <asp:Panel ID="Panel2" runat="server">
                        <table style="table-layout:fixed;">
                            <tr>
                                <td class="td_oa" style="height: 28px">资产状况明细
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                        <asp:GridView ID="GridView1" runat="server"
                                            AutoGenerateColumns="false"
                                            CellSpacing="1"
                                            DataKeyNames="rkmxid"
                                            
                                            EmptyDataText="没有查到符合条件的数据！"
                                            >
                                            <Columns>
                                                <asp:TemplateField HeaderText="序号">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="spwym" HeaderText="商品唯一编码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fl_mc" HeaderText="商品分类">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpxh" HeaderText="型号">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wppp" HeaderText="品牌">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="gzrq" HeaderText="购置日期">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="syr" HeaderText="使用人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sybm" HeaderText="使用部门">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="spr" HeaderText="审批人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lysj" HeaderText="审批时间">
                                                    <HeaderStyle Width="80px" ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="dqts" HeaderText="到期天数">
                                                    <HeaderStyle Width="80px" ForeColor="Black" />
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
                                <td>
                                    <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto">
                                        <asp:GridView ID="GridView2" runat="server"                                        
                                            AutoGenerateColumns="false"
                                            CellSpacing="1"
                                            DataKeyNames="rkmxid"
                                            
                                            EmptyDataText="没有查到符合条件的数据！"
                                             >
                                            <Columns>
                                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>
                                               
                                                <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="cfzt" HeaderText="拆分或合并">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />                                              
                                                </asp:BoundField>
                                                <asp:BoundField DataField="spwym" HeaderText="商品唯一码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fl_mc" HeaderText="商品分类">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wppp" HeaderText="商品品牌">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                 <asp:BoundField DataField="zczt" HeaderText="资产状态">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>    
                                                 <asp:BoundField DataField="syr" HeaderText="使用人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sybm" HeaderText="使用部门">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ljzcbm" HeaderText="零件编码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ljglzcbm" HeaderText="零件关联资产">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ljglzcsyr" HeaderText="关联资产使用人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ljglzcsybm" HeaderText="关联资产使用部门">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
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
            </tr>
        </table>
    </form>
</body>
</html>
