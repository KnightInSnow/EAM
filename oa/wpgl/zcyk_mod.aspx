<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcyk_mod.aspx.cs" Inherits="FCSystem.OA.wpgl.zcyk_mod" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�ʲ��ƿ���Ϣ</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>


</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">�ʲ��ƿ���Ϣ</td>
                    <td class="td_oa" style="width: 20%; height: 25px"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
                </tr>
                <tr>
                    <td width="100%" align="center" colspan="2">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table style="table-layout: fixed;">

                                                <tr>
                                                    <td> �ƿ���⣺</td>
                                                    <td>
                                                        <asp:TextBox ID="ykbt" runat="server" Width="450" Enabled="False"></asp:TextBox>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator1"
                                                            runat="server"
                                                            ControlToValidate="ykbt"
                                                            ErrorMessage="������黹����">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td> ���벿�ţ�</td>
                                                    <td>
                                                        <asp:DropDownList ID="sqbm" Width="450" runat="server" AutoPostBack="True" OnSelectedIndexChanged="sqbm_SelectedIndexChanged" Enabled="False">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator5"
                                                            runat="server"
                                                            ControlToValidate="sqbm"
                                                            ErrorMessage="��ѡ�����벿��">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td> ������Ա��</td>
                                                    <td>
                                                        <asp:DropDownList ID="sqry" runat="server" Width="450" AutoPostBack="true" Style="margin-top: 0px" Enabled="False">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator6"
                                                            runat="server"
                                                            ControlToValidate="sqry"
                                                            ErrorMessage="��ѡ��������Ա">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <%--<tr>
                                                    <td> ��Ʒ���ࣺ</td>
                                                    <td>
                                                        <asp:DropDownList ID="wpfl" Width="450px" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator2"
                                                            runat="server"
                                                            ControlToValidate="shbm"
                                                            ErrorMessage="��ѡ����Ʒ����">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td> ��Ʒ���ƣ�</td>
                                                    <td>
                                                        <asp:DropDownList ID="wpmc" runat="server" Width="450" AutoPostBack="True" OnSelectedIndexChanged="wpmc_SelectedIndexChanged">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator3"
                                                            runat="server"
                                                            ControlToValidate="shck"
                                                            ErrorMessage="��ѡ����Ʒ����">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>--%>
                                               <%-- <tr>
                                                    <td> �ʲ����룺</td>
                                                    <td>
                                                        <asp:DropDownList ID="zcbm" runat="server" Width="450">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator7"
                                                            runat="server"
                                                            ControlToValidate="zcbm"
                                                            ErrorMessage="��ѡ����Ӧ�ʲ�">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>--%>
                                                <tr>
                                                    <td> ���ղ��ţ�</td>
                                                    <td>
                                                        <asp:DropDownList ID="jsbm" Width="450px" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="shbm_SelectedIndexChanged" Enabled="False">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator4"
                                                            runat="server"
                                                            ControlToValidate="jsbm"
                                                            ErrorMessage="��ѡ���ջز���">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td> ���ղֿ⣺</td>
                                                    <td>
                                                        <asp:DropDownList ID="jsck" runat="server" Width="450" AutoPostBack="True" OnSelectedIndexChanged="shck_SelectedIndexChanged" Enabled="False">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator8"
                                                            runat="server"
                                                            ControlToValidate="jsck"
                                                            ErrorMessage="��ѡ���ջزֿ�">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp; �ƿ�˵����</td>
                                                    <td>
                                                        <asp:TextBox ID="yksm" runat="server" Width="450" Rows="3" TextMode="multiLine" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                               <tr>
                                                   <td></td>
                                               </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="lbltip" runat="server"  ForeColor="Red" Text="����ǰ������ѡ����Ӧ��Ϣ��" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="table-layout: fixed">
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull"
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
                                                    <asp:TemplateField>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <HeaderTemplate>
                                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="CheckEvery" runat="server" CssClass="mybox" />
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
                                                    <asp:TemplateField HeaderText="�ƿⵥ��">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_ykdh" runat="server" Text='<%# Bind("ykdh") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>                                                   
                                                    <asp:BoundField DataField="wpxh" HeaderText="�ʲ��ͺ�">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ckmc" HeaderText="�����ֿ�">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zt" HeaderText="�ʲ�״̬">
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
                                                    <asp:BoundField DataField="zcsm" HeaderText="�ʲ�˵��">
                                                        <HeaderStyle ForeColor="black" />
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
                                    <td style="height: 18px">&nbsp;</td>
                                </tr>
                            </table>
                            <table style="table-layout: fixed">
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button cssclass="mybutton" ID="SongShen" runat="server" Text="����" OnClick="SongShen_Click"></asp:Button><input id="closebtn" type="button" name="BackBtn" value="�ر�" class="mybtn_d1" onclick="javascript: window.close()" accesskey="q" />
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

            </tbody>
        </table>
        <asp:Label ID="lblykid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffckid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblykdh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblykzt" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
