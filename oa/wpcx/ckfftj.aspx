<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ckfftj.aspx.cs" Inherits="FCSystem.OA.wpcx.ckfftj" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ֿⷢ�Ų�ѯ</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
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
                                <td align="center" style="background-image: url(../../images/bg.gif);">�ֿⷢ�Ų�ѯ</td>
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
                                        <td colspan="6">
                                            </td>
                                    </tr>
                                    <tr>
                                        <td>�ֿ⣺</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_ffck" runat="server" Width="95%">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td>��ʼ���ڣ�</td>
                                        <td>
                                            <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10"></asp:TextBox><ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td>�������ڣ�</td>
                                        <td>
                                            <asp:TextBox ID="txtendtime" runat="server" MaxLength="10"></asp:TextBox><ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">��Ʒ���ࣺ</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_fl" runat="server">
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
                                        <td colspan="5">
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="False" DisplayMode="SingleParagraph" /><asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="���뿪ʼʱ������"
                                                ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator8"
                                                runat="server"
                                                ControlToValidate="txtbegintime"
                                                ErrorMessage="�����뿪ʼʱ��">&nbsp
                                            </asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="�������ʱ������"
                                                ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1"
                                                runat="server"
                                                ControlToValidate="txtendtime"
                                                ErrorMessage="���������ʱ��">&nbsp
                                            </asp:RequiredFieldValidator>                                         
                                        </td>
                                        <td align="right">
                                            <asp:Button cssclass="mybutton" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click" CausesValidation="true" AccessKey="f" /><asp:Button cssclass="mybutton" ID="ClearBtn" runat="server" Text="���" AccessKey="r" CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                                        </td>
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
                                                    
                                                   DataKeyNames=   "ssckid"
                                                    EmptyDataText="û�в鵽�������������ݣ�">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle Width="30px" />
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="��Ʒ����">
                                                            <HeaderStyle ForeColor="Black" Width="80" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label>
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="�ʲ�">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="30px" ForeColor="black" />
                                                        </asp:ImageField>
                                                        <asp:BoundField DataField="ffwpsl" HeaderText="��������">
                                                            <HeaderStyle Width="90px" ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="right" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ckmc" HeaderText="���Ųֿ�">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <HeaderStyle ForeColor="black" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spr" HeaderText="������">
                                                            <HeaderStyle ForeColor="black" />
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

