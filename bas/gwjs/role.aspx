<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="role.aspx.cs" Inherits="FCSystem.BAS.gwjs.role" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>��ɫά��</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">��ɫά��</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">���ټ�����</td>
                            <td>
                                <asp:DropDownList ID="query_tj" runat="server" Width="95%" CssClass="form-control">
                                    <asp:ListItem Value="role_name" Selected="True">��ɫ����</asp:ListItem>
                                    <asp:ListItem Value="role_comm">��ע</asp:ListItem>
                                </asp:DropDownList>

                            </td>
                            <td>
                                <asp:TextBox ID="query_content" runat="server" CssClass="form-control"></asp:TextBox></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click" CausesValidation="False" AccessKey="f" />
                                <input type="button" name="AddBtn" value="����" runat="server" id="btnAddnew" class="btn btn-primary active" onclick="javascript: popAdd('role_view.aspx');" accesskey="a" />
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="Page-EmptyLine-Normal"></div>
            <div class="PageBody-Middle-MinHeight">
                <td>

                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False" 
                        DataKeyNames="role_id" 
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
                            <asp:BoundField DataField="role_id" HeaderText="��ɫ����">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="����">
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popMod('/bas/gwjs/role_view.aspx?id=<%# Eval("role_id") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("role_name") %>'></asp:Label></font></a>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="role_comm" HeaderText="��ע">
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
            </div>
            <div class="PageBody-Bottom-Pager" style="text-align:right;">
                <td style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                        OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left"
                        ShowInputBox="Auto"
                        AlwaysShow="false"
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
            </div>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
