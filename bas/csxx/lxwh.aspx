<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="lxwh.aspx.cs" Inherits="FCSystem.BAS.csxx.lxwh" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>自定义类型</title>
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">自定义类型</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">请选择类型： </td>
                            <td>
                                <asp:DropDownList ID="xzlx" runat="server" OnSelectedIndexChanged="ChangeType" AutoPostBack="True" Width="100%" CssClass="form-control">
                                    <asp:ListItem Value="bm">部门类型</asp:ListItem>
                                    <asp:ListItem Value="sf">常用省份</asp:ListItem>
                                    <asp:ListItem Value="cs">常用城市</asp:ListItem>
                                    <asp:ListItem Value="yj">常用审批意见</asp:ListItem>
                                    <asp:ListItem Value="zw">常用人员职务</asp:ListItem>
                                    <asp:ListItem Value="bl">领用比例</asp:ListItem>
                                    <asp:ListItem Value="jh">计划类型</asp:ListItem>
                                    <asp:ListItem Value="hy">会议类型</asp:ListItem>
                                    <asp:ListItem Value="sp">视频类型</asp:ListItem>
                                    <asp:ListItem Value="hl">行业类别(名片)</asp:ListItem>
                                    <asp:ListItem Value="dx">常用短信分类</asp:ListItem>
                                    <asp:ListItem Value="gg">企业公告分类</asp:ListItem>
                                    <asp:ListItem Value="zd">规章制度分类</asp:ListItem>
                                    <asp:ListItem Value="mz">民族类型</asp:ListItem>
                                    <asp:ListItem Value="zc">职称类型</asp:ListItem>
                                    <asp:ListItem Value="zy">专业类型</asp:ListItem>
                                    <asp:ListItem Value="rl">人员类别</asp:ListItem>
                                    <asp:ListItem Value="lz">离职类型</asp:ListItem>
                                    <asp:ListItem Value="gz">工种类型</asp:ListItem>
                                    <asp:ListItem Value="yq">友情链接</asp:ListItem>
                                    <asp:ListItem Value="cd">物品产地</asp:ListItem>
                                    <asp:ListItem Value="pp">物品品牌</asp:ListItem>
                                    <asp:ListItem Value="gy">供应商类别</asp:ListItem>
                                    <asp:ListItem Value="rw">任务类别</asp:ListItem>
                                    <asp:ListItem Value="ly">资产来源</asp:ListItem>
                                    <asp:ListItem Value="lc">领出方式</asp:ListItem>
                                    <asp:ListItem Value="jt">计提方式</asp:ListItem>
                                    <asp:ListItem Value="dw">计量单位</asp:ListItem>
                                </asp:DropDownList></td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                    </table>

                    <asp:Panel ID="panel2" runat="server" ScrollBars="none">
                        <table style="table-layout: fixed">
                            <tr>
                            <td style="text-align:right;padding-right:10px;">
                                <asp:RequiredFieldValidator ID="Requiredfieldvalidator2" runat="server"
                                    ErrorMessage="请输入类型名称"
                                    Display="Static"
                                    ControlToValidate="name">&nbsp;
                                </asp:RequiredFieldValidator>
                                类型名称：                                           
                            </td>
                            <td>
                                <asp:TextBox ID="name" runat="server" MaxLength="50" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                                </tr>
                        </table>
                    </asp:Panel>

                    <asp:Panel ID="panel3" runat="server">
                        <table style="table-layout: fixed">
                            <tr>
                            <td>
                                <asp:TextBox ID="tb_num1" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="REV1" runat="server" ErrorMessage="输入有误! 请输入正整数" ControlToValidate="tb_num1" ValidationExpression="^\+?[1-9][0-9]*$">*</asp:RegularExpressionValidator><asp:Label ID="blb_operator" runat="server" Text=":"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="tb_num2" runat="server"></asp:TextBox><asp:RegularExpressionValidator ID="REV2" runat="server" ErrorMessage="输入有误! 请输入正整数" ControlToValidate="tb_num2" ValidationExpression="^\+?[1-9][0-9]*$">*</asp:RegularExpressionValidator>
                            </td>
                            <td></td>
                            <td></td>
                            <td></td>
                            <td></td>
                                </tr>
                        </table>
                    </asp:Panel>
                </div>

                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <td>
                            <asp:ValidationSummary
                                ID="ValidationSummary2"
                                runat="server"
                                EnableClientScript="true"
                                ShowMessageBox="true"
                                ShowSummary="false"></asp:ValidationSummary>
                        </td>
                        <td align="right">
                            <asp:Button ID="add" runat="Server" OnClick="Save_Click" CausesValidation="true" CssClass="btn btn-primary active" />
                            <asp:Button CssClass="btn btn-primary active" ID="StopBtn" runat="server" Text="禁用" OnClick="Stop_Click" AccessKey="i" CausesValidation="false" />
                            <asp:Button CssClass="btn btn-primary active" ID="PassBtn" runat="server" Text="启用" OnClick="Pass_Click" AccessKey="u" CausesValidation="false" />
                        </td>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">

                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    AllowSorting="True"
                    AutoGenerateColumns="False"
                    DataKeyNames="id"
                    DataSourceID="SqlDataSource1"
                    OnRowDataBound="OnRow_Bound"
                    EmptyDataText="没有查到符合条件的数据！">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <HeaderTemplate>
                                <div>
                                    <center><input type="checkbox" name="chkall" id="chkall" title="全选或取消" onclick="CheckAll(this.form)" style="width:16px;height:16px" /></center>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <center>
                                  <asp:CheckBox id="chk" runat="server"></asp:CheckBox>
                                </center>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="id" HeaderText="类型编码" ReadOnly="True" >
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mc" HeaderText="类型名称" >
                            <HeaderStyle ForeColor="Black"/>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zt" HeaderText="状态" ReadOnly="True">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="修改" ShowHeader="False">
                            <EditItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Update"
                                    ImageUrl="~/images/save2.gif" AlternateText="保存修改"/>
                                <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                                    ImageUrl="~/images/cancel.gif" AlternateText="取消修改" />
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle />
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation="False" CommandName="Edit"
                                    ImageUrl="~/images/edit.gif" AlternateText="修改此类型" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" ShowHeader="False">
                            <HeaderStyle />
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton4" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确认要执行删除吗？')"
                                    ImageUrl="~/images/del.gif" AlternateText="删除此类型" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="序号" Visible="False">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="dp_id" runat="server" Text='<%# Eval("id")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </div>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EamSqlConnectionString %>">
                <UpdateParameters>
                    <asp:Parameter Name="mc" DbType="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
    </form>
</body>
</html>
