<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wpwh_view.aspx.cs" Inherits="FCSystem.OA.wpgl.wpwh_view" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>商品维护</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>

    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>商品信息</td>
                    <td class="td_oa" style="width: 20%"><span style="color:red;">*为必填信息</span></td>
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
                    <td>
                        <asp:TextBox ID="wpbm" runat="server" Visible="false"></asp:TextBox></td>
                </tr>

                <tr>
                    <td style="text-align:right">商品简码：</td>
                    <td colspan="4">
                        <asp:TextBox ID="lbl_wpjc" runat="server" ToolTip="用于资产唯一编码时使用的精简名称，通常2到3个字符，比如NB-表示笔记本" MaxLength="4" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            ControlToValidate="lbl_wpjc"
                            Display="none"
                            ErrorMessage="请输入2-4位字母简码"
                            ValidationExpression="[a-zA-Z]{2,4}"
                            runat="server">* </asp:RegularExpressionValidator>
                    </td>
                </tr>

                <tr>
                    <td style="text-align:right">所属分类：<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="ssfl" runat="server" ToolTip="所属分类下拉框中标有固定资产的为固定资产类别">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td style="text-align:right">商品名称：<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:TextBox CssClass="form-control" ID="wpmc" runat="server" MaxLength="45"></asp:TextBox></td>
                </tr>

                <tr>
                    <td style="text-align:right">计量单位：</td>
                    <td colspan="1">
                        <asp:DropDownList CssClass="form-control" ID="ddlJldw" runat="server"></asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td style="text-align:right">品牌：<span style="color:red;">*</span></td>
                    <td colspan="1">
                        <asp:DropDownList CssClass="form-control" ID="wppp" runat="server">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>

                    <td></td>
                    <td style="text-align:right">产地：</td>
                    <td colspan="1">
                        <asp:DropDownList CssClass="form-control" ID="wpcd" runat="server">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td style="text-align:right">型号：<span style="color:red;">*</span></td>
                    <td colspan="1">
                        <asp:TextBox CssClass="form-control" ID="wpxh" runat="server"></asp:TextBox>
                    </td>

                    <td></td>
                    <td style="text-align:right">规格：</td>
                    <td colspan="1">
                        <asp:TextBox CssClass="form-control" ID="wpgg" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td style="text-align:right">商品条形码：</td>
                    <td colspan="1">
                        <asp:TextBox CssClass="form-control" ID="wptxm" runat="server"></asp:TextBox>
                    </td>

                    <td></td>
                    <td style="text-align:right">状态：</td>
                    <td colspan="1">
                        <asp:DropDownList CssClass="form-control" ID="wpzt" runat="server">
                            <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="禁用" Value="禁用"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">供应商：</td>
                    <td>
                        <asp:DropDownList CssClass="form-control" ID="wpgys" runat="server">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>

                    <td></td>
                    <td style="text-align:right">建议单价：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="wpdj" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="text-align:right">备注：</td>
                    <td colspan="4">
                        <asp:TextBox ID="wpbz" runat="server" CssClass="form-control" Rows="4" TextMode="multiLine"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="4" style="align-items: center;">
                        <asp:Button ID="AddBtn" runat="server" CssClass="btn btn-primary active" OnClick="Add_Click" Text="添加" />
                        <asp:Button ID="DelBtn" runat="server" CausesValidation="False" CssClass="btn btn-primary active" OnClick="Del_Click" Text="删除" />
                    </td>
                </tr>
            </table>
        </div>

        <div class="PopBodyGrid">
            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                OnRowDataBound="OnRow_Bound"
                AutoGenerateColumns="False"
                DataKeyNames="wpfsgys_tid"
                EmptyDataText="暂时没有分配物品领用信息" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit">
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
                    <asp:BoundField DataField="wpfsgys_tid" HeaderText="编号">
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpbm" HeaderText="商品编码" ReadOnly="true">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpmc" HeaderText="商品名称" ReadOnly="true">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpgysmc" HeaderText="商品供应商" ReadOnly="true">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="gyszt" HeaderText="供应商状态" ReadOnly="true">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpdj" HeaderText="商品单价">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="修改" ShowHeader="False">
                        <EditItemTemplate>
                            <asp:ImageButton ID="imgBtn1" runat="server" CausesValidation="False" CommandName="Update"
                                ImageUrl="~/images/save2.gif" AlternateText="保存" />
                            <asp:ImageButton ID="imgBtn2" runat="server" CausesValidation="False" CommandName="Cancel"
                                ImageUrl="~/images/cancel.gif" AlternateText="取消" />
                        </EditItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle />
                        <ItemTemplate>
                            <asp:ImageButton ID="imgBtn1" runat="server" CausesValidation="False" CommandName="Edit"
                                ImageUrl="~/images/edit.gif" AlternateText="编辑" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="GridViewRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
            </asp:GridView>
            <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                OnPageChanged="AspNetPager1_PageChanged"
                ShowCustomInfoSection="left"
                ShowInputBox="Auto"
                AlwaysShow="false"
                CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                NumericButtonCount="10"
                FirstPageText="首页"
                LastPageText="末页"
                NextPageText="下页"
                PrevPageText="上页"
                CustomInfoSectionWidth="250px"
                CssClass="page_text"
                ShowBoxThreshold="11"
                PageSize="6"
                InputBoxClass="AspNetPagerInputBox"
                SubmitButtonClass="“AspNetPagerButton”"
                SubmitButtonText="Go">
            </webdiyer:AspNetPager>
        </div>

        <br />

        <div class="PopBodyInputs">

            <asp:Button CssClass="btn btn-primary active" ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click" Visible="false" />
            <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s"></asp:Button>
            <input type="button" name="BackBtn" value="关闭" class="btn btn-primary active" onclick="javascript: window.close()" accesskey="q" />
            <asp:ValidationSummary
                ID="ValidationSummary1"
                runat="server"
                EnableClientScript="true"
                ShowMessageBox="true"
                ShowSummary="false"></asp:ValidationSummary>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator10"
                runat="server"
                ControlToValidate="wpmc"
                ErrorMessage="请输入物品名称">&nbsp; </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator4"
                runat="server"
                ControlToValidate="wpbm"
                ErrorMessage="请输入物品编码">&nbsp; </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator1"
                runat="server"
                ControlToValidate="ssfl"
                ErrorMessage="请选择所属分类">&nbsp; </asp:RequiredFieldValidator>
            <asp:RequiredFieldValidator
                ID="RequiredFieldValidator2"
                runat="server"
                ControlToValidate="ddlJldw"
                ErrorMessage="请选择计量单位">&nbsp; </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ControlToValidate="wpbm" ValidationExpression="^\w*\d{6}$" runat="server" ErrorMessage="商品编码格式不正确，后6位需为数字">&nbsp;</asp:RegularExpressionValidator>

            <asp:RegularExpressionValidator
                ID="RegularExpressionValidator10"
                ControlToValidate="wpdj"
                Display="none"
                ErrorMessage="建议单价必需为数值型"
                ValidationExpression="\d+\.\d+|\d{0,9}"
                runat="server">&nbsp; </asp:RegularExpressionValidator>
        </div>


        <!--隐藏label-->
        <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="ID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblMaxWPTID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblwpbm" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
