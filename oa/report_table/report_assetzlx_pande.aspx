<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_assetzlx_pande.aspx.cs" Inherits="FCSystem.OA.report_table.report_assetzlx_pande" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>打印资产总账（类型）报表</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!--startprint-->
        <table style="table-layout: fixed">
            <tr>
                <td align="center" width="100%">
                    <asp:Panel ID="panel1" runat="server" align="center">
                        <table id="table1" cellspacing="0" cellpadding="0" width="100%" style="height: 100%" border="0" align="center">
                            <tr>
                                <td>
                                    <h3 align="center">
                                        <br />
                                        资产总账（类型）
                                    </h3>
                                </td>
                            </tr>
                        </table>
                        <table id="Table3" cellspacing="0" cellpadding="0" width="100%" border="0" align="center">
                            <tr style="height: 30px">
                                <td align="right">查询日期：<asp:Label runat="server" ID="rq_start" Font-Underline="true" />至<asp:Label runat="server" ID="rq_end" Font-Underline="true" />&nbsp;&nbsp;打印人：<asp:Label runat="server" ID="dyr" Font-Underline="true" />&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                        <table cellspacing="0" width="100%" border="0" align="center">
                            <tr style="background-color: #ffffff" align="center">
                                <td>
                                    <br />
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
                                            <asp:BoundField DataField="fl_tid" HeaderText="类型代码">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fl_mc" HeaderText="资产类型">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="qcslz" HeaderText="数量">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="qcjez" HeaderText="金额">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zjsl" HeaderText="数量">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zjje" HeaderText="金额">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="jsslz" HeaderText="数量">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="jsjez" HeaderText="金额">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="qmslz" HeaderText="数量">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="qmjez" HeaderText="金额">
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
                        </table>
                        <!--endprint-->
                        <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
                        <asp:Label ID="zclx" runat="server" Text="" Visible="false"></asp:Label>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

