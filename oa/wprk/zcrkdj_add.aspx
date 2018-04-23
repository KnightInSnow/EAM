<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcrkdj_add.aspx.cs" Inherits="FCSystem.OA.wprk.zcrkdj_add" %>

<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产入库登记</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/AutoComplete.css" rel="stylesheet" type="text/css" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <div style='border: 0px; padding: 3px; padding: 0px; height: 540px; line-height: 20px; overflow-x: hidden; overflow-y: scroll;'>
            <div class="PopHead">
                <table style="table-layout: fixed;">
                    <tr>
                        <td style="width: 80%;">
                            <asp:Button ID="SaveBtn" runat="server" CssClass="btn btn-default btn-xs" Text="保存" OnClick="Save_Click" AccessKey="s" CausesValidation="true"></asp:Button>
                            <asp:Button ID="SendBtn" runat="server" CssClass="btn btn-default btn-xs" Text="送审" OnClick="Send_Click" CausesValidation="true" Visible="false"></asp:Button>
                            <asp:Button ID="AddBtn" Text="新增入库资产" runat="server" CssClass="btn btn-default btn-xs" Visible="false" CausesValidation="false" />
                            <asp:Button ID="DelBtn" runat="server" CssClass="btn btn-default btn-xs" Text="删除入库资产" OnClick="Del_Click" Visible="false" OnClientClick="return confirm('确认要执行删除吗？')" />
                            <asp:Button ID="RefBtn" runat="server" CssClass="btn btn-default btn-xs" Text="刷新" OnClick="Ref_Click" Visible="false" CausesValidation="false" />
                            <input type="button" class="btn btn-default btn-xs" name="BackBtn" value="关闭" onclick=" javascript: window.close();" accesskey="q" />
                        </td>
                        <td style="width: 20%;">
                            <asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" />
                            <a href="#">
                                <asp:Label ID="PrnLbl" runat="server" Text="打印入库单" Visible="False"></asp:Label></a>
                            <span style="color:red;">*为必填信息</span>
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
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
                        <td colspan="3"><font color="red">提示：您只能选择自己能够使用的固定资产类型仓库</font></td>
                        <td>
                            <ajaxToolkit:AutoCompleteExtender
                                runat="server"
                                BehaviorID="AutoCompleteEx"
                                ID="autoComplete1"
                                TargetControlID="myTextBox"
                                ServicePath="~/AutoComplete.asmx"
                                ServiceMethod="GetZCGysCompletionList"
                                MinimumPrefixLength="1"
                                EnableCaching="true"
                                CompletionSetCount="20"
                                CompletionInterval="200"
                                CompletionListCssClass="autocomplete_completionListElement"
                                CompletionListItemCssClass="autocomplete_listItem"
                                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"
                                DelimiterCharacters=""
                                ShowOnlyCurrentWordInCompletionListItem="true">
                            </ajaxToolkit:AutoCompleteExtender>
                        </td>
                    </tr>

                    <tr>
                        <td>机构代码:</td>
                        <td colspan="4" style="text-align: left;">
                            <asp:Label ID="lblJGDM" runat="server" Text="Label" CssClass="form-control" Width="150px"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>入库单号:</td>
                        <td colspan="4">
                            <asp:TextBox ID="lblRKDH" runat="server" CssClass="form-control"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td>资产来源:</td>
                        <td colspan="4">
                            <asp:DropDownList ID="ddl_zcly" runat="server" CssClass="form-control">
                                <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>选择仓库:<span style="color:red;">*</span></td>
                        <td colspan="4">
                            <asp:DropDownList CssClass="form-control" ID="rkck" runat="server" OnSelectedIndexChanged="rkck_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>搜索供应商:</td>
                        <td colspan="4">
                            <asp:TextBox runat="server" ID="myTextBox" Font-Bold="true" ForeColor="DarkGray" autocomplete="on" AutoPostBack="True" OnTextChanged="myTextBox_TextChanged" CssClass="form-control"/>
                        </td>
                    </tr>

                    <tr>
                        <td>选择供应商:<span style="color:red;">*</span></td>
                        <td colspan="4">
                            <asp:DropDownList CssClass="form-control" ID="gys" runat="server" OnSelectedIndexChanged="gys_SelectedIndexChanged" AutoPostBack="True">
                                <asp:ListItem Text="" Value=""></asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td style="text-align:left;">
                            <asp:ImageButton ID="imgbtn_addnew" runat="server" ImageUrl="~/images/add.gif" CausesValidation="False" Height="16px"/>
                        </td>
                    </tr>
                </table>


                <asp:Panel ID="pl_upload" runat="server" Visible="False">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td>合同：</td>
                            <td colspan="4">
                                <asp:FileUpload ID="uploadHt" runat="server" />
                            </td>
                            <td>
                                <asp:Button ID="btn_uploadht" runat="server" CausesValidation="False" Text="上传" OnClick="btn_uploadht_OnClick" Width="50px" Enabled="False"/></td>
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
                        <tr>
                            <td>备注：</td>
                            <td colspan="4">
                                <asp:TextBox ID="rkbz" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator1"
                                    runat="server"
                                    ControlToValidate="gys"
                                    ErrorMessage="请选择供应商信息">
                                </asp:RequiredFieldValidator></td>
                            <td>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator4"
                                    runat="server"
                                    ControlToValidate="rkck"
                                    ErrorMessage="请选择仓库信息">
                                </asp:RequiredFieldValidator></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>



                <asp:Panel ID="songshen" runat="server" Visible="false">
                    <table style="table-layout: fixed;">
                        <tr>
                            <td></td>
                            <td>
                                <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知库管人员" Checked="true" />
                            </td>
                            <td>
                                <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知库管人员" /></td>
                            <td></td>
                        </tr>
                    </table>
                </asp:Panel>
            </div>


            <div class="PopBodyGrid">
                <asp:Panel ID="plContent" runat="server" Visible="true" ScrollBars="Auto">

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
                            <asp:BoundField DataField="rkmxid" HeaderText="编码">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>

                            <asp:BoundField DataField="zcbmfull" HeaderText="唯一编码">
                                <HeaderStyle ForeColor="black" />
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="资产编码">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popAdd2('/oa/wprk/rkzcmod.aspx?id1=<%# Eval("rkmxid")%>&id2=<%# Eval("rk_gys")%>')"><font color="#3366ff"><asp:Label ID="Label2bm" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label></font></a>
                                </ItemTemplate>
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
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
                            <asp:BoundField DataField="gysmc" HeaderText="供应商">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="入库数量">
                                <ItemStyle HorizontalAlign="center" />
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <asp:Label ID="Label2aa" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="入库单价">
                                <ItemStyle HorizontalAlign="center" />
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdj")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="原始图片" ItemStyle-Width="228px">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="left" />
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
        </div>
        <!--隐藏label-->
        <asp:Label ID="IDlabel" runat="server" Visible="false" />
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
            ErrorMessage="请选择入库仓库">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator3"
            runat="server"
            ControlToValidate="lblRKDH"
            ErrorMessage="入库单号不能为空">&nbsp;
        </asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="lblRKDH" ValidationExpression="^\w*\d{5}$" ErrorMessage="输入单号格式不正确（后五位需为数字）">
        </asp:RegularExpressionValidator>
        <asp:Label ID="Label3" runat="server" Text="" Visible="False"></asp:Label>
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
        <asp:Label ID="lblcurTime" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
