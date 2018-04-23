<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_zctj_pande.aspx.cs" Inherits="FCSystem.OA.report_table.report_zctj_pande" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>�ʲ�ͳ�Ʊ�</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!--startprint-->
        <table id="table1" cellspacing="0" cellpadding="0" width="100%" style="height: 100%" border="0">
            <tr>
                <td>
                    <asp:Panel ID="panel1" runat="server">
                        <table id="table2" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td>
                                    <h3 align="center">
                                        <br />
                                        �ʲ�ͳ�Ʊ�</h3>
                                </td>
                            </tr>
                        </table>
                        <table id="Table3" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr style="height: 30px">
                                <td align="right">��ѯ���ڣ�<asp:Label runat="server" ID="rq_end" Font-Underline="true" />&nbsp;&nbsp;��ӡ�ˣ�<asp:Label runat="server" ID="dyr" Font-Underline="true" />&nbsp;&nbsp;</td>
                            </tr>
                        </table>
                        <table id="search" cellspacing="0" cellpadding="0" width="100%" border="0">
                            <tr>
                                <td>
                                    <tr align="center">
                                        <td>

                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                AllowPaging="false"
                                                DataKeyNames="fl_mc"
                                                BorderStyle="Solid"
                                                BorderWidth="1px"
                                                BackColor="#999999"
                                                EmptyDataText="��ʱû�еǼ��κ���Ʒ�����Ϣ"
                                                Width="100%" ShowFooter="True">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="fl_mc" HeaderText="�ʲ�����">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zsl" HeaderText="����">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zje" HeaderText="���">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                                <RowStyle CssClass="GridViewRowStyle" />
                                                <FooterStyle CssClass="GridViewFooterStyle" />
                                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                            </asp:GridView>
                                            <br />
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
                                                NumericButtonCount="100"
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
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label ID="zclx" runat="server" Text="" Visible="false"></asp:Label>
        </table>
        <!--endprint-->
    </form>
</body>
</html>



