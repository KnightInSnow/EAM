<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="txl.aspx.cs" Inherits="FCSystem.OA.txl.txl" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
 <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
 <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>ͨѶ¼</title>
 <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
 <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
 <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../csjs/myjs.js"></script>
</head>
<body class="main">
<form id="form1" runat="server">
  <table style="height:100%;width:100%;" border="0" cellpadding="0" cellspacing="0">
    <tbody>
  <tr>
  <td class="td_oa" style ="width:80%;height:25px">��ҵͨѶ¼</td>
  <td class="td_oa" style ="width:20%"></td>
  </tr>
  <tr> 
    <td>
        <table style="table-layout:fixed;">
            <tbody>
              <tr> 
                <td style="height:40px; width:180px;">���ټ�����
                    <asp:DropDownList id="query_tj" runat="server" CssClass="form-control">
                            <asp:ListItem Value="a.ui_desc" Selected="True">����</asp:ListItem>
                            <asp:ListItem Value="a.ui_yddh">�ƶ��绰</asp:ListItem>
                            <asp:ListItem Value="a.ui_bgdh">�칫�绰</asp:ListItem>
                            <asp:ListItem Value="a.ui_czdh">����绰</asp:ListItem>
                            <asp:ListItem Value="a.ui_mail">�����ʼ�</asp:ListItem>
                        </asp:DropDownList>
                    <asp:TextBox ID="query_content" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:button cssclass="btn btn-primary active" ID="QueryBtn" runat="server" Text="��ѯ" onclick="Query_Click" causesvalidation="False" AccessKey="f" />
                    <input type="button" name="BackBtn" value="�ر�" class="btn btn-primary active" onclick="javascript:window.close()" accesskey="q" />
                </td>                   
                <td align="right" ></td>
              </tr>
              <tr> 
                <td colspan="2">
				<asp:Panel ID="Panel1" runat="server" Width="700" Height="460"  ScrollBars="Auto">
                    <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered"
                    OnRowDataBound="OnRow_Bound"  
                    AutoGenerateColumns="False" 
                    DataKeyNames="ui_id" 
                    EmptyDataText="û�в鵽�������������ݣ�" 
                    Width="850">
                        <Columns>                        
                            <asp:TemplateField HeaderText="����">
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:MiniX('/oa/xxgl/minixx.aspx?id=<%# Eval("ui_id") %>&mc=<%# Eval("ui_desc") %>')"><font color="#3366FF">
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                    </font></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ui_yddh" HeaderText="�ƶ��绰" >
                                <HeaderStyle ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_bgdh" HeaderText="�칫�绰">
                                <HeaderStyle ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_czdh" HeaderText="����绰">
                                <HeaderStyle ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_mail" HeaderText="�����ʼ�">
                                <HeaderStyle ForeColor="Black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="zwmc" HeaderText="ְλ">
                                <HeaderStyle Width="90px" ForeColor="Black" />
                            </asp:BoundField>
                        </Columns>
                        <RowStyle CssClass="GridViewRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                    </asp:GridView>
                  </asp:Panel>
                </td>
              </tr>
              <tr> 
                <td colspan="2" style="height: 22px">
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" 
                      OnPageChanged="AspNetPager1_PageChanged"  
                      ShowCustomInfoSection="left" 
                      ShowInputBox="Auto" 
                      AlwaysShow="false"
                      CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>" 
                      NumericButtonCount="10" 
                      FirstPageText="��ҳ" 
                      LastPageText="ĩҳ" 
                      NextPageText="��ҳ" 
                      PrevPageText="��ҳ" 
                      CustomInfoSectionWidth="250px" 
                      CssClass="page_text" 
                      ShowBoxThreshold="11" 
                      InputBoxClass="AspNetPagerInputBox" 
                      SubmitButtonClass=��AspNetPagerButton�� 
                      SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td></tr>
            </tbody>
          </table>
    </td>
  </tr>
  </tbody>
  </table>
</form>
</body>
</html>