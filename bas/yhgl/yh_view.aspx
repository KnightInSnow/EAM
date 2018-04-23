<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="yh_view.aspx.cs" Inherits="FCSystem.BAS.yhgl.yh_view" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>ְԱά��</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("xm");  //��ʼ�����ù�꽹��
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
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true"
            EnableScriptLocalization="true">
        </asp:ScriptManager>
        <div class="PopHead">
            <table>
                <tr>
                    <td class="td_oa" width="80%" height="25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>ְԱ��Ϣ</td>
                    <td class="td_oa" width="20%"><span style="color:red;">*Ϊ������Ϣ</span></td>
                </tr>
            </table>
        </div>

        <div class="PopBodyInputs">
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
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
                        <td>ְԱ���룺<span style="color:red;">*</span></td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="zydm" runat="server"></asp:TextBox>
                        </td>
                        <td></td>

                        <td>�������룺</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="jgdm" runat="server" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>��¼����<span style="color:red;">*</span></td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="yhbm" runat="server"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>������<span style="color:red;">*</span></td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="xm" runat="server" MaxLength="8"></asp:TextBox>
                        </td>
                    </tr>

                    <asp:Panel ID="mm" runat="server">
                        <tr>
                            <td>��¼���룺</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="dlmm" runat="server" TextMode="password" MaxLength="20"></asp:TextBox>
                            </td>
                            <td></td>
                            <td>ȷ�����룺</td>
                            <td>
                                <asp:TextBox CssClass="form-control" ID="Rnewpwd" runat="server" TextMode="Password" MaxLength="20"></asp:TextBox>
                            </td>
                        </tr>
                    </asp:Panel>

                    <tr>
                        <td>�������ţ�<span style="color:red;">*</span></td>
                        <td colspan="4">
                            <asp:DropDownList CssClass="form-control" ID="bm" runat="server">
                                <asp:ListItem Value="" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>ְλ��</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="zwmc" runat="server">
                                <asp:ListItem Value="" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                        <td>ҳ���ɫ��<span style="color:red;">*</span></td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="gwjs" runat="server">
                                <asp:ListItem Value="" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>�����ʼ���</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="mail" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>�ƶ��绰��</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="yddh" runat="server" MaxLength="12"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>��Ч��ʼ���ڣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtbegintime" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtbegintime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator15"
                                runat="server"
                                ControlToValidate="txtbegintime"
                                ErrorMessage="��Ч��ʼ����">&nbsp;
                            </asp:RequiredFieldValidator></td>

                        <td class="td_no"></td>
                        <td>
                            <%--<asp:CheckBox ID="yn_sl" Text="�Ƿ�����������Ա" runat="server" />--%></td>
                    </tr>
                    <tr>
                        <td>��Ч��ֹ���ڣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="txtendtime" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtendtime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator13"
                                runat="server"
                                ControlToValidate="txtendtime"
                                ErrorMessage="��Ч��ֹ����">&nbsp;
                            </asp:RequiredFieldValidator></td>
                        <td class="td_no"></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>�������ڣ�</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="csrq" runat="server" MaxLength="10"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="csrq"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4" align="left">
                            <asp:RadioButtonList ID="ynck_ynxt" runat="server" Visible="false" RepeatDirection="horizontal">
                                <asp:ListItem Text="ϵͳ����Ա��ֿ����Ա" Value="xtck"></asp:ListItem>
                                <asp:ListItem Text="ϵͳ����Ա" Value="xtgly"></asp:ListItem>
                                <asp:ListItem Text="�ֿ������Ա" Value="ckgly"></asp:ListItem>
                                <asp:ListItem Text="��ͨԱ��" Value="ptyg" Selected="true"></asp:ListItem>
                            </asp:RadioButtonList>
                        </td>

                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4">
                            <!--<hr />-->
                        </td>
                    </tr>
                    <tr>
                        <td>�칫�绰��</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="bgdh" runat="server" MaxLength="20"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>����绰��</td>
                        <td>
                            <asp:TextBox CssClass="form-control" ID="czdh" runat="server" MaxLength="20"></asp:TextBox></td>
                    </tr>

                    <tr>
                        <td>�Ա�</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="xb" runat="server">
                                <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                <asp:ListItem Text="Ů" Value="Ů"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>

                        <td>״̬��</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="zt" runat="server">
                                <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                <asp:ListItem Text="����" Value="����"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>��ע��</td>
                        <td colspan="4">
                            <asp:TextBox ID="bz" runat="server" CssClass="form-control" TextMode="multiLine" Rows="3"></asp:TextBox></td>
                    </tr>


                    <tr>
                        <td></td>
                        <td colspan="4" style="height: 30px">
                            <asp:Button CssClass="btn btn-primary active" ID="SaveAddBtn" runat="server" Text="���沢�½�" OnClick="Save_Click" Visible="false" />
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

                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5"
                                runat="server"
                                ControlToValidate="zydm"
                                ErrorMessage="������ְԱ����">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator4"
                                runat="server"
                                ControlToValidate="yhbm"
                                ErrorMessage="�������¼��">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2"
                                runat="server"
                                ControlToValidate="xm"
                                ErrorMessage="����������">&nbsp;
                            </asp:RequiredFieldValidator>

                            <asp:CompareValidator
                                ID="Compare1"
                                runat="server"
                                ControlToValidate="dlmm"
                                Type="String"
                                ControlToCompare="rnewpwd"
                                ErrorMessage="��¼������ȷ�����벻����">&nbsp;</asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator10"
                                runat="server"
                                ControlToValidate="bm"
                                ErrorMessage="��ѡ����������">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3"
                                runat="server"
                                ControlToValidate="gwjs"
                                ErrorMessage="��ѡ���ɫ">&nbsp;
                            </asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator3"
                                ControlToValidate="dlmm"
                                Display="none"
                                ErrorMessage="��¼�������Ϊ���֡���ĸ��������"
                                ValidationExpression="^\w+$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator4"
                                ControlToValidate="Rnewpwd"
                                Display="none"
                                ErrorMessage="ȷ���������Ϊ���֡���ĸ��������"
                                ValidationExpression="^\w+$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator5"
                                ControlToValidate="mail"
                                Display="none"
                                ErrorMessage="�����ʼ���ʽ����"
                                ValidationExpression="[\w-]+@[\w-]+\.(com|net|net.cn|org|edu|mil|com.cn|cn)$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator6"
                                ControlToValidate="yddh"
                                Display="none"
                                ErrorMessage="�ƶ��绰��ʽ�����ֻ�����ǰ��Ҫ��0��С��ͨ��ʽΪ�����żӵ绰���롻�м䲻Ҫ���κη���"
                                ValidationExpression="\S{0,10}\d{12}|\S{0,10}\d{11}"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator7"
                                ControlToValidate="bgdh"
                                Display="none"
                                ErrorMessage="�칫�绰��ʽ���󣬲ο���ʽ010-62288888��62288888��010-62288888-815"
                                ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator8"
                                ControlToValidate="czdh"
                                Display="none"
                                ErrorMessage="����绰��ʽ���󣬲ο���ʽ010-62222222��62222222��010-62222222-832"
                                ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
                                runat="server">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator9"
                                ControlToValidate="bz"
                                Display="none"
                                ErrorMessage="��ע���ݲ��ܳ���50����"
                                ValidationExpression="^(\s|\S){0,50}$"
                                runat="server">
                            </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>


        <asp:Label ID="lblbmtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblyhid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
