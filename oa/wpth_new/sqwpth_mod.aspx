<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sqwpth_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.sqwpth_mod" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>������Ʒ�˻�</title>
<script type="text/javascript" src="../../csjs/myjs.js"></script>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../csjs/choose.js"></script>
<script type="text/javascript">
function SetFocus() {
var obj=document.getElementById("thbt");  //��ʼ�����ù�꽹��
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
<table style="table-layout: fixed">
<tbody>
  <tr>
      <td class="td_oa" style ="width:80%;height:25px">�޸���Ʒ/�ʲ��˻�</td>
      <td class="td_oa" style ="width:20%"><span class="td_yes"> </span> = ������Ϣ</td>
  </tr>
  <tr> 
    <td>
         <table style="table-layout: fixed">
            <tbody>
              <tr> 
                <td></td>
                <td><br /></td>
              </tr>
              <tr> 
                <td colspan="2">
				<table width="600" border="0" align="center" cellpadding="0" cellspacing="1">
                    <tr> 
                      <td style ="width:90px" class="td_yes">�˻ر��⣺</td>
                      <td colspan="3">
					  <asp:textbox ID="thbt" runat="server" Width="450"></asp:textbox>
                      </td>
                    </tr>
                    <tr> 
                      <td style ="width:90px" class="td_yes">���벿�ţ�</td>
                      <td> <asp:DropDownList ID="sqbm"  Width="150" runat ="server" Enabled="false">
                          <asp:ListItem Text ="" Value =""></asp:ListItem>
                      </asp:DropDownList>
                      </td> 
                      <td style ="width:90px" class="td_yes">�ջز��ţ�</td>
                      <td><asp:DropDownList ID="shbm"  Width="150" runat ="server" AutoPostBack ="true"  OnSelectedIndexChanged="shbm_SelectedIndexChanged" >
                          <asp:ListItem Text ="" Value =""></asp:ListItem>
                      </asp:DropDownList>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator2"
		                    runat="server"
		                    ControlToValidate="shbm"
		                    ErrorMessage="��ѡ����Ʒ�ջز���">&nbsp;
                      </asp:requiredfieldvalidator>
                      </td>
                      
                    </tr>
                    <tr> 
                      <td style ="width:90px" class="td_yes">��Ʒ���ࣺ</td>
                      <td colspan="3">
					  <asp:DropDownList ID="wpfl"  Width="450" runat ="server" AutoPostBack ="true" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                          <asp:ListItem Text ="" Value =""></asp:ListItem>
                      </asp:DropDownList>
                      </td>
                    </tr>
                    <tr> 
                      <td style ="width:90px" class="td_yes">����������</td>
                      <td><asp:textbox ID="thsl" runat="server"  Width="150" MaxLength ="25"></asp:textbox>
                      </td>
                      <td style ="width:90px" class="td_no"></td>
                      <td></td> 
                    </tr>
                    <tr> 
                      <td style ="width:90px" class="td_yes">�˻�˵����</td>
                      <td colspan="3">
					  <asp:textbox ID="thsm" runat="server" Width="450" Rows="3" TextMode="multiLine"></asp:textbox>
                      </td>
                    </tr>
                    <tr><td class="td_no">�����ˣ�</td><td colspan="3"><asp:Label ID="sqr" runat="server"></asp:Label>&nbsp;����ʱ��:<asp:Label ID="sqsj" runat="server"></asp:Label>&nbsp;����ʱ��:<asp:Label ID="sssj" runat="server"></asp:Label></td></tr>
                    <tr><td height="13" colspan="4"></td></tr>
                  </table></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
  <tr><td colspan="2">
  <table id="Table1" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
    <tr bgcolor="#f5f5f5">
                    <td class="td_no"><asp:Label ID="nextjsrid" runat="server" ReadOnly="true" Text="�������ˣ�" Visible="false" /></td>
                    <td colspan="3"><asp:Label ID="nextjsr" runat="server" ReadOnly="true" Font-Underline="true" Visible="false" Width="150" />
                      <asp:Label ID="nextsssjid" runat="server" ReadOnly="true" Text="����ʱ�䣺" Visible="false" />
                      <asp:Label ID="nextsssj" runat="server" ReadOnly="true" Font-Underline="true" Visible="false" Width="250" />
                      </td>
            </tr>
    <tr bgcolor="#f5f5f5" style="height:25px">
        <td class="td_no">������¼��</td>
        <td><asp:GridView ID="GridView11" runat="server"
                    OnRowDataBound="GridView11_RowDataBound"  
                    AutoGenerateColumns="False" 
                    DataKeyNames="spid" 
                    EmptyDataText="��ʱû���κ�������¼��">
                        <Columns>                        
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView11.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="spid" HeaderText="����">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spsj" HeaderText="����ʱ��" DataFormatString="{0:yyyy-MM-dd HH:mm}" HtmlEncode ="False">
                                <HeaderStyle Width="120px" ForeColor="black" />
                                 <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="������">
                                <HeaderStyle Width="80px" ForeColor="black" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelfs3" runat="server" Text='<%# Bind("ui_desc") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="����״̬">
                                <HeaderStyle Width="60px" ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelfs4" runat="server" Text='<%# Bind("spzt") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="spyj" HeaderText="�������">
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle CssClass="GridViewRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                    </asp:GridView>
            </td>
            </tr>
            <tr bgcolor="#f5f5f5">
                    <td class="td_no"><asp:Label ID="shckid" runat="server" ReadOnly="true" Text="�ջزֿ⣺" Visible="false" /></td>
                    <td colspan="3"><asp:Label ID="shck" runat="server" ReadOnly="true" Font-Underline="true" Visible="false" Width="150" />
                      <asp:Label ID="shwpid" runat="server" ReadOnly="true" Text="�ջ���Ʒ��" Visible="false" />
                      <asp:Label ID="shwp" runat="server" ReadOnly="true" Font-Underline="true" Visible="false" Width="250" />
                      <asp:Label ID="sjshslid" runat="server" ReadOnly="true" Text="ʵ���ջ�������" Visible="false" />
                      <asp:Label ID="sjshsl" runat="server" ReadOnly="true" Font-Underline="true" Visible="false" Width="31" />
                      </td>
            </tr>
            <tr> 
                      <td style ="width:90px" class="td_no"></td>
                      <td colspan="3"><hr size="1" noshade /></td>
                    </tr>
                    <tr> 
                      <td style ="width:90px" class="td_no"></td>
                      <td colspan="3">
                        <asp:DropDownList ID="jsr" runat ="server" Visible ="false" >
                          <asp:ListItem Text ="ѡ����һ��������" Value =""></asp:ListItem>
                      </asp:DropDownList>
                      <asp:HyperLink ID="flsm" runat="server" Target="_blank" Enabled="false">����鿴��������˵��</asp:HyperLink>
                               
                      </td>
                    </tr>
                    <tr> 
                      <td style ="width:90px" class="td_no"></td>
                      <td colspan="3">
                        <asp:CheckBox ID="xxtz" runat="server" Text="վ����Ϣ֪ͨ��һ��������" Checked="true" Visible ="false" />
                        <asp:CheckBox ID="dxtz" runat="server" Text="�ֻ�����֪ͨ��һ��������" Visible ="false" />
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="3" style="height: 30px">
                      <asp:button cssclass="mybutton" ID="SaveAddBtn" runat="server" Text="���沢����" onclick="Save_Click" AccessKey="a" Visible ="false"></asp:button>
                      <asp:button cssclass="mybutton" ID="SaveBtn" runat="server" Text="����" onclick="Save_Click" Visible ="false"></asp:button>
                      <asp:button cssclass="mybutton" ID="SendBtn" runat="server" Text="����" Enabled="false" onclick="Send_Click" Visible ="false"></asp:button>
                      <asp:button cssclass="mybutton" ID="DelBtn" runat="server" Text="ɾ��" onclick="Del_Click" Visible ="false" CausesValidation="false"  OnClientClick="return confirm('ȷ��Ҫִ��ɾ����')"></asp:button>
                      <input type="button" name="BackBtn" value=" �ر� " class="mybutton" onclick="javascript:window.close()" accesskey="q" />
                      <asp:validationsummary
	                        ID="ValidationSummary2"
	                        runat="server"
	                        EnableClientScript="true"
	                        ShowMessageBox="true"
	                        ShowSummary="false">
                      </asp:validationsummary>
                      </td>
                    </tr>
                    <tr>
                      <td></td>
                      <td colspan="3" style="height: 60px">
                          <font color="red">��ʾ1����Ʒ������������ʾ����ѡ���ջز����µ���Ϣ����*��Ϊ�̶��ʲ����࣡</font><br />
                          <font color="red">��ʾ2����ѡ�������ͨ��Ʒ����ʱ��[��һ��������]��ʾ�����ڲ��ŵĹ�����<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(����������������Ա)��</font><br />
                          <font color="red">��ʾ3����ѡ���˹̶��ʲ�����ʱ��[��һ��������]��ʾ�ջز����µ��ʲ�����Ա��</font>
                      </td>
                    </tr>
     </table>
  </td></tr>
</tbody>
</table>
<asp:Label ID="sqrid" runat="server" Visible="false"></asp:Label>
                    <asp:requiredfieldvalidator
                            id="RequiredFieldValidator5"
		                    runat="server"
		                    ControlToValidate="thbt"
		                    ErrorMessage="�������˻ر���">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator6"
		                    runat="server"
		                    ControlToValidate="sqbm"
		                    ErrorMessage="��ѡ�����벿��">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator8"
		                    runat="server"
		                    ControlToValidate="thsl"
		                    ErrorMessage="��������������">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:RegularExpressionValidator 
                           ID="RegularExpressionValidator1"  
                           ControlToValidate ="thsl" 
                           display="none"  
                           ErrorMessage ="������������Ϊ����0������" 
                           ValidationExpression ="^[1-9]{1}[\d]*$" 
                           runat ="server">
                      </asp:RegularExpressionValidator>
                       <asp:requiredfieldvalidator
                            id="RequiredFieldValidator9"
		                    runat="server"
		                    ControlToValidate="wpfl"
		                    ErrorMessage="��ѡ����Ʒ����">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator10"
		                    runat="server"
		                    ControlToValidate="shbm"
		                    ErrorMessage="��ѡ����Ʒ�ջز���">&nbsp;
                      </asp:requiredfieldvalidator>
                       <asp:requiredfieldvalidator
                            id="RequiredFieldValidator11"
		                    runat="server"
		                    ControlToValidate="thsm"
		                    ErrorMessage="�������˻�˵��">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator7"
		                    runat="server"
		                    ControlToValidate="jsr"
		                    ErrorMessage="��ѡ����һ�����������">&nbsp;
                      </asp:requiredfieldvalidator>
</form>
 <asp:Label ID="IDlabel" runat="server" Visible="false"></asp:Label>
 <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
</body>
</html>
