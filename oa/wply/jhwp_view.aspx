<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="jhwp_view.aspx.cs" Inherits="FCSystem.OA.wply.jhwp_view" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�����ʲ�</title>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("jjbt");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
</head>

<body class="main" method="post">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">�����ʲ�</td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
                </tr>
            </table>
        </div>


        <div class="PopBodyInputs">
            <table style="table-layout: fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>���ӱ��⣺</td>
                    <td colspan="4">
                        <asp:TextBox ID="jjbt" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="jjbt"
                            ErrorMessage="�����뽻�ӱ���">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>���Ӳ��ţ�</td>
                    <td colspan="4">
                        <asp:DropDownList ID="jjbm" runat="server" AutoPostBack="True" Enabled="False">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>������Ա��</td>
                    <td colspan="4">
                        <asp:DropDownList ID="jjry" runat="server" AutoPostBack="true" Enabled="False">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>����˵����</td>
                    <td colspan="4">
                        <asp:TextBox ID="jjsm" runat="server" CssClass="MultiLineText" Rows="3" TextMode="multiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>

        <div class="PopBodyGrid">
            <table style="table-layout: fixed;">
                <tr>
                    <td>
                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="200px">
                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                OnRowDataBound="OnRow_Bound"
                                AutoGenerateColumns="False"
                                DataKeyNames="lymx_tid"
                                EmptyDataText="��ʱû���ʲ���Ϣ">
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
                                    <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:TemplateField HeaderText="���õ���">
                                        <HeaderStyle ForeColor="Black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                        <ItemTemplate>
                                            <%-- <a href="#" onclick="javascript:popAdd2('/oa/wply/directly_print.aspx?id=<%# Eval("lyid") %>')">--%>
                                            <asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("lydh") %>'></asp:Label>
                                        </ItemTemplate>
                                        <ControlStyle CssClass="navigate" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="lymx_tid" HeaderText="������ϸ����">
                                        <HeaderStyle CssClass="hidden" />
                                        <ItemStyle CssClass="hidden" />
                                        <FooterStyle CssClass="hidden" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_zydm" HeaderText="ʹ���˴���">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ckmc" HeaderText="�ֿ�����">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zcsm" HeaderText="�ʲ�˵��">
                                        <HeaderStyle ForeColor="black" />
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
            </table>
        </div>

        <br />

        <div class="PopBodyInputs">
            <table style="table-layout: fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="jsbm"
                            ErrorMessage="��ѡ����ղ���">&nbsp;
                        </asp:RequiredFieldValidator>���ղ��ţ�</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="PopMust" ID="jsbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="jsbm_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>

                <tr>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8"
                            runat="server"
                            ControlToValidate="jsry"
                            ErrorMessage="��ѡ�������Ա">&nbsp;
                        </asp:RequiredFieldValidator>������Ա��</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="PopMust" ID="jsry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="jsry_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                </tr>

                <tr>
                    <td>
                        <br />
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:ValidationSummary
                            ID="ValidationSummary1"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                    </td>
                    <td>
                        <asp:Button CssClass="mybutton" ID="OK_jj" runat="server" Text="ȷ�Ͻ���" OnClick="JJ_Click"></asp:Button>
                    </td>
                    <td>
                        <asp:Button ID="Button3" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false" CssClass="mybutton" AccessKey="r" /></td>
                </tr>

            </table>
        </div>

        <asp:Label ID="lblmaxjjid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblmaxjjindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbljjyear" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblyhtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblbmtid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
