<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="lyqr.aspx.cs" Inherits="FCSystem.OA.wply.lyqr" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <title>����ȷ��</title>
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157px" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">����ȷ��</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />

                            <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true"
                                EnableScriptLocalization="true">
                            </asp:ScriptManager>

                            <table id="Table1" cellspacing="1" cellpadding="1" align="center" border="0" width="100%">
                                <tbody>

                                    <tr>
                                        <td align="left">���õ��ţ�</td>
                                        <td width="20%">
                                            <asp:TextBox ID="lydh" runat="server" Width="80%"></asp:TextBox>
                                        </td>


                                        <td align="left">���Ųֿ⣺</td>
                                        <td width="20%">
                                            <asp:DropDownList ID="ffck" runat="server" Width="80%">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>


                                        <td align="right">���õ�״̬��</td>
                                        <td width="20%">
                                            <asp:DropDownList ID="lyzt" runat="server" Width="100%">
                                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                                <asp:ListItem Text="�ѽᵥ" Value="�ѽᵥ"></asp:ListItem>
                                                <asp:ListItem Text="���˻�" Value="���˻�"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="left">¼��ʱ��(��)��</td>
                                        <td class="auto-style1">
                                            <asp:TextBox ID="txtbegintime" runat="server" Width="80%"></asp:TextBox>

                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*"
                                                ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>

                                        </td>
                                        <td align="left">¼��ʱ��(��)��</td>
                                        <td class="auto-style1">
                                            <asp:TextBox ID="txtendtime" runat="server" Width="80%"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*"
                                                ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                        </td>
                                        <td align="left"></td>
                                        <td></td>

                                    </tr>

                                    <tr>
                                        <td>
                                            <td></td>
                                        </td>

                                        <td colspan="2" align="left" style="visibility: hidden">
                                            <font color="red">ֻ��ʾ���������Ĳֿ��µ����Ǽ���Ϣ��</font>
                                        </td>


                                        <td align="right">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td align="right">
                                            <asp:Button CssClass="mybutton" ID="QueryBtn" runat="server" Text="��ѯ" AccessKey="f" OnClick="Ref_Click" CausesValidation="False" Width="50px"></asp:Button><asp:Button CssClass="mybutton" ID="ClearBtn" runat="server" Text="���" AccessKey="r" CausesValidation="false" OnClick="Clear_Click" Width="50px"></asp:Button><asp:Button CssClass="mybutton" ID="RefBtn" runat="server" Text="ˢ��" AccessKey="e" CausesValidation="false" OnClick="Ref_Click" Width="50px"></asp:Button>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td></td>
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
                                                    
                                                   DataKeyNames=   "lyid"
                                                    BorderStyle="None"
                                                    BorderWidth="0px"
                                                    BackColor="Silver"
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
                                                        <asp:BoundField DataField="lyid" HeaderText="���õ�ID">
                                                            <HeaderStyle CssClass="hidden" />
                                                            <ItemStyle CssClass="hidden" />
                                                            <FooterStyle CssClass="hidden" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="cklx" HeaderText="����">
                                                            <HeaderStyle Width="60px" ForeColor="black" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="���õ���">
                                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <ItemTemplate>
                                                                <%--<a href="#" onclick="javascript:popMod('/oa/wply/lyqr_modnew.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Label2" runat="server" Text='<%# Bind("lydh") %>'></asp:Label></font></a>--%>
                                                                <asp:LinkButton ID="lbtn_redirect" runat="server" CommandArgument='<%# Eval("yngdzc")%>' CommandName='<%# Eval("lyid") %>' Text='<%# Bind("lydh") %>' OnClick="lbtn_redirect_Click"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="lybt" HeaderText="���ñ���" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle ForeColor="black" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="lyzt" HeaderText="״̬">
                                                            <HeaderStyle ForeColor="black" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="������">
                                                            <HeaderStyle ForeColor="black" HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <asp:Label ID="Labelsqr" runat="server" Text='<%# Eval("ui_desc") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="sqsj" HeaderText="����ʱ��" HtmlEncode="False">
                                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="lysm" HeaderText="��ע">
                                                            <HeaderStyle ForeColor="black" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spr" HeaderText="������" HeaderStyle-HorizontalAlign="Center">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spsj" HeaderText="����ʱ��" HtmlEncode="False">
                                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                        </asp:BoundField>
                                                        <asp:TemplateField HeaderText="��������">
                                                            <HeaderStyle ForeColor="Black" HorizontalAlign="Center" />
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                                <a href="#" onclick="window.open('../../Showht.aspx?id=<%# Eval("bh") %>&id2=lydj',null,'width=700,height=550,scrollbars=yes,resizable=yes')">
                                                                    <asp:Label ID="lblbh" runat="server" Text='<%# Bind("bh") %>'><font color="#3366ff"></asp:Label></a>
                                                            </ItemTemplate>
                                                            <ControlStyle CssClass="navigate" />
                                                        </asp:TemplateField>
                                                        <asp:BoundField DataField="spyj" HeaderText="�������">
                                                            <HeaderStyle ForeColor="black" HorizontalAlign="Center" />
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
