<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="pkcl.aspx.cs" Inherits="FCSystem.OA.pd.pkcl" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
      <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <title>�̿�����</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
           <div style="margin-top:57px;color:#70708f;"> �̿�����</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <td style="text-align:right;padding-right:10px;">�ƻ�����:</td>
                        <td>
                            <asp:TextBox ID="tbx_name" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button ID="btn_query" runat="server" Text="��ѯ" CssClass="btn btn-primary active" OnClick="btn_query_Click1" />
                                <asp:Button ID="btn_Refresh" runat="server" Text="ˢ��" CssClass="btn btn-primary active" OnClick="btn_Refresh_Click" />
                                <asp:Button ID="btnClear" runat="server" AccessKey="f" CausesValidation="False" CssClass="btn btn-primary active" Text="���" OnClick="btnClear_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="Page-EmptyLine-Normal"></div>
            <div class="PageBody-Middle-MinHeight">
                <tr align="left">
                    <td colspan="5" align="left"><font color="red">����ƻ����ƿɲ鿴�̿��ʲ��嵥</font></td>
                </tr>
                <tr>
                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                        <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                            OnRowDataBound="GridView1_RowDataBound"
                            AutoGenerateColumns="False"
                            DataKeyNames="planid"
                            EmptyDataText="û�в鵽�������������ݣ�">
                            <Columns>
                                <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                    <HeaderTemplate>
                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                                    </HeaderTemplate>
                                    <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkevery" runat="server" CssClass="mybox" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="pddh" HeaderText="�̵㵥��">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderStyle-ForeColor="Black" HeaderText="�ƻ�����">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <a href="#" onclick="javascript:popPlan('pkList.aspx?id=<%#Eval("planid")%>')"><font color="#3366ff"><asp:Label ID="lbljhmc" runat="server" Text='<%#Bind("planname") %>'></asp:Label></font></a>
                                    </ItemTemplate>
                                    <ControlStyle CssClass="navigate" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="ui_desc" HeaderText="�����Ա">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="zxr" HeaderText="ִ����Ա">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="bm_mc" HeaderText="�����Ա��������">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="tjsj" HeaderText="���ʱ��">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="progress" HeaderText="������">
                                    <HeaderStyle ForeColor="Black" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="pdsm" HeaderText="��ע˵��">
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
                </tr>
            </div>
            <div class="PageBody-Bottom-Pager" style="text-align:right;">
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
                    SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
                </webdiyer:AspNetPager>
            </div>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
