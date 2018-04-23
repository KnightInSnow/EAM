<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zczjbf_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.zczjbf_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>报废登记</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tr>
                <td class="td_oa" style="width: 60%; height: 25px">
                    <input type="button" name="BackBtn" value="关闭" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /></td>
                <td class="td_oa" style="width: 20%">
                    <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:Label ID="lblprn" runat="server" Text="打印报废单" Font-Underline="True" Font-Names="仿宋" Font-Size="X-Small" Visible="false"></asp:Label></td>
                <td class="td_oa"></td>
            </tr>

            <tr>
                <td colspan="3" valign="top">
                    <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                        <table style="table-layout:fixed;">
                            <tr>
                                <td>
                                    <asp:Label ID="lblBfdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>报废标题：</td>
                                <td>
                                    <asp:TextBox ID="tbx_bfbt" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>收回仓库：</td>
                                <td>
                                    <asp:TextBox ID="tbx_shck" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>收回部门：</td>
                                <td>
                                    <asp:TextBox ID="tbx_shbm" Width="500px" Enabled="false" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>报废说明：</td>
                                <td>
                                    <asp:TextBox ID="tbx_bfsm" runat="server" Width="500px" Rows="3" TextMode="multiLine" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>

                        <table style="table-layout:fixed;">
                            <tr>
                                <td>
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
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                                <FooterStyle CssClass="hidden" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                                <FooterStyle CssClass="hidden" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
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
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <!--隐藏label-->
        <asp:Label ID="lblBfzt" runat="server" Visible="False" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="lblBfid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblYngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSqrytid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblShcktid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
