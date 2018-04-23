<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcrkdmx_add.aspx.cs" Inherits="FCSystem.OA.wprk.zcrkdmx_add" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../Scripts/jquery-1.12.4.min.js"></script>
    <title>���Ǽ� - ��Ʒ��ϸ</title>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("lbl_oldcode");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }


        function setContextKey() {
            var sGystid = $("#gys_tidLabel1").text();
            var autoComplete = $find("AutoCompleteEx");
            autoComplete.set_contextKey(sGystid);
        }

    </script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
</head>
<body class="main" onload="SetFocus();">


    <form id="form1" runat="server">
        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">

            <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
            </asp:ScriptManager>

            <div class="PopHead">
                <table>
                    <tr>
                        <td class="td_oa" style="width: 50%; height: 25px">�Ǽ������ϸ</td>
                        <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
                    </tr>
                </table>
            </div>

            <div class="PopBodyInputs">
                <table style="table-layout: fixed;">

                    <tr>
                        <td colspan="3" align="center">
                            <ajaxToolkit:AutoCompleteExtender
                                runat="server"
                                BehaviorID="AutoCompleteEx"
                                ID="autoComplete1"
                                TargetControlID="myTextBox"
                                ServicePath="~/AutoComplete.asmx"
                                ServiceMethod="GetAssetRKmxProductList"
                                MinimumPrefixLength="1"
                                EnableCaching="true"
                                UseContextKey="true"
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
                        <td>�����ʲ�</td>
                        <td colspan="3">
                            <asp:TextBox runat="server" ID="myTextBox" Width="300px" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" onkeydown="setContextKey();" CssClass="form-control"/></td>
                        <td colspan="2">
                            <asp:Label ID="bzflbm" runat="server" Text="" Visible="false"></asp:Label><asp:DropDownList CssClass="SelectQuarterWidth" ID="DropDownList1" runat="server" DataTextField="wz_id " Visible="false" DataValueField="wz_id" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList></td>
                    </tr>

                    <tr>
                        <td>���Ŵ��룺</td>
                        <td>
                            <asp:Label ID="lbl_bmid" runat="server"></asp:Label>
                        </td>
                        <td></td>

                        <td>������룺</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="lbl_zcbmqz" runat="server" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>�ʲ�Ψһ���룺</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="lbl_zcbmuqi" runat="server"></asp:TextBox>
                        </td>
                        <td>��ʼ</td>
                        <td>��ƷΨһ���룺</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="lbl_oldcode" runat="server" AutoPostBack="True" OnTextChanged="lbl_oldcode_TextChanged"></asp:TextBox>
                            <%-- <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="lbl_oldcode"  ErrorMessage="ԭ���벻���Ϲ淶" MaximumValue="999999999999999" MinimumValue="500000000000000">*</asp:RangeValidator>--%>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>��Ʒ��Ϣѡ��</td>
                        <td colspan="4">
                            <asp:DropDownList CssClass="form-control" ID="DropDownList2" runat="server" Width="100%" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>��Ʒ�������ࣺ</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="ssfl" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>��Ʒ���ƣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="wpmc" runat="server" Enabled="False" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>��Ʒ��Ӧ�̣�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="gys" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>��ƷƷ�ƣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="wppp" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>��Ʒ�ͺţ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="wpxh" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>��Ʒ���</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="wpgg" runat="server"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>��Ʒ���أ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="wpcd" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>��Ʒ���鵥�ۣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="wpdj" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>��Ʒ�����룺</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txm" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>������λ:</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="tbxJldw" runat="server" ReadOnly="true" Enabled="False"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>���޿�ʼʱ�䣺</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtBxkssj" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtBxkssj"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator8"
                                runat="server"
                                ControlToValidate="txtBxkssj"
                                ErrorMessage="�����뱣�޿�ʼʱ��">&nbsp;
                            </asp:RequiredFieldValidator></td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtBxjssj"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            ���޽���ʱ�䣺</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtBxjssj" runat="server"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>����ʱ�䣺</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="tbx_bfsj" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="tbx_bfsj"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator9"
                                runat="server"
                                ControlToValidate="tbx_bfsj"
                                ErrorMessage="�����뱨��ʱ��">&nbsp;
                            </asp:RequiredFieldValidator></td>
                    </tr>


                    <tr>
                        <td>���������</td>
                        <td>
                            <asp:TextBox CssClass="form-control PopMust" ID="rksl" runat="server" CausesValidation="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="rksl" ErrorMessage="��������������ֵ" MaximumValue="999" MinimumValue="1" Type="Integer">*</asp:RangeValidator></td>
                        <td>��ⵥ�ۣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control PopMust" ID="rkdj" runat="server" AutoPostBack="True" CausesValidation="True"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>��ע��Ϣ��</td>
                        <td colspan="4">
                            <asp:TextBox ID="tbx_zcbz" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>ԭʼͼ��</td>
                        <td colspan="4">
                            <asp:FileUpload ID="yst" runat="server" /><%--<input id="yst" runat="server" type="file" style="width: 300px; height: 20px" class="mytext" />--%>
                        </td>
                        <td>
                            <asp:Button ID="btn_ystsc" runat="server" Width="80px" Text="�ϴ�" OnClick="btn_ystsc_Click" /></td>
                    </tr>

                    <tr>
                        <td>���ϴ�ͼƬ��</td>
                        <td colspan="3">
                            <asp:Panel ID="panel_filename" runat="server" ScrollBars="Auto">
                                <asp:Label ID="lblPostedFilename" runat="server" Text=""></asp:Label>
                            </asp:Panel>
                        </td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>�ʲ���Դ�� 
                        </td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="ddl_zcly" runat="server" Enabled="false">
                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                        <td>�۾���ʼ�ۣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txt_zjqsj" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>�۾���ʼ�ڣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txt_zjqsq" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txt_zjqsq"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*"
                                ControlToValidate="txt_zjqsq" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)"></asp:RegularExpressionValidator>

                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator6"
                                runat="server"
                                ControlToValidate="txt_zjqsq"
                                ErrorMessage="�������۾ɿ�ʼʱ��">&nbsp;
                            </asp:RequiredFieldValidator></td>

                        <td>
                            <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txt_zjq" ErrorMessage="�۾���ӦΪ��������" MaximumValue="240" MinimumValue="1" Type="Integer">*</asp:RangeValidator>�۾���(��)��</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txt_zjq" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>���᷽ʽ��</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="ddl_jtfs" runat="server">
                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                        <td>��ֵ��</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txt_cz" runat="server"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td colspan="4">
                            <asp:Button ID="SaveAddBtn" runat="server" AccessKey="a" CssClass="btn btn-default btn-xs" OnClick="Save_Click" Text="���沢�½�" />
							<asp:Button ID="SaveBtn" runat="server" AccessKey="s" CssClass="btn btn-default btn-xs" OnClick="Save_Click" Text="����" />
							<asp:Button ID="btn_clear" runat="Server" AccessKey="r" CausesValidation="false" CssClass="btn btn-default btn-xs" OnClick="Clear_Click" Text="���" />
							<input type="button" name="BackBtn" value="�ر�" class="btn btn-default btn-xs" onclick="javascript: window.close()" accesskey="q" />&nbsp; &nbsp; 
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td style="height: 12px" colspan="3">&nbsp;<asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true" ShowMessageBox="true" ShowSummary="false" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rkdj" ErrorMessage="��������ⵥ��">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*"
                                ControlToValidate="txtBxjssj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)"></asp:RegularExpressionValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="*"
                                ControlToValidate="tbx_bfsj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)"></asp:RegularExpressionValidator>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="*"
                                ControlToValidate="txtBxkssj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)"></asp:RegularExpressionValidator>

                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5"
                                runat="server"
                                ControlToValidate="txtBxjssj"
                                ErrorMessage="�����뱣�޽���ʱ��">*
                            </asp:RequiredFieldValidator>
                            <%--                                                  <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator6"
                                                            runat="server"
                                                            ControlToValidate="lbl_oldcode"
                                                            ErrorMessage="�������ʽ����">&nbsp;
                                                        </asp:RequiredFieldValidator>--%>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="dropdownlist2" ErrorMessage="��������Ʒ����">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="lbl_zcbmuqi" ErrorMessage="�ʲ����벻��Ϊ��">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="rksl" ErrorMessage="�������������">&nbsp;
                            </asp:RequiredFieldValidator>
                            <%-- <asp:RegularExpressionValidator
                                                            ID="RegularExpressionValidator5"
                                                            ControlToValidate="lbl_zcbmqz"
                                                            Display="none"
                                                            ErrorMessage="������2-4λ��ĸ����"
                                                            ValidationExpression="[a-zA-Z]{2,4}"
                                                            runat="server">*
                                                        </asp:RegularExpressionValidator>--%>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="rksl" Display="none" ErrorMessage="�����������Ϊ������" ValidationExpression="^[1-9]\d*">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="rkdj" Display="none" ErrorMessage="��ⵥ�۱���Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}">
                            </asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="wpmc" ErrorMessage="��Ʒ���벻���ڣ��޷���������">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="lbl_zcbmuqi" ErrorMessage="�ʲ������ʽ����ȷ������λ��Ϊ���֣�" Display="None" ValidationExpression="^\w*\d{4}$">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>

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
                        <td align="left">
                            <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="6">
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                <asp:GridView ID="GridView_mx" runat="server"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="wpbm"
                                    EmptyDataText="û�в鵽�������������ݣ�"
                                    OnRowDataBound="OnRow_Bound"
                                    Width="100%">
                                    <Columns>
                                        <asp:TemplateField HeaderImageUrl="~/images/refresh.gif" HeaderText="���">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_mx.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                                            <HeaderStyle ForeColor="black" Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpgg" HeaderText="��Ʒ���">
                                            <HeaderStyle ForeColor="black" Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wppp" HeaderText="��ƷƷ��">
                                            <HeaderStyle ForeColor="black" Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:TemplateField HeaderText="��Ʒ���">
                                            <HeaderStyle ForeColor="Black" Width="60px" />
                                            <ItemTemplate>
                                                <asp:Label ID="lbl" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label>

                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="center" />
                                            <ControlStyle CssClass="navigate" />
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="��Ʒ���">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemTemplate> 
                                                            <a href="#" onclick="">
                                                                <font color="#3366ff"><asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label></font>
                                                            </a>
                                                        </ItemTemplate>
                                                      <ItemStyle HorizontalAlign="center" />
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>--%><%--<asp:TemplateField HeaderText="���ñ���">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_mod.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("lybt") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>--%>
                                        <asp:BoundField DataField="gysmc" HeaderText="��Ʒ��Ӧ��">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <%-- <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="�ʲ�">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle Width="30px" ForeColor="black" />
                                                    </asp:ImageField>
                                                    <asp:ImageField DataImageUrlField="yn_dlwp" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="����">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle Width="30px" ForeColor="black" />
                                                    </asp:ImageField>--%>
                                        <asp:BoundField DataField="wpdj" HeaderText="���鵥��">
                                            <HeaderStyle ForeColor="black" Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpcd" HeaderText="��Ʒ����">
                                            <HeaderStyle ForeColor="black" Width="60px" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <%--<asp:TemplateField HeaderText="����">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_ghview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("yngh") %>'></asp:Label></font></a>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_bfview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelbf" runat="server" Text='<%# Bind("ynbf") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>--%>
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
                        <td style="height: 22px">
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="false" CssClass="page_text" CustomInfoHTML="&lt;font color='#333333'&gt;�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ&lt;/font&gt;" CustomInfoSectionWidth="250px" FirstPageText="��ҳ" InputBoxClass="AspNetPagerInputBox" LastPageText="ĩҳ" NextPageText="��ҳ" NumericButtonCount="4" OnPageChanged="AspNetPager1_PageChanged" PageSize="4" PrevPageText="��ҳ" ShowBoxThreshold="11" ShowCustomInfoSection="left" ShowInputBox="Auto" SubmitButtonClass="��AspNetPagerButton��" SubmitButtonText="Go"></webdiyer:AspNetPager>
                        </td>
                    </tr>
                </table>
            </div>
        </asp:Panel>

        <asp:Label ID="IDlabel" runat="server" Visible="false" />
        <asp:Label ID="gys_tidLabel1" runat="server" />
        <asp:Label ID="lbl_maxuqi" runat="server" Visible="false" />
        <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblicount" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblfltid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblfltidExist" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_tpmc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_tplj" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblflqz" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblflmin" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblflmax" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblwpjm" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblcurmax" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblcurmin" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl_upfltid" runat="server" Visible="False"></asp:Label>

    </form>

</body>
</html>
