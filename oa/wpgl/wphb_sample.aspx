<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wphb_sample.aspx.cs" Inherits="FCSystem.OA.wpgl.wphb_sample" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�ʲ��ϲ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript">
        //function SetFocus() {
        //    var obj = document.getElementById("wpmc");  //��ʼ�����ù�꽹��
        //    if (obj.value == "") {
        //        obj.focus();
        //    }
        //    else
        //        obj.select();
        //}
    </script>
</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">�ʲ��ϲ�</td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table id="Table1" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">
                            <tbody>

                                <tr>
                                    <td width="3%"></td>

                                    <td align="right" width="20%">��Ҫ�ϲ��ʲ����룺</td>
                                    <td align="center" width="10%">
                                        <asp:TextBox ID="hbszcbm" runat="server" AutoPostBack="true" OnTextChanged="QueryContents_changed"></asp:TextBox>
                                    </td>
                                    <td align="right" width="8%"></td>

                                    <td align="left" width="15%">
                                        <asp:DropDownList ID="query_s" runat="server" Width="95%">
                                            <asp:ListItem Value="i.ui_id" Selected="True">ʹ���˴���</asp:ListItem>
                                            <asp:ListItem Value="i.ui_desc">ʹ��������</asp:ListItem>
                                            <asp:ListItem Value="e.wpmc">�ʲ�����</asp:ListItem>
                                            <asp:ListItem Value="e.wptxm">������</asp:ListItem>
                                            <asp:ListItem Value="f.mc">�ʲ�Ʒ��</asp:ListItem>
                                            <asp:ListItem Value="e.wpxh">�ʲ��ͺ�</asp:ListItem>

                                        </asp:DropDownList>
                                    </td>
                                    <td align="left" width="15%">
                                        <asp:TextBox ID="query_content_s" runat="server" AutoPostBack="true" OnTextChanged="Query_changed"></asp:TextBox>
                                    </td>
                                    <td width="10%"></td>
                                    <td align="right" width="10%">
                                        <asp:Button cssclass="mybutton" ID="QueryBtn_s" runat="server" Text="��ѯ" OnClick="Query_Click_s" CausesValidation="False" AccessKey="f" Width="100%" />
                                    </td>

                                </tr>
                            </tbody>
                        </table>


                        <table id="Table2" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">

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
                                            <asp:TemplateField>
                                                <HeaderStyle Width="30px"></HeaderStyle>
                                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                <HeaderTemplate>
                                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="del_s" runat="server" CssClass="mybox" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="�ʲ�����">
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
                                            <asp:BoundField DataField="ui_id_s" HeaderText="ʹ���˴���">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="sybm_s" HeaderText="ʹ�ò���">
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
                                        PageSize="4"
                                        InputBoxClass="AspNetPagerInputBox"
                                        SubmitButtonClass=��AspNetPagerButton��
                                        SubmitButtonText="Go">
                                    </webdiyer:AspNetPager>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Panel1" runat="server" Width="100%">
                            <table>


                                <tr>
                                    <td width="3%"></td>
                                    <td>
                                        <asp:Label ID="a02" Text="�ϲ�˵����" runat="server"></asp:Label>
                                    </td>

                                    <td colspan="3" width="40%">
                                        <asp:TextBox ID="hbbz" runat="server" Width="99%" Rows="3" TextMode="multiLine"></asp:TextBox>
                                    </td>



                                    <td width="20%"></td>

                                </tr>

                                <tr align="right">
                                    <td style="height: 25"></td>
                                    <td style="height: 25"></td>
                                    <td style="height: 25"></td>
                                    <td style="height: 25"></td>
                                    <td style="height: 25"></td>

                                    <td style="height: 25" align="right">
                                        <asp:Button CssClass="mybutton" ID="SaveBtn_cf" runat="server" Text="ȷ�Ϻϲ�" OnClick="HB_Click"></asp:Button>
                                    </td>
                                </tr>





                            </table>
                        </asp:Panel>
                        <table style="table-layout: fixed">
                            <tbody>
                                <tr>

                                    <td colspan="2">�ʲ��Ѿ��ϲ��ʲ��б�
                                    </td>

                                </tr>
                                <tr>

                                    <td colspan="2">

                                        <table style="table-layout:fixed;">
                                            <tr>
                                                <td style="height: 10"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GridView1" runat="server"
                                                        OnRowDataBound="OnRow_Bound"
                                                        AutoGenerateColumns="False"
                                                        CellSpacing="1"
                                                        DataKeyNames="zcbmfull_s"
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
                                                            <asp:TemplateField>
                                                                <HeaderStyle Width="30px"></HeaderStyle>
                                                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                                <HeaderTemplate>
                                                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
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
                                                <td colspan="2" style="height: 22px">
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
                                                        PageSize="4"
                                                        InputBoxClass="AspNetPagerInputBox"
                                                        SubmitButtonClass=��AspNetPagerButton��
                                                        SubmitButtonText="Go">
                                                    </webdiyer:AspNetPager>
                                                </td>
                                            </tr>
                                        </table>

                                        <table id="Table3" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                                            <tr>
                                                <td width="3%"></td>
                                                <td>
                                                    <asp:Label ID="Label2" Text="����˵����" runat="server" Visible="false"></asp:Label>
                                                </td>

                                                <td colspan="3" width="40%">
                                                    <asp:TextBox ID="cxbz" runat="server" Width="99%" Rows="3" Visible="false" TextMode="multiLine"></asp:TextBox>
                                                </td>



                                                <td width="20%"></td>

                                            </tr>

                                            <tr align="right">
                                                <td style="height: 25"></td>
                                                <td style="height: 25"></td>
                                                <td style="height: 25"></td>
                                                <td style="height: 25"></td>
                                                <td style="height: 25"></td>

                                                <td style="height: 25" align="right">
                                                    <asp:Button CssClass="mybutton" ID="DelBtn_cf" runat="server" Text="�����ϲ�" Visible="false" OnClick="Del_Click" CausesValidation="False" />
                                                </td>
                                            </tr>





                                        </table>


                                    </td>
                                </tr>

                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>


        <asp:Label ID="yzcbmfull" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="cfruiid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="ssbmid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="bmmax" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lyid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="pagestyle" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="hblx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="szcbmfull" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="query" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>

