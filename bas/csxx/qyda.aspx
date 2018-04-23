<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="qyda.aspx.cs" Inherits="FCSystem.BAS.csxx.qyda" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>������Ϣ</title>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("pp");
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
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">��������</div>
        </div>
        <div class="Page-EmptyLine-Large"></div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td>
                                <asp:ValidationSummary
                                    ID="ValidationSummary2"
                                    runat="server"
                                    EnableClientScript="true"
                                    ShowMessageBox="true"
                                    ShowSummary="false" DisplayMode="SingleParagraph"></asp:ValidationSummary>

                            </td>
                            <td align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="����" OnClick="Save_Click" AccessKey="s"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-AutoHeight">
                <table style="table-layout:fixed;">
                    <tr>
                        <td style="text-align:right;padding-right:10px;">�������룺</td>
                        <td>
                            <asp:TextBox ID="qybm" runat="server" Enabled="false" MaxLength="10" CssClass="form-control"></asp:TextBox>
                        </td>

                        <td style="text-align:right;padding-right:10px;">Ʒ�����ƣ�</td>
                        <td>
                            <asp:TextBox ID="pp" runat="server" MaxLength="10" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align:right;padding-right:10px;"><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5"
                                runat="server"
                                ControlToValidate="qc"
                                ErrorMessage="��������ҵȫ��">&nbsp;</asp:RequiredFieldValidator>����ȫ�ƣ�</td>
                        <td>
                            <asp:TextBox ID="qc" runat="server" MaxLength="25" CssClass="form-control"></asp:TextBox>
                            
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;padding-right:10px;"><asp:RequiredFieldValidator
                                ID="RequiredFieldValidator1"
                                runat="server"
                                ControlToValidate="jc"
                                ErrorMessage="��������ҵ���">&nbsp; </asp:RequiredFieldValidator>������ƣ�
                        </td>
                        <td>
                            <asp:TextBox ID="jc" runat="server" Enabled="true" MaxLength="25" CssClass="form-control"></asp:TextBox>
                            
                        </td>
                        <td style="text-align:right;padding-right:10px;">�������ͣ�</td>
                        <td>
                            <asp:TextBox ID="lx" runat="server" Enabled="true" MaxLength="10" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;padding-right:10px;">��ַ��</td>
                        <td>
                            <asp:TextBox ID="dz" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td style="text-align:right;padding-right:10px;">�������룺</td>
                        <td>
                            <asp:TextBox ID="yzbm" runat="server" Enabled="true" MaxLength="6" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;padding-right:10px;">�绰��</td>
                        <td>
                            <asp:TextBox ID="dh" runat="server" Enabled="true" MaxLength="20" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td style="text-align:right;padding-right:10px;">������룺</td>
                        <td>
                            <asp:TextBox ID="cz" runat="server" Enabled="true" MaxLength="20" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;padding-right:10px;">��վ��</td>
                        <td>
                            <asp:TextBox ID="wz" runat="server" Enabled="true" MaxLength="25" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td style="text-align:right;padding-right:10px;">�������䣺</td>
                        <td>
                            <asp:TextBox ID="mail" runat="server" Enabled="true" MaxLength="30" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;padding-right:10px;">��˰�ţ�</td>
                        <td>
                            <asp:TextBox ID="gsh" runat="server" Enabled="true" MaxLength="40" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td style="text-align:right;padding-right:10px;">��˰�ţ�</td>
                        <td>
                            <asp:TextBox ID="dsh" runat="server" Enabled="true" MaxLength="40" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;padding-right:10px;">�������У�</td>
                        <td>
                            <asp:TextBox ID="khyh" runat="server" Enabled="true" MaxLength="50" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td style="text-align:right;padding-right:10px;">�����ʺţ�</td>
                        <td>
                            <asp:TextBox ID="yhzh" runat="server" Enabled="true" MaxLength="40" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_no"><font color="red"></font></td>
                        <td colspan="3" style="padding-top:20px;"><font color="red">��ʾ�������漰��ϵͳ�������������ʾ���벻Ҫ�����޸���ҵƷ�ơ�ȫ�ƺͼ�ƣ�</font>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator1"
                                ControlToValidate="qybm"
                                Display="none"
                                ErrorMessage="��ҵ�������Ϊ����һλ�����֡���ĸ��������"
                                ValidationExpression="^\w+$"
                                runat="server"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2"
                                ControlToValidate="qybm"
                                runat="server"
                                ErrorMessage="�������������">*</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator2"
                                runat="server"
                                ControlToValidate="qybm"
                                ValidationExpression="\d*"
                                ErrorMessage="�����������Ϊ����">
                            </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator4"
                                ControlToValidate="lx"
                                Display="none"
                                ErrorMessage="��ҵ���ͱ���Ϊ����"
                                ValidationExpression="^[\u4e00-\u9fa5]+$"
                                runat="server"> </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator6"
                                ControlToValidate="yzbm"
                                Display="none"
                                ErrorMessage="�������������6λ����"
                                ValidationExpression="\d{6}"
                                runat="server"> </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator7"
                                ControlToValidate="dh"
                                Display="none"
                                ErrorMessage="��˾�绰��ʽ���󣬲ο���ʽ010-62288888��62288888��010-62288888-815"
                                ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
                                runat="server"> </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator8"
                                ControlToValidate="cz"
                                Display="none"
                                ErrorMessage="��������ʽ���󣬲ο���ʽ010-62222222��62222222��010-62222222-832"
                                ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
                                runat="server"> </asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator
                                ID="RegularExpressionValidator9"
                                ControlToValidate="mail"
                                Display="none"
                                ErrorMessage="���������ʽ����"
                                ValidationExpression="[\w-]+@[\w-]+\.(com|net|org|edu|mil|com.cn|cn)$"
                                runat="server"> </asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>
</html>
