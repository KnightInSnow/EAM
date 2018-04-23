<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wplycx_out.aspx.cs" EnableEventValidation="false" Inherits="FCSystem.OA.wpcx.wplycx_out" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/ms_excel; charset=gb2312" />
    <title>��Ʒ���ò�ѯ</title>
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
                            <td align="center" style="background-image: url(../../images/bg.gif);">��Ʒ���ò�ѯ</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%">
                    <asp:Panel ID="Panel2" runat="server">
                        <table style="table-layout:fixed;">
                            <tr>
                                <td class="td_oa" style="height: 28px">������Ʒ��ϸ
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                        <asp:GridView ID="GridView1" runat="server" 
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="lymx_tid"
                                            
                                            EmptyDataText="û�в鵽�������������ݣ�"
                                            >
                                            <Columns>
                                                <asp:TemplateField HeaderText="���">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="ckmc" HeaderText="�ֿ�����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sqrmc" HeaderText="������">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="bmmc" HeaderText="��������">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lydh" HeaderText="���õ���">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lysm" HeaderText="��ע">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sqsj" HeaderText="����ʱ��">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ffwpsl" HeaderText="��������">
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
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
