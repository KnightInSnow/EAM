<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wp_historyjl.aspx.cs" Inherits="FCSystem.OA.wply.wp_historyjl" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Ʒ/�ʲ���ʷ��¼��ѯ</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 500px;
        }
    </style>

</head>




<body class="main">
    <form id="form1" runat="server" onsubmit="false">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">��ʷ��¼��ѯ</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />

                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr width="100%">
                                        <td align="left" width="8%">��Ʒ���룺</td>


                                        <td align="left" width="15%">
                                            <asp:TextBox ID="wpbm_content" runat="server" Width="90%" Height="21px" AutoPostBack="True" OnTextChanged="wpbm_content_TextChanged"></asp:TextBox>
                                        </td>
                                        <td align="left" width="5%"></td>
                                        <td width="8%">�ʲ����룺</td>
                                        <td align="left" class="" width="15%">
                                            <asp:TextBox ID="zcbmfull_content" runat="server" Width="90%" Height="21px" AutoPostBack="True" OnTextChanged="zcbmfull_content_TextChanged"></asp:TextBox>
                                        </td>
                                        <td align="left" width="5%"></td>
                                        <td width="8">������:
                                        </td>
                                        <td width="10%">
                                            <asp:TextBox ID="sqry" runat="server"></asp:TextBox>
                                        </td>
                                        <td width="26%" align="right">

                                            <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" OnClick="Query_Click" Text="��ѯ" /><asp:Button ID="Button1" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" OnClick="Clear_Click" Text="���" />

                                        </td>
                                    </tr>

                                    <tr>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>

                            <table id="search2" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="wpbm"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>


                                                    <asp:TemplateField HeaderText="�ʲ����">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemTemplate>
                                                            <font color="black"><asp:Label ID="lbl" runat="server" Text='<%# Bind("his_zcbmfull") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>

                                                    <asp:TemplateField HeaderText="��Ʒ���">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemTemplate>
                                                            <font color="black"><asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label></font>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>

                                                    <%--<asp:TemplateField HeaderText="���ñ���">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_mod.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("lybt") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>--%>
                                                    <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="yn_gdzc" HeaderText="��Ʒ���">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="his_sj" HeaderText="ʱ��" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" HtmlEncode="False">
                                                        <HeaderStyle Width="80px" ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="his_zt" HeaderText="��Ʒ״̬">
                                                        <HeaderStyle Width="60px" ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="his_action" HeaderText="ִ�ж���">
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
                                                    <asp:BoundField DataField="sm" HeaderText="˵��">
                                                        <HeaderStyle Width="60px" ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="������">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('sqrzcAll.aspx?id=<%#Eval("his_actionrenid") %>')"><font color="#3366ff"><asp:Label ID="lblsqr" runat="server" text='<%#Bind("his_actionren") %>'>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="his_actionbm" HeaderText="���벿��">
                                                        <HeaderStyle ForeColor="black" Width="60" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="his_zxren" HeaderText="ִ����">
                                                        <HeaderStyle ForeColor="black" Width="50px" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="his_zxbm" HeaderText="ִ�в���">
                                                        <HeaderStyle ForeColor="black" Width="60" />
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
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                            OnPageChanged="AspNetPager1_PageChanged"
                                            ShowCustomInfoSection="left"
                                            ShowInputBox="Auto"
                                            AlwaysShow="true"
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
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    <asp:Label ID="QueryContent_zcbmfull" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="QueryContent_wpbm" runat="server" Visible="false"></asp:Label>
</body>
</html>

