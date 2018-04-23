<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcly_modnew.aspx.cs" Inherits="FCSystem.OA.wply.zcly_modnew" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�����ʲ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/html">
        a:link{
        color:#ffffff;
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table style="table-layout: fixed">
            <tr>
                <td class="td_oa" style="width: 60%; height: 25px">�ʲ�������Ϣ</td>
                <td class="td_oa" style="width: 20%">
                    <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="true" /><a href="#"><asp:Label ID="lblprn" runat="server" Text="��ӡ���õ�" Font-Underline="True" Font-Names="����" Font-Size="X-Small" Visible="true" ForeColor="White"></asp:Label></a>
                    &nbsp;&nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:Label ID="PrnLbl" runat="server" Text="��ӡ�ʲ���ǩ" Font-Names="����" Font-Underline="true" Visible="false"></asp:Label>
                </td>
                <td width="20%"><span class="td_yes">&nbsp;&nbsp;&nbsp</span>=������Ϣ</td>
            </tr>
            <tr>
                <td valign="top" colspan="3">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <br />
                    <table style="table-layout:fixed;">
                        <tr>
                            <td colspan="2">
                                <table style="table-layout: fixed">
                                    <tr>
                                        <td> ���ñ��⣺</td>
                                        <td>
                                            <asp:TextBox ID="lybt" runat="server" Width="450" Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1"
                                                runat="server"
                                                ControlToValidate="lybt"
                                                ErrorMessage="���������ñ���">&nbsp;</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> ���Ų��ţ�</td>
                                        <td class="auto-style1">
                                            <asp:DropDownList ID="ddl_ffbm" Width="450" Enabled="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_ffbm_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator2"
                                                runat="server"
                                                ControlToValidate="ddl_ffbm"
                                                ErrorMessage="��ѡ����Ʒ���Ų���">&nbsp;
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> ���Ųֿ⣺</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_ffck" Width="450" Enabled="false" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_ffck_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator4"
                                                runat="server"
                                                ControlToValidate="ddl_ffck"
                                                ErrorMessage="��ѡ����Ʒ���Ųֿ�">&nbsp;
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <asp:Panel ID="plNew" runat="server" Visible="false">
                                        <tr>
                                            <td> �ʲ����ࣺ</td>
                                            <td>
                                                <asp:DropDownList ID="ddl_zcfl" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_zcfl_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator3"
                                                    runat="server"
                                                    ControlToValidate="ddl_zcfl"
                                                    ErrorMessage="��ѡ���ʲ�����">&nbsp;
                                                </asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td> �����ʲ���</td>
                                            <td>
                                                <asp:DropDownList ID="ddlWp" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged">
                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator5"
                                                    runat="server"
                                                    ControlToValidate="ddlWp"
                                                    ErrorMessage="��ѡ�������ʲ�">&nbsp;
                                                </asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp; ���ⷽʽ��</td>
                                            <td>
                                                <asp:DropDownList ID="ddl_lcfs" runat="server" Width="450px" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="ddl_lcfs_SelectedIndexChanged">
                                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="plGhsj" runat="server" Visible="false">
                                        <tr>
                                            <td> �黹ʱ�䣺</td>
                                            <td>
                                                <asp:TextBox ID="tbx_ghsj" runat="server" Width="450px"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbx_ghsj" CssClass="MyCalendar" Format="yyyy-MM-dd">
                                                </ajaxToolkit:CalendarExtender>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="���ڸ�ʽ����ȷ"
                                                    ControlToValidate="tbx_ghsj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <tr>
                                        <td>&nbsp; �����̶ȣ�</td>
                                        <td>
                                            <asp:DropDownList ID="jjcd" Width="450px" runat="server" Enabled="false">
                                                <asp:ListItem Text="����" Value="����" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="��Ҫ" Value="��Ҫ"></asp:ListItem>
                                                <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp; ����˵����</td>
                                        <td>
                                            <asp:TextBox ID="lysm" runat="server" Width="450" Rows="3" TextMode="multiLine" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="height: 30px">
                                            <asp:ValidationSummary
                                                ID="ValidationSummary2"
                                                runat="server"
                                                EnableClientScript="true"
                                                ShowMessageBox="true"
                                                ShowSummary="false"></asp:ValidationSummary>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator6"
                                                runat="server"
                                                ControlToValidate="tbx_sqsl"
                                                ErrorMessage="����д��������">&nbsp;
                                            </asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbx_sqsl" ErrorMessage="�����������ݸ�ʽ����ȷ" MaximumValue="1000" MinimumValue="1" Type="Integer">*</asp:RangeValidator>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Panel ID="plAddnew" runat="server" Visible="false">
            <table cellpadding="1" cellspacing="1" border="0" width="600px" align="center">
                <tr>
                    <td>&nbsp; �������
                    </td>
                    <td width="20%">
                        <asp:Label ID="lblkcinfo" runat="server" Text=""></asp:Label>
                    </td>
                    <td>&nbsp; ����������
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_sqsl" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="���" OnClick="Add_Click" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <table style="table-layout: fixed">
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
                        EmptyDataText="��ʱû�еǼ��ʲ�������Ϣ"
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
                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_zydm" HeaderText="ʹ���˴���">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpmc" HeaderText="�ʲ�����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpxh" HeaderText="�ͺ�">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zcsm" HeaderText="�ʲ�˵��">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
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
                <td align="right">
                    <asp:Button cssclass="mybutton" ID="btn_songshen" runat="server" Text="��������" OnClick="SongShen_Click" Visible="false" Enabled="false" CausesValidation="False"></asp:Button>
                </td>
            </tr>
        </table>
        <asp:Label ID="lbllyid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="kcbz" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblsqzs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblLcfs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSqrtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblKcsl" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lbldlrysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lbldlyhtid" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>
