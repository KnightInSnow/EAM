<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wxsbj.aspx.cs" Inherits="FCSystem.OA.wpwx.wxsbj" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>ά�ޱ���</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">ά�ޱ���</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Label ID="lab_sm" runat="server" Text=""></asp:Label>
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr width="100%">
                                        <td align="left" width="8%">ά������:</td>

                                        <td align="left" width="15%">
                                            <asp:TextBox ID="tbx_name" runat="server"></asp:TextBox>
                                        </td>
                                        <td align="left" width="8%">ά��״̬:</td>
                                        <td width="15%" class="">
                                          <asp:DropDownList ID="zt" runat="server" Width="100%">
                                                <asp:ListItem Value="" Text="" Selected="True"></asp:ListItem>
                                                <asp:ListItem Value="1" Text="�ѱ���"></asp:ListItem>
                                                <asp:ListItem Value="2" Text="ѯ����"></asp:ListItem>
                                              <asp:ListItem Value="3" Text="�����"></asp:ListItem>
                                              <asp:ListItem Value="4" Text="�ѽӵ�δ���"></asp:ListItem>
                                          <%--     <asp:ListItem Value="4" Text="�ѷ���"></asp:ListItem>--%>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="left" class="" width="8%">&nbsp;</td>
                                        <td align="left" width="5%"></td>
                                        <td width="30%" align="right">
                                           <asp:Button ID="btn_del" runat="server" Text="��ѯ" cssclass="mybutton" OnClick="btn_Refresh_Click" /><asp:Button ID="btn_refresh" runat="server" Text="ˢ��" cssclass="mybutton" OnClick="btn_Refresh_Click" /><asp:Button ID="btnClear" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Text="���" OnClick="btnClear_Click" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_q_space">
                                            </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table id="search2" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="GridView1_RowDataBound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="wxd_id"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                   
                                                    <asp:TemplateField HeaderStyle-ForeColor="Black" HeaderText="ά������">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                        
                                                             <a href="#" onclick="javascript:popAdd2('wxsbj_mx.aspx?id=<%#Eval("wxd_id")%>&id2=<%#Eval("wxzt")%>')"><font color="#3366ff"><asp:Label ID="lbljhmc" runat="server" Text='<%#Bind("wxd_name") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="�����Ա">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="ui_yddh" HeaderText="��ϵ��ʽ">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxzt" HeaderText="ά��״̬">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxdkssj" HeaderText="����ʱ��">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxd_sm" HeaderText="��ע˵��">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
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
                                    <td class="td_q_space"></td>
                                </tr>

                                <tr>
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
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
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged"></webdiyer:AspNetPager>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
         <asp:Label ID="wxsid" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>

