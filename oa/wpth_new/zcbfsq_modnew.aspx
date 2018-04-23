<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcbfsq_modnew.aspx.cs" Inherits="FCSystem.OA.wpth_new.zcbfsq_modnew" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产报废信息</title>
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
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="请输入报废标题" ControlToValidate="tbx_bfbt"></asp:RequiredFieldValidator>
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
                            <asp:Panel ID="spyijpanel" runat="server" Visible="false">
                                <tr>
                                    <td>审批意见：</td>
                                    <td>
                                        <asp:DropDownList ID="spyjxz" runat="server" Width="500px">
                                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                            <asp:ListItem Text="同意" Value="同意"></asp:ListItem>
                                            <asp:ListItem Text="不同意" Value="不同意"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                            </asp:Panel>

                            <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                                <tr>
                                    <td>意见备注：</td>
                                    <td>
                                        <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500px" Enabled="false" TextMode="multiLine"></asp:TextBox></td>
                                </tr>
                            </asp:Panel>

                            <tr>
                                <td colspan="2">
                                    <asp:Label ID="lblTip1" runat="server" Visible="False" ForeColor="Red">上次申请报废的资产信息：</asp:Label>
                                </td>
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
                                </td>
                            </tr>
                            <tr>
                                <td></td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblTip" runat="server" Visible="False" ForeColor="Red">重新申请送审前请重新勾选资产信息：</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Panel ID="plNew" runat="server" Visible="false" ScrollBars="Auto">
                                        <asp:GridView ID="GridView2" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="lymx_tid"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="暂时没有资产信息"
                                            Width="100%" EnableModelValidation="True">
                                            <Columns>
                                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>

                                                <asp:TemplateField>
                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                    <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                    <HeaderTemplate>
                                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="领用单号">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("lydh") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ControlStyle CssClass="navigate" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="lymx_tid" HeaderText="领用明细单号">
                                                    <HeaderStyle CssClass="hidden" />
                                                    <ItemStyle CssClass="hidden" />
                                                    <FooterStyle CssClass="hidden" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="bmmc" HeaderText="所在部门">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="ckmc" HeaderText="领用仓库">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>

                                                <asp:BoundField DataField="zcsm" HeaderText="资产说明">
                                                    <HeaderStyle ForeColor="black" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="报废图片" HeaderStyle-HorizontalAlign="Center">
                                                    <ItemStyle Width="260px" Height="18px" HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <input id="bft" runat="server" type="file" style="width: 140px; height: 20px" class="mytext" /><asp:Button ID="btn_bftsc" runat="server" Height="20px" CommandArgument='<%# Container.DataItemIndex %>' OnClick="ShCh" Text="上传" /><asp:Label ID="lblFilename" runat="server" Text=""></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
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
                                <td></td>
                            </tr>
                            <tr>
                                <td>&nbsp;&nbsp;&nbsp;<asp:Button ID="btn_songshen" cssclass="mybutton" runat="server" Text="送审" Visible="false" OnClick="btn_songshen_Click" />
                                </td>
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
