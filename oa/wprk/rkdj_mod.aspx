<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rkdj_mod.aspx.cs" Inherits="FCSystem.OA.wprk.rkdj_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>查看入库登记</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td class="td_oa" style="height: 25px; width: 80%">
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s" CausesValidation="true" Visible="false"></asp:Button><asp:Button cssclass="mybutton" ID="DelJhBtn" runat="server" Text="删除入库单" OnClick="DelJh_Click" AccessKey="d" OnClientClick="return confirm('确认要删除该张入库单吗？')"  Visible="false"></asp:Button><asp:Button CssClass="mybutton" ID="SendBtn" runat="server" Text="送审" OnClick="Send_Click" CausesValidation="true" Visible="false"></asp:Button><asp:Button ID="AddBtn" Text="新增入库物品" cssclass="mybutton" runat="server" Visible="false" CausesValidation="false" /><asp:Button cssclass="mybutton" ID="DelBtn" runat="server" Text="删除入库物品" OnClick="Del_Click" Visible="false" OnClientClick="return confirm('确认要删除勾选的入库物品吗？')" /><asp:Button CssClass="mybutton" ID="RefBtn" runat="server" Text="刷新" OnClick="Ref_Click" CausesValidation="false" Visible="false" /><input type="button" name="BackBtn" value="关闭" class="mybutton" onclick="javascript: window.close()" accesskey="q" />&nbsp;
                    </td>
                    <td class="td_oa">
                        <asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="true" /><asp:Label ID="PrnLbl" runat="server" Text="打印入库单" Font-Underline="True" Font-Names="仿宋" Font-Size="X-Small" Visible="true"></asp:Label></td>
                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        <table style="table-layout:fixed;">
                            <tr>
                                <td colspan="4" align="center" style="height: 25">
                                    <asp:Label ID="rkdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%">仓库：</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="rkck" runat="server" Width="500">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>供应商：</td>
                                <td>
                                    <asp:DropDownList ID="ddl_gys" runat="server" Width="500">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>备注:</td>
                                <td>
                                    <asp:TextBox ID="rkbz" runat="server" Width="500px" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>
                            <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                                <tr>
                                    <td style="width: 20%">审批意见：</td>
                                    <td colspan="3">
                                        <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500" ReadOnly="true" TextMode="multiLine" Rows="2" Enabled="false"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="height: 25;">审批人：</td>
                                    <td>
                                        <asp:TextBox ID="spr" runat="server" Width="150" Enabled="false" /></td>
                                </tr>
                                <tr>
                                    <td>审批时间：</td>
                                    <td>
                                        <asp:TextBox ID="spsj" runat="server" Width="150" Enabled="false" /></td>
                                </tr>
                            </asp:Panel>
                            <asp:Panel ID="songshen" runat="server" Visible="false">
                                <tr>
                                    <td class="td_no" style="height: 25; width: 20%">&nbsp;</td>
                                    <td colspan="2" style="width: 45%">
                                        <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知库管人员" Checked="true" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知库管人员" />
                                    </td>
                                    <td style="width: 35%"></td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td colspan="2" style="height: 5px"></td>
                            </tr>
                        </table>
                        <asp:Panel ID="plContent" runat="server" Visible="true" ScrollBars="Auto">
                            <table style="table-layout:fixed;">
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="rkmxid"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="暂时没有登记任何物品入库信息"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderStyle Width="30px"></HeaderStyle>
                                                    <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                    <HeaderTemplate>
                                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="rkmxid" HeaderText="编码">
                                                    <HeaderStyle CssClass="hidden" />
                                                    <ItemStyle CssClass="hidden" />
                                                    <FooterStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="物品编码">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <a href="#" onclick="javascript:popMiniMod('rkdmx_mod.aspx?id=<%# Eval("rkmxid") %>&id2=<%# Eval("ssrkdid") %>&id3=<%# Eval("rk_gys") %>')"><font color="#3366ff"> <asp:Label ID="Label2bm" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label></font></a>
                                                    </ItemTemplate>
                                                    <ControlStyle CssClass="navigate" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="wpmc" HeaderText="物品名称">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="fl_mc" HeaderText="类别">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="wpxh" HeaderText="型号">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="gysmc" HeaderText="供应商">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="入库数量">
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2cc" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="入库单价">
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdj") %>'></asp:Label>
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
                            </table>
                        </asp:Panel>
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
            ControlToValidate="rkck"
            ErrorMessage="请选择入库仓库">&nbsp;
        </asp:RequiredFieldValidator>
        <!--隐藏label-->
        <asp:Label ID="rkzt" runat="server" Visible="false" />
        <asp:Label ID="lblrkdid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblgystid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
