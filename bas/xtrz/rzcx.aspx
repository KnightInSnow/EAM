<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rzcx.aspx.cs" Inherits="FCSystem.BAS.xtrz.rzcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>��¼��־��ѯ</title>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">��¼��־��ѯ</div>
        </div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:200px;">
                    <table style="table-layout:fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">�������ţ�</td>
                            <td>
                                <asp:DropDownList ID="czbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="czbm_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td style="text-align:right;padding-right:10px;">������Ա</td>
                            <td>
                                <asp:DropDownList ID="czry" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td style="text-align:right;padding-right:10px;">ģ�����ƣ�</td>
                            <td>
                                <asp:DropDownList ID="mkbm" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;padding-right:10px;">��¼״̬��</td>
                            <td>
                                <asp:DropDownList ID="dlzt" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                    <asp:ListItem Text="��½ϵͳ" Value="��½ϵͳ"></asp:ListItem>
                                    <asp:ListItem Text="ע��ϵͳ" Value="ע��ϵͳ"></asp:ListItem>
                                    <asp:ListItem Text="�˳�ϵͳ" Value="�˳�ϵͳ"></asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td style="text-align:right;padding-right:10px;"><ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtbegintime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtbegintime" ErrorMessage="*" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtbegintime" ErrorMessage="����������ʱ��(��)">&nbsp;
                                </asp:RequiredFieldValidator>��ʼ���ڣ�
                            </td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>

                            <td style="text-align:right;padding-right:10px;"><ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtendtime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtendtime" ErrorMessage="*" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtendtime" ErrorMessage="����������ʱ��(��)">&nbsp;
                                </asp:RequiredFieldValidator>�������ڣ�
                            </td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:right;padding-right:10px;">IP��ַ��</td>
                            <td>
                                <asp:TextBox ID="ipdz" runat="server" CssClass="form-control" />
                            </td>
                            <td></td>
                            <td style="text-align:center;">
                                <asp:RadioButton ID="rbtnthisweek" 
                                    onclick="quickseldate('week');"
                                    runat="server"
                                    GroupName="quickdate"
                                    Text="����"></asp:RadioButton>
                                <asp:RadioButton ID="rbtnthismonth"   
                                    onclick="quickseldate('month');"
                                    runat="server"
                                    GroupName="quickdate"
                                    Text="����"></asp:RadioButton>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator8"
                                    runat="server"
                                    ControlToValidate="txtbegintime"
                                    ErrorMessage="�����뿪ʼ����">
                                </asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator9"
                                    runat="server"
                                    ControlToValidate="txtendtime"
                                    ErrorMessage="�������������">
                                </asp:RequiredFieldValidator>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td align="center">
                                <asp:ValidationSummary
                                    ID="ValidationSummary2"
                                    runat="server"
                                    EnableClientScript="true"
                                    ShowMessageBox="true"
                                    ShowSummary="false"></asp:ValidationSummary>
                            </td>
                        </tr>
                    </table>
                    <table style="table-layout:fixed;">
                        <td align="right">
                            <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="��ѯ" AccessKey="f" CausesValidation="true" OnClick="Query_Click"></asp:Button>
                            <asp:Button CssClass="btn btn-primary active" ID="ClearBtn" runat="server" Text="���" AccessKey="r" CausesValidation="true" OnClick="Clear_Click"></asp:Button>
                            <asp:Button ID="OutBtn" runat="server" CssClass="btn btn-primary active" Text="����" /></td>

                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="dl_id"
                    EmptyDataText="û�в鵽�������������ݣ�">
                    <Columns>
                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="dl_rq" HeaderText="��������" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}" HtmlEncode="False">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="������Ա">
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:MiniX('/oa/xxgl/minixx.aspx?id=<%# Eval("dl_id") %>&mc=<%# Eval("ui_desc") %>')"><font color="#3366FF">
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                </font></a>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="dl_id" HeaderText="��¼�ʺ�">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dl_ip" HeaderText="IP��ַ">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dl_jqm" HeaderText="������">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="dl_zt" HeaderText="��¼״̬">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="����ģ��">
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("open_mk") %>'></asp:Label>-<asp:Label ID="Label5" runat="server" Text='<%# Bind("modu_mc") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </div>

            <div class="PageBody-Bottom-Pager" style="text-align:right;">
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
                        SubmitButtonClass=��AspNetPagerButton�� SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
            </div>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
