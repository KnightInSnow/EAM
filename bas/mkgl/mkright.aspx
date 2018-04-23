<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mkright.aspx.cs" Inherits="FCSystem.BAS.mkgl.mkright" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>ģ����Ϣ</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="Page-EmptyLine-Large"></div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td>
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
                            <td colspan="4" align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="AddBtn" runat="server" Text="����" OnClick="AddBtn_Click" AccessKey="a"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="�޸�" OnClick="Save_Click" AccessKey="s" Enabled="False"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d" Enabled="False"></asp:Button>
                                <asp:Button ID="btnClr" runat="server" Text="���" CssClass="btn btn-primary active" CausesValidation="False" OnClick="btnClr_Click" />

                            </td>
                        </tr>
                    </table>
                </div>

                <div class="Page-EmptyLine-Normal"></div>

                <div class="PageBody-Top-Inputs" style="height:175px;">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td colspan="4"><font color="red">���ģ�����ڸ�Ŀ¼����Ϊ��λ��������ΪΪ��λ��</font></td>
                        </tr>
                    </table>

                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;">
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator3"
                                    runat="server"
                                    ControlToValidate="moduid"
                                    ErrorMessage="������ģ�����">&nbsp;
                                </asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator1"
                                    runat="server"
                                    ErrorMessage="ģ����������1��100000֮�����������"
                                    ControlToValidate="moduid"
                                    MinimumValue="1"
                                    MaximumValue="100000"
                                    Type="integer">&nbsp;
                                </asp:RangeValidator>
                                ģ����룺
                            </td>

                            <td>
                                <asp:TextBox ID="moduid" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator2"
                                    runat="server"
                                    ControlToValidate="modumc"
                                    ErrorMessage="������ģ������">&nbsp;
                                </asp:RequiredFieldValidator>ģ�����ƣ�</td>
                            <td>
                                <asp:TextBox ID="modumc" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:right;">
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1"
                                    runat="server"
                                    ControlToValidate="moduwjlj"
                                    ErrorMessage="�������ļ�·���������޿�����#����">&nbsp;
                                </asp:RequiredFieldValidator>�ļ�·����</td>
                            <td>
                                <asp:TextBox ID="moduwjlj" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">����������</td>
                            <td>
                                <asp:TextBox ID="modubz" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td style="text-align:right;">
                                <asp:CompareValidator
                                    ID="Compare1"
                                    runat="server"
                                    ControlToValidate="moduid"
                                    Operator="notequal"
                                    Type="String"
                                    ControlToCompare="moduupid"
                                    ErrorMessage="�ϼ�ģ�鲻��ѡ��ģ�飡">&nbsp;</asp:CompareValidator>�ϼ�ģ�飺
                            </td>
                            <td>
                                <asp:DropDownList ID="moduupid" runat="server" AutoPostBack="True" OnSelectedIndexChanged="moduupid_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>


        </div>

        <asp:Label ID="lblUpid" runat="server" Visible="False"></asp:Label>

        <div class="PageFoot"></div>
    </form>
</body>
</html>
