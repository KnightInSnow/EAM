<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="ckwh_view.aspx.cs" Inherits="FCSystem.OA.ckgl.ckwh_view" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>仓库信息维护</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">
                        <asp:Label ID="lbltitle" runat="server"></asp:Label>仓库信息
                    </td>
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
                    <td>仓库代码：</td>
                    <td colspan="4">
                        <asp:TextBox ID="lblCKDM" runat="server" MaxLength="45" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>仓库名称：<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:TextBox CssClass="form-control" ID="ckmc" runat="server" MaxLength="45"></asp:TextBox>
                    </td>
                </tr>


                <tr>
                    <td>所属部门：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="bm" runat="server" CssClass="form-control">
                            <asp:ListItem Value="" Text=""></asp:ListItem>
                        </asp:DropDownList></td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="4">
                        <asp:RadioButtonList ID="cklx" runat="server" RepeatDirection="Horizontal" Visible="false" CssClass="form-control">
                            <asp:ListItem Text="固定资产" Value="固定资产" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="物品" Value="物品"></asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>

                <tr>
                    <td>仓库状态：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="ckzt" runat="server" CssClass="form-control">
                            <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                            <asp:ListItem Text="禁用" Value="禁用"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>仓库说明：</td>
                    <td colspan="4">
                        <asp:TextBox ID="cksm" runat="server" Rows="5" TextMode="multiLine" CssClass="form-control"></asp:TextBox></td>
                </tr>
            </table>

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
                    <td></td>
                    <td colspan="4">
                        <asp:Button ID="SaveAddBtn" runat="server" Text="保存并新建" OnClick="Save_Click" Visible="false" CssClass="btn btn-primary active"/>
                        <asp:Button ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s" CssClass="btn btn-primary active"></asp:Button>
                        <input type="button" name="BackBtn" value="关闭" onclick="javascript: window.close()" accesskey="q" class="btn btn-primary active"/>
                    </td>
                </tr>

                <tr>
                    <td colspan="4">
                        <asp:ValidationSummary
                            ID="ValidationSummary1"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator10"
                            runat="server"
                            ControlToValidate="ckmc"
                            ErrorMessage="请输入仓库名称">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator
                            ID="RegularExpressionValidator1"
                            runat="server"
                            ControlToValidate="lblCKDM"
                            ValidationExpression="^\w*\d{4}$"
                            ErrorMessage="输入仓库代码格式不正确（后四位需为数字）">&nbsp;
                        </asp:RegularExpressionValidator>
                        <%--   <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="glry"
                                                        ErrorMessage="请选择管理人员">&nbsp;
                                                    </asp:RequiredFieldValidator>--%>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="bm"
                            ErrorMessage="请选择所属部门">&nbsp;
                        </asp:RequiredFieldValidator>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="lblCKDM"
                            ErrorMessage="请输入仓库代码">&nbsp;
                        </asp:RequiredFieldValidator>
                    </td>
                </tr>
            </table>
        </div>



        <!--隐藏label-->
        <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="ID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblCktid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
