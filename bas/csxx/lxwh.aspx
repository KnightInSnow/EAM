<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lxwh.aspx.cs" Inherits="FCSystem.BAS.csxx.lxwh" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�Զ�������</title>
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�Զ�������</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">��ѡ�����ͣ� </td>
                            <td>
                                <asp:DropDownList ID="xzlx" runat="server" OnSelectedIndexChanged="ChangeType" AutoPostBack="True" Width="100%" CssClass="form-control">
                                    <asp:ListItem Value="bm">��������</asp:ListItem>
                                    <asp:ListItem Value="sf">����ʡ��</asp:ListItem>
                                    <asp:ListItem Value="cs">���ó���</asp:ListItem>
                                    <asp:ListItem Value="yj">�����������</asp:ListItem>
                                    <asp:ListItem Value="zw">������Աְ��</asp:ListItem>
                                    <asp:ListItem Value="bl">���ñ���</asp:ListItem>
                                    <asp:ListItem Value="jh">�ƻ�����</asp:ListItem>
                                    <asp:ListItem Value="hy">��������</asp:ListItem>
                                    <asp:ListItem Value="sp">��Ƶ����</asp:ListItem>
                                    <asp:ListItem Value="hl">��ҵ���(��Ƭ)</asp:ListItem>
                                    <asp:ListItem Value="dx">���ö��ŷ���</asp:ListItem>
                                    <asp:ListItem Value="gg">��ҵ�������</asp:ListItem>
                                    <asp:ListItem Value="zd">�����ƶȷ���</asp:ListItem>
                                    <asp:ListItem Value="mz">��������</asp:ListItem>
                                    <asp:ListItem Value="zc">ְ������</asp:ListItem>
                                    <asp:ListItem Value="zy">רҵ����</asp:ListItem>
                                    <asp:ListItem Value="rl">��Ա���</asp:ListItem>
                                    <asp:ListItem Value="lz">��ְ����</asp:ListItem>
                                    <asp:ListItem Value="gz">��������</asp:ListItem>
                                    <asp:ListItem Value="yq">��������</asp:ListItem>
                                    <asp:ListItem Value="cd">��Ʒ����</asp:ListItem>
                                    <asp:ListItem Value="pp">��ƷƷ��</asp:ListItem>
                                    <asp:ListItem Value="gy">��Ӧ�����</asp:ListItem>
                                    <asp:ListItem Value="rw">�������</asp:ListItem>
                                    <asp:ListItem Value="ly">�ʲ���Դ</asp:ListItem>
                                    <asp:ListItem Value="lc">�����ʽ</asp:ListItem>
                                    <asp:ListItem Value="jt">���᷽ʽ</asp:ListItem>
                                    <asp:ListItem Value="dw">������λ</asp:ListItem>
                                </asp:DropDownList></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                    </table>

                    <asp:Panel ID="panel2" runat="server" ScrollBars="none">
                        <table style="table-layout: fixed">
                            <tr>
                            <td style="text-align:right;padding-right:10px;">
                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server"
                                    ErrorMessage="��������������"
                                    Display="Static"
                                    ControlToValidate="name">&nbsp;
                                </asp:RequiredFieldValidator>
                                �������ƣ�                                           
                            </td>
                            <td>
                                <asp:TextBox ID="name" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                                </tr>
                        </table>
                    </asp:Panel>

                    <asp:Panel ID="panel3" runat="server">
                        <table style="table-layout: fixed">
                            <tr>
                            <td>
                                <asp:TextBox ID="tb_num1" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="REV1" runat="server" ErrorMessage="��������! ������������" ControlToValidate="tb_num1" ValidationExpression="^\+?[1-9][0-9]*$">*</asp:RegularExpressionValidator><asp:Label ID="blb_operator" runat="server" Text=":"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tb_num2" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="REV2" runat="server" ErrorMessage="��������! ������������" ControlToValidate="tb_num2" ValidationExpression="^\+?[1-9][0-9]*$">*</asp:RegularExpressionValidator>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                                </tr>
                        </table>
                    </asp:Panel>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <td>
                            <asp:ValidationSummary
                                ID="ValidationSummary2"
                                runat="server"
                                EnableClientScript="true"
                                ShowMessageBox="true"
                                ShowSummary="false"></asp:ValidationSummary>
                        </td>
                        <td align="right">
                            <asp:Button ID="add" runat="Server" OnClick="Save_Click" CausesValidation="true" CssClass="btn btn-primary active" />
                            <asp:Button CssClass="btn btn-primary active" ID="StopBtn" runat="server" Text="����" OnClick="Stop_Click" AccessKey="i" CausesValidation="false" />
                            <asp:Button CssClass="btn btn-primary active" ID="PassBtn" runat="server" Text="����" OnClick="Pass_Click" AccessKey="u" CausesValidation="false" />
                        </td>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">

                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    DataKeyNames="id"
                    DataSourceID="SqlDataSource1"
                    OnRowDataBound="OnRow_Bound"
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
                            <HeaderTemplate>
                                <div>
                                    <center><input type="checkbox" name="chkall" id="chkall" title="ȫѡ��ȡ��" onclick="CheckAll(this.form)" style="width:16px;height:16px" /></center>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <center>
                                  <asp:CheckBox id="chk" runat="server"></asp:CheckBox>
                                </center>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id" HeaderText="���ͱ���" ReadOnly="True" >
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mc" HeaderText="��������" >
                            <HeaderStyle ForeColor="Black"/>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zt" HeaderText="״̬" ReadOnly="True">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="�޸�" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Update"
                                    ImageUrl="~/images/save2.gif" AlternateText="�����޸�"/>
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    ImageUrl="~/images/cancel.gif" AlternateText="ȡ���޸�" />
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle />
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    ImageUrl="~/images/edit.gif" AlternateText="�޸Ĵ�����" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ɾ��" ShowHeader="False">
                            <HeaderStyle />
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"
                                    ImageUrl="~/images/del.gif" AlternateText="ɾ��������" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="���" Visible="False">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="dp_id" runat="server" Text='<%# Eval("id")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EamSqlConnectionString %>">
                <UpdateParameters>
                    <asp:Parameter Name="mc" DbType="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
