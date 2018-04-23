<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="yjqrMod.aspx.cs" Inherits="FCSystem.OA.wply.yjqrMod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����ȷ��</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function loadpage() {
            var chkEvery = document.getElementsByTagName("input");
            for (var i = 0; i < chkEvery.length; i++) {
                if (chkEvery[i].type == 'checkbox') {
                    if (chkEvery[i].id.indexOf('GridView1') > -1) {
                        chkEvery[i].checked = true;
                    }
                }
            }
        }
    </script>
</head>
<body class="main" onload="loadpage();">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td>
                        <asp:Button ID="SpBtn" runat="server" Text="����ͨ��" OnClick="Sp_Click" Visible="false" /><asp:Button ID="ThBtn" runat="server" Text="�����˻�" OnClick="Th_Click" Visible="false" /><input type="button" name="BackBtn" value="�ر�" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /></td>
                    <td class="td_oa" width="20%">&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="False" /><asp:LinkButton ID="PrnSelectLbl" runat="server" Font-Bold="True" Font-Names="����" Font-Size="X-Small" Font-Underline="True" ForeColor="White" OnClick="PrnSelectLbl_Click" Visible="False">��ӡ�ʲ���ǩ</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        <table style="table-layout:fixed;">
                            <tr>
                                <td>
                                    <asp:Label ID="jjdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>���Ӳ���</td>
                                <td>
                                    <asp:TextBox ID="jjbmmc" runat="server" CssClass="mytext4" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>������Ա</td>
                                <td>
                                    <asp:TextBox ID="jjry" runat="server" CssClass="mytext4" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>���ղ���</td>
                                <td>
                                    <asp:TextBox ID="tbxjsbm" runat="server" CssClass="mytext4" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>������Ա</td>
                                <td>
                                    <asp:TextBox ID="tbxjsry" runat="server" CssClass="mytext4" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>�鿴ͼƬ</td>
                                <td>
                                    <asp:HyperLink ID="cktp" runat="server"></asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td>��ע</td>
                                <td>
                                    <asp:TextBox ID="tbxbz" runat="server" CssClass="mytext4" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <%--   <asp:Panel ID="spyijpanel" runat="server" Visible="false">
                            <tr>
                             <td>���������</td>
                             <td>
                                 <asp:DropDownList ID="spyjxz" runat="server" Width="500px" >
                                 </asp:DropDownList>
                             </td>
                         </tr>
                        </asp:Panel>--%>

                            <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                                <tr>
                                    <td>���׷����</td>
                                    <td>
                                        <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500px" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox>&nbsp;</td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td colspan="2" style="height: 5px"></td>
                            </tr>
                        </table>

                        <table style="table-layout:fixed;">
                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                OnRowDataBound="OnRow_Bound"
                                AutoGenerateColumns="False"
                                DataKeyNames="jjid"
                                EmptyDataText="��ʱû�еǼ��κ���Ϣ"
                                Width="100%">
                                <Columns>
                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text="<%#GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <HeaderStyle Width="30px" />
                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="jjid" HeaderText="����">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="��Ʒ����">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
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
                                    <asp:TemplateField HeaderText="��������">
                                        <HeaderStyle ForeColor="Black" />
                                        <ItemTemplate>
                                            <asp:Label ID="Label2cc" runat="server" Text='<%# Bind("sjsl")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="��Ʒ����">
                                        <HeaderStyle ForeColor="Black" />
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("wpdj")%>'></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="zcsm" HeaderText="��ע">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <RowStyle CssClass="GridViewRowStyle" />
                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                            </asp:GridView>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <%--   <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="spyjxz"
            ErrorMessage="�������������">&nbsp;
        </asp:RequiredFieldValidator>--%>

        <!--����label-->
        <asp:Label ID="jjzt" runat="server" Visible="false" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="jjidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbljsry" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="jjdhlab" runat="server" Visible="false" />
        <asp:Label ID="cktid" runat="server" Visible="false" />
    </form>
</body>
</html>
