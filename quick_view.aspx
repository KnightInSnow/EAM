<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="quick_view.aspx.cs" Inherits="FCSystem.quick_view1" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
<title>�ҵĿ�ݷ�ʽ</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
function SetFocus() {
var obj=document.getElementById("mc");  //��ʼ�����ù�꽹��
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
  <td class="td_base" width="80%" height="25px"><asp:label ID="lbltitle" runat="server"></asp:label>��ݷ�ʽ</td>
  <td class="td_base" width="20%"><span class="td_yes"> </span> = ������Ϣ</td>
  </tr>
  <tr> 
    <td valign="top" colspan=2>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="1">
                    <tr><td colspan="2" style="height:100"</tr>
                    <tr>
                      <td style="width:35%" class="td_yes">������ƣ�&nbsp;&nbsp;&nbsp; </td>
                      <td style="width:65%"><asp:textbox ID="mc" runat="server"  Width="300"></asp:textbox></td>
                    </tr>
                    <tr>
                      <td class="td_yes">ѡ��ͼ�꣺&nbsp;&nbsp;&nbsp; </td>
                      <td><asp:DropDownList id="tb" runat="server" width="300" AutoPostBack="true" OnSelectedIndexChanged="View_Pic">
                        <asp:ListItem Text="ȱʡͼ��" Value="null.gif"></asp:ListItem>
                      </asp:DropDownList></td>
                    </tr>
                    <tr>
                      <td class="td_no">����(.exe)·����</td>
                      <td><input id="fj" runat="server" type="file" style="width:300px;" class="mytext" /></td>
                    </tr>
                    <tr>
                      <td class="td_no"></td>
                      <td><asp:textbox ID="lj" runat="server" Width="300" TextMode="multiLine" ReadOnly="true" Rows="3"></asp:textbox></td>
                    </tr>
                    <tr>
                      <td></td>
                      <td style="height: 30px">
                      <asp:button cssclass="mybutton" ID="SaveAddBtn" runat="server" Text="���沢�½�" onclick="Save_Click" Visible="false"></asp:button><asp:button cssclass="mybutton" ID="SaveBtn" runat="server" Text="����" onclick="Save_Click" AccessKey="s"></asp:button><input type="button" name="BackBtn" value="�ر�" class="qq_btn_100px" onclick="javascript:window.close()" accesskey="q" />
                      <asp:Image ID="Image1" runat="server" Height="50px" Width="50px" stretch="true" ImageAlign="AbsMiddle" />
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
		                    ControlToValidate="mc"
		                    ErrorMessage="�������ݷ�ʽ����">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator1"
		                    runat="server"
		                    ControlToValidate="tb"
		                    ErrorMessage="��ѡ��һ�����ʵ�ͼ��">&nbsp;
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
