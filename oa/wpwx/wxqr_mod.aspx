<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wxqr_mod.aspx.cs" Inherits="FCSystem.OA.wpwx.wxqr_mod" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ά��ȷ��</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function openwin_mini(src) {
            var vDialog = null;
            vDialog = showModalDialog(src, window, "status:no;resizable:off;dialogHeight:130px;dialogWidth:300px;unadorne:yes;help:no");
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <input type="button" name="BackBtn" value="�ر�" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /><asp:Button cssclass="mybutton" ID="SpBtn" runat="server" Text="����ͨ��" OnClick="Sp_Click" Visible="false" /><asp:Button cssclass="mybutton" ID="ThBtn" runat="server" Text="�����˻�" OnClick="Th_Click" Visible="false" /></td>
            </tr>
        </table>
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <asp:Label ID="lblwxdmc" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="15%">������Ա��</td>
                <td>
                    <asp:TextBox ID="tbx_sqry" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%">�������ţ�</td>
                <td>
                    <asp:TextBox ID="tbx_ssbm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%">��ע��</td>
                <td>
                    <asp:TextBox ID="tbx_wxd_sm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                <tr>
                    <td width="15%">���׷����</td>
                    <td>
                        <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500px" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox></td>
                </tr>
            </asp:Panel>
        </table>
        </br>
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False"
                        CellSpacing="1"
                        DataKeyNames="wxzc_tid"
                        BorderStyle="None"
                        BorderWidth="0px"
                        BackColor="Silver"
                        EmptyDataText="��ʱû�еǼ��κ���Ϣ"
                        Width="750px">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                <HeaderTemplate>
                                    <%-- <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />--%>
                                </HeaderTemplate>
                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkevery" runat="server" CssClass="mybox" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="wxd_id" HeaderText="ά�޵�id">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wxzc_bm" HeaderText="�ʲ�����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fl_mc" HeaderText="�������">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpdj" HeaderText="��Ʒ����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wxzc_sm" HeaderText="����˵��">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wxfs" HeaderText="ά�޷�ʽ">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wxbz" HeaderText="ά�ޱ�ע">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="ά��ͼ">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:HyperLink ID="ckqm" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ͼƬ" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="wxzt" HeaderText="ά��״̬" HeaderStyle-CssClass="hidden">
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
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
                <td style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                        OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left"
                        ShowInputBox="Auto"
                        AlwaysShow="false"
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
                        SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
        </br>
        <asp:Panel ID="Panel_jsfs" runat="server" Visible="false">
            <table border="0" cellpadding="1" cellspacing="1" width="100%">
                <tr>
                    <td colspan="3"><font color="red">ά�޽������빴ѡ�ʲ�����ά�޷�ʽ</font></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td width="15%">
                        <asp:RadioButton ID="rbtn1" runat="server" Text="����ά��" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn1_CheckedChanged" />
                    </td>
                    <td width="8%">ά�ޱ�ע��</td>
                    <td width="77%">
                        <asp:TextBox ID="tbx_bngh" runat="server" Width="400px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                        <asp:RadioButton ID="rbtn2" runat="server" Text="���ڻ���" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn1_CheckedChanged" />
                    </td>
                    <td width="10%">ά�ޱ�ע��</td>
                    <td>
                        <asp:TextBox ID="tbx_bnhx" runat="server" Width="400px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                        <asp:RadioButton ID="rbtn3" runat="server" Text="����ά��" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn1_CheckedChanged" />
                    </td>
                    <td width="8%">ά�޷��ã�</td>
                    <td>
                        <asp:TextBox ID="tbx_bwwx" runat="server" Width="100px" Enabled="false"></asp:TextBox><asp:Label ID="Label2" Text=" " runat="server" Width="20px"></asp:Label><asp:Label ID="lblbwwxsm" Text="ά��˵��:" runat="server" Width="80px"></asp:Label><asp:TextBox ID="tbx_bwwssm" runat="server" Width="200px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                        <asp:RadioButton ID="rbtn4" runat="server" Text="���ⱨ��" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn1_CheckedChanged" />
                    </td>
                    <td width="10%">ά��˵����</td>
                    <td>
                        <asp:TextBox ID="tbx_bwbf" runat="server" Width="400px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="tbx_bwwx" ErrorMessage="ά�޷��ñ���Ϊ��ֵ��" ValidationExpression="\d+\.\d+|\d{0,9}">
                        </asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center"></td>
                    <td align="left">
                        <asp:Button ID="btn_set" runat="server" Enabled="false" Text="ȷ��ά��" cssclass="mybutton" OnClick="btn_set_Click" /></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>

        <!--����label-->
        <asp:Label ID="lblwxdid" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblwxdzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblwxfs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblbmcode" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblwxdh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffcktid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
