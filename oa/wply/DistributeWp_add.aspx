<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="DistributeWp_add.aspx.cs" Inherits="FCSystem.OA.wply.DistributeWp_add" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>物品派发</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/AutoComplete.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("lybt");  //初始化设置光标焦点
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
        function refreshParentPage() {
            window.opener.location.href = window.opener.location.href;
        }
    </script>
    <style type="text/css">
        .auto-style1 {
            width: 197px;
        }

        .auto-style2 {
            width: 209px;
        }
    </style>
</head>
<body class="main" method="post" oncontextmenu="return false">
    <form id="form1" runat="server">
        <ajaxToolkit:ToolkitScriptManager runat="server" ID="ScriptManager1"></ajaxToolkit:ToolkitScriptManager>
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 60%; height: 25px">新增物品派发</td>
                    <td class="td_oa" style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><a href="#"><asp:Label ID="lblprn" runat="server" Text="打印领用单" ForeColor="White" Font-Underline="True" Font-Names="仿宋" Font-Size="X-Small" Visible="false"></asp:Label></a></td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <ajaxToolkit:AutoCompleteExtender
                            runat="server"
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1"
                            TargetControlID="myTextBox"
                            ServicePath="~/AutoComplete.asmx"
                            ServiceMethod="GetWpCompletionList"
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
                    <td colspan="3">
                        <table style="table-layout: fixed">
                            <tbody>
                                <tr>
                                    <td colspan="2">
                                        <table style="table-layout: fixed;">
                                            <tr>
                                                <td><strong>搜索物品</strong></td>
                                                <td colspan="3">
                                                    <asp:TextBox runat="server" ID="myTextBox" Width="400px" CssClass="ctlAlign" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" Height="21px" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                            <tr>
                                                <td> 派发标题：</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="lybt" runat="server" Width="450" Font-Bold="true" ForeColor="DarkGray"></asp:TextBox>
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
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ddl_sqbm" Width="450" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_sqbm_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator7"
                                                        runat="server"
                                                        ControlToValidate="ddl_sqbm"
                                                        ErrorMessage="请选择申请部门">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> 申请人员：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ddl_sqr" runat="server" Width="450">
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator8"
                                                        runat="server"
                                                        ControlToValidate="ddl_sqr"
                                                        ErrorMessage="请选择申请人员">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> 发放部门：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ffbm" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ffbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator2"
                                                        runat="server"
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="请选择物品发放部门">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> 发放仓库：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ffck" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ffck_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator4"
                                                        runat="server"
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="请选择物品发放仓库">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
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
                                                        ID="RequiredFieldValidator5"
                                                        runat="server"
                                                        ControlToValidate="ddlWp"
                                                        ErrorMessage="请选择物品名称">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp; 紧急程度：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="jjcd" Width="150" runat="server">
                                                        <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="重要" Value="重要"></asp:ListItem>
                                                        <asp:ListItem Text="紧急" Value="紧急"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp; 备注说明：</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="lysm" runat="server" Width="450" Rows="3" TextMode="multiLine"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td colspan="3"></td>
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
        <br />
        <table width="600px" align="center">
            <tr>
                <td><font color="red">请先添加需要领用的物品信息</font></td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server">
            <table cellspacing="0" cellpadding="0" border="0" width="600px" align="center">
                <tr>
                    <td>
                        <asp:Label ID="lbl_syr" Text="使用人：" runat="server"></asp:Label>
                    </td>
                    <td width="20%">
                        <asp:DropDownList ID="ddl_syr" runat="server" Width="100%">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;库存数量:
                    </td>
                    <td width="15%" style="text-align: center">
                        <asp:Label ID="lblKcinfo" runat="server" Text="" Width="100%" Enabled="false"></asp:Label>
                    </td>
                    <td>申请数量：
                    </td>
                    <td width="20%">
                        <asp:TextBox ID="sqsl" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="5" style="text-align: right">
                        <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="添加" OnClick="Add_Click" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" CausesValidation="False" />
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
                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
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
                <tr>
                    <td></td>
                </tr>
                <tr align="right">
                    <td>
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="派发" OnClick="Save_Click" Enabled="False"></asp:Button><asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false" CssClass="mybutton" AccessKey="r" /><input type="button" name="BackBtn" value=" 关闭 " class="mybutton" onclick="javascript: window.close()" accesskey="q" /></td>
                </tr>
                <tr>
                    <td style="height: 25px">
                        <asp:ValidationSummary
                            ID="ValidationSummary2"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sqsl" ErrorMessage="请输入申请数量">&nbsp</asp:RequiredFieldValidator><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="sqsl" Display="none" ValidationExpression="^[1-9]{1}[\d]*$" ErrorMessage="请输入大于0的整数">&nbsp</asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator9"
                            runat="server"
                            ControlToValidate="ddl_syr"
                            ErrorMessage="请选择使用人员">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <div style="display: none">
            <asp:Button ID="btnConfirm" runat="server" OnClick="btnConfirm_Click" />
        </div>
        <asp:Label ID="lblMaxLYID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbl_maxlyindex" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="sqzsl" runat="server" Text="0" Visible="False"></asp:Label>
        <asp:Label ID="kcsl" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:Label ID="ysqsl" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:Label ID="lblDlrysqsl" runat="server" Text="0" Visible="false"></asp:Label>
        <asp:Label ID="lblDlyhtid" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="lblWpinfo" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
