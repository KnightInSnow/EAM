<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="quick.aspx.cs" Inherits="FCSystem.quick1" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��ݷ�ʽ</title>
<link href="../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../csjs/myjs.js"></script>  
    <style type="text/css">
        .auto-style1
        {
            height: 40px;
            width: 700px;
        }
    </style>
</head>
<body class="main">
<form id="form1"  method="post" runat="server">
<table style="table-layout: fixed">
    <tbody>
      <tr> 
        <td style="height:20px;background-color: #8CA1AE;">
          <table width="157" style="height:100%" border="0" cellpadding="0" cellspacing="0">
            <tr> 
              <td align="center" style="background-image: url(../../images/bg.gif);">�ҵĿ�ݷ�ʽ</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr > 
        <td><table style="table-layout:fixed;">
            <tbody>
              <tr> 
                <td class="auto-style1">
                    &nbsp;��ݷ�ʽ���ͣ�<asp:Image ID="ImageY" runat="server" ImageUrl='/images/quick/N.gif' /> ����&nbsp;<asp:Image ID="ImageN" runat="server" ImageUrl='/images/quick/Y.gif' /> ����(��ֹ�޸ĺ�ɾ��)
                    <asp:HyperLink ID="downfj" Enabled="true" Target="_blank" runat="server" CssClass="navigate" Visible="false" Text="����/����ע���ļ�" />
                </td>                    
                <td align="center">
                <input type="button" name="AddBtn" value="����" class="qq_btn_100px" onclick="javascript:popAdd('quick_view.aspx');" accesskey="a" /><asp:button cssclass="mybutton" id="RegBtn" text="����ע���ļ�" runat="server" OnClick="Reg_Click"></asp:button><asp:button cssclass="mybutton" id="RefBtn" runat="server" text="ˢ��" AccessKey="e" CausesValidation = "false" OnClick="Query_Click"></asp:button> 
                </td>
              </tr>
              <tr> 
                <td colspan="2">
				<asp:Panel ID="Panel1" runat="server"  ScrollBars="Auto">
                   <table width="100%" border="0" cellspacing="1" cellpadding="0" bgcolor="#bdbdbe">
		              <tr>
			            <td bgcolor="#ffffff" valign="top">
			            <asp:GridView ID="GridView1" runat="server"  
                                AutoGenerateColumns="False" 
                                DataKeyNames="qid"
                                DataSourceID="SqlDataSource1"  
                                EmptyDataText="�����κο�ݷ�ʽ��" 
                                Width="100%"
                                ShowHeader="False"
                                OnRowDataBound="Item_Bound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="����">
                                            <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("qlx", "~/images/quick/{0}.gif") %>' />
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="Black" />
                                            <ItemStyle HorizontalAlign="center" Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ͼ��">
                                            <ItemTemplate>
                                                <a href="<%# Eval("qcs") %>:">
                                                    <asp:Image ID="Imageqcs" runat="server" ImageUrl='<%# Eval("qtb", "~/images/quick/{0}") %>' />
                                                    <font color="#3366FF"><asp:Label ID="Labelnr" runat="server" Text='<%# Bind("qmc") %>' /></font>
                                                </a>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="Black" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="����·��">
                                            <ItemTemplate>
                                                <font color="#999999"><asp:Label ID="Label1" runat="server" Text='<%# Bind("qlj") %>'></asp:Label></font>
                                                <a href="#" onclick="javascript:popMod('/quick_view.aspx?id=<%# Eval("qid") %>')"><asp:Image ID="Imageqlj" runat="server" ImageUrl='/images/edit.gif' ToolTip="�޸Ĵ˿�ݷ�ʽ" /></a>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick ="return confirm('ȷ��Ҫִ��ɾ����')" ImageUrl="~/images/del.gif" AlternateText="ɾ���˿�ݷ�ʽ" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="���" visible="False">
                                            <ItemTemplate>
                                            <asp:Label id="dp_id" runat="server" text='<%# Eval("qid")%>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <RowStyle BackColor="#F7F7F7" />
                                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                    <AlternatingRowStyle BackColor="#E6E6E6" />
                                </asp:GridView>
			            </td>
		              </tr>
		            </table>
                  </asp:Panel>
                  <font color="red">���裺1.����/�޸Ŀ�ݷ�ʽ>>> 2.����ע���ļ�>>> 3.ֱ����������ע���ļ�������ע�����������ע���ļ�������Ȼ���ֹ����룬���!<br />���ѣ�ֻ�гɹ�д����ע���ĵ��ԣ��ſ�������ʹ��������ݷ�ʽ!</font>
                </td>
              </tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table> 
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EamSqlConnectionString %>"></asp:SqlDataSource>
</form>
</body>
</html>
