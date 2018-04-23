<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Direct_Ly_add.aspx.cs" Inherits="FCSystem.OA.wply.Direct_Ly_add" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" /> 
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>领用登记</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>

    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />

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
            height: 20px;
        }
    </style>
</head>
<body class="main" method="post" oncontextmenu="return false">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>

        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td style="width: 60%; height: 25px">领用登记</td>
                    <td style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><a href="#"><asp:Label ID="lblprn" runat="server" Text="打印领用单" Visible="false"></asp:Label></a>
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
                    <td colspan="3" align="center">
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
                    <td><strong>搜索资产：</strong></td>
                    <td colspan="4">
                        <asp:TextBox runat="server" ID="myTextBox" CssClass="form-control" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" />
                    </td>
                </tr>

                <tr>
                    <td>领用标题：</td>
                    <td colspan="4">
                        <asp:TextBox ID="lybt" runat="server" CssClass="form-control"></asp:TextBox>

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
                    <td>申请部门：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddlbm" runat="server" AutoPostBack="True" Enabled="False" CssClass="form-control"></asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator7"
                            runat="server"
                            ControlToValidate="ddlbm"
                            ErrorMessage="请选择申请部门">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>申请人员：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddlry" runat="server" AutoPostBack="True" Enabled="False" CssClass="form-control"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8"
                            runat="server"
                            ControlToValidate="ddlry"
                            ErrorMessage="请选择申请人员">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>发放部门：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_ffbm" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_ffbm_SelectedIndexChanged" CssClass="form-control">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="ddl_ffbm"
                            ErrorMessage="请选择商品发放部门">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>发放仓库：</td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="ddl_ffck" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_ffck_SelectedIndexChanged">
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
                        <asp:DropDownList CssClass="form-control" ID="ddl_zcfl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_zcfl_SelectedIndexChanged">
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
                        <asp:DropDownList CssClass="form-control" ID="ddlWp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged">
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
                        <asp:DropDownList ID="ddl_lcfs" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_lcfs_SelectedIndexChanged" CssClass="form-control">
                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <asp:Panel ID="Panelghsj" runat="server" Visible="false">
                    <tr>
                        <td>归还时间：</td>
                        <td>
                            <asp:TextBox ID="tbx_ghsj" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                        <td>
                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbx_ghsj" CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="日期格式不正确"
                                ControlToValidate="tbx_ghsj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td>紧急程度：</td>
                    <td>
                        <asp:DropDownList CssClass="form-control" ID="ddl_jjcd" runat="server">
                            <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="重要" Value="重要"></asp:ListItem>
                            <asp:ListItem Text="紧急" Value="紧急"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>图片上传：</td>
                    <td colspan="4">
                        <asp:FileUpload ID="UploadPic" runat="server"/>
                    </td>
                    <td>
                        <asp:Button ID="btn_upload" runat="server" Text="上传" OnClick="btn_upload_Click" CausesValidation="False" CssClass="btn btn-primary active"/></td>
                </tr>
                <tr>
                    <td>备注：</td>
                    <td colspan="4">
                        <asp:TextBox ID="lysm" runat="server" CssClass="form-control" Rows="3" TextMode="multiLine"></asp:TextBox>
                    </td>
                </tr>

                <asp:Panel ID="Panel1" runat="server">
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>

                    <tr>
                        <td>使用人部门：
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="ddlsyrbm" runat="server" OnSelectedIndexChanged="ddlsyrbm_SelectedIndexChanged" AutoPostBack="True" CssClass="form-control"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>使用人：</td>
                        <td colspan="1">
                            <asp:DropDownList CssClass="form-control" ID="ddlsyr" runat="server" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td></td>
                        <td>资产编码：</td>
                        <td>
                            <asp:DropDownList CssClass="form-control" ID="ddlzcbm" runat="server"></asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td colspan="4" align="center">
                            <asp:Button CssClass="btn btn-primary active" ID="AddBtn" runat="server" Text="添加资产" OnClick="Add_Click" CausesValidation="true" />
                            <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" CausesValidation="False" />
                        </td>
                    </tr>
                </asp:Panel>
            </table>
        </div>


        <asp:Panel ID="Panel2" runat="server">
            <div class="PopBodyGrid">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="lymx_tid"
                    EmptyDataText="暂时没有登记资产领用信息">
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
                        <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
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
                        <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_zydm" HeaderText="使用人代码">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zcsm" HeaderText="资产说明">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                                <asp:TemplateField HeaderText="商品唯一码">
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <ItemTemplate>
                                        <asp:TextBox ID="tbx_spwym" runat="server" Text='<%# Bind("oldid") %>' OnTextChanged="tbx_spwym_OnTextChanged" AutoPostBack="True"></asp:TextBox><asp:Button ID="btnEditSpwym" CommandArgument='<%# Container.DataItemIndex %>' runat="server" OnClick="btnEditSpwym_OnClick" Visible="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </div>
            <table>
                <tr>
                    <td align="center">
                        <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="申请领用" OnClick="Save_Click" Enabled="False" ValidationGroup="1"></asp:Button>
                        <asp:Button ID="btn_clear" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false" Visible="false" CssClass="btn btn-primary active" AccessKey="r" /><%--<input type="button" name="BackBtn" value=" 关闭 " class="mybutton" onclick="javascript: window.close()" accesskey="q" />--%>
                    </td>
                </tr>

                <tr>
                    <td style="height: 25px">
                        <asp:ValidationSummary
                            ID="ValidationSummary2"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator9"
                            runat="server"
                            ControlToValidate="ddlsyr"
                            ErrorMessage="请选择使用人：">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10"
                            runat="server"
                            ControlToValidate="ddlzcbm"
                            ErrorMessage="请选择资产编码">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </asp:Panel>


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
        <asp:Label ID="lblkcinfo" runat="server" Visible="False"></asp:Label>
        <asp:TextBox ID="tbx_sqsl" runat="server" Visible="False">1</asp:TextBox>
    </form>
</body>
</html>
