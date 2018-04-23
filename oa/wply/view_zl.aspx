<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="view_zl.aspx.cs" Inherits="FCSystem.OA.wply.view_zl" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>查看资料</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
<form id="form1" runat="server">
<table width="100%" style="height:100%" border="0" cellpadding="0" cellspacing="0">
<tr>
<td valign="top">
  <table style="table-layout: fixed">
    <tbody>
      <tr> 
        <td>
        <table width="95%" border="0" align="center" cellpadding="0" cellspacing="1">
            <tr> 
                <td style="width:40%" class="td_no">用&nbsp;&nbsp;&nbsp;&nbsp;户：</td>
                <td style="width:60%"><asp:label ID="yhbm" runat="server" Enabled="false" /><asp:label ID="Label1" runat="server" Enabled="false" Text="-" /><asp:label ID="xm" runat="server" enabled="false" /></td>
            </tr>
            <tr> 
                <td  class="td_no">姓&nbsp;&nbsp;&nbsp;&nbsp;名：</td>
                <td><asp:textbox ID="xmxm" runat="server"  Width="150" ReadOnly ="true" ></asp:textbox></td>
            </tr>
              <tr> 
                <td class="td_no">性&nbsp;&nbsp;&nbsp;&nbsp;别：</td>
                <td> 
                <asp:DropDownList id="xb" runat="server" width="150" Enabled ="False" >
                    <asp:ListItem Text="男" Value="男"></asp:ListItem>
                    <asp:ListItem Text="女" Value="女"></asp:ListItem> 
                </asp:DropDownList> 
                </td>
              </tr>
              <tr> 
                <td class="td_no">所属部门：</td>
                <td> 
                <asp:DropDownList id="ssbm" runat="server" width="150" Enabled ="False" >
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList> 
                </td>
              </tr>
              <tr>
                <td class="td_no">职&nbsp;&nbsp;&nbsp;&nbsp;位：</td>
                <td><asp:DropDownList ID="zw" runat="server"  Width="150" Enabled ="False" >
                    <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList></td>
              </tr>
               <tr>
                <td class="td_no">移动电话：</td>
                <td><asp:textbox ID="yddh" runat="server"  Width="150" ReadOnly ="true"></asp:textbox>
                </td>
               </tr>
              <tr>
                <td class="td_no">电子邮件：</td>
                <td><asp:textbox ID="mail" runat="server"  Width="150" ReadOnly ="true"></asp:textbox>
                    
                </td>
              </tr>
              <tr>
                <td class="td_no">办公电话：</td>
                <td><asp:textbox ID="bgdh" runat="server"  Width="150" ReadOnly ="true"></asp:textbox></td>
              </tr>
              <tr>
                <td class="td_no">传真电话：</td>
                <td><asp:textbox ID="czdh" runat="server"  Width="150" ReadOnly ="true"></asp:textbox></td>
              </tr>
              <tr>
                <td class="td_no">出生日期：</td>
                <td><asp:textbox id="csrq" runat="server"	CssClass="mytext" Width="150" ReadOnly ="true" ></asp:textbox></td>
              </tr>
              <tr>
                <td style="height:30"></td>
                <td><input type="button" name="BackBtn" value="关闭" class="mybutton" onclick="javascript:window.close()" accesskey="q" /></td>
              </tr>
               <tr>
                 <td colspan="2">
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
