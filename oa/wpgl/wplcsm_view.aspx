<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wplcsm_view.aspx.cs" Inherits="FCSystem.OA.wpgl.wplcsm_view" ValidateRequest="false"  %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����˵��</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
function SetFocus() {
var obj=document.getElementById("smmc");  //��ʼ�����ù�꽹��
if(obj.value == "")
{  
   obj.focus();
}
else
  obj.select();
}
</script>
</head>
<body class="main" onload="SetFocus();">
<form id="form1" runat="server">
  <table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
    <tbody>
    <tr>
  <td class="td_oa" style ="width:80%; height:25px"><asp:label ID="lbltitle" runat="server"></asp:label>����˵����Ϣ</td>
  <td class="td_oa" style ="width:20%"><span class="td_yes"> </span> = ������Ϣ</td>
  </tr>
  <tr> 
    <td>
                <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr><td colspan="2" style="height:30"></td></tr>
                    <tr> 
                      <td style="width:20%">�������ţ�</td>
                      <td style="width:80%">
                      <asp:dropdownlist ID="bm" runat="server"  Width="500" Enabled ="False" >
                        <asp:ListItem Value="" Text=""></asp:ListItem>
                      </asp:dropdownlist></td>
                    </tr>
                    <tr> 
                      <td style="width:20%">�������ƣ�</td>
                      <td style="width:80%"><asp:textbox ID="smmc" runat="server"  Width="500"></asp:textbox></td>
                    </tr>
                    <tr> 
                      <td>�������ݣ�</td>
                      <td colspan ="3">
                        <FTB:FreeTextBox id="smnr" runat="Server" Language="zh-CN" ToolbarStyleConfiguration="OfficeXP" Width="600px" Height="320px" BreakMode="lineBreak" />
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td style="height: 30px">
                          <asp:button cssclass="mybutton" ID="SaveAddBtn" runat="server" Text="���沢�½�" onclick="Save_Click" Visible="false" /><asp:button cssclass="mybutton" ID="SaveBtn" runat="server" Text="����" onclick="Save_Click" AccessKey="s"></asp:button><asp:button cssclass="mybutton" id="DelBtn" runat="server" text="ɾ��" onclick="Del_Click" Visible="false" OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')" AccessKey="d"></asp:button><input type="button" name="BackBtn" value="�ر�" class="mybutton" onclick="javascript:window.close()" accesskey="q" />
                      <asp:validationsummary
	                        ID="ValidationSummary2"
	                        runat="server"
	                        EnableClientScript="true"
	                        ShowMessageBox="true"
	                        ShowSummary="false">
                      </asp:validationsummary>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator2"
		                    runat="server"
		                    ControlToValidate="smmc"
		                    ErrorMessage="������˵������">&nbsp;
                      </asp:requiredfieldvalidator>
                      </td>
                    </tr>
                  </table>
    </td>
  </tr>
  </tbody>
  </table>
</form>
</body>
</html>
