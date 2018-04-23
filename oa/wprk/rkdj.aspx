<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rkdj.aspx.cs" Inherits="FCSystem.OA.wprk.rkdj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <title>��Ʒ���Ǽ�</title>
    <style type="text/css">
        .auto-style1 {
            height: 25px;
            width: 500px;
        }

        .auto-style2 {
            height: 22px;
            width: 1036px;
        }

        .auto-style3 {
            width: 165px;
        }

        .auto-style4 {
            width: 520px;
        }
    </style>
</head>
<body class="main">
    <form id="form1" runat="server">

        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true">
        </asp:ScriptManager>

        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157px" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);" class="auto-style3">��Ʒ���Ǽ�</td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">


                            <table style="table-layout: fixed;">
                                <tbody>
                                    <tr>
                                        <td align="left">��ⵥ�ţ�</td>
                                        <td style="width: 20%;">
                                            <asp:TextBox ID="rkdh" runat="server" Width="80%"></asp:TextBox>
                                        </td>
                                        <td align="left">���ֿ⣺</td>
                                        <td style="width: 20%;" align="left">
                                            <asp:DropDownList ID="rkck" runat="server" Width="80%">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>

                                        <td align="right">״̬��</td>
                                        <td style="width: 20%;">
                                            <asp:DropDownList ID="rkzt" runat="server" Width="100%">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                                <asp:ListItem Text="¼��" Value="¼��"></asp:ListItem>
                                                <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                                <asp:ListItem Text="�ѽᵥ" Value="�ѽᵥ"></asp:ListItem>
                                                <asp:ListItem Text="���˻�" Value="���˻�"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">¼��ʱ��(��)��</td>
                                        <td style="width: 20%;">
                                            <asp:TextBox ID="txtbegintime" runat="server" Width="80%"></asp:TextBox>

                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*"
                                                ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1"
                                                runat="server"
                                                ControlToValidate="txtbegintime"
                                                ErrorMessage="������¼��ʱ��(��)">&nbsp;
                                            </asp:RequiredFieldValidator>
                                        </td>

                                        <td align="left">¼��ʱ��(��)��</td>
                                        <td style="width: 20%;">
                                            <asp:TextBox ID="txtendtime" runat="server" Width="80%"></asp:TextBox>

                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*"
                                                ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator9"
                                                runat="server"
                                                ControlToValidate="txtendtime"
                                                ErrorMessage="������¼��ʱ��(��)">&nbsp;
                                            </asp:RequiredFieldValidator>
                                        </td>
                                        <td align="right">��ע��</td>
                                        <td align="right">
                                            <asp:TextBox ID="rkbz" runat="server"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>��Ʒ���ƣ�</td>
                                        <td>
                                            <asp:TextBox ID="tbx_wpmc" runat="server" Width="80%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" colspan="6">
                                            <asp:Button CssClass="mybutton" ID="QueryBtn" runat="server" Text="��ѯ" AccessKey="f" OnClick="Ref_Click" CausesValidation="true"></asp:Button><asp:Button ID="AddBtn" Text="����" CssClass="mybutton" runat="server" Visible="true" CausesValidation="false" /><asp:Button CssClass="mybutton" ID="ClearBtn" runat="server" Text="���" AccessKey="r" CausesValidation="false" OnClick="Clear_Click"></asp:Button><asp:Button CssClass="mybutton" ID="RefBtn" runat="server" Text="ˢ��" AccessKey="e" CausesValidation="false" OnClick="Ref_Click"></asp:Button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td><a href="productRkmx_add.aspx">Product</a></td>
                                    </tr>

                                </tbody>
                            </table>
                            <table style="table-layout: fixed;">
                                <tbody>
                                    <tr>
                                        <td style="width: 100%">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="rkdid"
                                                EmptyDataText="û�в鵽�������������ݣ�">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="rkdid" HeaderText="��ⵥID">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <FooterStyle CssClass="hidden" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="��ⵥ��">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popMod('/oa/wprk/rkdj_mod.aspx?id=<%# Eval("rkdid") %>&id2=<%# Eval("rk_gys")%>')">
                                                                <font color="#3366ff"><asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdh") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ckmc" HeaderText="���ֿ�">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="rkzt" HeaderText="״̬">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="spsj" HeaderText="����ʱ��" HtmlEncode="False">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="rkbz" HeaderText="��ע">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sprmc" HeaderText="������">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="lrsj" HeaderText="¼��ʱ��">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="spyj" HeaderText="�������">
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
                                        <td class="auto-style2">
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
                                                SubmitButtonClass="��AspNetPagerButton��"
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
