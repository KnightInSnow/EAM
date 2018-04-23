<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zchistorycx.aspx.cs" Inherits="FCSystem.OA.wpcx.zchistorycx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�ʲ���ʷ��ѯ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�ʲ���ʷ��ѯ</div>
        </div>
        <!--ҳ������򲿷�-->
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="height:170px;">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">�ֿ����ƣ�</td>
                            <td>
                                <asp:DropDownList ID="ssck" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                ��ʼ���ڣ�
                            </td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp;</asp:RegularExpressionValidator>
                                �������ڣ�
                            </td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;padding-right:10px;">��Ʒ���ࣺ</td>
                            <td>
                                <asp:DropDownList ID="ssfl" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">��Ʒ���ƣ�</td>
                            <td>
                                <asp:TextBox ID="wpmc" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">��Ʒ�ͺţ�</td>
                            <td>
                                <asp:TextBox ID="wpxh" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;padding-right:10px;">�ʲ����룺</td>
                            <td>
                                <asp:TextBox ID="zcbmfull" runat="server" OnTextChanged="zcbmfull_TextChanged" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">��ƷΨһ�룺 
                            </td>
                            <td>
                                <asp:TextBox ID="tbx_spwym" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">��ƷƷ�ƣ�</td>
                            <td>
                                <asp:DropDownList ID="wppp" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;padding-right:10px;">ʹ�ò��ţ�</td>
                            <td>
                                <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">ʹ���ˣ�</td>
                            <td>
                                <asp:DropDownList ID="lyr" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lyr_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="��ѯ" />
                                <asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="btn btn-primary active" OnClick="Clear_Click" Text="���" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="ˢ��" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False"
                        DataKeyNames="zcbmfull"
                        EmptyDataText="û�в鵽�������������ݣ�">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="�ʲ�����">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popAdd2('/oa/wpcx/Hotkeys.aspx?id=<%#Eval("zcbmfull") %>&id2=<%#Eval("wpmc")%>')"><font color="#3366ff"><asp:Label id="lblzc" runat="server" text='<%#Bind("zcbmfull") %>'>'></asp:Label></font></a>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wppp" HeaderText="��ƷƷ��">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="yn_gdzc" HeaderText="�ʲ�����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <%--   <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="�Ƿ�̶��ʲ�">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="30px" ForeColor="black" />
                                                        </asp:ImageField>--%>

                            <asp:BoundField DataField="zczt" HeaderText="�ʲ�״̬">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="ʹ����">
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <asp:Label ID="Labellyrname" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="lybm" HeaderText="ʹ�ò���">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ckmc" HeaderText="�ֿ�����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gysmc" HeaderText="��Ʒ��Ӧ��">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lxdh" HeaderText="��Ӧ�̵绰">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="oldid" HeaderText="��ƷΨһ��">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="��ⵥ">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popMod('/oa/wprk/rkcx_view.aspx?id=<%# Eval("rkdid") %>')"><font color="#3366ff"><asp:Label id="lblrkd" runat="server" text='<%#Bind("rkdh") %>'>'></asp:Label></font></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="���õ�">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popAdd2('/oa/wply/wply_mod.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label id="lbllyd" runat="server" text='<%#Bind("lydh") %>'>'></asp:Label></font></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%--  <asp:BoundField DataField="ffsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                            <HeaderStyle Width="80px" ForeColor="Black" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spr" HeaderText="������">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>--%>
                        </Columns>
                        <RowStyle CssClass="GridViewRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                    </asp:GridView>
                </asp:Panel>
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
                    SubmitButtonClass=��AspNetPagerButton��
                    SubmitButtonText="Go">
                </webdiyer:AspNetPager>
            </div>
            <asp:Label ID="zcbm" runat="server" Text="" Visible="false"></asp:Label>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>

