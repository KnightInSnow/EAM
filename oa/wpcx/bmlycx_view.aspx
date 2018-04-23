<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bmlycx_view.aspx.cs" Inherits="FCSystem.OA.wpcx.bmlycx_view" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>部门领用查询</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../csjs/myjs.js"></script>
<script type="text/javascript" src="../../csjs/choose.js"></script>
<script type="text/javascript">
function SetFocus() {
var obj=document.getElementById("lybt");  //初始化设置光标焦点
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
      <td class="td_oa" style ="width:80%;height:25px">已领用物品</td>
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
                      <td style ="width:90" class="td_no">领用标题：</td>
                      <td colspan="3">
					  <asp:textbox ID="lybt" runat="server" Width="450" ReadOnly="true"></asp:textbox>
                      </td>
                    </tr>
                    <tr> 
                      <td style ="width:90" class="td_no">申请部门：</td>
                      <td><asp:textbox ID="sqbm" runat="server" Width="150" ReadOnly="true"></asp:textbox>
                      </td> 
                      <td style ="width:90" class="td_no">发放部门：</td>
                      <td><asp:DropDownList ID="ffbm"  Width="150" runat ="server" Enabled="false">
                          <asp:ListItem Text ="" Value =""></asp:ListItem>
                      </asp:DropDownList>
                      </td>
                      
                    </tr>
                    <tr> 
                      <td style ="width:90" class="td_no">物品分类：</td>
                      <td colspan="3">
					  <asp:textbox ID="wpfl"  Width="450" runat ="server" ReadOnly="true"></asp:textbox>
                      </td>
                    </tr>
                    <tr> 
                      <td style ="width:90" class="td_no">申请数量：</td>
                      <td><asp:textbox ID="sqsl" runat="server"  Width="150" ReadOnly="true"></asp:textbox>
                      </td>
                      <td style ="width:90" class="td_no">紧急程度：</td>
                      <td><asp:textbox ID="jjcd" runat="server" Width="150" ReadOnly="true"></asp:textbox>
                      </td> 
                    </tr>
                    <tr> 
                      <td style ="width:90" class="td_no">领用说明：</td>
                      <td colspan="3">
					  <asp:textbox ID="lysm" runat="server" Width="450" Rows="3" TextMode="multiLine" ReadOnly="true"></asp:textbox>
                      </td>
                    </tr>
                    <tr><td class="td_no">申请人：</td><td colspan="3"><asp:Label ID="sqr" runat="server"></asp:Label>&nbsp;申请时间:<asp:Label ID="sqsj" runat="server"></asp:Label>&nbsp;送审时间:<asp:Label ID="sssj" runat="server"></asp:Label></td></tr>
                    <tr><td height="13" colspan="4"></td></tr>
                  </table></td>
              </tr>
            </tbody>
          </table></td>
      </tr>
  <tr><td colspan="2">
  <table id="Table1" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
    <tr bgcolor="#f5f5f5" style="height:25px">
        <td class="td_no">审批记录：</td>
        <td><asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="GridView1_RowDataBound"  
                    AutoGenerateColumns="False"  
                    DataKeyNames="spid"  
                    EmptyDataText="暂时没有任何审批记录！">
                        <Columns>                        
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="spid" HeaderText="编码">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="spsj" HeaderText="审批时间" DataFormatString="{0:yyyy-MM-dd HH:mm}" HtmlEncode ="False">
                                <HeaderStyle Width="120px" ForeColor="black" />
                                 <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="审批人">
                                <HeaderStyle Width="80px" ForeColor="black" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("ui_desc") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="审批状态">
                                <HeaderStyle Width="60px" ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:Label ID="Labelfs" runat="server" Text='<%# Bind("spzt") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="spyj" HeaderText="审批意见">
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
                    <td class="td_no">发放仓库：</td>
                    <td><asp:TextBox ID="ffck" runat ="server" Width="150" ReadOnly="true"></asp:TextBox>
                      发放物品：<asp:TextBox ID="ffwp" runat ="server" Width="200" ReadOnly="true">
                      </asp:TextBox>
                      发放数量：<asp:TextBox ID="sjffsl" runat="server" Width="31" ReadOnly="true"></asp:TextBox>
                      </td>
            </tr>
            <tr>
            <td></td>
			<td style="height:35px">
                  <input type="button" name="BackBtn" value="关闭" class="mybutton" onclick="javascript:window.close()" accesskey="q" />
                &nbsp;<asp:HyperLink ID="flsm" runat="server" Target="_blank" Enabled="false">分类流程说明</asp:HyperLink>
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
		                    ErrorMessage="请选择要发放的仓库">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator5"
		                    runat="server"
		                    ControlToValidate="ffck"
		                    ErrorMessage="请选择要发放的物品">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:requiredfieldvalidator
                            id="RequiredFieldValidator6"
		                    runat="server"
		                    ControlToValidate="sjffsl"
		                    ErrorMessage="请输入实际发放的物品数量">&nbsp;
                      </asp:requiredfieldvalidator>
                      <asp:RegularExpressionValidator 
                           ID="RegularExpressionValidator1"  
                           ControlToValidate ="sjffsl" 
                           display="none"  
                           ErrorMessage ="实际发放数量必须为大于0的整数" 
                           ValidationExpression ="^[1-9]{1}[\d]*$" 
                           runat ="server">
                      </asp:RegularExpressionValidator>
</form>
</body>
</html>
