<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wpfl_right.aspx.cs" Inherits="FCSystem.OA.wpgl.wpfl_right" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��Ʒ����</title>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

    <style type="text/css">
        .auto-style1
        {
            width: 580px;
        }
    </style>

</head>
<body class="main">
    <form id="form1" runat="server">
        <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td width="21%">
                        <br />
                        &nbsp;<asp:Label ID="labelstatus" runat="server" Text="-> ����״̬" Font-Size="medium" ForeColor="red"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"></font></td>
                    <td width="58%" align="right">
                        <br />

                        <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="����" OnClick="Save_Click" AccessKey="a"></asp:Button><asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="�޸�" OnClick="Save_Click" AccessKey="s" Enabled="False"></asp:Button><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="ɾ��" OnClick="Del_Click" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:Button><asp:Button ID="btnClear" CssClass="mybutton" runat="server" Text="���" OnClick="btnClear_Click" CausesValidation="False" />
                        <asp:ValidationSummary
                            ID="ValidationSummary2"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                    </td>
                    <td width="21%">&nbsp</td>
                </tr>
            </tbody>
        </table>
        <center>
<table style="table-layout: fixed">
    <tbody>
      <tr> 
        <td valign="top"><center>
        <table width="100%" border="0" cellpadding="0" cellspacing="1">
                    <tr>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>
                    <tr> 
                      <td width="12%">���岿�ţ�</td>
                      <td colspan ="3" width="88%">
                          <asp:dropdownlist ID="bm" runat="server"  Width="100%" Enabled ="False" >
                        <asp:ListItem Value="" Text=""></asp:ListItem>
                      </asp:dropdownlist>
                      </td>
                    </tr>
                    <tr> 
                      <td width="12%">������룺</td>
                      <td width="38%">
					  <asp:textbox ID="flid" runat="server" Width="100%" Enabled="false"></asp:textbox>
                      </td>
                      <td width="12%">��������:</td>
                      <td width="38%">
					  <asp:textbox ID="flmc" runat="server" ></asp:TextBox>                  
					  </td>
                    </tr>
                    <tr>
                      <td width="12%">����״̬��</td>
                      <td width="38%"><asp:DropDownList ID="flzt" runat="server" Width="100%">
                             <asp:ListItem Text="����" Value="����"></asp:ListItem>
                             <asp:ListItem Text="����" Value="����"></asp:ListItem>
                          </asp:DropDownList>
                      </td>
                      <td width="12%">����˵����</td>
                      <td width="38%"><asp:textbox ID="flsm" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                    <td width="12%">�ϼ����ࣺ</td>
                    <td colspan="3" width="88%"> 
                    <asp:DropDownList id="flupid" runat="server" Width="100%">
					    <asp:ListItem Value="0" Text=""></asp:ListItem>
					</asp:DropDownList>				 
                    </td>
                    </tr>
                    <tr> 
                      <td width="12%">����˵����</td>
                      <td colspan ="3" width="88%">
                          <asp:dropdownlist id="wplzsm" runat="server" width="100%">
                            <asp:ListItem Text ="" Value =""></asp:ListItem>
                          </asp:dropdownlist>
                      </td>
                    </tr>
                    <tr> 
                      <td class="td_no" width="12%"></td>
                      <td colspan ="3" width="88%">
                          <asp:CheckBox ID="yngdzc" Text="�Ƿ�̶��ʲ�����" runat="server" Enabled="false" Checked="false" visible="false" />
                      </td>
                    </tr>
            <tr>
                <td>
                             <asp:requiredfieldvalidator
                            id="RequiredFieldValidator2"
		                    runat="server"
		                    ControlToValidate="flmc"
		                    ErrorMessage="�������������">&nbsp;
                      </asp:requiredfieldvalidator>
					<asp:CompareValidator
                            ID="Compare1" 
                            runat="server" 
                            ControlToValidate="flid"
                            Operator="notequal"
                            Type="String" 
                            ControlToCompare="flupid" 
                            ErrorMessage="�ϼ����಻��ѡ�񱾷��࣡">&nbsp;</asp:CompareValidator>
                </td>
            </tr>
          </table>
        </center></td>
      </tr>
    </tbody>
  </table>
</center>
    </form>
</body>
</html>
