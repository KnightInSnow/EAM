<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rkdj_add.aspx.cs" Inherits="FCSystem.OA.wprk.rkdj_add" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Ʒ���Ǽ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/AutoComplete.css" rel="stylesheet" type="text/css" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td>
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click" AccessKey="s" CausesValidation="true"></asp:Button><asp:Button CssClass="mybutton" ID="SendBtn" runat="server" Text="����" OnClick="Send_Click" CausesValidation="true" Visible="false"></asp:Button><asp:Button ID="AddBtn" Text="���������Ʒ" cssclass="mybutton" runat="server" Visible="false" CausesValidation="false" /><asp:Button cssclass="mybutton" ID="DelBtn" runat="server" Text="ɾ�������Ʒ" OnClick="Del_Click" Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" /><asp:Button CssClass="mybutton" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Ref_Click" Visible="false" CausesValidation="false" /><input type="button" name="BackBtn" value="�ر�" class="mybutton" onclick="javascript: window.close()" accesskey="q" />&nbsp;
                    </td>
                    <td class="td_oa"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp</span>=������Ϣ</td>
                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        <table style="table-layout:fixed;">
                            <tr>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <td colspan="3" align="center">
                                    <ajaxToolkit:AutoCompleteExtender
                                        runat="server"
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1"
                                        TargetControlID="myTextBox"
                                        ServicePath="~/AutoComplete.asmx"
                                        ServiceMethod="GetWPGysCompletionList"
                                        MinimumPrefixLength="1"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionInterval="200"
                                        CompletionListCssClass="autocomplete_completionListElement"
                                        CompletionListItemCssClass="autocomplete_listItem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=""
                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                    </ajaxToolkit:AutoCompleteExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_no" style="height: 25; width: 120"></td>
                                <td style="width: 160"></td>
                                <td class="td_no" style="width: 80"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td_no"></td>
                                <td colspan="3"><font color="red">��ʾ����ֻ��ѡ���Լ��ܹ�ʹ�õ���Ʒ���Ͳֿ�</font></td>
                            </tr>
                            <tr>
                                <td>�������룺</td>
                                <td colspan="3">
                                    <asp:Label ID="lblJGDM" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td>��ⵥ�ţ�</td>
                                <td colspan="3">
                                    <asp:Label ID="lblRKDH" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>�ֿ⣺</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="rkck" runat="server" Width="500" OnSelectedIndexChanged="rkck_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>������Ӧ��</td>
                                <td colspan="3">
                                    <asp:TextBox runat="server" ID="myTextBox" Width="500px" CssClass="ctlAlign" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" Height="21px" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" />
                                </td>
                            </tr>
                            <tr>
                                <td>��Ӧ�̣�</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddl_gys" runat="server" Width="500px">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList><asp:ImageButton ID="imgbtn_addnew" Width="17px" ImageUrl="~/images/add.gif" runat="server" CausesValidation="False" />
                                </td>
                            </tr>
                            <tr>
                                <td>��ע��</td>
                                <td colspan="3">
                                    <asp:TextBox ID="rkbz" runat="server" Width="500px" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>
                            <asp:Panel ID="songshen" runat="server" Visible="false">
                                <tr>
                                    <td class="td_no" style="height: 25; width: 120"></td>
                                    <td colspan="2">
                                        <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ�����Ա" Checked="true" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ�����Ա" />
                                    </td>
                                    <td></td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td colspan="4" style="height: 5"></td>
                            </tr>
                        </table>
                        <asp:Panel ID="plContent" runat="server" Visible="true" ScrollBars="Auto">
                            <table style="table-layout:fixed;">
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="rkmxid"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="��ʱû�еǼ��κ���Ʒ�����Ϣ"
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
                                                <asp:BoundField DataField="rkmxid" HeaderText="����">
                                                    <HeaderStyle CssClass="hidden" />
                                                    <ItemStyle CssClass="hidden" />
                                                    <FooterStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="��Ʒ����">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <a href="#" onclick="javascript:popMiniMod('rkdmx_mod.aspx?id=<%# Eval("rkmxid") %>&id2=<%# Eval("ssrkdid") %>&id3=<%# Eval("rk_gys") %>')"><font color="#3366ff"> <asp:Label ID="Label2bm" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label></font></a>
                                                    </ItemTemplate>
                                                    <ControlStyle CssClass="navigate" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fl_mc" HeaderText="���">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpxh" HeaderText="�ͺ�">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="gysmc" HeaderText="��Ӧ��">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="�������">
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2aa" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="��ⵥ��">
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdj") %>'></asp:Label>
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
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>

        <!--����label-->
        <asp:Label ID="IDlabel" runat="server" Visible="false" />
        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="rkck"
            ErrorMessage="��ѡ�����ֿ�">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator1"
            runat="server"
            ControlToValidate="ddl_gys"
            ErrorMessage="��ѡ��Ӧ����Ϣ">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:Label ID="lblyhtid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
