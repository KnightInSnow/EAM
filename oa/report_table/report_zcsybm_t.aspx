<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_zcsybm_t.aspx.cs" Inherits="FCSystem.OA.report_table.report_zcsybm_t" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <title>�ʲ�ʹ��һ����</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True">
        </asp:ScriptManager>

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�ʲ�ʹ��һ����</div>
        </div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">ѡ��ֽ�ſ�ȣ�
                            </td>
                            <td>
                                <asp:DropDownList ID="papersize" runat="server" AutoPostBack="true" CssClass="form-control">
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td style="text-align:right;padding-right:10px;">���ò��ţ�</td>
                            <td>
                                <asp:DropDownList ID="lybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="lybm_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">��Ա:</td>
                            <td>
                                <asp:DropDownList ID="ddl_bmry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BMry_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style="text-align:right;padding-right:10px;">�ʲ��������ƣ�</td>
                            <td>
                                <asp:TextBox ID="zclx" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td align="right">
                                <asp:Button ID="QueryBtn" runat="server" AccessKey="f" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="��ѯ" />
                                <asp:Button ID="ClearBtn" runat="server" AccessKey="r" CausesValidation="false" CssClass="btn btn-primary active" OnClick="Clear_Click" Text="���" />
                                <asp:Button ID="RefBtn" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Query_Click" Text="ˢ��" />
                                <asp:Button ID="Printbt" runat="server" AccessKey="p" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Printbt_Click" Text="��ӡ����" />
                                <asp:Button ID="grtoexcl" runat="server" AccessKey="e" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Export_Click" Text="����Excel��" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <div class="Page-EmptyLine-Normal"></div>

                <!--startprint-->
                <asp:Panel ID="Panel2" runat="server" align="center" Width="100%">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td>
                                <h3 align="center">�ʲ�ʹ��һ����</h3>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle"
                                    OnRowDataBound="OnRow_Bound"
                                    AutoGenerateColumns="False"
                                    EmptyDataText="��ʱû���ʲ���Ϣ"
                                    ShowFooter="True">
                                    <Columns>
                                        <asp:BoundField DataField="ProductKindName" HeaderText="�ʲ�����">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="ProductName" HeaderText="�ʲ�����">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="DepartmentName" HeaderText="��������">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="EmployeeName" HeaderText="ʹ����">
                                            <HeaderStyle ForeColor="black" />
                                            <ItemStyle HorizontalAlign="Center" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Quantity" HeaderText="����">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="Amount" HeaderText="���">
                                            <ItemStyle HorizontalAlign="Center" />
                                            <HeaderStyle ForeColor="black" />
                                        </asp:BoundField>
                                    </Columns>
                                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                                    <RowStyle CssClass="GridViewRowStyle" />
                                    <FooterStyle CssClass="GridViewFooterStyle" />
                                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
                <!--endprint-->

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
                    SubmitButtonClass="��AspNetPagerButton��"
                    SubmitButtonText="Go">
                </webdiyer:AspNetPager>
            </div>
        </div>


        <div class="PageFoot">
            <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>
            <asp:Label runat="server" ID="rq_end" Visible="false" />
        </div>
    </form>
</body>
</html>
