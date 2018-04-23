<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="bmwh_view.aspx.cs" Inherits="FCSystem.BAS.bmgl.bmwh_view" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
     <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>����ά��</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("bmmc");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
</head>
<body class="main" onload="SetFocus();">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table>
                <tr>
                    <td class="td_oa" width="80%" height="25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>���ŵ���</td>
                    <td class="td_oa" style="width: 20%"><span style="color:red;">*Ϊ������Ϣ</span></td>
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
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="bm_id" runat="server" Visible="False"></asp:TextBox></td>
                    <td>&nbsp;</td>
                    <td>
                        <asp:TextBox ID="bm_sjbm" runat="server" Visible="False"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>���Ŵ���:</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="bmdm" runat="server" Visible="true"></asp:TextBox></td>

                </tr>

                <tr>
                    <td>�������ƣ�<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:TextBox CssClass="form-control" ID="bmmc" runat="server"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>�ϼ����ţ�</td>
                    <td colspan="4">
                        <asp:DropDownList ID="bmsjbm" runat="server" CssClass="form-control">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>�����ˣ�</td>
                    <td colspan="4">
                        <asp:DropDownList ID="fzr" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>�������ͣ�</td>
                    <td colspan="4">
                        <asp:DropDownList ID="bmlx" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="2" style="text-align:left;">
                        <asp:CheckBox ID="ynffbm" runat="server" Text="�Ƿ�Ϊ���Ų���" /></td>
                </tr>
                <tr>
                    <td>�绰��</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="bmdh" runat="server"></asp:TextBox></td>
                    <td></td>
                </tr>
                <tr>
                    <td>���棺</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="bmcz" runat="server"></asp:TextBox></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>��ע��</td>
                    <td colspan="4">
                        <asp:TextBox ID="bmbz" runat="server" CssClass="form-control" TextMode="multiLine" Rows="5"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4" align="center">
                        <asp:Button CssClass="btn btn-primary active" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" Visible="false" />
                        <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click" AccessKey="s"></asp:Button>
                        <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" AccessKey="d" Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:Button>
                        <input type="button" name="CloseBtn" value="�ر�" class="btn btn-primary active" onclick="javascript: window.close()" accesskey="q" />
                    </td>
                </tr>
            </table>
        </div>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="bmmc"
            ErrorMessage="�����벿������">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator7"
            ControlToValidate="bmdh"
            Display="none"
            ErrorMessage="�绰��ʽ���󣬲ο���ʽ010-62288888��62288888��010-62288888-815"
            ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
            runat="server">
        </asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator8"
            ControlToValidate="bmcz"
            Display="none"
            ErrorMessage="�����ʽ���󣬲ο���ʽ010-62222222��62222222��010-62222222-832"
            ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
            runat="server">
        </asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator9"
            ControlToValidate="bmbz"
            Display="none"
            ErrorMessage="��ע���ݲ��ܳ���50����"
            ValidationExpression="^(\s|\S){0,50}$"
            runat="server">
        </asp:RegularExpressionValidator>

    </form>
</body>
</html>
