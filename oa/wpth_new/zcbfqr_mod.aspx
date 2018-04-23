<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcbfqr_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.zcbfqr_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����ȷ��</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table>

                <tr>
                    <td>
                        <asp:Button CssClass="mybutton" ID="SpBtn" runat="server" Text="����ͨ��" OnClick="Sp_Click" Visible="false" />
                        <asp:Button CssClass="mybutton" ID="ThBtn" runat="server" Text="�����˻�" OnClick="Th_Click" Visible="false" />
                        <input type="button" name="BackBtn" value="�ر�" class="mybutton" onclick="javascript: window.close()" accesskey="q" /></td>
                    <td class="td_oa"></td>
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
                    <td colspan="4" align="center" style="height: 25px">
                        <asp:Label ID="bfdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
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
                <tr>
                    <td>����˵����</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_bfsm" runat="server" CssClass="MultiLineText" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                    </td>
                </tr>

                <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                    <tr>
                        <td>���׷����</td>
                        <td colspan="4">
                            <asp:TextBox ID="spyj" runat="server" CssClass="MultiLineText" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox></td>
                    </tr>
                </asp:Panel>

            </table>
        </div>


        <div class="PopBodyGrid">
            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                OnRowDataBound="OnRow_Bound"
                AutoGenerateColumns="False"
                DataKeyNames="bfid"
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
                    <asp:BoundField DataField="bfid" HeaderText="����">
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
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
                    <asp:BoundField DataField="gysmc" HeaderText="��Ӧ��">
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
                    <%--       <asp:TemplateField HeaderText ="����ͼƬ">
                                        <HeaderStyle ForeColor="Black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                             <asp:HyperLink ID="cktp" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ͼƬ" />
                                        </ItemTemplate>
                                    </asp:TemplateField>--%>
                </Columns>
                <RowStyle CssClass="GridViewRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
            </asp:GridView>
        </div>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <%--  <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="spyjxz"
            ErrorMessage="�������������">&nbsp;
        </asp:RequiredFieldValidator>--%>

        <!--����label-->
        <asp:Label ID="bfzt" runat="server" Visible="False" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="cktid" runat="server" Visible="false" />
        <asp:Label ID="bfidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="kcsl" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="yngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbl" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="lblbfid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblbfdh" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="conn" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ifht" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="path" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblhth" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblpath" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="bfdjljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="smsl" runat="server" Visible="False"></asp:Label>
        <input id="smzsl" type="hidden" runat="server" />
        <asp:Label ID="lblcurTime" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
