<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="rkshqr_mod.aspx.cs" Inherits="FCSystem.OA.wprk.rkshqr_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>入库确认</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function loadpage() {
            var ckinput = document.getElementsByTagName("input");
            for (var i = 0; i < ckinput.length; i++) {
                if (ckinput[i].type == 'checkbox') {
                    if (ckinput[i].id.indexOf('GridView1') > -1) {
                        ckinput[i].checked = true;
                    }
                }
            }
        }
    </script>
</head>
<body class="main" onload="loadpage();">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td>
                        <asp:Button ID="SpBtn" runat="server" Text="审批通过" OnClick="Sp_Click" Visible="false" />
                        <asp:Button ID="ThBtn" runat="server" Text="审批退回" OnClick="Th_Click" Visible="false" />
                        <input type="button" name="BackBtn" value="关闭" onclick="javascript: window.close();" accesskey="q" />
                    </td>
                    <td style="width: 20%">&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="False" /><asp:LinkButton ID="PrnSelectLbl" runat="server"  OnClick="PrnSelectLbl_Click" Visible="false">打印资产标签</asp:LinkButton></td>
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
                    <td colspan="4">
                        <asp:Label ID="rkdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>入库仓库：</td>
                    <td colspan="4">
                        <asp:TextBox ID="rkck" runat="server" Enabled="false"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>备注：</td>
                    <td colspan="4">
                        <asp:TextBox ID="rkbz" runat="server" TextMode="MultiLine" Rows="2" Enabled="false" CssClass="MultiLineText"></asp:TextBox>
                    </td>
                </tr>

                <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                    <tr>
                        <td>意见追述：</td>
                        <td colspan="4">
                            <asp:TextBox ID="spyj" runat="server" ReadOnly="true" TextMode="multiLine" Rows="2" CssClass="MultiLineText"></asp:TextBox>&nbsp;</td>
                    </tr>
                </asp:Panel>

                <asp:Panel ID="songshen" runat="server" Visible="false">
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="4">
                            <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知入库登记人" Checked="true" />
                            <asp:CheckBox ID="dxtz" runat="server" Text="邮件通知入库登记人" />
                        </td>
                    </tr>
                </asp:Panel>

            </table>
        </div>

        <div class="PopBodyGrid">
            <asp:Panel style="height:300px;" ScrollBars="Both" ID="Panel1" runat="server">
            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                OnRowDataBound="OnRow_Bound"
                AutoGenerateColumns="False"
                DataKeyNames="rkmxid"
                EmptyDataText="暂时没有登记任何入库信息">
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
                    <asp:BoundField DataField="rkmxid" HeaderText="编码">
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="资产编码">
                        <HeaderStyle ForeColor="Black" />
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <a href="#" onclick="javascript:popMiniMod('rkshqr_mx_mod.aspx?id=<%# Eval("rkmxid")%>')"><font color="#3366ff"><asp:Label ID="lblzcbm" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label></font></a>
                        </ItemTemplate>
                        <ControlStyle CssClass="navigate" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="oldid" HeaderText="商品唯一码">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fl_mc" HeaderText="商品类别">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="zcgg" HeaderText="商品规格">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="gysmc" HeaderText="供应商">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="入库数量">
                        <ItemStyle HorizontalAlign="center" />
                        <HeaderStyle ForeColor="Black" />
                        <ItemTemplate>
                            <asp:Label ID="Label2cc" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="入库单价">
                        <ItemStyle HorizontalAlign="center" />
                        <HeaderStyle ForeColor="Black" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdj") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="原始图片">
                        <HeaderStyle ForeColor="Black" />
                        <ItemStyle HorizontalAlign="center" />
                        <ItemTemplate>
                            <asp:HyperLink ID="cktp" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看图片" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="GridViewRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
            </asp:GridView>

            <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle"
                OnRowDataBound="OnRow_Bound"
                AutoGenerateColumns="False"
                DataKeyNames="rkmxid"
                EmptyDataText="暂时没有登记任何入库信息">
                <Columns>
                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                        <HeaderStyle Width="30px" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="rkmxid" HeaderText="编码">
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="fl_mc" HeaderText="商品类别">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="gysmc" HeaderText="供应商">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="入库数量">
                        <ItemStyle HorizontalAlign="center" />
                        <HeaderStyle ForeColor="Black" />
                        <ItemTemplate>
                            <asp:Label ID="Label2cc" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="入库单价">
                        <ItemStyle HorizontalAlign="center" />
                        <HeaderStyle ForeColor="Black" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdj") %>'></asp:Label>
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
        <%--  <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="spyjxz"
            ErrorMessage="请填写审批意见">&nbsp;
        </asp:RequiredFieldValidator>--%>

        <!--隐藏label-->
        <asp:Label ID="rkzt" runat="server" Visible="false" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="yngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblZcsource" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
