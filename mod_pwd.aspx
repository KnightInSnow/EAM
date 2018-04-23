<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="mod_pwd.aspx.cs" Inherits="FCSystem.mod_pwd" %>


<!DOCTYPE HTML>

<html>
<head>
<link href="Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
<link href="../css/Main.css" type="text/css" rel="stylesheet" />
<title>修改密码</title>
<script type="text/javascript">
function SetFocus() {
var obj=document.getElementById("oldpwd");  //设置初始光标焦点
if(obj.value == "")
{  
   obj.focus();
}
else
  obj.select();
}
</script>
    <style type="text/css">
        .auto-style1
        {
            height: 30;
            width: 181px;
        }
    </style>
</head>
<body class="main"  onload="SetFocus();">
<form id="form1" runat="server">
<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td valign="top">
  <table style="table-layout: fixed">
    <tbody>
      <tr> 
        <td style="height:20px;background-color: #8CA1AE;">
        <table width="157" style="height:100%" border="0" cellpadding="0" cellspacing="0">
            <tr> 
              <td align="center" style="background-image: url(../../images/bg.gif);">修改密码</td>
            </tr>
          </table></td>
      </tr>
      <tr> 
        <td><br>
        <table style="table-layout: fixed">
            <tbody>
              <tr> 
                <td></td>
                <td align="right"></td>
              </tr>
              <tr> 
                <td height="13">&nbsp;</td>
                <td>&nbsp;</td>
              </tr>
              <tr> 
                <td colspan="2"><table border="0" align="center" cellpadding="0" cellspacing="1">
                    <tr> 
                      <td style="text-align:right;padding-right:10px;">原登陆密码：
                        <asp:TextBox id="oldpwd" runat="server" textmode="password" Width="120" MaxLength ="20"></asp:TextBox>
                      </td>
                      <td>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator4"
		                    runat="server"
		                    ControlToValidate="oldpwd"
		                    ErrorMessage="请输入原登陆密码" CssClass="form-control">&nbsp;
                        </asp:requiredfieldvalidator>
                      </td>
                    </tr>
                    <tr>
                      <td style="text-align:right;padding-right:10px;">新登陆密码：
                      <asp:TextBox ID="newpwd" runat="server" TextMode="Password" Width="120" MaxLength ="20"></asp:TextBox> 
                      </td>                    
                      <td><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
		                    runat="server"
		                    ControlToValidate="newpwd"
		                    ErrorMessage="请输入新登陆密码" CssClass="form-control">&nbsp; </asp:RequiredFieldValidator></td>
                    </tr>
                    <tr> 
                      <td align="right" colspan="2">确认新密码：
                        <asp:TextBox id="Rnewpwd" runat="server" TextMode="Password" Width="120" MaxLength ="20"></asp:TextBox>
                      </td>
                      <td><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
		                    runat="server"
		                    ControlToValidate="Rnewpwd"
		                    ErrorMessage="请输入确认新密码">&nbsp; </asp:RequiredFieldValidator>
                          <asp:CompareValidator
                            ID="Compare1" 
                            runat="server" 
                            ControlToValidate="newpwd" 
                            Type="String" 
                            ControlToCompare="rnewpwd" 
                            ErrorMessage="新登陆密码与确认密码不符！" CssClass="form-control">&nbsp;</asp:CompareValidator></td>
                    </tr>
                    <tr>
                      <td align="center" class="auto-style1">
                        &nbsp;&nbsp;&nbsp;</td>
                      <td>
                          <asp:button cssclass="btn btn-primary active" ID="SaveBtn" runat="server" Text="保存" onclick="Save_Click" AccessKey="s"></asp:button></td>
                      <td></td>
                    </tr>
                    <tr>
                        <td colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;
                          <asp:validationsummary
	                        ID="ValidationSummary1"
	                        runat="server"
	                        EnableClientScript="true"
	                        ShowMessageBox="true"
	                        ShowSummary="false">
                         </asp:validationsummary>
                      <asp:RegularExpressionValidator 
                           ID="RegularExpressionValidator3"  
                           ControlToValidate ="oldpwd" 
                           display="none"  
                           ErrorMessage ="原登陆密码必需为数字、字母或二者组合" 
                           ValidationExpression ="^\w+$" 
                           runat ="server">
                      </asp:RegularExpressionValidator>
                      <asp:RegularExpressionValidator 
                           ID="RegularExpressionValidator4"  
                           ControlToValidate ="newpwd" 
                           display="none"  
                           ErrorMessage ="新登陆密码必需为数字、字母或二者组合" 
                           ValidationExpression ="^\w+$" 
                           runat ="server">
                      </asp:RegularExpressionValidator>
                      <asp:RegularExpressionValidator 
                           ID="RegularExpressionValidator5"  
                           ControlToValidate ="Rnewpwd" 
                           display="none"  
                           ErrorMessage ="确认新密码必需为数字、字母或二者组合" 
                           ValidationExpression ="^\w+$" 
                           runat ="server">
                      </asp:RegularExpressionValidator>
                      </td>
				    </tr>
                  </table>
                  </td>
              </tr>
            </tbody>
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
