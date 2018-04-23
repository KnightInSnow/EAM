<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="quick.aspx.cs" Inherits="FCSystem.quick1" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>快捷方式</title>
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
              <td align="center" style="background-image: url(../../images/bg.gif);">我的快捷方式</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr > 
        <td><table style="table-layout:fixed;">
            <tbody>
              <tr> 
                <td class="auto-style1">
                    &nbsp;快捷方式类型：<asp:Image ID="ImageY" runat="server" ImageUrl='/images/quick/N.gif' /> 个人&nbsp;<asp:Image ID="ImageN" runat="server" ImageUrl='/images/quick/Y.gif' /> 公共(禁止修改和删除)
                    <asp:HyperLink ID="downfj" Enabled="true" Target="_blank" runat="server" CssClass="navigate" Visible="false" Text="运行/下载注册文件" />
                </td>                    
                <td align="center">
                <input type="button" name="AddBtn" value="新增" class="qq_btn_100px" onclick="javascript:popAdd('quick_view.aspx');" accesskey="a" /><asp:button cssclass="mybutton" id="RegBtn" text="生成注册文件" runat="server" OnClick="Reg_Click"></asp:button><asp:button cssclass="mybutton" id="RefBtn" runat="server" text="刷新" AccessKey="e" CausesValidation = "false" OnClick="Query_Click"></asp:button> 
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
                                EmptyDataText="暂无任何快捷方式！" 
                                Width="100%"
                                ShowHeader="False"
                                OnRowDataBound="Item_Bound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="公共">
                                            <ItemTemplate>
                                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("qlx", "~/images/quick/{0}.gif") %>' />
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="Black" />
                                            <ItemStyle HorizontalAlign="center" Width="30px" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="图标">
                                            <ItemTemplate>
                                                <a href="<%# Eval("qcs") %>:">
                                                    <asp:Image ID="Imageqcs" runat="server" ImageUrl='<%# Eval("qtb", "~/images/quick/{0}") %>' />
                                                    <font color="#3366FF"><asp:Label ID="Labelnr" runat="server" Text='<%# Bind("qmc") %>' /></font>
                                                </a>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="Black" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="程序路径">
                                            <ItemTemplate>
                                                <font color="#999999"><asp:Label ID="Label1" runat="server" Text='<%# Bind("qlj") %>'></asp:Label></font>
                                                <a href="#" onclick="javascript:popMod('/quick_view.aspx?id=<%# Eval("qid") %>')"><asp:Image ID="Imageqlj" runat="server" ImageUrl='/images/edit.gif' ToolTip="修改此快捷方式" /></a>
                                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick ="return confirm('确认要执行删除吗？')" ImageUrl="~/images/del.gif" AlternateText="删除此快捷方式" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="序号" visible="False">
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
                  <font color="red">步骤：1.新增/修改快捷方式>>> 2.生成注册文件>>> 3.直接在线运行注册文件并导入注册表，或者下载注册文件到本地然后手工导入，完成!<br />提醒：只有成功写入了注册表的电脑，才可以正常使用上述快捷方式!</font>
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
