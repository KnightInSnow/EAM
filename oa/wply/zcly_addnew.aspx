<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcly_addnew.aspx.cs" Inherits="FCSystem.OA.wply.zcly_addnew" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>领用资产</title>

    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />

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
            //var n = window.event.screenX - window.screenLeft;
            //var b = n > document.documentElement.scrollWidth;
            //if (!(b && window.event.clientY < 0 || window.event.altKey)) 
            window.opener.location.href = window.opener.location.href;
        }
    </script>
</head>

<body class="main" method="post" oncontextmenu="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>

        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td style="width: 60%;">新增资产领用</td>
                    <td style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" />
                        <a href="#">
                            <asp:Label ID="lblprn" runat="server" Text="打印领用单" Font-Underline="True" Visible="false" ForeColor="White"></asp:Label></a>
                    </td>
                    <td style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
            </table>
        </div>

        <div class="PopBodyInputs">

            <table style="table-layout: fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td></td>
                    <td><strong>搜索资产</strong></td>
                    <td colspan="2">
                        <asp:TextBox runat="server" ID="myTextBox" CssClass="ctlAlign InputHalfWidth" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" Height="21px" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" />
                    </td>
                    <td>
                        <ajaxToolkit:AutoCompleteExtender
                            runat="server"
                            BehaviorID="AutoCompleteEx"
                            ID="autoComplete1"
                            TargetControlID="myTextBox"
                            ServicePath="~/AutoComplete.asmx"
                            ServiceMethod="GetZcCompletionList"
                            MinimumPrefixLength="1"
                            EnableCaching="true"
                            CompletionSetCount="30"
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
                    <td>
                        <br />
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>领用标题：
                    </td>
                    <td colspan="4">
                        <asp:TextBox ID="lybt" runat="server"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="lybt"
                            ErrorMessage="请输入领用标题">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>发放部门：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_ffbm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_ffbm_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="ddl_ffbm"
                            ErrorMessage="*"></asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>发放仓库：</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="PopMust" ID="ddl_ffck" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_ffck_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="ddl_ffck"
                            ErrorMessage="请选择商品发放仓库">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>资产分类：</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="PopMust" ID="ddl_zcfl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_zcfl_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="ddl_zcfl"
                            ErrorMessage="请选择资产分类">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>领用资产：</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="PopMust" ID="ddlWp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator5"
                            runat="server"
                            ControlToValidate="ddlWp"
                            ErrorMessage="请选择领用资产">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>出库方式：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_lcfs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_lcfs_SelectedIndexChanged">
                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <asp:Panel ID="Panelghsj" runat="server" Visible="false">
                    <tr>
                        <td>归还时间：</td>
                        <td>
                            <asp:TextBox ID="tbx_ghsj" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbx_ghsj" CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="日期格式不正确"
                                ControlToValidate="tbx_ghsj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator></td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td>紧急程度：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_jjcd" runat="server">
                            <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="重要" Value="重要"></asp:ListItem>
                            <asp:ListItem Text="紧急" Value="紧急"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>领用说明：</td>
                    <td colspan="4">
                        <asp:TextBox ID="lysm" runat="server" CssClass="MultiLineText" Rows="3" TextMode="multiLine"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>库存数量：
                    </td>
                    <td>
                        <asp:Label ID="lblkcinfo" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>申请数量：</td>
                    <td>
                        <asp:TextBox CssClass="InputQuarterWidth PopMust" ID="tbx_sqsl" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4">
                        <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="添加资产" OnClick="Add_Click" CausesValidation="true" />
                        <asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </div>

        <div class="PopBodyGrid">
            <asp:Panel ID="Panel2" runat="server" CssClass="fPopPanel sPopPanel" style="height:60px;">
                <table style="table-layout: fixed;">
                    <tr>
                        <td>
                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                OnRowDataBound="OnRow_Bound"
                                AutoGenerateColumns="False"
                                DataKeyNames="lymx_tid"
                                EmptyDataText="暂时没有登记资产领用信息"
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
                                    <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ui_zydm" HeaderText="使用人代码">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="wpxh" HeaderText="型号">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zt" HeaderText="状态">
                                        <HeaderStyle ForeColor="black" />
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="zcsm" HeaderText="资产说明">
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
                        <td>
                            <div class="Pop-EmptyLine-Normal" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>

        <br />

        <div class="PopBodyInputs">
            <table style="table-layout: fixed;">
                <tr>

                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="申请领用" OnClick="Save_Click" Enabled="False" ValidationGroup="1"></asp:Button>
                    </td>
                    <td>
                        <asp:Button ID="btn_clear" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false" Visible="false" CssClass="mybutton" AccessKey="r" />
                    </td>
                    <td>
                        <asp:ValidationSummary
                            ID="ValidationSummary2"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator6"
                            runat="server"
                            ControlToValidate="tbx_sqsl"
                            ErrorMessage="请填写申请数量">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbx_sqsl" ErrorMessage="申请数量数据格式不正确" MaximumValue="1000" MinimumValue="1" Type="Integer">*</asp:RangeValidator>
                    </td>
                    <td></td>
                </tr>
            </table>
            </asp:Panel>
        </div>

        <asp:Label ID="lblMaxLYID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbl_maxlyindex" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbldlyhtid" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="kcbz" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="sqsl" runat="server" Text="0" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="tbx_kcsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lbldlrysqsl" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>
