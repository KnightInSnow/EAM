<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bmlycx_view.aspx.cs" Inherits="FCSystem.OA.wpcx.bmlycx_view" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�������ò�ѯ</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../csjs/myjs.js"></script>
<script type="text/javascript" src="../../csjs/choose.js"></script>
<script type="text/javascript">
function SetFocus() {
var obj=document.getElementById("lybt");  //��ʼ�����ù�꽹��
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
      <td class="td_oa" style ="width:80%;height:25px">��������Ʒ</td>
      <td class="td_oa" style ="width:20%"></td>
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
                      <td style ="width:90" class="td_no">���ñ��⣺</td>
                      <td colspan="3">
					  <asp:textbox ID="lybt" runat="server" Width="450" ReadOnly="true"></asp:textbox>
                      </td>
                    </tr>
                    <tr> 
                      <td style ="width:90" class="td_no">���벿�ţ�</td>
                      <td><asp:textbox ID="sqbm" runat="server" Width="150" ReadOnly="true"></asp:textbox>
                      </td> 
                      <td style ="width:90" class="td_no">���Ų��ţ�</td>
                      <td><asp:DropDownList ID="ffbm"  Width="150" runat ="server" Enabled="false">
                          <asp:ListItem Text ="" Value =""></asp:ListItem>
                      </asp:DropDownList>
                      </td>
                      
                    </tr>
                    <tr> 
                      <td style ="width:90" class="td_no">��Ʒ���ࣺ</td>
                      <td colspan="3">
					  <asp:textbox ID="wpfl"  Width="450" runat ="server" ReadOnly="true"></asp:textbox>
                      </td>
                    </tr>
                    <tr> 
                      <td style ="width:90" class="td_no">����������</td>
                      <td><asp:textbox ID="sqsl" runat="server"  Width="150" ReadOnly="true"></asp:textbox>
                      </td>
                      <td style ="width:90" class="td_no">�����̶ȣ�</td>
                      <td><asp:textbox ID="jjcd" runat="server" Width="150" ReadOnly="true"></asp:textbox>
                      </td> 
                    </tr>
                    <tr> 
                      <td style ="width:90" class="td_no">����˵����</td>
                      <td colspan="3">
					  <asp:textbox ID="lysm" runat="server" Width="450" Rows="3" TextMode="multiLine" ReadOnly="true"></asp:textbox>
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
    <tr bgcolor="#f5f5f5" style="height:25px">
        <td class="td_no">������¼��</td>
        <td><asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="GridView1_RowDataBound"  
                    AutoGenerateColumns="False"  
                    DataKeyNames="spid"  
                    EmptyDataText="��ʱû���κ�������¼��">
                        <Columns>                        
                            <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
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
                                    <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("ui_desc") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="����״̬">
                                <HeaderStyle Width="60px" ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("spzt") %>' />
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
            <tr bgcolor="#f5f5f5" style="height:5px">
                    <td class="td_no"></td>
                    <td></td>
            </tr>
            <tr bgcolor="#f5f5f5" style="height:25px">
                    <td class="td_no">���Ųֿ⣺</td>
                    <td><asp:TextBox ID="ffck" runat ="server" Width="150" ReadOnly="true"></asp:TextBox>
                      ������Ʒ��<asp:TextBox ID="ffwp" runat ="server" Width="200" ReadOnly="true">
                      </asp:TextBox>
                      ����������<asp:TextBox ID="sjffsl" runat="server" Width="31" ReadOnly="true"></asp:TextBox>
                      </td>
            </tr>
            <tr>
            <td></td>
			<td style="height:35px">
                  <input type="button" name="BackBtn" value="�ر�" class="mybutton" onclick="javascript:window.close()" accesskey="q" />
                &nbsp;<asp:HyperLink ID="flsm" runat="server" Target="_blank" Enabled="false">��������˵��</asp:HyperLink>
             </td>
            </tr>
     </table>
  </td></tr>
</tbody>
</table>
<asp:Label ID="sqrid" runat="server" Visible="false"></asp:Label>
<asp:Label ID="wpflid" runat="server" Visible="false"></asp:Label>
<asp:requiredfieldvalidator
                            id="RequiredFieldValidator4"
		                    runat="server"
		                    ControlToValidate="ffck"
		                    ErrorMessage="��ѡ��Ҫ���ŵĲֿ�">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator5"
		                    runat="server"
		                    ControlToValidate="ffck"
		                    ErrorMessage="��ѡ��Ҫ���ŵ���Ʒ">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator6"
		                    runat="server"
		                    ControlToValidate="sjffsl"
		                    ErrorMessage="������ʵ�ʷ��ŵ���Ʒ����">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:RegularExpressionValidator 
                           ID="RegularExpressionValidator1"  
                           ControlToValidate ="sjffsl" 
                           display="none"  
                           ErrorMessage ="ʵ�ʷ�����������Ϊ����0������" 
                           ValidationExpression ="^[1-9]{1}[\d]*$" 
                           runat ="server">
                      </asp:RegularExpressionValidator>
</form>
</body>
</html>
