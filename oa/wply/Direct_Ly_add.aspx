<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Direct_Ly_add.aspx.cs" Inherits="FCSystem.OA.wply.Direct_Ly_add" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>���õǼ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>

    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />

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
            height: 20px;
        }
    </style>
</head>
<body class="main" method="post" oncontextmenu="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>

        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td style="width: 60%; height: 25px">���õǼ�</td>
                    <td style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><a href="#"><asp:Label ID="lblprn" runat="server" Text="��ӡ���õ�" Visible="false"></asp:Label></a>
                    <td style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
                </tr>
            </table>
        </div>

        <div class="PopBodyInputs">
            <table style="table-layout: fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
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
                            ServiceMethod="GetZcCompletionList"
                            MinimumPrefixLength="1"
                            EnableCaching="true"
                            CompletionSetCount="30"
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
                    <td><strong>�����ʲ���</strong></td>
                    <td colspan="4">
                        <asp:TextBox runat="server" ID="myTextBox" CssClass="form-control" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" />
                    </td>
                </tr>

                <tr>
                    <td>���ñ��⣺</td>
                    <td colspan="4">
                        <asp:TextBox ID="lybt" runat="server" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="lybt"
                            ErrorMessage="���������ñ���">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>���벿�ţ�</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddlbm" runat="server" AutoPostBack="True" Enabled="False" CssClass="form-control"></asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7"
                            runat="server"
                            ControlToValidate="ddlbm"
                            ErrorMessage="��ѡ�����벿��">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>������Ա��</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddlry" runat="server" AutoPostBack="True" Enabled="False" CssClass="form-control"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8"
                            runat="server"
                            ControlToValidate="ddlry"
                            ErrorMessage="��ѡ��������Ա">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>���Ų��ţ�</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_ffbm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_ffbm_SelectedIndexChanged" CssClass="form-control">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="ddl_ffbm"
                            ErrorMessage="��ѡ����Ʒ���Ų���">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>���Ųֿ⣺</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="ddl_ffck" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_ffck_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="ddl_ffck"
                            ErrorMessage="��ѡ����Ʒ���Ųֿ�">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>�ʲ����ࣺ</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="ddl_zcfl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_zcfl_SelectedIndexChanged">
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="ddl_zcfl"
                            ErrorMessage="��ѡ���ʲ�����">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>�����ʲ���</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="ddlWp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged">
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
                            runat="server"
                            ControlToValidate="ddlWp"
                            ErrorMessage="��ѡ�������ʲ�">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>���ⷽʽ��</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_lcfs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_lcfs_SelectedIndexChanged" CssClass="form-control">
                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <asp:Panel ID="Panelghsj" runat="server" Visible="false">
                    <tr>
                        <td>�黹ʱ�䣺</td>
                        <td>
                            <asp:TextBox ID="tbx_ghsj" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbx_ghsj" CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="���ڸ�ʽ����ȷ"
                                ControlToValidate="tbx_ghsj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td>�����̶ȣ�</td>
                    <td>
                        <asp:DropDownList CssClass="form-control" ID="ddl_jjcd" runat="server">
                            <asp:ListItem Text="����" Value="����" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="��Ҫ" Value="��Ҫ"></asp:ListItem>
                            <asp:ListItem Text="����" Value="����"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>ͼƬ�ϴ���</td>
                    <td colspan="4">
                        <asp:FileUpload ID="UploadPic" runat="server"/>
                    </td>
                    <td>
                        <asp:Button ID="btn_upload" runat="server" Text="�ϴ�" OnClick="btn_upload_Click" CausesValidation="False" CssClass="btn btn-primary active"/></td>
                </tr>
                <tr>
                    <td>��ע��</td>
                    <td colspan="4">
                        <asp:TextBox ID="lysm" runat="server" CssClass="form-control" Rows="3" TextMode="multiLine"></asp:TextBox>
                    </td>
                </tr>

                <asp:Panel ID="Panel1" runat="server">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>ʹ���˲��ţ�
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="ddlsyrbm" runat="server" OnSelectedIndexChanged="ddlsyrbm_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>ʹ���ˣ�</td>
                        <td colspan="1">
                            <asp:DropDownList CssClass="form-control" ID="ddlsyr" runat="server" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td></td>
                        <td>�ʲ����룺</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="ddlzcbm" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4" align="center">
                            <asp:Button CssClass="btn btn-primary active" ID="AddBtn" runat="server" Text="����ʲ�" OnClick="Add_Click" CausesValidation="true" />
                            <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" CausesValidation="False" />
                        </td>
                    </tr>
                </asp:Panel>
            </table>
        </div>


        <asp:Panel ID="Panel2" runat="server">
            <div class="PopBodyGrid">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="lymx_tid"
                    EmptyDataText="��ʱû�еǼ��ʲ�������Ϣ">
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
                        <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
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
                        <asp:BoundField DataField="zt" HeaderText="״̬">
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
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                                <asp:TemplateField HeaderText="��ƷΨһ��">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:TextBox ID="tbx_spwym" runat="server" Text='<%# Bind("oldid") %>' OnTextChanged="tbx_spwym_OnTextChanged" AutoPostBack="True"></asp:TextBox><asp:Button ID="btnEditSpwym" CommandArgument='<%# Container.DataItemIndex %>' runat="server" OnClick="btnEditSpwym_OnClick" Visible="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </div>
            <table>
                <tr>
                    <td align="center">
                        <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="��������" OnClick="Save_Click" Enabled="False" ValidationGroup="1"></asp:Button>
                        <asp:Button ID="btn_clear" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false" Visible="false" CssClass="btn btn-primary active" AccessKey="r" /><%--<input type="button" name="BackBtn" value=" �ر� " class="mybutton" onclick="javascript: window.close()" accesskey="q" />--%>
                    </td>
                </tr>

                <tr>
                    <td style="height: 25px">
                        <asp:ValidationSummary
                            ID="ValidationSummary2"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator9"
                            runat="server"
                            ControlToValidate="ddlsyr"
                            ErrorMessage="��ѡ��ʹ���ˣ�">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10"
                            runat="server"
                            ControlToValidate="ddlzcbm"
                            ErrorMessage="��ѡ���ʲ�����">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </asp:Panel>


        <asp:Label ID="lblMaxLYID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbl_maxlyindex" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbldlyhtid" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="kcbz" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="sqsl" runat="server" Text="0" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="tbx_kcsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lbldlrysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblkcinfo" runat="server" Visible="False"></asp:Label>
        <asp:TextBox ID="tbx_sqsl" runat="server" Visible="False">1</asp:TextBox>
    </form>
</body>
</html>
