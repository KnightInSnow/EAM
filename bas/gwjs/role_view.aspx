<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="role_view.aspx.cs" Inherits="FCSystem.BAS.gwjs.role_view" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>��ɫά��</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("jsmc");  //��ʼ�����ù�꽹��
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
            <table style="table-layout: fixed;">
                <tr>
                    <td class="td_oa" width="80%" height="25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>��ɫ��Ϣ</td>
                    <td class="td_oa" width="20%"><span style="color:red;">*Ϊ������Ϣ</span></td>
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
                    <td>��ɫ���ƣ�<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:TextBox CssClass="form-control" ID="jsmc" runat="server" MaxLength="30"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>��ɫ���ͣ�</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_rolelx" runat="server" CssClass="form-control">
                            <asp:ListItem Value="��ҵ" Text="��ҵ" Selected="True"></asp:ListItem>
                            <asp:ListItem Value="ά��" Text="ά��"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td>��ע��</td>
                    <td colspan="4">
                        <asp:TextBox ID="bz" runat="server" CssClass="form-control" TextMode="multiLine" Rows="6"></asp:TextBox></td>
                </tr>

                <tr>
                    <td><br /></td>
                </tr>

                <tr>
                    <td colspan="1"></td>
                    <td colspan="4" align="center">
                        <asp:Button CssClass="btn btn-primary active" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" Visible="false"></asp:Button>
                        <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click" AccessKey="s"></asp:Button>
                        <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:Button>
                        <input type="button" name="BackBtn" value="�ر�" class="btn btn-primary active" onclick="javascript: window.close()" accesskey="q" />
                    </td>
                </tr>

                <tr>
                    <td colspan="6">
                        <asp:ValidationSummary
                            ID="ValidationSummary2"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator2"
                            ControlToValidate="jsmc"
                            Display="none"
                            ValidationExpression="^[\u4e00-\u9fa5]+$"
                            ErrorMessage="��ɫ���Ʊ���Ϊ����"
                            runat="server">
                        </asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator9"
                            ControlToValidate="bz"
                            Display="none"
                            ErrorMessage="��ע���ݲ��ܳ���100����"
                            ValidationExpression="^(\s|\S){0,100}$"
                            runat="server">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="jsmc"
                            ErrorMessage="�������ɫ����">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
