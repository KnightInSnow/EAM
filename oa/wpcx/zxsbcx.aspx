<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zxsbcx.aspx.cs" Inherits="FCSystem.OA.wpcx.zxsbcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����豸��ѯ</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">�����豸��ѯ</td>
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
                                        <td align="left" width="8%">��������:</td>
                                        <td align="left" width="23%">
                                            <asp:DropDownList ID="ddl_bm" Width="95%" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_bm_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" width="5%"></td>
                                        <td width="8%">�������ƣ�</td>
                                        <td align="left" class="" width="23%">
                                            <asp:DropDownList ID="ddl_fl" Width="95%" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_fl_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" width="5%"></td>
                                        <td width="30%" align="right">
                                            <asp:Button ID="btnQuery" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Text="��ѯ" OnClick="btnSave_Click" /><asp:Button ID="btnClear" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Text="���" OnClick="btnClear_Click" />
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
                                                OnRowDataBound="GridView1_RowDataBound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="fl_mc" HeaderText="��������">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxdkssj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="wxzc_sm" HeaderText="ά��˵��">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="gysmc" HeaderText="ά�޵�λ">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="tjry" HeaderText="������Ա">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="bm_mc" HeaderText="��������">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
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
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
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
</body>
</html>