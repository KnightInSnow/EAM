<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcrkdmx_mod.aspx.cs" Inherits="FCSystem.OA.wprk.zcrkdmx_mod" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>���Ǽ� - ��Ʒ��ϸ</title>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("wpbm");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>

<body class="main" onload="SetFocus();">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">�޸������Ʒ��ϸ</td>
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


                    <td>�����룺</td>
                    <td>
                        <asp:TextBox ID="rkbm" runat="server" AutoPostBack="true"></asp:TextBox>
                    </td>
                    <td></td>

                    <td>�������򵼣�</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="wz_id " DataValueField="wz_id" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td align="left">��Ʒ���룺</td>
                    <td>
                        <asp:TextBox ID="wpbm" runat="server" AutoPostBack="true" OnTextChanged="Wpbm_Changed"></asp:TextBox>&nbsp;<img src="/images/fd.gif" onclick="openA('/choose/spview_zc.aspx?id=t2')" alt="ѡ��Ҫ��ѯ����Ʒ����" />&nbsp;<asp:ImageButton ID="RefBtn" runat="server" OnClick="Wpbm_Changed" ImageUrl="~/images/refresh.gif" ToolTip="ˢ����Ʒ��Ϣ" CausesValidation="false" />
                    </td>
                    <td></td>

                    <td align="right">��Ʒ���ƣ�</td>
                    <td>
                        <asp:TextBox ID="wpmc" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>�������ࣺ</td>
                    <td>
                        <asp:TextBox ID="ssfl" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>Ʒ�ƣ�</td>
                    <td>
                        <asp:TextBox ID="wppp" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>��Ӧ�̣�</td>
                    <td>
                        <asp:TextBox ID="gys" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>�����룺</td>
                    <td>
                        <asp:TextBox ID="txm" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>�ͺţ�</td>
                    <td>
                        <asp:TextBox ID="wpxh" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>���</td>
                    <td>
                        <asp:TextBox ID="wpgg" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>���أ�</td>
                    <td>
                        <asp:TextBox ID="wpcd" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>���鵥�ۣ�</td>
                    <td>
                        <asp:TextBox ID="wpdj" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">
                        <hr size="1" noshade />
                    </td>
                </tr>
                <tr>
                    <td>���������</td>
                    <td>
                        <asp:TextBox ID="rksl" runat="server"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>��ⵥ�ۣ�</td>
                    <td>
                        <asp:TextBox ID="rkdj" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3" style="height: 30px">
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="���沢�ر�" OnClick="Save_Click" AccessKey="s"></asp:Button>
                        <input type="button" name="BackBtn" value="�ر�" class="mybutton" onclick="javascript: window.close()" accesskey="q" />&nbsp;
                                                    <asp:ValidationSummary
                                                        ID="ValidationSummary2"
                                                        runat="server"
                                                        EnableClientScript="true"
                                                        ShowMessageBox="true"
                                                        ShowSummary="false"></asp:ValidationSummary>

                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="wpbm"
                            ErrorMessage="��������Ʒ����">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="rksl"
                            ErrorMessage="�������������">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="rkdj"
                            ErrorMessage="��������ⵥ��">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            ControlToValidate="rksl"
                            Display="none"
                            ErrorMessage="�����������Ϊ��ֵ��"
                            ValidationExpression="\d+\.\d+|\d{0,9}"
                            runat="server">
                        </asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator17"
                            ControlToValidate="rkdj"
                            Display="none"
                            ErrorMessage="��ⵥ�۱���Ϊ��ֵ��"
                            ValidationExpression="\d+\.\d+|\d{0,9}"
                            runat="server">
                        </asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="wpmc"
                            ErrorMessage="��Ʒ���벻���ڣ��޷���������">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
