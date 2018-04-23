<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sqwpth_add.aspx.cs" Inherits="FCSystem.OA.wpth_new.sqwpth_add" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>������Ʒ�黹</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("ghbt");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
</head>
<body class="main" onload="SetFocus();" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td width="80%">������Ʒ�黹</td>
                    <td class="td_oa" width="20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <br/>
                        <table id="search" cellspacing="1" cellpadding="1" width="95%" align="center" border="0">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <table style="table-layout: fixed;">
                                            <tr>
                                                <td>�黹���⣺</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="ghbt" runat="server" Width="450"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="ghbt"
                                                        ErrorMessage="�������˻ر���">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>                                                                                   
                                            <tr>
                                                <td>��Ʒ���ࣺ</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="wpfl" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator3"
                                                        runat="server"
                                                        ControlToValidate="wpfl"
                                                        ErrorMessage="��ѡ����Ʒ����">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                                <tr>
                                                <td>��Ʒ���ƣ�</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="wpmc" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="wpmc_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator7"
                                                        runat="server"
                                                        ControlToValidate="wpmc"
                                                        ErrorMessage="��ѡ��黹��Ʒ">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                             <tr>
                                                <td>�ջز���</td>
                                                <td>
                                                    <asp:DropDownList ID="shbm" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="shbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator2"
                                                        runat="server"
                                                        ControlToValidate="shbm"
                                                        ErrorMessage="��ѡ����Ʒ�ջز���">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>�ջزֿ�</td>
                                                <td>
                                                    <asp:DropDownList ID="shck" Width="450" runat="server" AutoPostBack="true">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator8"
                                                        runat="server"
                                                        ControlToValidate="shck"
                                                        ErrorMessage="��ѡ����Ʒ�ջزֿ�">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>�黹������</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="ghsl" runat="server" Width="150" MaxLength="25"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator6"
                                                        runat="server"
                                                        ControlToValidate="ghsl"
                                                        ErrorMessage="�����������˻�����">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator
                                                        ID="RegularExpressionValidator1"
                                                        ControlToValidate="ghsl"
                                                        Display="none"
                                                        ErrorMessage="������������Ϊ����0������"
                                                        ValidationExpression="^[1-9]{1}[\d]*$"
                                                        runat="server">
                                                    </asp:RegularExpressionValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90px">�黹˵����</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="ghsm" runat="server" Width="450" Rows="3" TextMode="multiLine"></asp:TextBox>                                                
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90px" class="td_no"></td>
                                                <td colspan="3">
                                                    <hr size="1" noshade />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>

                                            <tr>
                                                <td></td>
                                            </tr>
                                            <%--   <tr>
                                                <td style="width: 90px" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="jsr" runat="server">
                                                        <asp:ListItem Text="ѡ����һ��������" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator7"
                                                        runat="server"
                                                        ControlToValidate="jsr"
                                                        ErrorMessage="��ѡ����һ�����������">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                    <asp:HyperLink ID="flsm" runat="server" Target="_blank" Enabled="false">����鿴��������˵��</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90px" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ��һ��������" Checked="true" />
                                                    <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ��һ��������" />
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 30px">
                                                    <asp:Button ID="Qrgh" runat="server" Text="�黹" cssclass="mybutton" OnClick="Qrgh_Click" /><asp:Button ID="Button2" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false" class="mybtn_d1" AccessKey="r" /><input type="button" name="BackBtn" value=" �ر� " class="mybtn_d1" onclick="javascript: window.close()" accesskey="q" />
                                                    <asp:ValidationSummary
                                                        ID="ValidationSummary2"
                                                        runat="server"
                                                        EnableClientScript="true"
                                                        ShowMessageBox="true"
                                                        ShowSummary="false"></asp:ValidationSummary>
                                                </td>
                                            </tr>
                                            <%--   <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 60px">
                                                    <font color="red">��ʾ1����Ʒ������������ʾ����ѡ���ջز����µ���Ϣ����*��Ϊ�̶��ʲ����࣡</font>
                                                    <br />
                                                    <font color="red">��ʾ2����ѡ�������ͨ��Ʒ����ʱ��[��һ��������]��ʾ�����ڲ��ŵĹ�����<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(����������������Ա)��</font>
                                                    <br />
                                                    <font color="red">��ʾ3����ѡ���˹̶��ʲ�����ʱ��[��һ��������]��ʾ�ջز����µ��ʲ�����Ա��</font>
                                                </td>
                                            </tr>--%>
                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Label ID="lblmaxthid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblmaxindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="rkmxid" runat="server"></asp:Label>
    </form>
</body>
</html>
