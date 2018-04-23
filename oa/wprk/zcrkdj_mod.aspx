<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcrkdj_mod.aspx.cs" Inherits="FCSystem.OA.wprk.zcrkdj_mod" %>

<!DOCTYPE HTML>

<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>查看入库登记</title>
	<link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />

    <style type="text/css">
        #prt {
            height: 0px;
            width: 0px;
        }
    </style>
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table>
                <tr>
                    <td class="td_oa" style="height: 25px; width: 80%">
                        <asp:Button CssClass="btn btn-default btn-xs" ID="SaveBtn" runat="server" Text="保存" OnClick="Save_Click" AccessKey="s" CausesValidation="true" Visible="false"></asp:Button>
                        <asp:Button CssClass="btn btn-default btn-xs" ID="DelJhBtn" runat="server" Text="删除入库单" OnClick="DelJh_Click" AccessKey="d" OnClientClick="return confirm('确认要删除该张入库单吗？')" Visible="false"></asp:Button>
                        <asp:Button CssClass="btn btn-default btn-xs" ID="SendBtn" runat="server" Text="送审" OnClick="Send_Click" CausesValidation="true" Visible="false"></asp:Button>
                        <asp:Button ID="AddBtn" Text="新增入库资产" CssClass="btn btn-default btn-xs" runat="server" Visible="false" CausesValidation="false" />
                        <asp:Button CssClass="btn btn-default btn-xs" ID="DelBtn" runat="server" Text="删除入库资产" OnClick="Del_Click" Visible="false" OnClientClick="return confirm('确认要删除勾选的入库物品吗？')" />
                        <asp:Button CssClass="btn btn-default btn-xs" ID="RefBtn" runat="server" Text="刷新" OnClick="Ref_Click" CausesValidation="false" Visible="false" />
                        <input type="button" name="BackBtn" value="关闭" class="btn btn-default btn-xs" onclick="javascript: window.close();" accesskey="q" />&nbsp;
                    </td>
                    <td class="td_oa">
                        <asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><a href="#"><asp:Label ID="PrnLbl" runat="server" Text="打印入库单" Visible="False"></asp:Label></a></td>
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
                        <asp:Label ID="rkdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                    </td>
                </tr>

                <tr>
                    <td>选择仓库：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="rkck" runat="server" CssClass="form-control" width="424px">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>选择供应商：</td>
                    <td colspan="4">
                        <asp:DropDownList ID="gys" runat="server" OnSelectedIndexChanged="gys_SelectedIndexChanged" AutoPostBack="True" Enabled="False" CssClass="form-control" width="424px">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>

                <tr>
                    <td>备注：</td>
                    <td colspan="4">
                        <asp:TextBox ID="rkbz" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2"></asp:TextBox>
                    </td>
                </tr>

                <asp:Panel ID="pl_upload" runat="server" Visible="False">
                    <tr>
                        <td>合同：</td>
                        <td colspan="4">
                            <asp:FileUpload ID="uploadHt" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="btn_uploadht" runat="server" CausesValidation="False" Text="上传" OnClick="btn_uploadht_OnClick" Width="50px" Enabled="False" /></td>
                    </tr>
                    <tr>
                        <td>凭证：</td>
                        <td colspan="4">
                            <asp:FileUpload ID="uploadPz" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="btn_uploadpz" runat="server" CausesValidation="False" Text="上传" OnClick="btn_uploadpz_OnClick" Width="50px" Enabled="False" /></td>
                    </tr>
                    <tr>
                        <td>购买申请：</td>
                        <td colspan="4">
                            <asp:FileUpload ID="uploadGmsq" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="btn_uploadgmsq" runat="server" CausesValidation="False" OnClick="btn_uploadgmsq_OnClick" Text="上传" Width="50px" Enabled="False" /></td>
                    </tr>
                </asp:Panel>

                <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                    <tr>
                        <td>审批意见：</td>
                        <td colspan="4">
                            <asp:TextBox ID="spyj" runat="server" CssClass="MultiLineText" ReadOnly="true" TextMode="multiLine" Rows="2" Enabled="false"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>审批人:</td>
                        <td>
                            <asp:TextBox ID="spr" runat="server" Enabled="false" /></td>
                    </tr>

                    <tr>
                        <td>审批时间：</td>
                        <td>
                            <asp:TextBox ID="spsj" runat="server" Enabled="false" /></td>
                    </tr>
                </asp:Panel>

                <asp:Panel ID="songshen" runat="server" Visible="false">
                    <tr>
                        <td>&nbsp;</td>
                        <td colspan="2">
                            <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知库管人员" Checked="true" />
                        </td>
                        <td colspan="2">
                            <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知库管人员" />
                        </td>
                    </tr>
                </asp:Panel>
            </table>

        </div>

        <div class="PopBodyGrid">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" CssClass="sPopPanel">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="rkmxid"
                    EmptyDataText="暂时没有登记任何物品入库信息">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="20px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderStyle Width="20px"></HeaderStyle>
                            <ItemStyle Width="20px" Height="18px" HorizontalAlign="center" />
                            <HeaderTemplate>
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
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
                                <a href="#" onclick="javascript:popAdd('/oa/wprk/rkzcmod.aspx?id1=<%# Eval("rkmxid")%>&id2=<%# Eval("rk_gys")%>')">
                                    <font color="#3366ff"><asp:Label ID="lblzcbm" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label></font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
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
                        <asp:BoundField DataField="zcgg" HeaderText="规格">
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
                                <asp:Label ID="lblrkdj" runat="server" Text='<%# Bind("rkdj") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="原始图片" ItemStyle-Width="228px">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <input id="yst" runat="server" type="file" style="width: 120px; height: 20px" class="mytext" /><asp:Button ID="btn_ystsc" runat="server" Height="20px" OnClick="btn_ystsc_Click" CommandArgument='<%# Container.DataItemIndex %>' Text="上传" /><asp:HyperLink ID="cktp" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看图片" /><asp:Label ID="lblPostedFilename" runat="server" Text=""></asp:Label>
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
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="rkck"
            ErrorMessage="请选择入库仓库">&nbsp; </asp:RequiredFieldValidator>
        <!--隐藏label-->
        <asp:Label ID="rkzt" runat="server" Visible="false" />
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
        <asp:Label ID="htsl" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="pzsl" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="conn" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ifht" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="path" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblhth" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblpath" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="htljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="pzljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="gmsqljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="smhtsl" runat="server" Visible="False"></asp:Label>
        <input id="smzsl" type="hidden" runat="server" />
        <%--  <input id="htsl" type="hidden" name="htsl" />
        <input id="pzsl" type="hidden" name="pzsl" />--%>
        <asp:Label ID="lblrkd" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblcurTime" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblZcsource" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
