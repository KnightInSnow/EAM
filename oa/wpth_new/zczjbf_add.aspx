<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zczjbf_add.aspx.cs" Inherits="FCSystem.OA.wpth_new.zczjbf_add" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
     <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>���ϵǼ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("bfbt");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
    <style type="text/css">
        #File1 {
            height: 21px;
        }
    </style>
</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
        </asp:ScriptManager>

        <div class="PopHead">
            <table style="table-layout: fixed">
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">���ϵǼ�</td>
                    <td class="td_oa" style="width: 20%; height: 25px"><span style="color:red;">*Ϊ������Ϣ</span></td>
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
                            ServiceMethod="GetLoginUserManagedZCInfo"
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
                    <td></td>
                </tr>

                <tr>
                    <td>���ϱ��⣺</td>
                    <td colspan="4">
                        <asp:TextBox ID="bfbt" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="bfbt"
                            ErrorMessage="�����뱨�ϱ���">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>���벿�ţ�
                    </td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddlbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlbm_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="ddlbm"
                            ErrorMessage="��ѡ�����벿��">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>������Ա��</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddlry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlry_SelectedIndexChanged" CssClass="form-control"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="ddlry"
                            ErrorMessage="��ѡ��������Ա">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>&nbsp; ͼƬ�ϴ���<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:FileUpload ID="UploadPic" runat="server" />
                        </td>
                    <td><asp:Button ID="btn_upload" runat="server" Text="�ϴ�" OnClick="btn_upload_Click" CausesValidation="False" CssClass="btn btn-primary active"/></td>
                </tr>

                <tr>
                    <td>&nbsp; ����˵����</td>
                    <td colspan="4">
                        <asp:TextBox ID="bfsm" runat="server" CssClass="form-control" Rows="3" TextMode="multiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>


        <div class="PopBodyGrid">

            <asp:Label ID="Label2" runat="server" Text="����ѡ����Ҫ���ϵ��ʲ���"></asp:Label>

            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="250px">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="rkmxid"
                    EmptyDataText="��ʱû���ʲ���Ϣ"
                    EnableModelValidation="True">
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
                        <asp:BoundField DataField="zczt" HeaderText="���ڲ���">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zczt" HeaderText="�ʲ�״̬">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckmc" HeaderText="�����ֿ�">
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
            </asp:Panel>
        </div>

        <div class="PopBodyPager">
            <table>
                <tr>
                    <td><div class="Pop-EmptyLine-Normal"></div></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2">
                        <asp:Button CssClass="btn btn-primary active" ID="OK_bf" runat="server" Text="ȷ��" OnClick="OK_bf_Click"></asp:Button>
                        <asp:Button ID="Button3" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false" CssClass="btn btn-primary active" AccessKey="r" />&nbsp;
                                    <asp:ValidationSummary
                                        ID="ValidationSummary1"
                                        runat="server"
                                        EnableClientScript="true"
                                        ShowMessageBox="true"
                                        ShowSummary="false"></asp:ValidationSummary>
                    </td>
                </tr>
            </table>
        </div>


        <asp:Label ID="lblmaxbfid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblmaxindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="shckid" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
