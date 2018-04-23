<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_zcmx_t.aspx.cs" Inherits="FCSystem.OA.report_table.report_zcmx_t" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�ʲ���ϸ�˱���</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
        </asp:ScriptManager>
        <div class="PageHead">�ʲ���ϸ�˱���</div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td>ѡ��ֽ�ſ�ȣ�
                            </td>
                            <td>
                                <asp:DropDownList ID="papersize" runat="server" AutoPostBack="true"  OnSelectedIndexChanged="ChangeSize_Selected">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>��ⵥ�ţ�</td>
                            <td>
                                <asp:TextBox ID="rkdh" runat="server"></asp:TextBox>
                            </td>
                            <td>�ʲ����룺</td>
                            <td>
                                <asp:TextBox ID="zcbmfull" runat="server"></asp:TextBox>
                            </td>
                            <td>���ʷ��ࣺ</td>
                            <td>
                                <asp:TextBox ID="zclx" runat="server"></asp:TextBox>
                            </td>
                        </tr>


                        <tr>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" CssClass="MyCalendar" Format="yyyy-MM-dd" TargetControlID="txtbegintime">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtbegintime" ErrorMessage="*" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtbegintime" ErrorMessage="����������ʱ��(��)">&nbsp;
                                </asp:RequiredFieldValidator>��ʼ���ڣ�
                            </td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" CssClass="MyCalendar" Format="yyyy-MM-dd" TargetControlID="txtendtime">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtendtime" ErrorMessage="*" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="txtendtime" ErrorMessage="����������ʱ��(��)">&nbsp;
                                </asp:RequiredFieldValidator>�������ڣ�
                            </td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" MaxLength="10"></asp:TextBox>
                            </td>
                            <td>������룺</td>
                            <td>
                                <asp:TextBox ID="lxid" runat="server"></asp:TextBox>
                            </td>


                        </tr>
                        <tr>
                            <td>�������ƣ�</td>
                            <td>
                                <asp:TextBox ID="wpmc" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" CssClass="mybutton" OnClick="Query_Click" Text="��ѯ" />
                                <asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="mybutton" OnClick="Clear_Click" Text="���" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="mybutton" OnClick="Query_Click" Text="ˢ��" />
                                <asp:Button ID="Printbt" runat="server" AccessKey="p" CausesValidation="False" CssClass="mybutton" OnClick="Printbt_Click" Text="��ӡ����" />
                                <asp:Button ID="grtoexcl" runat="server" AccessKey="e" CausesValidation="False" CssClass="mybutton" OnClick="Export_Click" Text="����Excel��" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <div class="Page-EmptyLine-Normal"></div>

                <!--startprint-->
                <asp:Panel ID="Panel2" runat="server" align="center">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td>
                                <h3 align="center">�ʲ���ϸ�˱�
                                </h3>
                            </td>
                        </tr>
                        <tr align="center">
                            <td>
                                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                    AllowPaging="false"
                                    AutoGenerateColumns="False"
                                    DataKeyNames="fl_tid"
                                    EmptyDataText="��ʱû�еǼ��κ���Ʒ�����Ϣ"
                                    OnRowDataBound="OnRow_Bound"
                                    ShowFooter="True">
                                    <Columns>
                                        <asp:TemplateField HeaderImageUrl="~/images/refresh.gif" HeaderText="���">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                            </ItemTemplate>
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle Width="30px" />
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="fl_tid" HeaderText="�ʲ����ʹ���">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="fl_mc" HeaderText="�ʲ���������">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="spsj" HeaderText="����">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="rkdh" HeaderText="��ⵥ��">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zcxx" HeaderText="�̶��ʲ�">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zjsl" HeaderText="����">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="zjje" HeaderText="���">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jssl" HeaderText="����">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jsje" HeaderText="���">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jcsl" HeaderText="����">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="jcje" HeaderText="���">
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                                    <RowStyle CssClass="GridViewRowStyle" />
                                    <FooterStyle CssClass="GridViewFooterStyle" />
                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                </asp:GridView>
                        </tr>
                    </table>
                </asp:Panel>
                <!--endprint-->
            </div>
            <div class="PageBody-Bottom-Pager">
                <tr>
                    <td style="height: 22px">
                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" AlwaysShow="true" CssClass="page_text" CustomInfoHTML="&lt;font color='#333333'&gt;�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ&lt;/font&gt;" CustomInfoSectionWidth="250px" FirstPageText="��ҳ" InputBoxClass="AspNetPagerInputBox" LastPageText="ĩҳ" NextPageText="��ҳ" NumericButtonCount="10" OnPageChanged="AspNetPager1_PageChanged" PrevPageText="��ҳ" ShowBoxThreshold="11" ShowCustomInfoSection="left" ShowInputBox="Auto" SubmitButtonClass=��AspNetPagerButton�� SubmitButtonText="Go">
                        </webdiyer:AspNetPager>
                    </td>
                </tr>
            </div>
            <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>
</html>

