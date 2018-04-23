<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wply_mod.aspx.cs" Inherits="FCSystem.OA.wply.wply_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>领用物品</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 60%; height: 25px">物品领用信息</td>
                    <td class="td_oa" style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="true" /><a href="#"><asp:Label ID="lblprn" runat="server" Text="打印领用单" Font-Underline="True" ForeColor="White" Font-Names="仿宋" Font-Size="X-Small" Visible="true"></asp:Label></a></td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td valign="top" colspan="3">
                        <br />
                        <br />
                        <table style="table-layout: fixed">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <table style="table-layout: fixed;">

                                            <tr>
                                                <td> 领用标题：</td>
                                                <td>
                                                    <asp:TextBox ID="lybt" runat="server" Width="450"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="lybt"
                                                        ErrorMessage="请输入领用标题">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> 申请部门：</td>
                                                <td>
                                                    <asp:DropDownList ID="sqbm" Width="450" runat="server" AutoPostBack="True" OnSelectedIndexChanged="sqbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> 申请人员：</td>
                                                <td>
                                                    <asp:DropDownList ID="lyry" runat="server" Width="450">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> 发放部门：</td>
                                                <td>
                                                    <asp:DropDownList ID="ffbm" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ffbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> 发放仓库：</td>
                                                <td>
                                                    <asp:DropDownList ID="ffck" Width="450" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <asp:Panel ID="PanelWPXX" runat="server">
                                                <tr>
                                                    <td> 物品分类：</td>
                                                    <td colspan="3">
                                                        <asp:DropDownList ID="wpfl" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator3"
                                                            runat="server"
                                                            ControlToValidate="wpfl"
                                                            ErrorMessage="请选择物品分类">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td> 物品名称：</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddlWp" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator2"
                                                            runat="server"
                                                            ControlToValidate="ddlWp"
                                                            ErrorMessage="请选择物品信息">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                            </asp:Panel>


                                            <tr>
                                                <td>&nbsp; 紧急程度：</td>
                                                <td>
                                                    <asp:DropDownList ID="jjcd" Width="150" runat="server">
                                                        <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="重要" Value="重要"></asp:ListItem>
                                                        <asp:ListItem Text="紧急" Value="紧急"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td>&nbsp; 领用说明：</td>
                                                <td>
                                                    <asp:TextBox ID="lysm" runat="server" Width="450" Rows="3" TextMode="multiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td colspan="2">
                                                    <asp:Label ID="lbltip" runat="server" ForeColor="Red" Text="送审前请重新选择相应信息！" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <%--<tr>
                                                <td style="width: 90" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="jsr" runat="server">
                                                        <asp:ListItem Text="选择下一步审批人" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:HyperLink ID="flsm" runat="server" Target="_blank" Enabled="false">点击查看分类流程说明</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知下一步审批人" Checked="true" />
                                                    <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知下一步审批人" />
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td></td>
                                                <td style="height: 20px">
                                                    <asp:Button CssClass="mybutton" ID="SongShen" runat="server" Text="申请领用" OnClick="SongShen_Click"></asp:Button><input type="button" name="BackBtn" value=" 关闭 " class="mybutton" onclick="javascript: window.close()" accesskey="q" />
                                                    <asp:ValidationSummary
                                                        ID="ValidationSummary2"
                                                        runat="server"
                                                        EnableClientScript="true"
                                                        ShowMessageBox="true"
                                                        ShowSummary="false"></asp:ValidationSummary>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
            </tbody>
        </table>

        <asp:Panel ID="Panel1" runat="server">
            <table cellspacing="0" cellpadding="0" border="0" width="600px" align="center">
                <asp:Panel ID="PanelKC" runat="server">
                    <tr>
                        <td>&nbsp;&nbsp;库存数量:</td>
                        <td width="28%">
                            <asp:TextBox ID="kcsl" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>&nbsp;申请数量：</td>
                        <td width="28%">
                            <asp:TextBox ID="sqsl" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                </asp:Panel>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="添加" OnClick="Add_Click" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" CausesValidation="False" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sqsl" ErrorMessage="请输入申请数量">&nbsp</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="sqsl" Display="none" ValidationExpression="^[1-9]{1}[\d]*$" ErrorMessage="请输入大于0的整数">&nbsp</asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <table style="table-layout: fixed">
                <tr>
                    <td style="height: 10"></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server"
                            OnRowDataBound="OnRow_Bound"
                            AutoGenerateColumns="False"
                            CellSpacing="1"
                            DataKeyNames="lymx_tid"
                            BorderStyle="None"
                            BorderWidth="0px"
                            BackColor="Silver"
                            EmptyDataText="暂时没有分配物品领用信息"
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
                                <asp:BoundField DataField="lymx_tid" HeaderText="领用详单tid编码">
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                    <FooterStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_zydm" HeaderText="使用人代码">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpxh" HeaderText="型号">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpmc" HeaderText="物品名称">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="sqsl" HeaderText="申请数量">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
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
        <asp:Label ID="lbllyid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbllyzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="sqwpzsl" runat="server" Text="0" Visible="False"></asp:Label>
    </form>
</body>
</html>
