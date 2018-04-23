<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkshqr_mx_mod.aspx.cs" Inherits="FCSystem.OA.wprk.rkshqr_mx_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <title>资产明细信息</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">查看资产明细信息</td>
                    <td class="td_oa" style="width: 20%"></td>
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
                    <td>资产编码：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_zcbm" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>商品唯一编码：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_spwym" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>商品编码：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_spbm" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>商品名称：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_spmc" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>商品分类：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_ssfl" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>商品品牌：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_sppp" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>商品型号：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_wpxh" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>商品规格：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_wpgg" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>商品产地：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_wpcd" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>商品条形码：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_txm" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>商品供应商：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_gys" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>商品建议单价：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_wpdj" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>保修开始日期：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_bxkssj" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>保修结束时间：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_bxjssj" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>入库数量：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_rksl" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                    <td></td>
                    <td>入库单价：</td>
                    <td>
                        <asp:TextBox CssClass="form-control" ID="tbx_rkdj" runat="server" ReadOnly="true" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <!--<td></td>
                    <td colspan="4">
                        <hr />-->
                    </td>
                </tr>
                <tr>
                    <td>存放地点：</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_cfdd" runat="server" CssClass="form-control" Width="130px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>资产备注：</td>
                    <td colspan="4">
                        <asp:TextBox CssClass="form-control" ID="tbx_zcbz" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td colspan="3" style="height: 30px">&nbsp;
                                            <asp:Button ID="btn_modify" runat="server" Text="保存" CssClass="btn btn-primary active" OnClick="btn_modify_Click" />
                        <input type="button" name="BackBtn" value=" 关闭 " class="btn btn-primary active" onclick="javascript: window.close()" accesskey="q" /></td>
                </tr>
            </table>
        </div>
        <asp:Label ID="lblrkmxid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
