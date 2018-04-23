<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcrkdj.aspx.cs" Inherits="FCSystem.OA.wprk.zcrkdj" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>


<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <title>���Ǽ�</title>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />


</head>

<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true">
        </asp:ScriptManager>

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">���Ǽ�</div>
        </div>
        <!--����򲿷�--->
        <div class="PageBody">
            <div class="PageBody-Top">

                <div class="PageBody-Top-Inputs" style="height:130px;">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">��ⵥ�ţ�</td>
                            <td>
                                <asp:TextBox ID="rkdh" runat="server" OnTextChanged="rkdh_TextChanged" CssClass="form-control"></asp:TextBox>
                            </td>

                            <td style="text-align:right;padding-right:10px;">���ֿ⣺</td>
                            <td>
                                <asp:DropDownList ID="rkck" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">״̬��</td>
                            <td>
                                <asp:DropDownList ID="rkzt" runat="server" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
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
                                ¼��ʱ��(��)��
                            </td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" Style="z-index: 1000" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;padding-right:10px;">
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtendtime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
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
                            <td style="text-align:right;padding-right:10px;">�ʲ����룺</td>
                            <td>
                                <asp:TextBox ID="tbx_zcbm" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
                <!--��ť����--->
                <div class="PageBody-Top-Buttons" style="margin-top:10px;">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td colspan="6" align="right">
                                <asp:FileUpload ID="FileToRK" runat="server" Visible="False" CssClass="btn btn-primary active" />
                                <asp:Button ID="btnBatch" Visible="False" CssClass="btn btn-primary active" runat="server" Text="�������" OnClick="btnBatch_Click" />
                                <asp:Button ID="btnBatchRK" runat="server" CssClass="btn btn-primary active" Text="�������" Visible="False" OnClick="btnBatchRK_Click" />
                                <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="��ѯ" AccessKey="f" OnClick="Ref_Click" CausesValidation="true"></asp:Button>
                                <asp:Button ID="AddBtn" Text="����" CssClass="btn btn-primary active" runat="server" Visible="true" CausesValidation="false" />
                                <asp:Button CssClass="btn btn-primary active" ID="ClearBtn" runat="server" Text="���" AccessKey="r" CausesValidation="false" OnClick="Clear_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="ˢ��" AccessKey="e" CausesValidation="true" OnClick="Ref_Click"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

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
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="��ⵥ��">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:popMod('/oa/wprk/zcrkdj_mod.aspx?id=<%# Eval("rkdid") %>');">
                                    <font color="#3366ff"><asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdh") %>'></asp:Label></font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="ckmc" HeaderText="���ֿ�">
                            <HeaderStyle Width="120px" ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rkzt" HeaderText="״̬">
                            <HeaderStyle Width="55px" ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mc" HeaderText="�ʲ���Դ">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lrsj" HeaderText="¼��ʱ��" HtmlEncode="False">
                            <HeaderStyle Width="80px" ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rkbz" HeaderText="��ע">
                            <HeaderStyle ForeColor="black" />
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
                        <asp:BoundField DataField="sprmc" HeaderText="������">
                            <HeaderStyle Width="80px" ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="spsj" HeaderText="����ʱ��">
                            <HeaderStyle Width="80px" ForeColor="Black" />
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
                    SubmitButtonClass="��AspNetPagerButton��"
                    SubmitButtonText="Go">
                </webdiyer:AspNetPager>
            </div>
        </div>





        <div class="PageFoot"></div>
    </form>
</body>
</html>
