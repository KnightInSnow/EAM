<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcbfsq_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.zcbfsq_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产报废</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 60%; height: 25px">
                        <input type="button" name="BackBtn" value="关闭" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /></td>
                    <td class="td_oa" style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="true" /><asp:Label ID="lblprn" runat="server" Text="打印报废单" Font-Underline="True" Font-Names="仿宋" Font-Size="X-Small" Visible="true"></asp:Label></td>
                    <td class="td_oa"></td>
                </tr>

                <tr>
                    <td colspan="3" valign="top">
                        <center>
                    <table style="table-layout:fixed;">
                        <tr>
                            <td colspan="2" align="center" style="height:25px"><asp:Label ID="bfdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                            </td>
                        </tr>
				        <tr>
                            <td style="width:15%">收回仓库：</td>
                            <td><asp:TextBox ID="shck" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                            </td>
                        </tr>

                        <asp:Panel ID="spyijpanel" runat="server" Visible="false">
                            <tr>
                             <td>审批意见：</td>
                             <td>
                                 <asp:DropDownList ID="spyjxz" runat="server" Width="500px" >
                                     <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem> 
                                     <asp:ListItem Text="同意" Value="同意"></asp:ListItem>
                                      <asp:ListItem Text="不同意" Value="不同意"></asp:ListItem>
                                 </asp:DropDownList>
                             </td>
                         </tr>
                        </asp:Panel>

                        <asp:panel id="spyjpanel" runat="server" Visible="false">
                        <tr>
                            <td style="width:15%">意见备注：</td>
                            <td><asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500px" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox></td>
                        </tr>
                        </asp:panel>

                        <tr><td colspan="2" style="height:5px"></td></tr>
			        </table>

                    <table style="table-layout:fixed;">
                        <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                OnRowDataBound="OnRow_Bound"  
                                AutoGenerateColumns="False" 
                                DataKeyNames="bfid"
                                EmptyDataText="暂时没有登记任何信息" 
                                Width="100%">
                                <Columns>                        
                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                        <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                <asp:BoundField DataField="bfid" HeaderText="编码">
                                    <HeaderStyle CssClass ="hidden"/>
                                    <ItemStyle CssClass ="hidden"/>
                                    <FooterStyle CssClass ="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                    <HeaderStyle ForeColor="black" />
                                     <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="商品编码">
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemStyle HorizontalAlign="center" />
                                    <ItemTemplate>
                                       <font><asp:Label ID="Label2bm" runat="server" Text='<%# Eval("wpbm") %>'></asp:Label></font>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="fl_mc" HeaderText="商品分类">
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="gysmc" HeaderText="商品供应商">
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                           
                                <asp:TemplateField HeaderText="商品单价">
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle ForeColor="Black" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("wpdj") %>'></asp:Label>                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle CssClass="GridViewRowStyle" />
                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                            <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                        </asp:GridView>
			        </table>
			</center>
                    </td>
                </tr>
            </tbody>
        </table>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="spyjxz"
            ErrorMessage="请输入审批意见">&nbsp;
        </asp:RequiredFieldValidator>

        <!--隐藏label-->
        <asp:Label ID="bfzt" runat="server" Visible="False" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="bfidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="kcsl" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="yngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label>
    </form>
</body>
</html>
