<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="gyswh.aspx.cs" Inherits="FCSystem.OA.ckgl.gyswh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Ӧ��ά��</title>
     <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    
</head>

<body class="main">
    <form runat="server">
        <!--ҳͷ����-->
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">��Ӧ��ά��</div>
        </div>
        <!--���ټ�������򲿷�-->
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs" style="padding-top:20px;">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">���ټ�����</td>
                            <td>
                                <asp:DropDownList ID="query_tj" runat="server" CssClass="form-control">
                                    <asp:ListItem Value="gysmc">��Ӧ������</asp:ListItem>
                                    <asp:ListItem Value="mc">��Ӧ�����</asp:ListItem>
                                    <asp:ListItem Value="gyszt">��Ӧ��״̬</asp:ListItem>
                                    <asp:ListItem Value="lxr">��ϵ��</asp:ListItem>
                                    <asp:ListItem Value="lxdh">��ϵ�绰</asp:ListItem>
                                    <asp:ListItem Value="czdh">����绰</asp:ListItem>
                                    <asp:ListItem Value="dz">��ַ</asp:ListItem>
                                    <asp:ListItem Value="web">��ַ</asp:ListItem>
                                    <asp:ListItem Value="mail">�����ʼ�</asp:ListItem>
                                    <asp:ListItem Value="bz">��ע</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:left;">
                                <asp:TextBox ID="query_content" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <!--��ť����-->
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed">
                        <tr>
                            <td align="right">
                                <asp:Button ID="QueryBtn" runat="server" Text="��ѯ" OnClick="Query_Click" CausesValidation="False" AccessKey="f" CssClass="btn btn-primary active"/>
                                <input  id="addnew" type="button" name="AddBtn" value="����" runat="server" onclick="javascript: popAdd('gyswh_view.aspx');" accesskey="a" class="btn btn-primary active"/>
                                <asp:Button CssClass="btn btn-primary active" ID="UseBtn" runat="server" Text="����" OnClick="Use_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="StopBtn" runat="server" Text="����" OnClick="Stop_Click"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" AccessKey="d" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
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
                        DataKeyNames="gys_tid"
                        EmptyDataText="û�в鵽�������������ݣ�">
                        <Columns>
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle Width="30px"></HeaderStyle>
                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                <HeaderTemplate>
                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="gys_tid" HeaderText="����">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="��Ӧ������">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popAdd2('/oa/ckgl/gyswh_view.aspx?id=<%# Eval("gys_tid") %>');"><font color="#3366ff"><asp:Label ID="Labelgysmc" runat="server" Text='<%# Bind("gysmc") %>'></asp:Label></font></a>
                                </ItemTemplate>
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="bm_mc" HeaderText="��������">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mc" HeaderText="���">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="gyszt" HeaderText="״̬">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lxr" HeaderText="��ϵ��">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lxdh" HeaderText="��ϵ�绰">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="czdh" HeaderText="����绰">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="mail" HeaderText="�����ʼ�">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="dz" HeaderText="��ַ">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
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
        </div>

        <div class="PageFoot"></div>

    </form>
</body>
</html>
