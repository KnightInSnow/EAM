<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcbfsq_modnew.aspx.cs" Inherits="FCSystem.OA.wpth_new.zcbfsq_modnew" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ʲ�������Ϣ</title>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="�����뱨�ϱ���" ControlToValidate="tbx_bfbt"></asp:RequiredFieldValidator>
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
                            <asp:Panel ID="spyijpanel" runat="server" Visible="false">
                                <tr>
                                    <td>���������</td>
                                    <td>
                                        <asp:DropDownList ID="spyjxz" runat="server" Width="500px">
                                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="ͬ��" Value="ͬ��"></asp:ListItem>
                                            <asp:ListItem Text="��ͬ��" Value="��ͬ��"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </asp:Panel>

                            <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                                <tr>
                                    <td>�����ע��</td>
                                    <td>
                                        <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500px" Enabled="false" TextMode="multiLine"></asp:TextBox></td>
                                </tr>
                            </asp:Panel>

                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblTip1" runat="server" Visible="False" ForeColor="Red">�ϴ����뱨�ϵ��ʲ���Ϣ��</asp:Label>
                                </td>
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
                                            <asp:TemplateField HeaderText="��Ʒ����">
                                                <HeaderStyle ForeColor="Black" />
                                                <ItemStyle HorizontalAlign="center" />
                                                <ItemTemplate>
                                                    <font><asp:Label ID="Label2bm" runat="server" Text='<%# Eval("wpbm") %>'></asp:Label></font>
                                                </ItemTemplate>
                                            </asp:TemplateField>
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
                            <tr>
                                <td>
                                    <asp:Label ID="lblTip" runat="server" Visible="False" ForeColor="Red">������������ǰ�����¹�ѡ�ʲ���Ϣ��</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="plNew" runat="server" Visible="false" ScrollBars="Auto">
                                        <asp:GridView ID="GridView2" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="lymx_tid"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="��ʱû���ʲ���Ϣ"
                                            Width="100%" EnableModelValidation="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                    <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                    <HeaderTemplate>
                                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="�ʲ�����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="���õ���">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("lydh") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ControlStyle CssClass="navigate" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="lymx_tid" HeaderText="������ϸ����">
                                                    <HeaderStyle CssClass="hidden" />
                                                    <ItemStyle CssClass="hidden" />
                                                    <FooterStyle CssClass="hidden" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="bmmc" HeaderText="���ڲ���">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ckmc" HeaderText="���òֿ�">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>

                                                <asp:BoundField DataField="zcsm" HeaderText="�ʲ�˵��">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="����ͼƬ" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemStyle Width="260px" Height="18px" HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <input id="bft" runat="server" type="file" style="width: 140px; height: 20px" class="mytext" /><asp:Button ID="btn_bftsc" runat="server" Height="20px" CommandArgument='<%# Container.DataItemIndex %>' OnClick="ShCh" Text="�ϴ�" /><asp:Label ID="lblFilename" runat="server" Text=""></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_songshen" cssclass="mybutton" runat="server" Text="����" Visible="false" OnClick="btn_songshen_Click" />
                                </td>
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
