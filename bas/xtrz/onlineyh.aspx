<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="onlineyh.aspx.cs" Inherits="FCSystem.BAS.xtrz.onlineyh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
     <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�����û�</title>

</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�����û�</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td>��ǰ����������<asp:Label ID="onlineperson" runat="server"></asp:Label>
                                �ˣ���������ϵͳ��ʱ���£����ܴ�����΢�ӳ٣���</td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False" 
                    DataKeyNames="username" 
                    EmptyDataText="û�в鵽�������������ݣ�">
                    <Columns>
                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="��¼�û�">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:MiniX('/oa/xxgl/minixx.aspx?id=<%# Eval("username") %>&mc=<%# Eval("ui_desc") %>')"><font color="#3366FF">
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("username") %>'></asp:Label>-<asp:Label ID="Label5" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                    </font></a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="logintime" HeaderText="��¼ʱ��" HtmlEncode="False">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="activetime" HeaderText="����ʱ��(��)" HtmlEncode="False">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ipaddr" HeaderText="IP��ַ">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="modu_mc" HeaderText="��ǰ�˵�λ��">
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

            <div class="PageBody-Bottom-Pager">
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
            </div>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
