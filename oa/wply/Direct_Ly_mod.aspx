<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Direct_Ly_mod.aspx.cs" Inherits="FCSystem.OA.wply.Direct_Ly_mod" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>领用登记</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">

    <script type="text/html">
        a:link{
        color:#ffffff;
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td style="width: 60%;">领用登记</td>
                    <td style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" />
                        <a href="#">
                            <asp:Label ID="lblprn" runat="server" Text="打印领用单" Font-Underline="True" Visible="false"></asp:Label>
                        </a>
                        <asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" />
                        <asp:Label ID="PrnLbl" runat="server" Text="打印资产标签" Visible="false"></asp:Label>
                    </td>
                    <td style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
            </table>
        </div>


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
                    <td>领用标题：</td>
                    <td colspan="4">
                        <asp:TextBox ID="lybt" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="lybt"
                            ErrorMessage="请输入领用标题"></asp:RequiredFieldValidator></td>
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
                            ErrorMessage="请选择申请部门">
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
                            ErrorMessage="请选择申请人员">
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>发放部门：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_ffbm" runat="server" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="ddl_ffbm_SelectedIndexChanged" CssClass="form-control">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="ddl_ffbm"
                            ErrorMessage="请选择商品发放部门">
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>发放仓库：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ddl_ffck" runat="server" Enabled="false" AutoPostBack="True" OnSelectedIndexChanged="ddl_ffck_SelectedIndexChanged" CssClass="form-control">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="ddl_ffck"
                            ErrorMessage="请选择商品发放仓库">
                        </asp:RequiredFieldValidator></td>
                </tr>

                <asp:Panel ID="plNew" runat="server" Visible="false">
                    <tr>
                        <td>资产分类：</td>
                        <td colspan="4">
                            <asp:DropDownList ID="ddl_zcfl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_zcfl_SelectedIndexChanged" CssClass="form-control">
                            </asp:DropDownList>

                        </td>
                        <td>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator3"
                                runat="server"
                                ControlToValidate="ddl_zcfl"
                                ErrorMessage="请选择资产分类">
                            </asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td>领用资产：</td>
                        <td colspan="4">
                            <asp:DropDownList ID="ddlWp" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged" CssClass="form-control">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:RequiredFieldValidator
                                ID="RequiredFieldValidator5"
                                runat="server"
                                ControlToValidate="ddlWp"
                                ErrorMessage="请选择领用资产">
                            </asp:RequiredFieldValidator></td>
                    </tr>

                    <tr>
                        <td>出库方式：</td>
                        <td colspan="4">
                            <asp:DropDownList ID="ddl_lcfs" runat="server" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="ddl_lcfs_SelectedIndexChanged" CssClass="form-control">
                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                </asp:Panel>

                <asp:Panel ID="plGhsj" runat="server" Visible="false">
                    <tr>
                        <td>归还时间：</td>
                        <td>
                            <asp:TextBox ID="tbx_ghsj" runat="server" CssClass="form-control"></asp:TextBox>

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
                    <td>
                        <asp:DropDownList CssClass="form-control" ID="jjcd" runat="server" Enabled="false">
                            <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="重要" Value="重要"></asp:ListItem>
                            <asp:ListItem Text="紧急" Value="紧急"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <asp:Panel ID="plShowTP" runat="server" Visible="false">
                    <tr>
                        <td>图片上传：</td>
                        <td colspan="4">
                            <asp:FileUpload ID="UploadPic" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="btn_upload" runat="server" Text="上传" OnClick="btn_upload_Click" CausesValidation="False" CssClass="btn btn-primary active"/></td>
                    </tr>

                    <tr>
                        <td>查看图片：</td>
                        <td>
                            <asp:HyperLink ID="cktp" runat="server"></asp:HyperLink>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td>领用说明：</td>
                    <td colspan="4">
                        <asp:TextBox ID="lysm" runat="server" CssClass="form-control" Rows="3" TextMode="multiLine" Enabled="false"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <asp:ValidationSummary
                            ID="ValidationSummary2"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                    </td>
                </tr>

                <asp:Panel ID="Panel1" runat="server" Visible="false">
                    <tr>
                        <td>使用人部门：
                        </td>
                        <td colspan="4">
                            <asp:DropDownList ID="ddlsyrbm" runat="server" OnSelectedIndexChanged="ddlsyrbm_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td>使用人：
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlsyr" runat="server" AutoPostBack="True"></asp:DropDownList>
                        </td>
                        <td>资产编码：</td>
                        <td>
                            <asp:DropDownList ID="ddlzcbm" runat="server"></asp:DropDownList>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td colspan="4" align="center">
                            <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="添加资产" OnClick="Add_Click" CausesValidation="true" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" CausesValidation="False" />
                        </td>
                    </tr>
                </asp:Panel>
            </table>

        </div>

        <div class="PopBodyGrid">
            <asp:Panel ID="Panel2" runat="server">
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
                        <asp:BoundField DataField="oldid" HeaderText="商品唯一码">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>

                <table>
                    <tr>
                        <td align="center">
                            <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="申请领用" OnClick="Save_Click" Visible="false" Enabled="False" ValidationGroup="1"></asp:Button>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>


        <asp:Label ID="lbllyid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="kcbz" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblsqzs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblLcfs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSqrtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblKcsl" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lbldlrysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblkcinfo" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
