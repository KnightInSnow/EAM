<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcly_mod.aspx.cs" Inherits="FCSystem.OA.wply.zcly_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�����ʲ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>

</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 60%; height: 25px">�ʲ�������Ϣ</td>
                    <td class="td_oa" style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="true" /><asp:Label ID="lblprn" runat="server" Text="��ӡ���õ�" Font-Underline="True" Font-Names="����" Font-Size="X-Small" Visible="true"></asp:Label>
                        &nbsp;&nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:Label ID="PrnLbl" runat="server" Text="��ӡ�ʲ���ǩ" Font-Names="����" Font-Underline="true" Visible="false"></asp:Label>
                    </td>
                    <td width="20%"><span class="td_yes">&nbsp;&nbsp;&nbsp</span>=������Ϣ</td>
                </tr>
                <tr>
                    <td valign="top" colspan="3">
                        <br />
                        <br />
                        <table style="table-layout:fixed;">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <table style="table-layout: fixed;">

                                            <tr>
                                                <td> ���ñ��⣺</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="lybt" runat="server" Width="450"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="lybt"
                                                        ErrorMessage="���������ñ���">&nbsp; </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> ���벿�ţ�</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="sqbm" Width="450" runat="server" AutoPostBack="True" OnSelectedIndexChanged="sqbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> ������Ա��</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="lyry" runat="server" Width="450" AutoPostBack="True">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> ���Ų��ţ�</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ffbm" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ffbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator2"
                                                        runat="server"
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="��ѡ����Ʒ���Ų���">&nbsp; </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> ���Ųֿ⣺</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ffck" Width="450" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator4"
                                                        runat="server"
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="��ѡ����Ʒ���Ųֿ�">&nbsp; </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <asp:Panel ID="zcfl" runat="server" Visible="false">
                                                <tr>
                                                    <td> ��Ʒ���ࣺ</td>
                                                    <td colspan="3">
                                                        <asp:DropDownList ID="wpfl" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator3"
                                                            runat="server"
                                                            ControlToValidate="wpfl"
                                                            ErrorMessage="��ѡ���ʲ�����">&nbsp; </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td> �����ʲ���</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlWp" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                            </asp:Panel>


                                            <tr>
                                                <td>&nbsp; �����̶ȣ�</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="jjcd" Width="150" runat="server">
                                                        <asp:ListItem Text="����" Value="����" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="��Ҫ" Value="��Ҫ"></asp:ListItem>
                                                        <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp; ����˵����</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="lysm" runat="server" Width="450" Rows="3" TextMode="multiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="lbltip" runat="server" ForeColor="Red" Text="����ǰ������ѡ����Ӧ��Ϣ��" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 30px">
                                                    <asp:Button CssClass="mybutton" ID="SongShen" runat="server" Text="����" OnClick="SongShen_Click"></asp:Button>
                                                    <asp:ValidationSummary
                                                        ID="ValidationSummary2"
                                                        runat="server"
                                                        EnableClientScript="true"
                                                        ShowMessageBox="true"
                                                        ShowSummary="false"></asp:ValidationSummary>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Panel ID="Panel1" runat="server">
            <table cellspacing="0" cellpadding="0" border="0" width="600px" align="center">
                <tr>
                    <td>
                        <asp:Label ID="a03" Text="�ʲ���ţ�" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlZcbmfull" Width="150px" runat="server">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                        <%--<asp:RequiredFieldValidator ID="requirefieldvalidate3"
                            ControlToValidate="ddlZcbmfull"
                            runat="server"
                            ErrorMessage="��ѡ����Ʒ���">*
                        </asp:RequiredFieldValidator>--%>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="���" OnClick="Add_Click" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <table style="table-layout: fixed">
                <tr>
                    <td style="height: 10px"></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server"
                            OnRowDataBound="OnRow_Bound"
                            AutoGenerateColumns="False"
                            CellSpacing="1"
                            DataKeyNames="lymx_tid"
                            BorderStyle="None"
                            BorderWidth="0px"
                            BackColor="Silver"
                            EmptyDataText="��ʱû�з�����Ʒ������Ϣ"
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
                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16; height: 16" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="lymx_tid" HeaderText="�����굥tid����">
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                    <FooterStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_zydm" HeaderText="ʹ���˴���">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpxh" HeaderText="�ͺ�">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                            </Columns>
                            <RowStyle CssClass="GridViewRowStyle" />
                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                            <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Label ID="lbllyid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="kcbz" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblsqzs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
