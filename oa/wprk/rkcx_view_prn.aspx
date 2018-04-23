<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkcx_view_prn.aspx.cs" Inherits="FCSystem.OA.wprk.rkcx_view_prn" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>�嵥��ӡ</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 24px">
            &nbsp;
            <input type="button" name="print" class="mybutton" value="��ӡ" onclick="preview()" accesskey="p">
            <input type="button" id="CloseBtn" class="mybutton" value="�˳�" onclick="javascript: window.close()" accesskey="q" />
        </div>

        <!--startprint-->
        <table id="table1" cellspacing="0" cellpadding="0" width="100%" style="height: 100%" border="0">
            <tr>
                <td>
                    <h3>
                        <br />
                        ��ⵥ[<asp:Label ID="rkdh" runat="server" ForeColor="#FF0000"></asp:Label>]
                        <hr align="center" width="100%" size="1" noshade />
                    </h3>
                    <asp:Panel ID="panel1" runat="server">
                        <table id="search" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td colspan="6">
                                    <table style="background-color: #CCCCCC" cellspacing="1" cellpadding="1" width="100%" border="1">
                                        <tr style="height: 25px; background-color: #ffffff">
                                            <td class="td_no"><strong>�ֿ����ƣ�</strong> </td>
                                            <td align="left">
                                                <asp:Label runat="server" ID="rkck" Font-Underline="true" /></td>
                                            <td align="left"><strong>��ǰ״̬��</strong></td>
                                            <td align="left" style="border-right: #CCCCCC thin solid">
                                                <asp:Label runat="server" ID="rkzt" Font-Underline="true" /></td>
                                        </tr>
                                        <tr style="height: 30px; background-color: #ffffff">
                                            <td class="td_no"><strong>��ע��Ϣ��</strong></td>
                                            <td colspan="3" align="left">
                                                <asp:Label runat="server" ID="rkbz" Width="400" /></td>
                                        </tr>
                                        <tr style="height: 25px; background-color: #ffffff">
                                            <td class="td_no"><strong>�����ˣ�</strong> </td>
                                            <td align="left">
                                                <asp:Label runat="server" ID="lrr" Font-Underline="true" /></td>
                                            <td align="left"><strong>����ʱ�䣺</strong> </td>
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
                                                    EmptyDataText="��ʱû�еǼ��κ���Ϣ"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ssrkdid" HeaderText="��ⵥid">
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            <FooterStyle CssClass="hidden" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="��������">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="��������">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="lblrksl" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="��Ʒ�۸�">
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
                                                    EmptyDataText="��ʱû�еǼ��κ���Ϣ"
                                                    Width="100%">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ssrkdid" HeaderText="��ⵥid">
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            <FooterStyle CssClass="hidden" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spmc" HeaderText="��Ʒ����">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="��������">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sqsl" HeaderText="��������">
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
                                <td align="right" colspan="6">���ƣ�<asp:Label runat="server" ID="jgzs" Font-Underline="True">&nbsp;&nbsp;&nbsp;&nbsp;0</asp:Label>
                                    &nbsp;&nbsp;</td>
                            </tr>
                            <tr style="height: 30px">
                                <td width="12%"><strong>������:</strong></td>
                                <td width="20%"></td>
                                <td width="12%"><strong>������ȷ��:</strong></td>
                                <td width="20%"></td>
                                <td width="12%"><strong>�����ȷ��:</strong></td>
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

