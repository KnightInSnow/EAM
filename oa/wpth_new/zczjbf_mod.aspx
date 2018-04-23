<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zczjbf_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.zczjbf_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ϵǼ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tr>
                <td class="td_oa" style="width: 60%; height: 25px">
                    <input type="button" name="BackBtn" value="�ر�" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /></td>
                <td class="td_oa" style="width: 20%">
                    <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:Label ID="lblprn" runat="server" Text="��ӡ���ϵ�" Font-Underline="True" Font-Names="����" Font-Size="X-Small" Visible="false"></asp:Label></td>
                <td class="td_oa"></td>
            </tr>

            <tr>
                <td colspan="3" valign="top">
                    <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                        <table style="table-layout:fixed;">
                            <tr>
                                <td>
                                    <asp:Label ID="lblBfdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>���ϱ��⣺</td>
                                <td>
                                    <asp:TextBox ID="tbx_bfbt" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>�ջزֿ⣺</td>
                                <td>
                                    <asp:TextBox ID="tbx_shck" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>�ջز��ţ�</td>
                                <td>
                                    <asp:TextBox ID="tbx_shbm" Width="500px" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>����˵����</td>
                                <td>
                                    <asp:TextBox ID="tbx_bfsm" runat="server" Width="500px" Rows="3" TextMode="multiLine" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>

                        <table style="table-layout:fixed;">
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                        OnRowDataBound="OnRow_Bound"
                                        AutoGenerateColumns="False"
                                        DataKeyNames="bfid"
                                        EmptyDataText="��ʱû�еǼ��κ���Ϣ"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <HeaderStyle Width="30px" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="bfid" HeaderText="����">
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                                <FooterStyle CssClass="hidden" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                                <FooterStyle CssClass="hidden" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="gysmc" HeaderText="��Ʒ��Ӧ��">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:TemplateField HeaderText="��Ʒ����">
                                                <ItemStyle HorizontalAlign="center" />
                                                <HeaderStyle ForeColor="Black" />
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("wpdj") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="GridViewRowStyle" />
                                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <!--����label-->
        <asp:Label ID="lblBfzt" runat="server" Visible="False" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="lblBfid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblYngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSqrytid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblShcktid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
