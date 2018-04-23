<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wply_add.aspx.cs" Inherits="FCSystem.OA.wply.wply_add" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>������Ʒ</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/AutoComplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("lybt");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
        function refreshParentPage() {
            window.opener.location.href = window.opener.location.href;
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 197px;
        }

        .auto-style2 {
            width: 209px;
        }
    </style>
</head>
<body class="main" method="post" oncontextmenu="return false">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1"></ajaxToolkit:ToolkitScriptManager>
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 60%; height: 25px">������Ʒ����</td>
                    <td class="td_oa" style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><a href="#"><asp:Label ID="lblprn" runat="server" Text="��ӡ���õ�" ForeColor="White" Font-Underline="True" Font-Names="����" Font-Size="X-Small" Visible="false"></asp:Label></a></td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <ajaxToolkit:AutoCompleteExtender
                            runat="server"
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1"
                            TargetControlID="myTextBox"
                            ServicePath="~/AutoComplete.asmx"
                            ServiceMethod="GetWpCompletionList"
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
                    <td colspan="3">
                        <br />
                        <table style="table-layout: fixed">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <table style="table-layout: fixed;">
                                            <tr>
                                                <td><strong>������Ʒ</strong></td>
                                                <td colspan="3">
                                                    <asp:TextBox runat="server" ID="myTextBox" Width="400px" CssClass="ctlAlign" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" Height="21px" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td>���ñ��⣺</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="lybt" runat="server" Width="450" Font-Bold="true" ForeColor="DarkGray"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="lybt"
                                                        ErrorMessage="���������ñ���">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>���Ų��ţ�</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ffbm" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ffbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator2"
                                                        runat="server"
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="��ѡ����Ʒ���Ų���">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>���Ųֿ⣺</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ffck" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ffck_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator4"
                                                        runat="server"
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="��ѡ����Ʒ���Ųֿ�">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>��Ʒ���ࣺ</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="wpfl" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator3"
                                                        runat="server"
                                                        ControlToValidate="wpfl"
                                                        ErrorMessage="��ѡ����Ʒ����">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>��Ʒ���ƣ�</td>
                                                <td>
                                                    <asp:DropDownList ID="ddlWp" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator5"
                                                        runat="server"
                                                        ControlToValidate="ddlWp"
                                                        ErrorMessage="��ѡ����Ʒ����">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
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
                                                <td></td>
                                                <td colspan="3"></td>
                                            </tr>
                                            <%--<tr>
                                                <td style="width: 90" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="jsr" runat="server">
                                                        <asp:ListItem Text="ѡ����һ��������" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:HyperLink ID="flsm" runat="server" Target="_blank" Enabled="false">����鿴��������˵��</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ��һ��������" Checked="true" />
                                                    <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ��һ��������" />
                                                </td>
                                            </tr>--%>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <table width="600px" align="center">
            <tr>
                <td><font color="red">���������Ҫ���õ���Ʒ��Ϣ</font></td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server">
            <table cellspacing="0" cellpadding="0" border="0" width="600px" align="center">
                <tr>
                    <td>&nbsp;&nbsp;�������:
                    </td>
                    <td width="28%" style="text-align: center">
                        <asp:Label ID="lblKcinfo" runat="server" Text="" Width="100%" Enabled="false"></asp:Label>
                    </td>
                    <td>&nbsp;����������
                    </td>
                    <td width="28%">
                        <asp:TextBox ID="sqsl" runat="server" Width="120px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sqsl" ErrorMessage="��������������">&nbsp</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="sqsl" Display="none" ValidationExpression="^[1-9]{1}[\d]*$" ErrorMessage="���������0������">&nbsp</asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3">
                        <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="���" OnClick="Add_Click" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <table style="table-layout: fixed">
                <tr>
                    <td style="height: 10"></td>
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
                                <asp:BoundField DataField="ui_desc" HeaderText="������">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_zydm" HeaderText="�����˴���">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpxh" HeaderText="�ͺ�">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="sqsl" HeaderText="��������">
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
                <tr align="right">
                    <td>
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="��������" OnClick="Save_Click" Enabled="False"></asp:Button><asp:Button ID="Button2" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false" CssClass="mybutton" AccessKey="r" /><input type="button" name="BackBtn" value=" �ر� " class="mybutton" onclick="javascript: window.close()" accesskey="q" /></td>
                </tr>
            </table>
        </asp:Panel>
        <div style="display: none">
            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" />
        </div>
        <asp:Label ID="lblMaxLYID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbl_maxlyindex" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="sqzsl" runat="server" Text="0" Visible="False"></asp:Label>
        <asp:Label ID="kcsl" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:Label ID="ysqsl" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:Label ID="lblDlrysqsl" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:Label ID="lblDlyhtid" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="lblWpinfo" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblDlbmtid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
