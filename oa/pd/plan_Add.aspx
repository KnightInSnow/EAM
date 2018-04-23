<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="plan_Add.aspx.cs" Inherits="FCSystem.OA.pd.plan_Add" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�����̵�ƻ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script language="javascript" type="text/javascript" src="../../csjs/tree-select.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed">
                <tr>
                    <td class="td_oa" style="width: 70%; height: 25px">�����Ǽ�</td>
                    <td class="td_oa" style="width: 30%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp</span>=������Ϣ</td>
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
                    <td>�ƻ����ƣ�</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtbox_mc" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>�ƻ�˵����</td>
                    <td colspan="4">
                        <asp:TextBox ID="txtbox_sm" runat="server" CssClass="form-control"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>�̵�ֿ⣺</td>
                    <td colspan="4" style="text-align:left;">
                        <asp:CheckBoxList ID="CKBL" runat="server" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="CKBL_SelectedIndexChanged"></asp:CheckBoxList>
                    </td>
                </tr>
                <tr>
                    <td>ִ����Ա��
                    </td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_zxr" runat="server" CssClass="form-control"></asp:DropDownList>
                        <%--     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                             runat="server"
                                             ControlToValidate="ddl_zxr"
                                             ErrorMessage="��ѡ��ִ����">*
                                        </asp:RequiredFieldValidator>--%>
                    </td>
                </tr>
                <tr>
                    <td>�ʲ�״̬��
                    </td>
                    <td colspan="2" style="text-align:left;">
                        <asp:CheckBoxList ID="CKBLZCZT" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Text="�ڿ�" Value="0">�ڿ�</asp:ListItem>
                            <asp:ListItem Text="ʹ����" Value="1">ʹ����</asp:ListItem>
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </div>

        <div class="Pop-EmptyLine-Normal"></div>

        <div style="width: 640px; margin: auto;">
            <asp:Panel ID="Panel2" runat="server" Width="100%" HorizontalAlign="left">


                <table id="treeview" cellspacing="1" cellpadding="1" width="100%" align="left" border="0">
                    <tr>
                        <td colspan="2"><font color="red">����ݲ��Ż����ʲ���������̵�ƻ�</font></td>
                    </tr>
                    <tr>
                        <td style="width: 50%">
                            <asp:Panel ID="PanelBM" runat="server" ScrollBars="Auto" Width="320px" Height="250px">
                                <asp:TreeView ID="TV_BM" runat="server" ShowCheckBoxes="All" ExpandDepth="1" onclick="javascript:client_OnTreeNodeChecked(event);"></asp:TreeView>
                            </asp:Panel>
                        </td>
                        <td style="width: 50%">
                            <asp:Panel ID="PanelFL" runat="server" ScrollBars="Auto" Width="320px" Height="250px">
                                <asp:TreeView ID="TV_FL" runat="server" ShowCheckBoxes="All" ExpandDepth="1" onclick="javascript:client_OnTreeNodeChecked(event);"></asp:TreeView>
                            </asp:Panel>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btn_add" runat="server" Text="��Ӽƻ�" CssClass="btn btn-primary active" OnClick="btn_add_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>

        <p>
            <asp:Label ID="lblplanid" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblpdck" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblzczt" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblPddh" runat="server" Visible="False"></asp:Label>
        </p>
    </form>
</body>
</html>
