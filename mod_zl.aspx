<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="mod_zl.aspx.cs" Inherits="FCSystem.mod_zl" %>


<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
     <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�޸�����</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�޸�����</div>
        </div>
        <table>
            <tr>
                <td valign="top">
                    <table style="table-layout: fixed">
                        <tbody>
                            <tr>
                                <td style="height: 20px;">
                                    <!--<td style="height: 20px; background-color: #8CA1AE;">
                                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" style="background-image: url(../../images/bg.gif);">�޸�����</td>
                                        </tr>
                                    </table>-->
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <table style="width:80%;">
                                        <tr>
                                            <td colspan="2" align="right"></td>
                                        </tr>
                                        <tr >
                                            <td style="width: 60%" class="td_no">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
                                            <td style="width: 60%;text-align:left;">
                                                <asp:Label ID="yhbm" runat="server" Enabled="false"/>
                                                <asp:Label ID="Label1" runat="server" Enabled="false" Text="-" />
                                                <asp:Label ID="xm" runat="server" Enabled="false" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_yes">��&nbsp;&nbsp;&nbsp;&nbsp;����</td>
                                            <td>
                                                <asp:TextBox ID="xmxm" runat="server" CssClass="form-control"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_no">��&nbsp;&nbsp;&nbsp;&nbsp;��</td>
                                            <td>
                                                <asp:DropDownList ID="xb" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="��" Value="��"></asp:ListItem>
                                                    <asp:ListItem Text="Ů" Value="Ů"></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_yes">�������ţ�</td>
                                            <td>
                                                <asp:DropDownList ID="ssbm" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_no">ְ&nbsp;&nbsp;&nbsp;&nbsp;λ��</td>
                                            <td>
                                                <asp:DropDownList ID="zw" runat="server" CssClass="form-control">
                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                        <tr>
                                            <td class="td_no">�ƶ��绰��</td>
                                            <td>
                                                <asp:TextBox ID="yddh" runat="server" MaxLength="12" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_yes">�����ʼ���</td>
                                            <td>
                                                <asp:TextBox ID="mail" runat="server" MaxLength="30" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_no">�칫�绰��</td>
                                            <td>
                                                <asp:TextBox ID="bgdh" runat="server" MaxLength="20" CssClass="form-control"></asp:TextBox>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_no">����绰��</td>
                                            <td>
                                                <asp:TextBox ID="czdh" runat="server" MaxLength="20" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="td_no">�������ڣ�</td>
                                            <td>
                                                <asp:TextBox ID="csrq" onfocus="setday(this);" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr style="line-height:4;">
                                            <td></td>
                                            <td style="text-align:left;">
                                                <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click" AccessKey="s"></asp:Button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <asp:ValidationSummary
                                                    ID="ValidationSummary1"
                                                    runat="server"
                                                    EnableClientScript="true"
                                                    ShowMessageBox="true"
                                                    ShowSummary="false"></asp:ValidationSummary>
                                                <asp:RegularExpressionValidator
                                                    ID="RegularExpressionValidator5"
                                                    ControlToValidate="mail"
                                                    Display="none"
                                                    ErrorMessage="�����ʼ���ʽ����"
                                                    ValidationExpression="[\w-]+@[\w-]+\.(com|net|org|edu|mil|com.cn|net.cn|cn)$"
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
                                                <asp:CompareValidator ID="CompareValidator1"
                                                    ControlToValidate="csrq"
                                                    Display="none"
                                                    Operator="DataTypeCheck"
                                                    ErrorMessage="�������ڸ�ʽ���󣬸�ʽ�ο�1980-07-07��1980/07/07"
                                                    Type="date"
                                                    runat="server">
                                                </asp:CompareValidator>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator2"
                                                    runat="server"
                                                    ControlToValidate="mail"
                                                    ErrorMessage="����������ʼ�">&nbsp;
                                                </asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator3"
                                                    runat="server"
                                                    ControlToValidate="xmxm"
                                                    ErrorMessage="����������">&nbsp;
                                                </asp:RequiredFieldValidator>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator4"
                                                    runat="server"
                                                    ControlToValidate="ssbm"
                                                    ErrorMessage="��ѡ����������">&nbsp;
                                                </asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
