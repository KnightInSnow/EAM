<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcybset.aspx.cs" Inherits="FCSystem.OA.wpwx.zcybset" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�ʲ��ӱ�����</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tr>
                <td style="height: 20px; background-color: #8CA1AE;" colspan="6">
                    <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" style="background-image: url(../../images/bg.gif);">�ʲ��ӱ�����</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%" colspan="6">
                    <asp:Panel ID="Panel2" runat="server" ScrollBars="None">
                        <br />
                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                        <table style="table-layout:fixed;">
                            <tr>
                                <td align="left">�ʲ����룺</td>
                                <td align="left" width="25%">
                                    <asp:TextBox ID="tbxZCBM" runat="server"></asp:TextBox>
                                </td>
                                <td align="left">�ʲ����ࣺ</td>
                                <td align="left" width="25%">
                                    <asp:DropDownList ID="ddlZCFL" runat="server" Width="95%"></asp:DropDownList>
                                </td>
                                <td align="left">��Ӧ�̣�</td>
                                <td>
                                    <asp:DropDownList ID="ddlGYS" runat="server" Width="100%"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">��Ʒ���ƣ�</td>
                                <td align="left" width="25%">
                                    <asp:TextBox ID="tbxSPMC" runat="server"></asp:TextBox>
                                </td>
                                <td align="left">��Ʒ�ͺţ�</td>
                                <td align="left" width="25%">
                                    <asp:TextBox ID="tbxSPXH" runat="server"></asp:TextBox>
                                </td>
                                <td align="left">��ƷƷ�ƣ�</td>
                                <td>
                                    <asp:DropDownList ID="ddlSPPP" runat="server" Width="100%"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3"></td>
                                <td align="right" colspan="3">
                                    <asp:Button ID="btnQuery" runat="server" Text="��ѯ" cssclass="mybutton" OnClick="btnQuery_Click" ValidationGroup="ctrl" /><asp:Button ID="btnClear" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Text="���" OnClick="btnClear_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td_q_space"></td>
                            </tr>
                        </table>

                        <table id="search2" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                            <tr>
                                <td colspan="4">
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="GridView1_RowDataBound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="rkmxid"
                                            
                                            EmptyDataText="û�в鵽�������������ݣ�"
                                            >
                                            <Columns>
                                                <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="5%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                                    <HeaderTemplate>
                                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                    </HeaderTemplate>
                                                    <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="cbxEvery" runat="server" CssClass="mybox" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderText="�ʲ�����" DataField="zcbmfull">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="��ƷΨһ��" DataField="oldid">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="�ʲ�����" DataField="fl_mc">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="��Ʒ����" DataField="wpmc">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="��Ʒ�ͺ�" DataField="wpxh">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="��ƷƷ��" DataField="ppmc">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="��Ӧ��" DataField="gysmc">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="���޿�ʼʱ��" DataField="bxkssj">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="���޽���ʱ��" DataField="bxjssj">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="�ӱ�����ʱ��" DataField="ybdqsj">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle HorizontalAlign="Center" />
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
                                <td class="td_q_space"></td>
                            </tr>
                            <tr>
                                <td style="height: 22px" colspan="4">
                                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
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
                                        SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
                                    </webdiyer:AspNetPager>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_q_space"></td>
                            </tr>
                            <tr>
                                <td colspan="4"><font color="red">�����Ը��ݾ���ʱ������ӱ����������ӱ�ʱ�䣺</font></td>
                            </tr>
                            <tr>
                                <td width="8%" style="background-color: #CAE4FF">
                                    <asp:RadioButton ID="rbtnDate" runat="server" Text="�ӱ�ʱ��" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn_CheckedChanged" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbxYBSJ" runat="server" Width="80%" Enabled="false" ValidationGroup="setDate"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbxYBSJ"
                                        CssClass="MyCalendar" Format="yyyy-MM-dd">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td>
                                    <asp:Button ID="btnSetDate" runat="server" cssclass="mybutton" Text="����" Enabled="false" OnClick="btnSetDate_Click" ValidationGroup="setDate" /></td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="tbxYBSJ" runat="server" ErrorMessage="��ѡ���ӱ�����" ValidationGroup="setDate"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="�����ӱ�ʱ������"
                                        ControlToValidate="tbxYBSJ" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)" Display="Static" ValidationGroup="setDate"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td width="8%" style="background-color: #CAE4FF">
                                    <asp:RadioButton ID="rbtnDays" runat="server" Text="�ӱ�����(��)" GroupName="rbtn" OnCheckedChanged="rbtn_CheckedChanged" AutoPostBack="True" />
                                </td>
                                <td>
                                    <asp:TextBox ID="tbxYBTS" runat="server" Width="80%" Enabled="false" ValidationGroup="setDay"></asp:TextBox>
                                </td>
                                <td width="8%">
                                    <asp:Button ID="btnAddDays" runat="server" cssclass="mybutton" Text="����" Enabled="false" OnClick="btnAddDays_Click" ValidationGroup="setDay" />
                                </td>
                                <td>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tbxYBTS" ErrorMessage="�������ӱ�����" ValidationGroup="setDay"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ControlToValidate="tbxYBTS" ValidationExpression="^[1-9]\d*" runat="server" ErrorMessage="�ӱ�����ӦΪ������" ValidationGroup="setDay"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
