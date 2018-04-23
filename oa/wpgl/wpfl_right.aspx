<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wpfl_right.aspx.cs" Inherits="FCSystem.OA.wpgl.wpfl_right" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>物品分类</title>
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
                        &nbsp;<asp:Label ID="labelstatus" runat="server" Text="-> 新增状态" Font-Size="medium" ForeColor="red"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;<font color="red"></font></td>
                    <td width="58%" align="right">
                        <br />

                        <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="增加" OnClick="Save_Click" AccessKey="a"></asp:Button><asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="修改" OnClick="Save_Click" AccessKey="s" Enabled="False"></asp:Button><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d"></asp:Button><asp:Button ID="btnClear" CssClass="mybutton" runat="server" Text="清除" OnClick="btnClear_Click" CausesValidation="False" />
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
                      <td width="12%">定义部门：</td>
                      <td colspan ="3" width="88%">
                          <asp:dropdownlist ID="bm" runat="server"  Width="100%" Enabled ="False" >
                        <asp:ListItem Value="" Text=""></asp:ListItem>
                      </asp:dropdownlist>
                      </td>
                    </tr>
                    <tr> 
                      <td width="12%">分类编码：</td>
                      <td width="38%">
					  <asp:textbox ID="flid" runat="server" Width="100%" Enabled="false"></asp:textbox>
                      </td>
                      <td width="12%">分类名称:</td>
                      <td width="38%">
					  <asp:textbox ID="flmc" runat="server" ></asp:TextBox>                  
					  </td>
                    </tr>
                    <tr>
                      <td width="12%">分类状态：</td>
                      <td width="38%"><asp:DropDownList ID="flzt" runat="server" Width="100%">
                             <asp:ListItem Text="启用" Value="启用"></asp:ListItem>
                             <asp:ListItem Text="禁用" Value="禁用"></asp:ListItem>
                          </asp:DropDownList>
                      </td>
                      <td width="12%">分类说明：</td>
                      <td width="38%"><asp:textbox ID="flsm" runat="server" ></asp:TextBox></td>
                    </tr>
                    <tr>
                    <td width="12%">上级分类：</td>
                    <td colspan="3" width="88%"> 
                    <asp:DropDownList id="flupid" runat="server" Width="100%">
					    <asp:ListItem Value="0" Text=""></asp:ListItem>
					</asp:DropDownList>				 
                    </td>
                    </tr>
                    <tr> 
                      <td width="12%">流程说明：</td>
                      <td colspan ="3" width="88%">
                          <asp:dropdownlist id="wplzsm" runat="server" width="100%">
                            <asp:ListItem Text ="" Value =""></asp:ListItem>
                          </asp:dropdownlist>
                      </td>
                    </tr>
                    <tr> 
                      <td class="td_no" width="12%"></td>
                      <td colspan ="3" width="88%">
                          <asp:CheckBox ID="yngdzc" Text="是否固定资产分类" runat="server" Enabled="false" Checked="false" visible="false" />
                      </td>
                    </tr>
            <tr>
                <td>
                             <asp:requiredfieldvalidator
                            id="RequiredFieldValidator2"
		                    runat="server"
		                    ControlToValidate="flmc"
		                    ErrorMessage="请输入分类名称">&nbsp;
                      </asp:requiredfieldvalidator>
					<asp:CompareValidator
                            ID="Compare1" 
                            runat="server" 
                            ControlToValidate="flid"
                            Operator="notequal"
                            Type="String" 
                            ControlToCompare="flupid" 
                            ErrorMessage="上级分类不能选择本分类！">&nbsp;</asp:CompareValidator>
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
