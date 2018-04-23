<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkcx_view_prn.aspx.cs" Inherits="FCSystem.OA.wprk.rkcx_view_prn" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>清单打印</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 24px">
            &nbsp;
            <input type="button" name="print" class="mybutton" value="打印" onclick="preview()" accesskey="p">
            <input type="button" id="CloseBtn" class="mybutton" value="退出" onclick="javascript: window.close()" accesskey="q" />
        </div>

        <!--startprint-->
        <table id="table1" cellspacing="0" cellpadding="0" width="100%" style="height: 100%" border="0">
            <tr>
                <td>
                    <h3>
                        <br />
                        入库单[<asp:Label ID="rkdh" runat="server" ForeColor="#FF0000"></asp:Label>]
                        <hr align="center" width="100%" size="1" noshade />
                    </h3>
                    <asp:Panel ID="panel1" runat="server">
                        <table id="search" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td colspan="6">
                                    <table style="background-color: #CCCCCC" cellspacing="1" cellpadding="1" width="100%" border="1">
                                        <tr style="height: 25px; background-color: #ffffff">
                                            <td class="td_no"><strong>仓库名称：</strong> </td>
                                            <td align="left">
                                                <asp:Label runat="server" ID="rkck" Font-Underline="true" /></td>
                                            <td align="left"><strong>当前状态：</strong></td>
                                            <td align="left" style="border-right: #CCCCCC thin solid">
                                                <asp:Label runat="server" ID="rkzt" Font-Underline="true" /></td>
                                        </tr>
                                        <tr style="height: 30px; background-color: #ffffff">
                                            <td class="td_no"><strong>备注信息：</strong></td>
                                            <td colspan="3" align="left">
                                                <asp:Label runat="server" ID="rkbz" Width="400" /></td>
                                        </tr>
                                        <tr style="height: 25px; background-color: #ffffff">
                                            <td class="td_no"><strong>申请人：</strong> </td>
                                            <td align="left">
                                                <asp:Label runat="server" ID="lrr" Font-Underline="true" /></td>
                                            <td align="left"><strong>申请时间：</strong> </td>
                                            <td align="left" style="border-right: #CCCCCC thin solid">
                                                <asp:Label runat="server" ID="lrsj" Font-Underline="true" /></td>
                                        </tr>
                                        <tr style="background-color: #ffffff" align="center">
                                            <td colspan="4">
                                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                    OnRowDataBound="OnRow_Bound"
                                                    AutoGenerateColumns="False"
                                                    
                                                   DataKeyNames=   "ssrkdid"
                                                    BorderStyle="None"
                                                    BorderWidth="1px"
                                                    BackColor="#999999"
                                                    EmptyDataText="暂时没有登记任何信息"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="序号">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ssrkdid" HeaderText="入库单id">
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            <FooterStyle CssClass="hidden" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="分类名称">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="申请数量">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblrksl" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="商品价格">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblrkdj" runat="server" Text='<%# Bind("rkdj")%>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                    <RowStyle CssClass="GridViewRowStyle" />
                                                    <FooterStyle CssClass="GridViewFooterStyle" />
                                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                        <tr style="background-color: #ffffff" align="center">
                                            <td colspan="4">
                                                <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle"
                                                    OnRowDataBound="OnRow_Bound"
                                                    AutoGenerateColumns="False"
                                                    
                                                   DataKeyNames=   "ssrkdid"
                                                    BorderStyle="None"
                                                    BorderWidth="0px"
                                                    BackColor="#999999"
                                                    EmptyDataText="暂时没有登记任何信息"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="序号">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ssrkdid" HeaderText="入库单id">
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            <FooterStyle CssClass="hidden" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spmc" HeaderText="商品名称">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="分类名称">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sqsl" HeaderText="申请数量">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField> 
                                                    </Columns>
                                                    <HeaderStyle BackColor="#CCCCCC" />
                                                    <RowStyle CssClass="GridViewRowStyle" />
                                                    <FooterStyle CssClass="GridViewFooterStyle" />
                                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                                </asp:GridView>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr style="height: 30px">
                                <td align="right" colspan="6">共计：<asp:Label runat="server" ID="jgzs" Font-Underline="True">&nbsp;&nbsp;&nbsp;&nbsp;0</asp:Label>
                                    &nbsp;&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td width="12%"><strong>经办人:</strong></td>
                                <td width="20%"></td>
                                <td width="12%"><strong>收料人确认:</strong></td>
                                <td width="20%"></td>
                                <td width="12%"><strong>审核人确认:</strong></td>
                                <td width="20%"></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblrkdid" runat="server" Visible="False"></asp:Label>
        <!--endprint-->

        <asp:Label ID="lblcklx" runat="server" Text="Label" Visible="False"></asp:Label>

    </form>
</body>
</html>

