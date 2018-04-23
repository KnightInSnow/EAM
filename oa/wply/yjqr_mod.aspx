<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="yjqr_mod.aspx.cs" Inherits="FCSystem.OA.wply.yjqr_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>调拨确认</title>
	<link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
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
                    <td style="width:60%;">
                        <asp:Button CssClass="btn btn-default btn-xs" ID="SpBtn" runat="server" Text="审批通过" OnClick="Sp_Click" Visible="false" />
                        <asp:Button CssClass="btn btn-default btn-xs" ID="ThBtn" runat="server" Text="审批退回" OnClick="Th_Click" Visible="false" />
                        <input type="button" name="BackBtn" value="关闭" class="btn btn-default btn-xs" onclick="javascript: window.close()" accesskey="q" />
                    </td>
                    <td width="20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="False" />
                        <asp:LinkButton ID="PrnSelectLbl" runat="server" OnClick="PrnSelectLbl_Click" Visible="False">打印资产标签</asp:LinkButton>
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
                        <asp:Label ID="jjdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>交接部门</td>
                    <td colspan="4">
                        <asp:TextBox ID="jjbmmc" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>交接人员</td>
                    <td colspan="4">
                        <asp:TextBox ID="jjry" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>接收部门</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbxjsbm" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>接收人员</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbxjsry" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>查看图片</td>
                    <td>
                        <asp:HyperLink ID="cktp" runat="server"></asp:HyperLink>
                    </td>
                </tr>
                <tr>
                    <td>备注</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbxbz" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
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
            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                OnRowDataBound="OnRow_Bound"
                AutoGenerateColumns="False"
                DataKeyNames="jjid"
                BorderStyle="None"
                BorderWidth="0px"
                BackColor="Silver"
                EmptyDataText="暂时没有登记任何信息"
                Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%#GridView1.Rows.Count+ 1 %>"></asp:Label>
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
                    <asp:BoundField DataField="jjid" HeaderText="编码">
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="商品编码">
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
                    <asp:TemplateField HeaderText="申请数量">
                        <HeaderStyle ForeColor="Black" />
                        <ItemTemplate>
                            <asp:Label ID="Label2cc" runat="server" Text='<%# Bind("sjsl")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="商品单价">
                        <HeaderStyle ForeColor="Black" />
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("wpdj")%>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="zcsm" HeaderText="备注">
                        <HeaderStyle ForeColor="black" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <RowStyle CssClass="GridViewRowStyle" />
                <HeaderStyle CssClass="GridViewHeaderStyle" />
                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
            </asp:GridView>
        </div>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <%--   <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="spyjxz"
            ErrorMessage="请输入审批意见">&nbsp;
        </asp:RequiredFieldValidator>--%>

        <!--隐藏label-->
        <asp:Label ID="jjzt" runat="server" Visible="false" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="jjidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbljsry" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="jjdhlab" runat="server" Visible="false" />
        <asp:Label ID="cktid" runat="server" Visible="false" />
    </form>
</body>
</html>
