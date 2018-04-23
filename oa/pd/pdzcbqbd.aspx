<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pdzcbqbd.aspx.cs" Inherits="FCSystem.oa.pd.pdzcbqbd" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�ʲ���ǩ����</title>
</head>

<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
        <div class="PageHead">�ʲ���ǩ����</div>
        <div class="PageBody">
            <div class="PageBody-Buttons">
                <table style="table-layout: fixed">
                    <tr>
                        <td>�ֿ����ƣ� 
                        </td>
                        <td>
                            <asp:DropDownList ID="ddl_ck" runat="server" Width="95%">
                            </asp:DropDownList>
                        </td>
                        <td>��ʼ���ڣ�
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="���뿪ʼʱ������"
                                ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator></td>
                        <td>
                            <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>�������ڣ�
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="�������ʱ������"
                                ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator></td>
                        <td>
                            <asp:TextBox ID="txtendtime" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>��Ʒ���ࣺ</td>
                        <td>
                            <asp:DropDownList ID="ddl_fl" runat="server" Width="95%">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>��Ʒ���ƣ�</td>
                        <td>
                            <asp:TextBox ID="tbx_wpmc" runat="server"></asp:TextBox>
                        </td>
                        <td>��Ʒ�ͺţ�</td>
                        <td>
                            <asp:TextBox ID="tbx_wpxh" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>��ѯ���ԣ�
                        </td>
                        <td>
                            <asp:DropDownList ID="ddl_query" runat="server" Width="95%">

                                <asp:ListItem Value="10" Text="δ�����ǩ"></asp:ListItem>
                                <asp:ListItem Value="11" Text="�Ѳ����ǩ"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>ʹ�ò��ţ�</td>
                        <td>
                            <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>ʹ���ˣ�</td>
                        <td>
                            <asp:DropDownList ID="lyr" runat="server" Width="100%" AutoPostBack="True" OnSelectedIndexChanged="lyr_SelectedIndexChanged">
                                <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>�ʲ����룺</td>
                        <td>
                            <asp:TextBox ID="tbx_zcbmfull" runat="server"></asp:TextBox>
                        </td>
                        <td>��ƷΨһ�룺 
                        </td>
                        <td>
                            <asp:TextBox ID="tbx_spwym" runat="server"></asp:TextBox>
                        </td>
                        <td>��ƷƷ�ƣ�</td>
                        <td>
                            <asp:DropDownList ID="ddl_pp" runat="server" Width="100%">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                </table>
                <table style="table-layout:fixed;">
                    <tr>
                        <td align="right">
                            <asp:Button ID="btn_usedzc" runat="server" Text="����ʹ���ʲ�" CssClass="mybutton" Visible="false" /><asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="true" CssClass="mybutton" Height="21px" OnClick="Query_Click" Text="��ѯ" /><asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="mybutton" Height="21px" OnClick="Clear_Click" Text="���" /><asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="mybutton" Height="21px" OnClick="Query_Click" Text="ˢ��" /><asp:Button ID="btn_print" runat="server" Text="��ӡ" CssClass="mybutton" Height="21px" OnClick="btn_print_Click" /><asp:Button ID="btn_out" runat="server" Enabled="false" Text="����" CssClass="mybutton" /><asp:Button ID="delete" runat="server" Text="ɾ��" CssClass="mybutton" Height="21px" OnClick="btn_delete_Click" /></td>
                    </tr>
                </table>
            </div>
            <div class="PageBody-Middle-MinHeight">
                <table style="table-layout:fixed;">
                    <tr>
                        <td>
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                <asp:GridView ID="GridView1" runat="server"
                                    OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="false"
                                    CellSpacing="1"
                                    DataKeyNames="rkmxid"
                                    BorderStyle="None"
                                    BorderWidth="0px"
                                    BackColor="Silver"
                                    EmptyDataText="û�в鵽�������������ݣ�"
                                    Width="100%" OnRowCreated="GridView1_RowCreated">
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
                                                <asp:LinkButton ID="lbtn_zcbm" runat="server" Text='<%#Eval("zcbmfull") %>' CommandArgument='<%# Eval("rkmxid")%>' OnClick="lbtn_zcbm_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="spwym" HeaderText="��ƷΨһ��">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wppp" HeaderText="��ƷƷ��">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ckmc" HeaderText="�ֿ�����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="gzrq" HeaderText="��������">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zczt" HeaderText="�ʲ�״̬">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="syr" HeaderText="ʹ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sybm" HeaderText="ʹ�ò���">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="spr" HeaderText="������">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="lysj" HeaderText="����ʱ��">
                                            <HeaderStyle Width="80px" ForeColor="Black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="dqts" HeaderText="��������">
                                            <HeaderStyle Width="80px" ForeColor="Black" />
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
                        <td>
                            <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto">
                                <asp:GridView ID="GridView2" runat="server"
                                    OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="false"
                                    CellSpacing="1"
                                    DataKeyNames="rkmxid"
                                    BorderStyle="None"
                                    BorderWidth="0px"
                                    BackColor="Silver"
                                    EmptyDataText="û�в鵽�������������ݣ�"
                                    Width="100%" OnRowCreated="GridView2_RowCreated">
                                    <Columns>
                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
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
                                        <asp:TemplateField HeaderText="���ʲ�����">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lbtn_zcbm" runat="server" Text='<%#Eval("zcbmfull") %>' CommandArgument='<%# Eval("rkmxid")%>' OnClick="lbtn_zcbm_Click"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="cfzt" HeaderText="��ֻ�ϲ�">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="spwym" HeaderText="��ƷΨһ��">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="wppp" HeaderText="��ƷƷ��">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ckmc" HeaderText="�ֿ�����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zczt" HeaderText="�ʲ�״̬">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="syr" HeaderText="ʹ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="sybm" HeaderText="ʹ�ò���">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ljzcbm" HeaderText="�������">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ljglzcbm" HeaderText="��������ʲ�">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ljglzcsyr" HeaderText="�����ʲ�ʹ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ljglzcsybm" HeaderText="�����ʲ�ʹ�ò���">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="center" />
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
                </table>
            </div>
            <div class="PageBody-Bottom-Pager">
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
            </div>
            <asp:Label ID="lblMindate" runat="server" Visible="False"></asp:Label>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
