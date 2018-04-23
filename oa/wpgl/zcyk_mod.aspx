<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcyk_mod.aspx.cs" Inherits="FCSystem.OA.wpgl.zcyk_mod" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>资产移库信息</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>


</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">资产移库信息</td>
                    <td class="td_oa" style="width: 20%; height: 25px"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td width="100%" align="center" colspan="2">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table style="table-layout: fixed;">

                                                <tr>
                                                    <td> 移库标题：</td>
                                                    <td>
                                                        <asp:TextBox ID="ykbt" runat="server" Width="450" Enabled="False"></asp:TextBox>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator1"
                                                            runat="server"
                                                            ControlToValidate="ykbt"
                                                            ErrorMessage="请输入归还标题">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td> 申请部门：</td>
                                                    <td>
                                                        <asp:DropDownList ID="sqbm" Width="450" runat="server" AutoPostBack="True" OnSelectedIndexChanged="sqbm_SelectedIndexChanged" Enabled="False">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator5"
                                                            runat="server"
                                                            ControlToValidate="sqbm"
                                                            ErrorMessage="请选择申请部门">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td> 申请人员：</td>
                                                    <td>
                                                        <asp:DropDownList ID="sqry" runat="server" Width="450" AutoPostBack="true" Style="margin-top: 0px" Enabled="False">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator6"
                                                            runat="server"
                                                            ControlToValidate="sqry"
                                                            ErrorMessage="请选择申请人员">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <%--<tr>
                                                    <td> 物品分类：</td>
                                                    <td>
                                                        <asp:DropDownList ID="wpfl" Width="450px" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator2"
                                                            runat="server"
                                                            ControlToValidate="shbm"
                                                            ErrorMessage="请选择物品分类">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td> 物品名称：</td>
                                                    <td>
                                                        <asp:DropDownList ID="wpmc" runat="server" Width="450" AutoPostBack="True" OnSelectedIndexChanged="wpmc_SelectedIndexChanged">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator3"
                                                            runat="server"
                                                            ControlToValidate="shck"
                                                            ErrorMessage="请选择物品名称">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>--%>
                                               <%-- <tr>
                                                    <td> 资产编码：</td>
                                                    <td>
                                                        <asp:DropDownList ID="zcbm" runat="server" Width="450">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator7"
                                                            runat="server"
                                                            ControlToValidate="zcbm"
                                                            ErrorMessage="请选择相应资产">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>--%>
                                                <tr>
                                                    <td> 接收部门：</td>
                                                    <td>
                                                        <asp:DropDownList ID="jsbm" Width="450px" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="shbm_SelectedIndexChanged" Enabled="False">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator4"
                                                            runat="server"
                                                            ControlToValidate="jsbm"
                                                            ErrorMessage="请选择收回部门">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td> 接收仓库：</td>
                                                    <td>
                                                        <asp:DropDownList ID="jsck" runat="server" Width="450" AutoPostBack="True" OnSelectedIndexChanged="shck_SelectedIndexChanged" Enabled="False">
                                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                                        </asp:DropDownList>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator8"
                                                            runat="server"
                                                            ControlToValidate="jsck"
                                                            ErrorMessage="请选择收回仓库">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp; 移库说明：</td>
                                                    <td>
                                                        <asp:TextBox ID="yksm" runat="server" Width="450" Rows="3" TextMode="multiLine" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                               <tr>
                                                   <td></td>
                                               </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="lbltip" runat="server"  ForeColor="Red" Text="送审前请重新选择相应信息！" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="table-layout: fixed">
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull"
                                                EmptyDataText="暂时没有物品信息"
                                                Width="100%">
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
                                                            <asp:CheckBox ID="CheckEvery" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="移库单号">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_ykdh" runat="server" Text='<%# Bind("ykdh") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>                                                   
                                                    <asp:BoundField DataField="wpxh" HeaderText="资产型号">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ckmc" HeaderText="所属仓库">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zt" HeaderText="资产状态">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_zydm" HeaderText="使用人代码">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zcsm" HeaderText="资产说明">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="GridViewRowStyle" />
                                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 18px">&nbsp;</td>
                                </tr>
                            </table>
                            <table style="table-layout: fixed">
                                <tr>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button cssclass="mybutton" ID="SongShen" runat="server" Text="送审" OnClick="SongShen_Click"></asp:Button><input id="closebtn" type="button" name="BackBtn" value="关闭" class="mybtn_d1" onclick="javascript: window.close()" accesskey="q" />
                                        <asp:ValidationSummary
                                            ID="ValidationSummary1"
                                            runat="server"
                                            EnableClientScript="true"
                                            ShowMessageBox="true"
                                            ShowSummary="false"></asp:ValidationSummary>
                                    </td>
                                </tr>

                            </table>
                        </asp:Panel>
                    </td>
                </tr>

            </tbody>
        </table>
        <asp:Label ID="lblykid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffckid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblykdh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblykzt" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
