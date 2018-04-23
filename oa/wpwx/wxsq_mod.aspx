<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wxsq_mod.aspx.cs" Inherits="FCSystem.OA.wpwx.wxsq_mod" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ά������</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <input type="button" name="BackBtn" value="�ر�" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /></td>
            </tr>
        </table>
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <asp:Label ID="lblwxdmc" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="12%">������Ա��</td>
                <td>
                    <asp:TextBox ID="tbx_sqry" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="12%">�������ţ�</td>
                <td>
                    <asp:TextBox ID="tbx_ssbm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="12%">��ע��</td>
                <td>
                    <asp:TextBox ID="tbx_wxd_sm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
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
                        Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
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
                        </Columns>
                        <RowStyle CssClass="GridViewRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="td_q_space"></td>
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
        <!--����label-->
        <asp:Label ID="lblwxdid" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblwxdzt" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
