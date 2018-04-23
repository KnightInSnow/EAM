<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcrkdj_add.aspx.cs" Inherits="FCSystem.OA.wprk.zcrkdj_add" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ʲ����Ǽ�</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/AutoComplete.css" rel="stylesheet" type="text/css" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div style='border: 0px; padding: 3px; padding: 0px; height: 540px; line-height: 20px; overflow-x: hidden; overflow-y: scroll;'>
            <div class="PopHead">
                <table style="table-layout: fixed;">
                    <tr>
                        <td style="width: 80%;">
                            <asp:Button ID="SaveBtn" runat="server" CssClass="btn btn-default btn-xs" Text="����" OnClick="Save_Click" AccessKey="s" CausesValidation="true"></asp:Button>
                            <asp:Button ID="SendBtn" runat="server" CssClass="btn btn-default btn-xs" Text="����" OnClick="Send_Click" CausesValidation="true" Visible="false"></asp:Button>
                            <asp:Button ID="AddBtn" Text="��������ʲ�" runat="server" CssClass="btn btn-default btn-xs" Visible="false" CausesValidation="false" />
                            <asp:Button ID="DelBtn" runat="server" CssClass="btn btn-default btn-xs" Text="ɾ������ʲ�" OnClick="Del_Click" Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" />
                            <asp:Button ID="RefBtn" runat="server" CssClass="btn btn-default btn-xs" Text="ˢ��" OnClick="Ref_Click" Visible="false" CausesValidation="false" />
                            <input type="button" class="btn btn-default btn-xs" name="BackBtn" value="�ر�" onclick=" javascript: window.close();" accesskey="q" />
                        </td>
                        <td style="width: 20%;">
                            <asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" />
                            <a href="#">
                                <asp:Label ID="PrnLbl" runat="server" Text="��ӡ��ⵥ" Visible="False"></asp:Label></a>
                            <span style="color:red;">*Ϊ������Ϣ</span>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>

            <div class="PopBodyInputs">
                <table style="table-layout: fixed">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td colspan="3"><font color="red">��ʾ����ֻ��ѡ���Լ��ܹ�ʹ�õĹ̶��ʲ����Ͳֿ�</font></td>
                        <td>
                            <ajaxToolkit:AutoCompleteExtender
                                runat="server"
                                BehaviorID="AutoCompleteEx"
                                ID="autoComplete1"
                                TargetControlID="myTextBox"
                                ServicePath="~/AutoComplete.asmx"
                                ServiceMethod="GetZCGysCompletionList"
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
                        <td>��������:</td>
                        <td colspan="4" style="text-align: left;">
                            <asp:Label ID="lblJGDM" runat="server" Text="Label" CssClass="form-control" Width="150px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>��ⵥ��:</td>
                        <td colspan="4">
                            <asp:TextBox ID="lblRKDH" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>�ʲ���Դ:</td>
                        <td colspan="4">
                            <asp:DropDownList ID="ddl_zcly" runat="server" CssClass="form-control">
                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>ѡ��ֿ�:<span style="color:red;">*</span></td>
                        <td colspan="4">
                            <asp:DropDownList CssClass="form-control" ID="rkck" runat="server" OnSelectedIndexChanged="rkck_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>������Ӧ��:</td>
                        <td colspan="4">
                            <asp:TextBox runat="server" ID="myTextBox" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" CssClass="form-control"/>
                        </td>
                    </tr>

                    <tr>
                        <td>ѡ��Ӧ��:<span style="color:red;">*</span></td>
                        <td colspan="4">
                            <asp:DropDownList CssClass="form-control" ID="gys" runat="server" OnSelectedIndexChanged="gys_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align:left;">
                            <asp:ImageButton ID="imgbtn_addnew" runat="server" ImageUrl="~/images/add.gif" CausesValidation="False" Height="16px"/>
                        </td>
                    </tr>
                </table>


                <asp:Panel ID="pl_upload" runat="server" Visible="False">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td>��ͬ��</td>
                            <td colspan="4">
                                <asp:FileUpload ID="uploadHt" runat="server" />
                            </td>
                            <td>
                                <asp:Button ID="btn_uploadht" runat="server" CausesValidation="False" Text="�ϴ�" OnClick="btn_uploadht_OnClick" Width="50px" Enabled="False"/></td>
                        </tr>
                        <tr>
                            <td>ƾ֤��</td>
                            <td colspan="4">
                                <asp:FileUpload ID="uploadPz" runat="server" />
                            </td>
                            <td>
                                <asp:Button ID="btn_uploadpz" runat="server" CausesValidation="False" Text="�ϴ�" OnClick="btn_uploadpz_OnClick" Width="50px" Enabled="False" /></td>
                        </tr>
                        <tr>
                            <td>�������룺</td>
                            <td colspan="4">
                                <asp:FileUpload ID="uploadGmsq" runat="server" />
                            </td>
                            <td>
                                <asp:Button ID="btn_uploadgmsq" runat="server" CausesValidation="False" OnClick="btn_uploadgmsq_OnClick" Text="�ϴ�" Width="50px" Enabled="False" /></td>
                        </tr>
                        <tr>
                            <td>��ע��</td>
                            <td colspan="4">
                                <asp:TextBox ID="rkbz" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1"
                                    runat="server"
                                    ControlToValidate="gys"
                                    ErrorMessage="��ѡ��Ӧ����Ϣ">
                                </asp:RequiredFieldValidator></td>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator4"
                                    runat="server"
                                    ControlToValidate="rkck"
                                    ErrorMessage="��ѡ��ֿ���Ϣ">
                                </asp:RequiredFieldValidator></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>



                <asp:Panel ID="songshen" runat="server" Visible="false">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td></td>
                            <td>
                                <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ�����Ա" Checked="true" />
                            </td>
                            <td>
                                <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ�����Ա" /></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>


            <div class="PopBodyGrid">
                <asp:Panel ID="plContent" runat="server" Visible="true" ScrollBars="Auto">

                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False"
                        DataKeyNames="rkmxid"
                        EmptyDataText="��ʱû�еǼ��κ���Ʒ�����Ϣ">
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

                            <asp:BoundField DataField="zcbmfull" HeaderText="Ψһ����">
                                <HeaderStyle ForeColor="black" />
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="�ʲ�����">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popAdd2('/oa/wprk/rkzcmod.aspx?id1=<%# Eval("rkmxid")%>&id2=<%# Eval("rk_gys")%>')"><font color="#3366ff"><asp:Label ID="Label2bm" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label></font></a>
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
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdj")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ԭʼͼƬ" ItemStyle-Width="228px">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="left" />
                                <ItemTemplate>
                                    <input id="yst" runat="server" type="file" style="width: 120px; height: 20px" class="mytext" /><asp:Button ID="btn_ystsc" runat="server" Height="20px" OnClick="btn_ystsc_Click" CommandArgument='<%# Container.DataItemIndex %>' Text="�ϴ�" /><asp:HyperLink ID="cktp" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ͼƬ" /><asp:Label ID="lblPostedFilename" runat="server" Text=""></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle CssClass="GridViewRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                    </asp:GridView>

                </asp:Panel>
            </div>
        </div>
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
            ID="RequiredFieldValidator3"
            runat="server"
            ControlToValidate="lblRKDH"
            ErrorMessage="��ⵥ�Ų���Ϊ��">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="lblRKDH" ValidationExpression="^\w*\d{5}$" ErrorMessage="���뵥�Ÿ�ʽ����ȷ������λ��Ϊ���֣�">
        </asp:RegularExpressionValidator>
        <asp:Label ID="Label3" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="htsl" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="pzsl" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="conn" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ifht" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="path" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblhth" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblpath" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="htljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="pzljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="gmsqljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="smhtsl" runat="server" Visible="False"></asp:Label>
        <input id="smzsl" type="hidden" runat="server" />
        <asp:Label ID="lblcurTime" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
