<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="gyswh_view.aspx.cs" Inherits="FCSystem.OA.ckgl.gyswh_view" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>供应商维护</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function refreshParentPage() {
            if (window.opener != null) {
                window.opener.location.href = window.opener.location.href;
            }
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
        </asp:ScriptManager>

        <div class="PopHead">
            <table style="table-layout:fixed;">
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>供应商信息</td>
                    <td class="td_oa" style="width: 20%"><span style="color:red;">*为必填信息</span></td>
                </tr>
            </table>
        </div>
                 
        <ajaxToolkit:AutoCompleteExtender
            runat="server"
            BehaviorID="AutoCompleteEx"
            ID="autoComplete1"
            TargetControlID="gysmc"
            ServicePath="~/AutoComplete.asmx"
            ServiceMethod="GetZCGysmcCompletionList"
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
        
        <div class="PopBodyInputs">
            <table style="table-layout: fixed">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>所属部门：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_bm" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>供应商名称：<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:TextBox CssClass="form-control" ID="gysmc" runat="server" MaxLength="35" autocomplete="on" AutoPostBack="False"></asp:TextBox></td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="4">
                        <asp:CheckBox ID="cbxWp" runat="server" Text="物品" Visible="false" />
                        <asp:CheckBox ID="cbxZc" runat="server" Text="资产" Visible="false" Checked="true" />
                    </td>
                </tr>

                <tr>
                    <td>供应商类别：</td>
                    <td colspan="2">
                        <asp:DropDownList CssClass="form-control" ID="gyslb" runat="server">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    </tr>

                <tr>
                    <td>状态：</td>
                    <td colspan="2"> 
                        <asp:DropDownList CssClass="form-control" ID="gyszt" runat="server">
                            <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="禁用" Value="禁用"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>联系人：</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="lxr" runat="server" MaxLength="10"></asp:TextBox>
                    </td>
                    </tr>

                <tr>
                    <td>电子邮件：</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="mail" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>网站：</td>
                    <td colspan="4">
                        <asp:TextBox ID="web" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>地址：</td>
                    <td colspan="4">
                        <asp:TextBox ID="dz" runat="server" MaxLength="100" CssClass="form-control"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>电话：</td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="lxdh" runat="server" MaxLength="15" AutoPostBack="True" CausesValidation="True" OnTextChanged="gysdh_change"></asp:TextBox>
                    </td>
                    <td>
                        <asp:CheckBox ID="cbx_yntgwx" runat="server" Visible="false" />
                    </td>
                </tr>

                <tr>
                    <td>传真： </td>
                    <td colspan="2">
                        <asp:TextBox CssClass="form-control" ID="czdh" runat="server" MaxLength="15"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>备注： </td>
                    <td colspan="4">
                        <asp:TextBox ID="bz" runat="server" MaxLength="60" Rows="6" TextMode="multiLine" CssClass="form-control"></asp:TextBox></td>
                </tr>

                <tr>
                    <td></td>
                    <td><asp:Button ID="SaveAddBtn" runat="server" CssClass="btn btn-primary active" Text="保存并新建" OnClick="Save_Click" Visible="false" /></td>
                    <td><asp:Button ID="SaveBtn" runat="server" CssClass="btn btn-primary active" Text="保存" OnClick="Save_Click" AccessKey="s"></asp:Button></td>
                    <td><input type="button" class="btn btn-primary active" name="BackBtn" value="关闭" onclick="javascript: window.close()" accesskey="q" /></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
        </div>

        <div class="PopBodyInputs">
            <asp:Label ID="Label2" runat="server" Text=" "></asp:Label>
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                <asp:GridView ID="GridView_mx" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False" 
                    DataKeyNames="wpbm" 
                    EmptyDataText="没有查到符合条件的数据！">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView_mx.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="gysmc" HeaderText="商品供应商">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpzt" HeaderText="商品状态">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="商品编号">
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="lbl" runat="server" Text='<%# Bind("wpbm") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="center" />
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>

                        <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpgg" HeaderText="商品规格">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>

                        <asp:BoundField DataField="wppp" HeaderText="商品品牌">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField> 
                        <asp:BoundField DataField="wpdj" HeaderText="建议单价">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField> 
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </asp:Panel>
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                OnPageChanged="AspNetPager1_PageChanged"
                ShowCustomInfoSection="left"
                ShowInputBox="Auto"
                AlwaysShow="false"
                PageSize="4"
                CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                NumericButtonCount="4"
                FirstPageText="首页"
                LastPageText="末页"
                NextPageText="下页"
                PrevPageText="上页"
                CustomInfoSectionWidth="250px"
                CssClass="page_text"
                ShowBoxThreshold="4"
                InputBoxClass="AspNetPagerInputBox"
                SubmitButtonClass=“AspNetPagerButton”
                SubmitButtonText="Go">
            </webdiyer:AspNetPager>
        </div>


        <asp:ValidationSummary
            ID="ValidationSummary1"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator10"
            runat="server"
            ControlToValidate="gysmc"
            ErrorMessage="请输入供应商名称">&nbsp;
        </asp:RequiredFieldValidator> 
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="ddl_bm"
            ErrorMessage="请选择所属部门">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator2"
            ControlToValidate="lxdh"
            Display="none"
            ErrorMessage="联系电话格式错误，参考格式010-62288888、62288888、010-62288888-815"
            ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
            runat="server">
        </asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator4"
            ControlToValidate="czdh"
            Display="none"
            ErrorMessage="传真格式错误，参考格式010-62288888、62288888、010-62288888-815"
            ValidationExpression="(\d{1,}-+\d{1,}-+\d{1,})|(\d{1,}-+\d{1,})|\d{1,}"
            runat="server">
        </asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator6"
            ControlToValidate="mail"
            Display="none"
            ErrorMessage="电子邮件格式错误"
            ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
            runat="server">
        </asp:RegularExpressionValidator>
        <asp:RegularExpressionValidator
            ID="RegularExpressionValidator9"
            ControlToValidate="bz"
            Display="none"
            ErrorMessage="备注内容不能超200过个字"
            ValidationExpression="^(\s|\S){0,200}$"
            runat="server">
        </asp:RegularExpressionValidator> 
    </form>
</body>
</html>
