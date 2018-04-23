<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bmzycx.aspx.cs" Inherits="FCSystem.OA.wpcx.bmzycx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�������ò�ѯ</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">�������ò�ѯ</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server">
                            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody> 
                                    <tr>
                                        <td>�ֿ⣺</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_ck" runat="server"></asp:DropDownList></td>
                                        <td align="left">��ʼ���ڣ�</td>
                                        <td>
                                            <asp:TextBox ID="tbxkssj" runat="server" Enabled="false"></asp:TextBox>
                                        </td>
                                        <td align="left">�������ڣ�</td>
                                        <td>
                                            <asp:TextBox ID="tbxjssj" runat="server" Width="100%" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>��Ʒ���ࣺ</td>
                                        <td>
                                            <asp:DropDownList ID="ssfl" runat="server" OnSelectedIndexChanged="ssfl_SelectedIndexChanged" AutoPostBack="true">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>��Ʒ���ƣ�</td>
                                        <td>
                                            <asp:TextBox ID="wpmc" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="left">��Ʒ���룺</td>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server"  Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>���ò��ţ�</td>
                                        <td>
                                            <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td> 
                                    </tr>
                                    <tr>
                                        <td class="td_q_space"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6" align="right">
                                            <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Height="21px" OnClick="Query_Click" Text="��ѯ" /><asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" cssclass="mybutton" Height="21px" OnClick="Clear_Click" Text="���" /><asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" cssclass="mybutton" Height="21px" OnClick="Query_Click" Text="ˢ��" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_q_space"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                    OnRowDataBound="OnRow_Bound"
                                                    AutoGenerateColumns="False"
                                                    
                                                   DataKeyNames=   "ffckid"
                                                    EmptyDataText="û�в鵽�������������ݣ�">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="��������">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ffwpsl" HeaderText="��������">
                                                            <HeaderStyle Width="70px" ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="sybm" HeaderText="���ò���">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ckmc" HeaderText="���Ųֿ�">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ffbm" HeaderText="���Ų���">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spr" HeaderText="������">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                    </Columns>
                                                    <RowStyle CssClass="GridViewRowStyle" />
                                                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                                                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                                </asp:GridView>
                                        </td>
                                        <td colspan="8">
                                            <asp:GridView ID="GridView2" runat="server"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="ffckid"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                                                        <HeaderStyle ForeColor="black" Width="80px" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="fl_mc" HeaderText="����">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="�ʲ�">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle Width="30px" ForeColor="black" />
                                                    </asp:ImageField>
                                                    <asp:BoundField DataField="mc" HeaderText="Ʒ��">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpxh" HeaderText="�ͺ�">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ffwpsl" HeaderText="��������">
                                                        <HeaderStyle Width="70px" ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="right" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ckmc" HeaderText="���òֿ�">
                                                        <HeaderStyle ForeColor="black" />
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
            </tbody>
        </table>
        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
</body>
</html>
