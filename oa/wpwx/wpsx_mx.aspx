<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpsx_mx.aspx.cs" Inherits="FCSystem.OA.wpwx.wpsx_mx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ʲ�ά�ޱ���</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript">
        function IsDigit(str) {
            var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
            return (reg.test(str));
        }
        function validType(name, value) {
            if (!IsDigit(value)) {
                var obj = document.getElementsByName(name);
                obj[0].value = "";
            }
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">�ʲ�ά�ޱ���</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody>

                                    <tr>
                                        <td align="center" style="height: 25px">
                                            <asp:Label ID="wxdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td_q_space">
                                    </tr>
                                </tbody>
                            </table>

                            <table id="search2" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="GridView1_RowDataBound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull"
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

                                                    <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                        <HeaderStyle Width="25%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="�ʲ�����">
                                                        <HeaderStyle Width="20%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxyy" HeaderText="ά��ԭ��">
                                                        <HeaderStyle Width="20%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <%--  <asp:BoundField DataField="wxje" HeaderText="ά�޽��">
                                                        <HeaderStyle Width="20%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>                    --%>
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
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>


                            </table>
                            <table id="Table1" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">



                                <tr>

                                    <td align="left" width="12%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="10%"></td>
                                    <td width="28%" align="right"></td>

                                </tr>
                            </table>
                        </asp:Panel>
                        <asp:Panel ID="Panel_gys" runat="server" ScrollBars="Auto">
                            <table id="wxgys" cellspacing="1" cellpadding="1" width="95%" align="center" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel_wxgys" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView2" runat="server"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="gys_tid"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <HeaderTemplate>
                                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="del" runat="server" CssClass="mybox" AutoPostBack="true" OnCheckedChanged="SelectAsset" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <%-- <asp:BoundField DataField="gysmc" HeaderText="ά��������">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>--%>
                                                    <asp:TemplateField HeaderStyle-ForeColor="Black" HeaderText="ά��������">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd('wxsbj_gysmx.aspx?id=<%#wxdid%>&id2=<%#Eval("gys_tid")%>')"><font color="#3366ff"><asp:Label ID="lbljhmc" runat="server" Text='<%#Bind("gysmc") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="lxr" HeaderText="��ϵ��">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="lxdh" HeaderText="��ϵ�绰">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="dz" HeaderText="��ַ">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxzj" HeaderText="ά���ܼ�">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxzsm" HeaderText="ά����˵��">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="center" />
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
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager2" runat="server"
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
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager2_PageChanged">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblTip" runat="server" Visible="false" Font-Size="10pt" Font-Bold="true" ForeColor="red" Text="�ʲ�ά����ɣ��뵽ά��ȷ��ҳ��ᵥ"></asp:Label>
                                    </td>
                                </tr>
                        <tr>
                            <td width="18%" align="right">
                                <asp:Button ID="btn_sx" runat="server" Text="����" cssclass="mybutton" OnClick="btnSx_Click" /><asp:Button ID="btn_finish" runat="server" Text="ά�޵����" cssclass="mybutton" Visible="false" OnClick="btnfinish_Click" /></td>
                        </tr>
        </table>
        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Label ID="wxdzt" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="wxsid" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>
