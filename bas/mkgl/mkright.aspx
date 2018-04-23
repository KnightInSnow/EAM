<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mkright.aspx.cs" Inherits="FCSystem.BAS.mkgl.mkright" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>模块信息</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="Page-EmptyLine-Large"></div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td>
                                <asp:Label ID="labelstatus" runat="server" Text="-> 新增状态" ForeColor="red"></asp:Label>
                            </td>
                            <td>
                                <asp:ValidationSummary
                                    ID="ValidationSummary2"
                                    runat="server"
                                    EnableClientScript="true"
                                    ShowMessageBox="true"
                                    ShowSummary="false" DisplayMode="SingleParagraph"></asp:ValidationSummary>
                            </td>
                            <td colspan="4" align="right">
                                <asp:Button CssClass="btn btn-primary active" ID="AddBtn" runat="server" Text="增加" OnClick="AddBtn_Click" AccessKey="a"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="SaveBtn" runat="server" Text="修改" OnClick="Save_Click" AccessKey="s" Enabled="False"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" OnClientClick="return confirm('确认要执行删除吗？')" AccessKey="d" Enabled="False"></asp:Button>
                                <asp:Button ID="btnClr" runat="server" Text="清除" CssClass="btn btn-primary active" CausesValidation="False" OnClick="btnClr_Click" />

                            </td>
                        </tr>
                    </table>
                </div>

                <div class="Page-EmptyLine-Normal"></div>

                <div class="PageBody-Top-Inputs" style="height:175px;">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td colspan="4"><font color="red">如果模块属于根目录编码为三位数，否则为为五位数</font></td>
                        </tr>
                    </table>

                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;">
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator3"
                                    runat="server"
                                    ControlToValidate="moduid"
                                    ErrorMessage="请输入模块编码">&nbsp;
                                </asp:RequiredFieldValidator><asp:RangeValidator ID="RangeValidator1"
                                    runat="server"
                                    ErrorMessage="模块编码必须是1至100000之间的正整数！"
                                    ControlToValidate="moduid"
                                    MinimumValue="1"
                                    MaximumValue="100000"
                                    Type="integer">&nbsp;
                                </asp:RangeValidator>
                                模块编码：
                            </td>

                            <td>
                                <asp:TextBox ID="moduid" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator2"
                                    runat="server"
                                    ControlToValidate="modumc"
                                    ErrorMessage="请输入模块名称">&nbsp;
                                </asp:RequiredFieldValidator>模块名称：</td>
                            <td>
                                <asp:TextBox ID="modumc" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                        </tr>

                        <tr>
                            <td style="text-align:right;">
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1"
                                    runat="server"
                                    ControlToValidate="moduwjlj"
                                    ErrorMessage="请输入文件路径，如暂无可输入#符号">&nbsp;
                                </asp:RequiredFieldValidator>文件路径：</td>
                            <td>
                                <asp:TextBox ID="moduwjlj" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td style="text-align:right;">功能描述：</td>
                            <td>
                                <asp:TextBox ID="modubz" runat="server" CssClass="form-control"></asp:TextBox></td>
                        </tr>

                        <tr>
                            <td style="text-align:right;">
                                <asp:CompareValidator
                                    ID="Compare1"
                                    runat="server"
                                    ControlToValidate="moduid"
                                    Operator="notequal"
                                    Type="String"
                                    ControlToCompare="moduupid"
                                    ErrorMessage="上级模块不能选择本模块！">&nbsp;</asp:CompareValidator>上级模块：
                            </td>
                            <td>
                                <asp:DropDownList ID="moduupid" runat="server" AutoPostBack="True" OnSelectedIndexChanged="moduupid_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Value="0" Text=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>


        </div>

        <asp:Label ID="lblUpid" runat="server" Visible="False"></asp:Label>

        <div class="PageFoot"></div>
    </form>
</body>
</html>
