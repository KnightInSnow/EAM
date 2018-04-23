<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zczjgh_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.zczjgh_mod" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�黹�Ǽ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tr>
                <td class="td_oa" style="width: 60%; height: 25px">�黹�Ǽ�</td>
                <td class="td_oa" style="width: 20%">&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:Label ID="lblprn" runat="server" Text="��ӡ�黹��" Font-Underline="True" Font-Names="����" Font-Size="X-Small" Visible="false"></asp:Label></td>
                <td class="td_oa" style="width: 20%; height: 25px"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
            </tr>
            <tr>
                <td width="100%" align="center" colspan="3">
                    <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                        <br />
                        <table style="table-layout: fixed;">
                            <tr>
                                <td>�黹���⣺</td>
                                <td>
                                    <asp:TextBox ID="ghbt" runat="server" Width="450" Enabled="False"></asp:TextBox>
                                    <asp:RequiredFieldValidator
                                        ID="RequiredFieldValidator1"
                                        runat="server"
                                        ControlToValidate="ghbt"
                                        ErrorMessage="������黹����">&nbsp;
                                    </asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>���벿�ţ�</td>
                                <td>
                                    <asp:TextBox ID="tbx_sqbm" Width="450" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>������Ա��</td>
                                <td>
                                    <asp:TextBox ID="tbx_sqry" Width="450" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>�ջز��ţ�</td>
                                <td>
                                    <asp:TextBox ID="tbx_shbm" Width="450" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td>�ջزֿ⣺</td>
                                <td>
                                    <asp:TextBox ID="tbx_shck" Width="450" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>�黹˵����</td>
                                <td>
                                    <asp:TextBox ID="ghsm" runat="server" Width="450" Rows="3" TextMode="multiLine" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>

                        <table>
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="lymx_tid"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="��ʱû����Ʒ��Ϣ"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="�ʲ�����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="�黹����">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("ghdh") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ControlStyle CssClass="navigate" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="lymx_tid" HeaderText="������ϸ����">
                                                    <HeaderStyle CssClass="hidden" />
                                                    <ItemStyle CssClass="hidden" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <FooterStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ckmc" HeaderText="�ջزֿ�">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ui_zydm" HeaderText="ʹ���˴���">
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
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                        <table style="table-layout: fixed">
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ValidationSummary
                                        ID="ValidationSummary1"
                                        runat="server"
                                        EnableClientScript="true"
                                        ShowMessageBox="true"
                                        ShowSummary="false"></asp:ValidationSummary>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblghid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffckid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblghdh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblghzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblsqrytid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblshcktid" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
