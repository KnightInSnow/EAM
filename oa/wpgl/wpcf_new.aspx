<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpcf.aspx.cs" Inherits="FCSystem.OA.wpgl.wpcf" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>ѡ���ʲ������ʲ����й�ѡ���ɣ�</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>



</head>






<script language="javascript">
    function chuan(mobj)
        //˫����ѡ���е����Ƹ�ֵ��ĸ���ڲ��ر�,wpbm_view�и��������� wpbm�и����Ǳ���
    {
        window.opener.document.body.all.wpbm_view.value = mobj.childNodes[1].innerText;
        window.opener.document.body.all.wpbm.value = mobj.childNodes[0].innerText;
        window.close();
    }

    function chuan1(mobj) {
        window.opener.document.body.all.wpbm.value = mobj.childNodes[0].innerText;
        window.close();
    }

    function chuan_null()
        //��ĸ�ı����ÿղ��رգ���ʱ����
    {
        window.opener.document.body.all.wpbm_view.value = "";
        window.opener.document.body.all.wpbm.value = "";
        window.close();
    }
</script>

<body class="main">

    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>

                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">�ʲ����</td>
                            </tr>
                        </table>
                    </td>
                </tr>










                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" align="center">
                            <br>
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr>
                                        <td width="10%"></td>
                                        <td align="right" width="8%">��Ҫ����ʲ����룺</td>
                                        <td align="center" width="10%">
                                            <asp:TextBox ID="cf_zcbm" runat="server" AutoPostBack="true" OnTextChanged="zcbm_content_c_TextChanged"></asp:TextBox>
                                        </td>
                                        <td align="right" width="10%"></td>
                                        <td align="left" width="10%">

                                            <asp:DropDownList ID="query_c" runat="server" Width="100%">
                                                <asp:ListItem Value="f.ui_id" Selected="True">ʹ���˴���</asp:ListItem>
                                                <asp:ListItem Value="f.ui_desc">ʹ��������</asp:ListItem>
                                                <asp:ListItem Value="c.wpmc">�ʲ�����</asp:ListItem>
                                                <asp:ListItem Value="c.wptxm">������</asp:ListItem>
                                                <asp:ListItem Value="d.mc">�ʲ�Ʒ��</asp:ListItem>
                                                <asp:ListItem Value="c.wpxh">�ʲ��ͺ�</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="center" width="10%">
                                            <asp:TextBox ID="query_content_c" runat="server" AutoPostBack="true" OnTextChanged="query_content_c_TextChanged"></asp:TextBox>
                                        </td>
                                        <td align="right" width="13%">
                                            <asp:Button cssclass="mybutton" ID="QueryBtn_y" runat="server" Text="��ѯ�ʲ�" OnClick="Query_Click" CausesValidation="False" AccessKey="f" />
                                        </td>
                                        <td width="9%"></td>

                                    </tr>
                                    <tr>
                                        <td width="2%"></td>
                                        <td colspan="2" style="height: 25px">
                                            <font color="red"><%=tishi%></font>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>

                            <table id="Table1" cellspacing="0" cellpadding="0" width="90%" align="center" border="0">

                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="zcbmfull_z"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="��ʱû���ʲ���Ϣ"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="zcbmfull_z" HeaderText="�ʲ�����">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:TemplateField>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="btn_cf" runat="server" Text="���" OnClick="onbtncf_click" CommandArgument='<%# Container.DataItemIndex%>' />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="wpmc_z" HeaderText="�ʲ�����">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="zcsm" HeaderText="�ʲ�˵��">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wppp_z" HeaderText="�ʲ�Ʒ��">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpxh_z" HeaderText="�ʲ��ͺ�">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpgg_z" HeaderText="�ʲ����">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <%--<asp:TemplateField HeaderText="����">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_ghview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("yngh") %>'></asp:Label></font></a>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_bfview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelbf" runat="server" Text='<%# Bind("ynbf") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>--%>
                                                <asp:BoundField DataField="ui_desc_z" HeaderText="ʹ����">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ui_id_z" HeaderText="ʹ���˴���">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sybm_z" HeaderText="ʹ�ò���">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <%--  <asp:BoundField DataField="zfzt_z" HeaderText="����״̬">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>     --%>
                                            </Columns>
                                            <RowStyle CssClass="GridViewRowStyle" />
                                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                            <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                        </asp:GridView>
                                    </td>
                                </tr>

                                <tr>
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
                                </tr>

                            </table>


                            <table id="Table3" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">


                                <tr>
                                    <td></td>
                                    <td width="30%"></td>
                                    <td width="10%"></td>
                                    <td align="right" width="30%">
                                        <asp:Button cssclass="mybutton" ID="flesh" runat="server" Text="�鿴��ֺϲ���ʷ" Visible="false" /><asp:Button cssclass="mybutton" ID="OK_cf" runat="server" Text="�����ֽ���"  Visible="false"></asp:Button>

                                    </td>
                                    <td width="30%"></td>
                                    <td width="4%"></td>

                                </tr>

                                <tr>
                                    <td width="2%"></td>
                                    <td colspan="2" style="height: 25px">
                                        <font color="red"><%=tishi_s%></font>
                                    </td>
                                </tr>

                                
                                    <tr>
                                        <td>
                                            <asp:GridView ID="GridView2" runat="server"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull_s"
                                                EmptyDataText="��ʱû���ʲ���Ϣ"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>
                                                    <%-- <asp:TemplateField>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <HeaderTemplate>
                                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="del_s" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>    --%>
                                                    <asp:TemplateField HeaderText="���ʲ�����">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <font color="black"><asp:Label ID="Label_z" runat="server" Text='<%# Bind("zzcbm_s") %>'></asp:Label></font></a>                       
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="�����ʲ�����">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <font color="black"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("zcbmfull_s") %>'></asp:Label></font></a>                       
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="wpmc_s" HeaderText="�ʲ�����">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wppp_s" HeaderText="�ʲ�Ʒ��">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpxh_s" HeaderText="�ʲ��ͺ�">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpgg_s" HeaderText="�ʲ����">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <%--<asp:TemplateField HeaderText="����">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_ghview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("yngh") %>'></asp:Label></font></a>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_bfview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelbf" runat="server" Text='<%# Bind("ynbf") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>--%>
                                                    <asp:BoundField DataField="ui_desc_s" HeaderText="ʹ����">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_ssbm_s" HeaderText="ʹ�ò���">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zfzt_s" HeaderText="����״̬">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>

                                                </Columns>
                                                <RowStyle CssClass="GridViewRowStyle" />
                                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                            </asp:GridView>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="height: 22px">
                                            <webdiyer:AspNetPager ID="AspNetPager2" runat="server"
                                                OnPageChanged="AspNetPager2_PageChanged"
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
                                    </tr>
                                </table>



                                <tr>
                                    <td></td>
                                    <td align="center">

                                        <asp:ValidationSummary
                                            ID="ValidationSummary1"
                                            runat="server"
                                            EnableClientScript="true"
                                            ShowMessageBox="true"
                                            ShowSummary="false"></asp:ValidationSummary>


                                    </td>
                                </tr>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Label ID="chaxunlx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="QueryContent" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="zcbmfull" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
