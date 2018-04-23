<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ryzycx.aspx.cs" Inherits="FCSystem.OA.wpcx.ryzycx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Ա���ò�ѯ</title>
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
            <tr>
                <td style="height: 20px; background-color: #8CA1AE;">
                    <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" style="background-image: url(../../images/bg.gif);">��Ա���ò�ѯ</td>
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
                                    <td>�ֿ⣺ 
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="ddl_ck" runat="server">
                                        </asp:DropDownList>
                                    </td>
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
                                        <asp:DropDownList ID="ssfl" runat="server">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>��Ʒ���ƣ�</td>
                                    <td>
                                        <asp:TextBox ID="wpmc" runat="server"></asp:TextBox>
                                    </td>
                                    <td>��Ʒ���룺</td>
                                    <td>
                                        <asp:TextBox ID="wpbm" runat="server"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>ʹ�ò��ţ�</td>
                                    <td>
                                        <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>ʹ���ˣ�</td>
                                    <td align="left" width="25%">
                                        <asp:DropDownList ID="lyr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lyr_SelectedIndexChanged">
                                            <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_q_space"></td>
                                </tr>
                                <tr>
                                    <td colspan="3">
                                        <font color="red">ʹ��������ʹ�õ��ʲ�: ��ע:ѡ��ʹ���ˣ��ɲ鿴����ʹ�õ��ʲ�)</font>
                                    </td>
                                    <td colspan="3" align="right">
                                        <asp:Button ID="btn_usedzc" runat="server" Text="����ʹ���ʲ�" cssclass="mybutton" Visible="false" /><asp:Button ID="btn_print" runat="server" Text="��ӡ" cssclass="mybutton" Height="21px" OnClick="btn_print_Click" /><asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Height="21px" OnClick="Query_Click" Text="��ѯ" /><asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" cssclass="mybutton" Height="21px" OnClick="Clear_Click" Text="���" /><asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" cssclass="mybutton" Height="21px" OnClick="Query_Click" Text="ˢ��" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="td_q_space"></td>
                                </tr>
                        </table>
                        <table style="table-layout:fixed;">
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="lyid"
                                            
                                            EmptyDataText="û�в鵽�������������ݣ�"
                                            >
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
                                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="�ʲ�����">
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lbtn_zcbm" runat="server" Text='<%#Eval("zcbm") %>' OnClick="lbtn_zcbm_Click"></asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wppp" HeaderText="Ʒ��">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ffwpsl" HeaderText="��������">
                                                    <HeaderStyle Width="70px" ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lybm" HeaderText="ʹ�ò���">
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
                                                <asp:BoundField DataField="ffsj" HeaderText="����ʱ��">
                                                    <HeaderStyle Width="80px" ForeColor="Black" />
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
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblMindate" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
