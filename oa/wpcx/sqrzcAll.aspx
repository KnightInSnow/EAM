<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="sqrzcAll.aspx.cs" Inherits="FCSystem.OA.wply.sqrzcAll" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>申请人名下资产</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout:fixed;">
            <tbody>
                <tr>
                    <td>
                        <input type="button" name="BackBtn" value="关闭" class="mybutton" onclick="javascript: window.close()" accesskey="q" /></td>
                    <td class="td_oa"></td>
                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        <center>
                    <table cellspacing="1" cellpadding="1" border="0" width="98%">
                        <tr>
                            <td class="td_q_space"></td>
                        </tr>
				        <tr>
                            <td><asp:Label ID="lblzcall" runat="server" ForeColor="Red" Font-Size="X-Small" Font-Bold="True"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="td_q_space"></td>
                        </tr>
			        </table>

                    <table cellspacing="0" cellpadding="0" border="0" width="98%">
                      
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="lymx_tid"
                                                EmptyDataText="暂时没有物品信息"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>
                                                 <%--   <asp:TemplateField>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <HeaderTemplate>
                                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>--%>    
                                                         <asp:BoundField DataField="lydh" HeaderText="领用单号">
                                                         <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>                                           
                                                    <asp:BoundField DataField="lymx_tid" HeaderText="领用明细单号">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <FooterStyle CssClass="hidden" />
                                                    </asp:BoundField>                                              
                                                   <asp:TemplateField HeaderText="资产编码">
                                                       <ItemStyle HorizontalAlign="Center" />
                                                       <ItemTemplate>
                                                           <%--<a href="#" onclick="javascript:popMod('directly_print_new.aspx?id=<%#Eval("zcbmfull") %>')"><font color="#3366ff"><asp:Label ID="lblzcbmfll" runat="server" text='<%#Bind("zcbmfull") %>'>'></asp:Label></font></a>--%>
                                                         <asp:LinkButton ID="lbtn_zcbm" runat="server" Text='<%#Eval("zcbmfull")%>' OnClick="lbtn_zcbm_Click"></asp:LinkButton>
                                                       </ItemTemplate>
                                                   </asp:TemplateField>                                                  
                                                    <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_zydm" HeaderText="使用人代码">
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpxh" HeaderText="物品型号">
                                                         <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="物品名称">
                                                         <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>                                                
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
    </form>
</body>
</html>
