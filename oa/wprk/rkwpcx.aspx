<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkwpcx.aspx.cs" Inherits="FCSystem.OA.wprk.rkwpcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>



<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet">
    <title>�ڿ��ʲ���ѯ</title>
</head>

<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�ڿ��ʲ���ѯ</div>
        </div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <!--ҳ������򲿷�-->
                <div class="PageBody-Top-Inputs" style="height:130px;">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">�ʲ�Ψһ��ţ�</td>
                            <td>
                                <asp:TextBox ID="zcbmfull" runat="server" OnTextChanged="zcbmfull_TextChanged" CssClass="form-control"></asp:TextBox>
                            </td>

                            <td style="text-align:right;padding-right:10px;">���ڲֿ⣺</td>
                            <td>
                                <asp:DropDownList ID="rkck" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>

                            <td style="text-align:right;padding-right:10px;">״̬��</td>
                            <td>
                                <asp:DropDownList ID="rkzt" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="¼��" Value="¼��"></asp:ListItem>
                                    <asp:ListItem Text="������" Value="������"></asp:ListItem>
                                    <asp:ListItem Text="�ѽᵥ" Value="�ѽᵥ"></asp:ListItem>
                                    <asp:ListItem Text="���˻�" Value="���˻�"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align:right;padding-right:10px;">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtbegintime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtbegintime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                ¼��ʱ��(��)��
                            </td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>

                            <td style="text-align:right;padding-right:10px;">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*"
                                    ControlToValidate="txtendtime" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                ¼��ʱ��(��)��
                            </td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" CssClass="form-control"></asp:TextBox>

                            </td>
                            <td style="text-align:right;padding-right:10px;">��ע��</td>
                            <td>
                                <asp:TextBox ID="rkbz" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:right;padding-right:10px;">�ʲ����ƣ�</td>
                            <td>
                                <asp:TextBox ID="tbxzcmc" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">¼���ˣ�</td>
                            <td>
                                <asp:DropDownList ID="sqr" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value="" Selected="true"></asp:ListItem>
                                </asp:DropDownList></td>
                        </tr>
                    </table>
                </div>
                <!--��ť����--->
                <div class="PageBody-Top-Buttons" style="margin-top:10px;">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="��ѯ" AccessKey="f" OnClick="Ref_Click" CausesValidation="False"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="ClearBtn" runat="server" Text="���" AccessKey="r" CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="ˢ��" AccessKey="e" CausesValidation="false" OnClick="Ref_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>
            <!--ҳ���񲿷�-->
            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
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
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�Ψһ���">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zcmc" HeaderText="�ʲ�����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="��ⵥ��">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:popMod('/oa/wprk/rkcx_view.aspx?id=<%# Eval("rkdid") %>')"><font color="#3366ff"> <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdh") %>'></asp:Label></font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="oldid" HeaderText="��ƷΨһ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckmc" HeaderText="���ֿ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zcbz" HeaderText="��ע">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rkzt" HeaderText="״̬">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lrrmc" HeaderText="¼����">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lrsj" HeaderText="¼��ʱ��" HtmlEncode="False">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="sprmc" HeaderText="������">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="spsj" HeaderText="����ʱ��" HtmlEncode="False">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="��ͬ">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="hl_ht" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ͼƬ" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="����ƾ֤">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="hl_pz" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ͼƬ" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="��������">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <asp:HyperLink ID="hl_gmsq" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ͼƬ" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="spyj" HeaderText="�������">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gysmc" HeaderText="��Ӧ��">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lxdh" HeaderText="��ϵ��ʽ">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
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
                    SubmitButtonClass=��AspNetPagerButton��
                    SubmitButtonText="Go">
                </webdiyer:AspNetPager>
            </div>
        </div>
    </form>
</body>
</html>
