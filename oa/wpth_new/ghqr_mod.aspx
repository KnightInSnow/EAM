<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ghqr_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.ghqr_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�黹ȷ��</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
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

        <div class="PopHead">
            <table>
                <tr>
                    <td width="80%">
                        <asp:Button CssClass="mybutton" ID="SpBtn" runat="server" Text="����ͨ��" OnClick="Sp_Click" Visible="false" />
                        <asp:Button CssClass="mybutton" ID="ThBtn" runat="server" Text="�����˻�" OnClick="Th_Click" Visible="false" />
                        <input type="button" name="BackBtn" value="�ر�" class="mybutton" onclick="javascript: window.close()" accesskey="q" />
                    </td>
                    <td class="td_oa">&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="False" /><asp:LinkButton ID="PrnSelectLbl" runat="server" Visible="False" OnClick="PrnSelectLbl_Click">��ӡ�ʲ���ǩ</asp:LinkButton></td>
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
                            <td></td>
                    <td colspan="4">
                        <asp:Label ID="ghdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>�ջزֿ⣺</td>
                    <td colspan="4">
                        <asp:TextBox ID="shck" runat="server" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>�鿴ͼƬ</td>
                    <td>
                        <asp:HyperLink ID="cktp" runat="server"></asp:HyperLink>
                    </td>
                </tr>


                <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                    <tr>
                        <td>���׷����</td>
                        <td colspan="4">
                            <asp:TextBox ID="spyj" runat="server" CssClass="MultiLineText" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox>
                        </td>
                    </tr>
                </asp:Panel>

            </table>
        </div>



        <div class="PopBodyGrid">
            <table style="table-layout: fixed;">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="ghid"
                    EmptyDataText="��ʱû�еǼ��κ���Ϣ"
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
                            <HeaderStyle Width="30px" />
                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ���߲�ѡ" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ghid" HeaderText="����">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
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
                        <asp:TemplateField HeaderText="��Ʒ����">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("wpdj") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="zcsm" HeaderText="��ע˵��">
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
        </div>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <%--<img src="/images/fd.gif" onclick="openA('/choose/spyjview.aspx?page=xpsp')" alt="ѡ��ϵͳ�ṩ���������" />--%>

        <!--����label-->
        <asp:Label ID="ghzt" runat="server" Visible="False" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="lblghid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="kcsl" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="yngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ghdhlab" runat="server" Visible="false" />
        <asp:Label ID="shcktid" runat="server" Visible="false" />
    </form>
</body>
</html>
