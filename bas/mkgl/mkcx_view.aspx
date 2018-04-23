<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="mkcx_view.aspx.cs" Inherits="FCSystem.BAS.mkgl.mkcx_view" %>

<!DOCTYPE HTML>

<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>模块查询</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed;">

                <tr>
                    <td class="td_oa" width="80%" height="25px">查看模块信息</td>
                    <td class="td_oa" width="20%"><span class="td_oa"></span></td>
                </tr>
            </table>
        </div>


        <div class="PopBodyInputs">
            <table style="table-layout: fixed;">
                <tr>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>模块编码：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="moduid" runat="server" ReadOnly="true"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>模块名称：</td>
                    <td>
                        <asp:TextBox ID="modumc" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>模块类型：
                    </td>
                    <td>
                        <asp:TextBox ID="Textbox1" runat="server" ReadOnly="true" Text="企业" CssClass="form-control"></asp:TextBox></td>
                    <td></td>
                    <td>状态：</td>
                    <td>
                        <asp:TextBox ID="moduzt" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>文件路径：</td>
                    <td colspan="4">
                        <asp:TextBox ID="moduwjlj" runat="server" ReadOnly="true" CssClass="form-control"></asp:TextBox></td>
                </tr>

                <tr>
                    <td>上级模块：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="moduupid" runat="server" CssClass="form-control">
                            <asp:ListItem Value="0" Text=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>功能描述：</td>
                    <td colspan="4">
                        <asp:TextBox ID="modubz" runat="server" CssClass="form-control" TextMode="multiLine" Rows="5" ReadOnly="true"></asp:TextBox></td>
                </tr>

                <tr>
                    <td></td>
                    <td colspan="3" style="height: 30px">
                        <input type="button" name="BackBtn" value="关闭" class="btn btn-primary active" onclick="javascript: window.close()" accesskey="q" />
                    </td>
                </tr>
            </table>
        </div>

    </form>
</body>
</html>
