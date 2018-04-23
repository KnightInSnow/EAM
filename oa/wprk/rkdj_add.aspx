<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rkdj_add.aspx.cs" Inherits="FCSystem.OA.wprk.rkdj_add" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>物品入库登记</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/AutoComplete.css" rel="stylesheet" type="text/css" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td>
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s" CausesValidation="true"></asp:Button><asp:Button CssClass="mybutton" ID="SendBtn" runat="server" Text="送审" OnClick="Send_Click" CausesValidation="true" Visible="false"></asp:Button><asp:Button ID="AddBtn" Text="新增入库商品" cssclass="mybutton" runat="server" Visible="false" CausesValidation="false" /><asp:Button cssclass="mybutton" ID="DelBtn" runat="server" Text="删除入库商品" OnClick="Del_Click" Visible="false" OnClientClick="return confirm('确认要执行删除吗？')" /><asp:Button CssClass="mybutton" ID="RefBtn" runat="server" Text="刷新" OnClick="Ref_Click" Visible="false" CausesValidation="false" /><input type="button" name="BackBtn" value="关闭" class="mybutton" onclick="javascript: window.close()" accesskey="q" />&nbsp;
                    </td>
                    <td class="td_oa"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp</span>=必填信息</td>
                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        <table style="table-layout:fixed;">
                            <tr>
                                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                <td colspan="3" align="center">
                                    <ajaxToolkit:AutoCompleteExtender
                                        runat="server"
                                        BehaviorID="AutoCompleteEx"
                                        ID="autoComplete1"
                                        TargetControlID="myTextBox"
                                        ServicePath="~/AutoComplete.asmx"
                                        ServiceMethod="GetWPGysCompletionList"
                                        MinimumPrefixLength="1"
                                        EnableCaching="true"
                                        CompletionSetCount="20"
                                        CompletionInterval="200"
                                        CompletionListCssClass="autocomplete_completionListElement"
                                        CompletionListItemCssClass="autocomplete_listItem"
                                        CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                        DelimiterCharacters=""
                                        ShowOnlyCurrentWordInCompletionListItem="true">
                                    </ajaxToolkit:AutoCompleteExtender>
                                </td>
                            </tr>
                            <tr>
                                <td class="td_no" style="height: 25; width: 120"></td>
                                <td style="width: 160"></td>
                                <td class="td_no" style="width: 80"></td>
                                <td></td>
                            </tr>
                            <tr>
                                <td class="td_no"></td>
                                <td colspan="3"><font color="red">提示：您只能选择自己能够使用的物品类型仓库</font></td>
                            </tr>
                            <tr>
                                <td>机构代码：</td>
                                <td colspan="3">
                                    <asp:Label ID="lblJGDM" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td>入库单号：</td>
                                <td colspan="3">
                                    <asp:Label ID="lblRKDH" runat="server" Text="Label"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>仓库：</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="rkck" runat="server" Width="500" OnSelectedIndexChanged="rkck_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>搜索供应商</td>
                                <td colspan="3">
                                    <asp:TextBox runat="server" ID="myTextBox" Width="500px" CssClass="ctlAlign" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" Height="21px" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" />
                                </td>
                            </tr>
                            <tr>
                                <td>供应商：</td>
                                <td colspan="3">
                                    <asp:DropDownList ID="ddl_gys" runat="server" Width="500px">
                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                    </asp:DropDownList><asp:ImageButton ID="imgbtn_addnew" Width="17px" ImageUrl="~/images/add.gif" runat="server" CausesValidation="False" />
                                </td>
                            </tr>
                            <tr>
                                <td>备注：</td>
                                <td colspan="3">
                                    <asp:TextBox ID="rkbz" runat="server" Width="500px" TextMode="MultiLine" Rows="2"></asp:TextBox>
                                </td>
                            </tr>
                            <asp:Panel ID="songshen" runat="server" Visible="false">
                                <tr>
                                    <td class="td_no" style="height: 25; width: 120"></td>
                                    <td colspan="2">
                                        <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知库管人员" Checked="true" />
                                        <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知库管人员" />
                                    </td>
                                    <td></td>
                                </tr>
                            </asp:Panel>
                            <tr>
                                <td colspan="4" style="height: 5"></td>
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
                                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
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
                                                <asp:TemplateField HeaderText="商品编码">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <a href="#" onclick="javascript:popMiniMod('rkdmx_mod.aspx?id=<%# Eval("rkmxid") %>&id2=<%# Eval("ssrkdid") %>&id3=<%# Eval("rk_gys") %>')"><font color="#3366ff"> <asp:Label ID="Label2bm" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label></font></a>
                                                    </ItemTemplate>
                                                    <ControlStyle CssClass="navigate" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="wpmc" HeaderText="商品名称">
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
                                                        <asp:Label ID="Label2aa" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
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

        <!--隐藏label-->
        <asp:Label ID="IDlabel" runat="server" Visible="false" />
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
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator1"
            runat="server"
            ControlToValidate="ddl_gys"
            ErrorMessage="请选择供应商信息">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:Label ID="lblyhtid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
