<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ckkccx.aspx.cs" Inherits="FCSystem.OA.wpcx.ckkccx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <title>�ֿ����ѯ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">�ֿ����ѯ</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel3" runat="server">
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody> 
                                    <tr>
                                        <td align="left" style="height: 25px" width="8%">�ֿ⣺</td>
                                        <td>
                                            <asp:DropDownList ID="rkck" runat="server">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left">��ʼ���ڣ�</td>
                                        <td>
                                            <asp:TextBox ID="tbxkssj" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td align="left">�������ڣ�</td>
                                        <td>
                                            <asp:TextBox ID="tbxjssj" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="height: 25px" width="8%">��Ʒ���ࣺ</td>
                                        <td>
                                            <asp:DropDownList ID="ssfl" runat="server">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" style="height: 25px" width="8%">��Ʒ���ƣ�</td>
                                        <td>
                                            <asp:TextBox ID="wpmc" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="left" style="height: 25px" width="8%">��Ʒ���룺</td>
                                        <td>
                                            <asp:TextBox ID="wpbm" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3"></td>
                                        <td align="right" colspan="3">
                                            <asp:Button ID="Button1" runat="server" AccessKey="f" CausesValidation="true" cssclass="mybutton" Height="21px" OnClick="Ref_Click" Text="��ѯ" /><asp:Button ID="Button2" runat="server" AccessKey="r" CausesValidation="false" cssclass="mybutton" Height="21px" OnClick="Clear_Click" Text="���" /><asp:Button ID="Button3" runat="server" AccessKey="e" CausesValidation="false" cssclass="mybutton" Height="21px" OnClick="Ref_Click" Text="ˢ��" /><asp:Button ID="btnOut" runat="server" class="mybtn_d3" Text="����" Height="21px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_q_space"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                    OnRowDataBound="OnRow_Bound"
                                                    AutoGenerateColumns="False"
                                                    
                                                   DataKeyNames=   "ssckid"
                                                    EmptyDataText="û�в鵽�������������ݣ�">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="ssckid" HeaderText="�ֿ����">
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            <FooterStyle CssClass="hidden" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="��������">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="�ֿ�����">
                                                            <HeaderStyle ForeColor="Black" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Labelckmc" runat="server" Text='<%# Bind("ckmc") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                                                            <HeaderStyle Width="100px" ForeColor="black" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="wpmc" HeaderText="����">
                                                            <HeaderStyle ForeColor="black" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="����">
                                                            <HeaderStyle Width="100px" ForeColor="Black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="�ʲ�">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="30px" ForeColor="black" />
                                                        </asp:ImageField>
                                                        <asp:BoundField DataField="mc" HeaderText="Ʒ��">
                                                            <HeaderStyle ForeColor="black" Width="70px" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="wpxh" HeaderText="�ͺ�">
                                                            <HeaderStyle ForeColor="black" Width="60px" />
                                                            <ItemStyle HorizontalAlign="right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="kcsl" HeaderText="�������">
                                                            <HeaderStyle ForeColor="black" Width="90px" />
                                                            <ItemStyle HorizontalAlign="right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="kcje" HeaderText="�����">
                                                            <HeaderStyle ForeColor="black" Width="90px" />
                                                            <ItemStyle HorizontalAlign="right" />
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
                                        <td style="height: 22px">
                                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                                OnPageChanged="AspNetPager1_PageChanged"
                                                ShowCustomInfoSection="left"
                                                ShowInputBox="Auto"
                                                AlwaysShow="true"
                                                CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                                NumericButtonCount="10"
                                                FirstPageText="��ҳ"
                                                LastPageText="ĩҳ"
                                                NextPageText="��ҳ"
                                                PrevPageText="��ҳ"
                                                CustomInfoSectionWidth="250px"
                                                CssClass="page_text"
                                                ShowBoxThreshold="11"
                                                InputBoxClass="AspNetPagerInputBox"
                                                SubmitButtonClass=��AspNetPagerButton��
                                                SubmitButtonText="Go">
                                            </webdiyer:AspNetPager>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
