<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcjjMod.aspx.cs" Inherits="FCSystem.OA.wply.zcjjMod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>调拨登记</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PopHead">
            <table>
                <tr>
                    <td style="width: 60%;">调拨登记</td>
                    <td style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" />
                        <asp:LinkButton ID="lbtnPrnDoc" runat="server" Visible="false">打印交接单</asp:LinkButton>
                    </td>
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
                    <td>申请人员：</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_sqry" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>所属部门：</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_bmmc" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>接收人员：</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_jsry" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>所属部门：</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_jsbm" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
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
                    <td>交接说明：</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_jjsm" runat="server" CssClass="form-control" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>

        <div class="PopBodyGrid">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False" 
                    DataKeyNames="lymx_tid" 
                    EmptyDataText="暂无资产信息">
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
                        <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="使用人">
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
            </asp:Panel>

            <table>
                <tr>
                    <td style="text-align: center" align="center">
                        <asp:Button ID="btnQr" runat="server" Text="申请" Visible="false" CssClass="mybutton" OnClick="btnQr_Click" />
                    </td>
                </tr>
            </table>
        </div>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>

        <!--隐藏label-->
        <asp:Label ID="lbljjzt" runat="server" Visible="False" />
        <asp:Label ID="lbljjid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
