<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_zcmx_pande.aspx.cs" Inherits="FCSystem.OA.report_table.report_zcmx_pande" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>打印资产明细账报表</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!--startprint-->
        <table id="table1" cellspacing="0" cellpadding="0" width="100%" style="height: 100%" border="0">
            <tr>
                <td>
                    <asp:Panel ID="panel1" runat="server" align="center">
                        <table id="table4" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td>
                                    <h3 align="center">
                                        <br />
                                        <br />
                                        资产明细账表</h3>
                                </td>
                            </tr>
                        </table>
                        <table id="Table3" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr style="height: 30px">
                                <td align="right">查询日期：<asp:Label runat="server" ID="rq_start" Font-Underline="true" />至<asp:Label runat="server" ID="rq_end" Font-Underline="true" />&nbsp;&nbsp;打印人：<asp:Label runat="server" ID="dyr" Font-Underline="true" />&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                        <table id="search" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td>                                   
                                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                        OnRowDataBound="OnRow_Bound"
                                        AutoGenerateColumns="False" 
                                        AllowPaging="false"
                                        DataKeyNames="fl_tid" 
                                        EmptyDataText="暂时没有登记任何物品入库信息"
                                        ShowFooter="True">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="fl_tid" HeaderText="资产类型代码">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fl_mc" HeaderText="资产类型名称">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="spsj" HeaderText="日期">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="rkdh" HeaderText="入库单号">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zcxx" HeaderText="固定资产">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zjsl" HeaderText="数量">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zjje" HeaderText="金额">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="jssl" HeaderText="数量">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="jsje" HeaderText="金额">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="jcsl" HeaderText="数量">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="jcje" HeaderText="金额">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                        </Columns>
                                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                                        <RowStyle CssClass="GridViewRowStyle" />
                                        <FooterStyle CssClass="GridViewFooterStyle" />
                                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                    </asp:GridView>
                                    <br />
                                </td>
                            </tr>                           
                            <!--endprint-->
                        </table>
                        <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="rkdh" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="zcbmfull" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="zclx" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="lxid" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="wpmc" runat="server" Text="" Visible="false"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
