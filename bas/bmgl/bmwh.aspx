<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="bmwh.aspx.cs" Inherits="FCSystem.BAS.bmgl.bmwh" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>����ά��</title>

</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PageHead">
        <div style="margin-top:57px;color:#70708f;">����ά��</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">ѡ�������</td>
                            <td>
                                <asp:DropDownList ID="bmsjbm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="BmSelectChanged" Width="100%" CssClass="form-control"></asp:DropDownList>
                            </td>
                            <td></td>
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
                                <asp:Button CssClass="btn btn-primary active" ID="StopBtn" runat="server" Text="����" OnClick="Stop_Click" OnClientClick="return confirm('ȷ��Ҫִ�н�����')" AccessKey="i" />
                                <asp:Button CssClass="btn btn-primary active" ID="PassBtn" runat="server" Text="����" OnClick="Pass_Click" OnClientClick="return confirm('ȷ��Ҫִ��������')" AccessKey="u" />
                                <input type="button" name="AddBtn" value="����" class="btn btn-primary active" onclick="javascript: popAdd('bmwh_view.aspx');" accesskey="a" />
                                <asp:Button CssClass="btn btn-primary active" ID="RefBtn" runat="server" Text="ˢ��" OnClick="Refresh" CausesValidation="False" AccessKey="e" />
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
                    DataKeyNames="bm_tid" 
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
                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                            <HeaderTemplate>
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="bm_code" HeaderText="��������">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                        </asp:BoundField>

                        <asp:BoundField DataField="bm_status" HeaderText="״̬">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:TemplateField HeaderText="��������">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:popMod('/bas/bmgl/bmwh_view.aspx?id=<%# Eval("bm_id") %>&bm_tid=<%# Eval("bm_tid") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("bm_mc") %>'></asp:Label></font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>

                        <asp:BoundField HeaderText="��������" DataField="bm_code">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ControlStyle CssClass="navigate" />
                        </asp:BoundField>

                        <asp:BoundField DataField="sjbmex_mc" HeaderText="�ϼ�����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="bm_dh" HeaderText="�绰����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="bm_cz" HeaderText="�������">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>

                        <asp:ImageField DataImageUrlField="ynffbm" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="��Ʒ���Ų���">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:ImageField>
                        <%--   <asp:ImageField DataImageUrlField="ynslbm" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="����������">
                                                        <ItemStyle HorizontalAlign="center" />
                                                        <HeaderStyle Width="100px" ForeColor="black" />
                                                    </asp:ImageField>--%>
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

        <div class="PageFoot"></div>
    </form>
</body>
</html>
