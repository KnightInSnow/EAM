<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="bmright.aspx.cs" Inherits="FCSystem.BAS.bmgl.bmright" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>������Ϣ</title>
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
                      <td>�������ƣ�</td>
                      <td colspan="3">
					      <asp:textbox ID="bmmc" runat="server"  Width="449px" MaxLength ="5" ReadOnly="true"></asp:textbox>
                          <asp:requiredfieldvalidator
                                id="RequiredFieldValidator2"
		                        runat="server"
		                        ControlToValidate="bmmc"
		                        ErrorMessage="�����벿������">&nbsp;
                          </asp:requiredfieldvalidator>
					  </td>
					  
                    </tr>

                    <tr>
                        <td>�����ˣ�</td>
                              <td><asp:textbox ID="fzr" runat="server"  Width="150" MaxLength ="20" ReadOnly="true"></asp:textbox></td>
                    </tr>

                    <tr> 
                      <td>�������룺</td>
                      <td>
					  <asp:textbox ID="bmcode" runat="server"  Width="150" MaxLength ="5" ReadOnly="true"></asp:textbox>                      
					  </td>
                    </tr>

                    <tr> 
                      <td>�������ͣ�</td>
                      <td><asp:textbox ID="bmlx" runat="server"  Width="150" MaxLength ="20" ReadOnly="true"></asp:textbox></td>

                      <td></td>
                      <td align="left"><asp:CheckBox ID="ynffbm" runat="server" Text="�Ƿ���Ʒ���Ų���" /></td>
                    </tr>

                    <tr>
                      <td>�绰��</td>
                      <td><asp:textbox ID="bmdh" runat="server"  Width="150" MaxLength ="20" ReadOnly="true"></asp:textbox></td>

                      <td></td>
                      <td align="left"><%--<asp:CheckBox ID="ynslbm" runat="server" Text="�Ƿ�����������" />--%></td>
                    </tr>

                    <tr>
                      <td>���棺</td>
                      <td><asp:textbox ID="bmcz" runat="server"  Width="150" MaxLength ="20" ReadOnly="true"></asp:textbox></td>                                             
                    </tr>

                    <tr>
                      <td>��ע��</td>
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

