<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gdzcfl_right.aspx.cs" Inherits="FCSystem.OA.wpgl.gdzcfl_right" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�̶��ʲ�����</title>
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="Page-EmptyLine-Large"></div>

        <div class="PageBody" style="width:95%;">

            <div class="PageBody-Top" style="width:100%;">
                <div class="PageBody-Top-Buttons" style="width:100%;">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="labelstatus" runat="server" Text="-> ����״̬" ForeColor="red"></asp:Label>
                            </td>

                            <td>
                                <asp:ValidationSummary
                                    ID="ValidationSummary2"
                                    runat="server"
                                    EnableClientScript="true"
                                    ShowMessageBox="true"
                                    ShowSummary="false" DisplayMode="SingleParagraph"></asp:ValidationSummary>
                            </td>

                            <td colspan="4">
                                <asp:Button CssClass="btn btn-primary active" ID="AddBtn" runat="server" Text="����" OnClick="Save_Click" AccessKey="a"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="�޸�" OnClick="Save_Click" AccessKey="s" Enabled="False"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:Button>
                                <asp:Button ID="btnClear" CssClass="btn btn-primary active" runat="server" Text="���" OnClick="btnClear_Click" CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Top-Inputs" style="width:100%; height:250px;">
                <table style="table-layout: fixed;">
                    <tr>
                        <td style="text-align:right;">���岿�ţ�</td>
                        <td>
                            <asp:DropDownList ID="bm" runat="server" Enabled="False" CssClass="form-control">
                                <asp:ListItem Value="" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;">�������ƣ�<span style="color:red;">*</span></td>
                        <td>
                            <asp:TextBox ID="flmc" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                        <td>
                            <asp:TextBox ID="flid" runat="server" Visible="false" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align:right;">����״̬��</td>
                        <td>
                            <asp:DropDownList ID="flzt" runat="server" CssClass="form-control">
                                <asp:ListItem Text="����" Value="����"></asp:ListItem>
                                <asp:ListItem Text="����" Value="����"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align:right;">����˵����</td>
                        <td>
                            <asp:TextBox ID="flsm" runat="server" CssClass="form-control"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;">�ϼ����ࣺ</td>
                        <td>
                            <asp:DropDownList ID="flupid" runat="server" CssClass="form-control">
                                <asp:ListItem Value="0" Text=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:DropDownList ID="wplzsm" runat="server" Visible="false">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td style="text-align:right;">������룺<span style="color:red;">*</span><asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            ControlToValidate="txtbx_fljm"
                            Display="none"
                            ErrorMessage="������2-5λ��������ĸ�������"
                            ValidationExpression="[a-zA-Z0-9]{2,5}"
                            runat="server">*
                        </asp:RegularExpressionValidator></td>
                        <td>
                            <asp:TextBox ID="txtbx_fljm" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="text-align:right;">��Сֵ��</td>
                        <td>
                            <asp:TextBox ID="txtbx_min" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td style="text-align:right;">���ֵ��</td>
                        <td>
                            <asp:TextBox ID="txtbx_max" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td>
                            <asp:CheckBox ID="yngdzc" Text="�Ƿ�̶��ʲ�����" runat="server" Checked="true" Visible="false" Enabled="false" />
                        </td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtbx_min" ValidationExpression="^\d{0,5}$" ErrorMessage="��Сֵ��������ɲ�������λ">*</asp:RegularExpressionValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtbx_max" ValidationExpression="^\d{0,5}$" ErrorMessage="���ֵ��������ɲ�������λ">*</asp:RegularExpressionValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="��СֵӦС�����ֵ" ControlToCompare="txtbx_max" ControlToValidate="txtbx_min" Operator="LessThan" Type="Integer">*</asp:CompareValidator>
                            <asp:CompareValidator
                                ID="Compare1"
                                runat="server"
                                ControlToValidate="flid"
                                Operator="notequal"
                                Type="String"
                                ControlToCompare="flupid"
                                ErrorMessage="�ϼ����಻��ѡ�񱾷��࣡">&nbsp;</asp:CompareValidator>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator2"
                                runat="server"
                                ControlToValidate="flmc"
                                ErrorMessage="�������������">&nbsp;
                            </asp:RequiredFieldValidator>
                        </td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
        
        <div class="PageFoot"></div>
    </form>
</body>
</html>
