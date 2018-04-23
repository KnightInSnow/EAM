<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="dbsy.aspx.cs" Inherits="FCSystem.dbsy" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>我的首页</title>
<link href="../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../csjs/myjs.js"></script>
<script type="text/javascript">
function change_view(obj_name)
{
var aa=document.getElementById(obj_name);
if(aa.style.display=="")
{
aa.style.display="none";
}
else
{
aa.style.display="";
}
}
</script>
    <style type="text/css">
        .auto-style1
        {
            height: 30px;
            width: 950px;
        }
    </style>
</head>
<body class="main">
<form id="Form1" runat="server">
<center>
<table style="table-layout: fixed">
<tr>
<td align="right" class="auto-style1">&nbsp;</td>
<td align="center" style="height:30px"><asp:button id="cmdNewFlow" runat="server" CssClass="mybutton" Text="刷新" OnClick="Refresh_Click"></asp:button></td>
</tr>
</table>
<asp:Panel id="panel888" runat="server" ScrollBars="auto">
<table style="table-layout: fixed">
    <asp:Panel ID="s11p" runat="server" Visible="false">
    <tr>
        <td>
        <table width="100%" border="0" cellpadding="0" cellspacing="1" style="background-color:#999999">
          <tr onclick="change_view('a25')">
            <td style="height:20px;background-image: url(images/initb2.gif)">&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="images/initdown.gif" /> 等待审批的文档</td>
          </tr>
          <tr id="a25" style="background-color:#ecece8;display:none"><!-- 如果想一打开网页菜单就是展开的，此处删除none--->
            <td>
              <asp:Panel ID="Panel25" runat="server"  ScrollBars="Auto" Height="100">
                <asp:datagrid id="datagrid25" runat="server" 
                        CellSpacing="1" 
                        BorderStyle="None" 
                        BorderWidth="0px"
                        BackColor="Silver" 
					    OnItemDataBound="dg_ItemDataBound" 
					    AutoGenerateColumns="False" 
					    Width="100%">
					    <ItemStyle CssClass="list_gray"></ItemStyle>
					    <HeaderStyle CssClass="GridViewHeaderStyle"></headerStyle>
					    <Columns>
						    <asp:TemplateColumn HeaderText="ID">
							    <HeaderStyle CssClass="hidden" />
							    <ItemStyle CssClass="hidden" />
							    <ItemTemplate>
								    <asp:label id="Flow_ID" runat="server" />
							    </ItemTemplate>
						    </asp:TemplateColumn>
						    <asp:TemplateColumn HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# datagrid25.Items.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" HorizontalAlign="Center" />
                            </asp:TemplateColumn>
						    <asp:TemplateColumn HeaderText="文档标题">
							    <HeaderStyle HorizontalAlign="Center" Font-Bold="True"></HeaderStyle>
							    <ItemTemplate>
								    <asp:HyperLink CssClass="navigate" ID="HyperLink1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.Title") %>' NavigateUrl='<%# GetdisplayDocumentUrl(DataBinder.Eval(Container, "DataItem.Doc_ID").ToString())%>'></asp:HyperLink>
							    </ItemTemplate>
						    </asp:TemplateColumn>
						    <asp:BoundColumn DataField="DocBuilder" HeaderText="拟稿人">
							    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" Width="10%"></HeaderStyle>
						    </asp:BoundColumn>
						    <asp:BoundColumn DataField="Short_Doc_Added_Date" HeaderText="拟稿时间">
							    <HeaderStyle Width="13%" HorizontalAlign="Center" Font-Bold="True"></HeaderStyle>
							    <ItemStyle HorizontalAlign="center" />
						    </asp:BoundColumn>
						    <asp:BoundColumn DataField="Status" HeaderText="状态">
							    <HeaderStyle HorizontalAlign="Center" Font-Bold="True" Width="8%"></HeaderStyle>
							    <ItemStyle HorizontalAlign="Center"></ItemStyle>
						    </asp:BoundColumn>
					    </Columns>
					</asp:datagrid>
              </asp:Panel>
            </td>
          </tr>
        </table>
        </td>
    </tr>
    <tr>
        <td style="height:10px"></td>
    </tr>
    </asp:Panel>
</table>
</asp:Panel>
</center>
</form>
</body>
</html>