<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zczjgh_main.aspx.cs" Inherits="FCSystem.OA.wpth_new.zczjgh_main" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�黹�Ǽ�</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�黹�Ǽ�</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <td style="text-align:right;padding-right:10px;">���ټ�����</td>
                        <td>
                            <asp:DropDownList ID="query_tj" runat="server" Width="98%" CssClass="form-control">
                                <asp:ListItem Value="ghbt" Selected="True">�黹����</asp:ListItem>
                                <asp:ListItem Value="ghsm">�黹˵��</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:TextBox ID="query_content" runat="server" Width="98%" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click" CausesValidation="False" AccessKey="f" />
                                <input type="button" name="AddBtn" value="����" class="btn btn-primary active" onclick="javascript: popWXD('zczjgh_add.aspx');" accesskey="a" />
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="Page-EmptyLine-Normal"></div>
            <div class="PageBody-Middle-MinHeight">
                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False" 
                        DataKeyNames="ghid" 
                        EmptyDataText="û�в鵽�������������ݣ�">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ghid" HeaderText="���">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="�黹����">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popMod('/oa/wpth_new/zcghMod.aspx?id=<%# Eval("ghid") %>')">
                                        <font color="#3366ff"><asp:Label ID="Label2" runat="server" Text='<%# Bind("ghdh") %>'></asp:Label></font></a>
                                </ItemTemplate>
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="�黹����">
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("ghbt") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="center" />
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ghzt" HeaderText="״̬">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lx" HeaderText="����">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sqr" HeaderText="������">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="bm_mc" HeaderText="���벿��">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="sqsj" HeaderText="����ʱ��" HtmlEncode="False">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ghsl" HeaderText="��������">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="����ͼƬ">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:HyperLink ID="cktp" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="�鿴ͼƬ" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="sprs" HeaderText="������">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spsj" HeaderText="����ʱ��">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spyj" HeaderText="�������">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ghdh" HeaderText="����">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
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
            <asp:Label ID="lblyhtid" runat="server" Visible="False"></asp:Label>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
