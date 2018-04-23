<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Direct_Ly_qrmod.aspx.cs" Inherits="FCSystem.OA.wply.Direct_Ly_qrmod" EnableEventValidation="false" %>

<!DOCTYPE HTML>

<html
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>领用确认</title>
	<link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function loadpage() {
            var chkEvery = document.getElementsByTagName("input");
            for (var i = 0; i < chkEvery.length; i++) {
                if (chkEvery[i].type == 'checkbox') {
                    if (chkEvery[i].id.indexOf('GridView1') > -1) {
                        chkEvery[i].checked = true;
                    }
                }
            }
        }
    </script>
</head>
<body class="main" onload="loadpage();">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table>
                <tr>
                    <td>
                        <asp:Button CssClass="btn btn-default btn-xs" ID="SpBtn" runat="server" Text="审批通过" OnClick="Sp_Click" Visible="false" />
                        <asp:Button CssClass="btn btn-default btn-xs" ID="ThBtn" runat="server" Text="审批退回" OnClick="Th_Click" Visible="false" />
                        <input type="button" name="BackBtn" value="关闭" class="btn btn-default btn-xs" onclick="javascript: window.close();" accesskey="q" />
                        <asp:Button ID="btnNext" runat="server" Visible="false" Text="审批下一单" CssClass="btn btn-default btn-xs" OnClick="btnNext_Click" />
                        <asp:Button ID="btnffConfim" runat="server" Text="发放确认" OnClick="btnffConfim_OnClick" Visible="False" CssClass="btn btn-default btn-xs"/>
                    </td>
                    <td style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="False" />
                        <asp:LinkButton ID="PrnSelectLbl" runat="server" Visible="False" OnClick="PrnSelectLbl_Click">打印资产标签</asp:LinkButton>
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
                    <td colspan="4">
                        <asp:Label ID="lydh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>发放仓库：</td>
                    <td colspan="4">
                        <asp:TextBox ID="ffck" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>查看图片</td>
                    <td>
                        <asp:HyperLink ID="cktp" runat="server"></asp:HyperLink>
                    </td>
                </tr>

                <tr>
                    <td>备注：</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbxBz" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                    <tr>
                        <td>意见追述：</td>
                        <td colspan="4">
                            <asp:TextBox ID="spyj" runat="server" CssClass="form-control" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox>&nbsp;</td>
                    </tr>
                </asp:Panel>
            </table>
        </div>

        <div class="PopBodyGrid">
            <asp:Panel runat="server" Height="350px" ScrollBars="Vertical">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle" Width="730px"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="lymxtid"
                    EmptyDataText="暂时没有登记任何信息">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle Width="30px" />
                            <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                            <HeaderTemplate>
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zczt" HeaderText="资产状态">
                            <HeaderStyle ForeColor="black" />
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fl_mc" HeaderText="类别">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="型号">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="syry" HeaderText="使用人">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="sqsl" HeaderText="申请数量">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rkdj" HeaderText="商品单价">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="rkck" HeaderText="入库仓库">
                            <HeaderStyle ForeColor="black" />
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fl_tid" HeaderText="分类tid">
                            <HeaderStyle ForeColor="black" />
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                            <HeaderStyle ForeColor="black" />
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wp_tid" HeaderText="wptid">
                            <HeaderStyle ForeColor="black" />
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="商品唯一码">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:TextBox ID="tbx_spwym" runat="server" Text='<%# Bind("oldid") %>' OnTextChanged="tbx_spwym_OnTextChanged" AutoPostBack="True" CssClass="form-control"></asp:TextBox><asp:Button ID="btnEditSpwym" CommandArgument='<%# Container.DataItemIndex %>' OnClick="btnEditSpwym_OnClick" runat="server" Visible="False" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </asp:Panel>
        </div>


        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>

        <!--隐藏label-->
        <asp:Label ID="lyzt" runat="server" Visible="false" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="lyidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="kcsl" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="htsl" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="pzsl" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="conn" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ifht" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="path" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblhth" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblpath" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lydjljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="smhtsl" runat="server" Visible="False"></asp:Label>
        <input id="smzsl" type="hidden" runat="server" />
        <asp:Label ID="lblcurTime" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllydzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblLYDHZ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblyhtid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
