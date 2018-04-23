<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wplcsm_view.aspx.cs" Inherits="FCSystem.OA.wpgl.wplcsm_view" ValidateRequest="false"  %>
<%@ Register TagPrefix="FTB" Namespace="FreeTextBoxControls" Assembly="FreeTextBox" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>流程说明</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript">
function SetFocus() {
var obj=document.getElementById("smmc");  //初始化设置光标焦点
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
  <td class="td_oa" style ="width:80%; height:25px"><asp:label ID="lbltitle" runat="server"></asp:label>流程说明信息</td>
  <td class="td_oa" style ="width:20%"><span class="td_yes"> </span> = 必填信息</td>
  </tr>
  <tr> 
    <td>
                <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                    <tr><td colspan="2" style="height:30"></td></tr>
                    <tr> 
                      <td style="width:20%">所属部门：</td>
                      <td style="width:80%">
                      <asp:dropdownlist ID="bm" runat="server"  Width="500" Enabled ="False" >
                        <asp:ListItem Value="" Text=""></asp:ListItem>
                      </asp:dropdownlist></td>
                    </tr>
                    <tr> 
                      <td style="width:20%">流程名称：</td>
                      <td style="width:80%"><asp:textbox ID="smmc" runat="server"  Width="500"></asp:textbox></td>
                    </tr>
                    <tr> 
                      <td>流程内容：</td>
                      <td colspan ="3">
                        <FTB:FreeTextBox id="smnr" runat="Server" Language="zh-CN" ToolbarStyleConfiguration="OfficeXP" Width="600px" Height="320px" BreakMode="lineBreak" />
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td style="height: 30px">
                          <asp:button cssclass="mybutton" ID="SaveAddBtn" runat="server" Text="保存并新建" onclick="Save_Click" Visible="false" /><asp:button cssclass="mybutton" ID="SaveBtn" runat="server" Text="保存" onclick="Save_Click" AccessKey="s"></asp:button><asp:button cssclass="mybutton" id="DelBtn" runat="server" text="删除" onclick="Del_Click" Visible="false" OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d"></asp:button><input type="button" name="BackBtn" value="关闭" class="mybutton" onclick="javascript:window.close()" accesskey="q" />
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
		                    ErrorMessage="请输入说明名称">&nbsp;
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
