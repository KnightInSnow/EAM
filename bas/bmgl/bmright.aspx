<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="bmright.aspx.cs" Inherits="FCSystem.BAS.bmgl.bmright" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>部门信息</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table id="Table1" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tbody>
                <tr>
                    <td>
                        <br />
                        &nbsp;</td>
                    <td align="right">
                        <br />
                    </td>
                </tr>
            </tbody>
        </table>
        <center>
<table width="100%" border="0" cellpadding="0" cellspacing="5">
    <tbody>
      <tr> 
        <td valign="top"><center>
        <table width="600" border="0" cellpadding="1" cellspacing="1">
                    <tr>
                      <td style="height:60">&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                      <td>&nbsp;</td>
                    </tr>

                    <tr> 
                      <td>机构名称：</td>
                      <td colspan="3">
					      <asp:textbox ID="bmmc" runat="server"  Width="449px" MaxLength ="5" ReadOnly="true"></asp:textbox>
                          <asp:requiredfieldvalidator
                                id="RequiredFieldValidator2"
		                        runat="server"
		                        ControlToValidate="bmmc"
		                        ErrorMessage="请输入部门名称">&nbsp;
                          </asp:requiredfieldvalidator>
					  </td>
					  
                    </tr>

                    <tr>
                        <td>负责人：</td>
                              <td><asp:textbox ID="fzr" runat="server"  Width="150" MaxLength ="20" ReadOnly="true"></asp:textbox></td>
                    </tr>

                    <tr> 
                      <td>机构代码：</td>
                      <td>
					  <asp:textbox ID="bmcode" runat="server"  Width="150" MaxLength ="5" ReadOnly="true"></asp:textbox>                      
					  </td>
                    </tr>

                    <tr> 
                      <td>机构类型：</td>
                      <td><asp:textbox ID="bmlx" runat="server"  Width="150" MaxLength ="20" ReadOnly="true"></asp:textbox></td>

                      <td></td>
                      <td align="left"><asp:CheckBox ID="ynffbm" runat="server" Text="是否物品发放部门" /></td>
                    </tr>

                    <tr>
                      <td>电话：</td>
                      <td><asp:textbox ID="bmdh" runat="server"  Width="150" MaxLength ="20" ReadOnly="true"></asp:textbox></td>

                      <td></td>
                      <td align="left"><%--<asp:CheckBox ID="ynslbm" runat="server" Text="是否需求受理部门" />--%></td>
                    </tr>

                    <tr>
                      <td>传真：</td>
                      <td><asp:textbox ID="bmcz" runat="server"  Width="150" MaxLength ="20" ReadOnly="true"></asp:textbox></td>                                             
                    </tr>

                    <tr>
                      <td>备注：</td>
                      <td colspan="3" ><asp:textbox ID="bmbz" runat="server" cssclass="mytextarea"  Width="449" TextMode="multiLine" Rows="3" ReadOnly="true"></asp:textbox></td>
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

