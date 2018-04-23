<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcgh_mod.aspx.cs" Inherits="FCSystem.OA.wpth_new.zcgh_mod" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>资产归还信息</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>


</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 60%; height: 25px">资产归还信息</td>
                    <td class="td_oa" style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="true" /><asp:Label ID="lblprn" runat="server" Text="打印归还单" Font-Underline="True" Font-Names="仿宋" Font-Size="X-Small" Visible="true"></asp:Label></td>
                    <td class="td_oa" style="width: 20%; height: 25px"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td width="100%" align="center" colspan="3">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            <table style="table-layout:fixed;">
                                <tr>
                                    <td>
                                        <table style="table-layout: fixed;">

                                            <tr>
                                                <td> 归还标题：</td>
                                                <td>
                                                    <asp:TextBox ID="ghbt" runat="server" Width="450" Enabled="False"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="ghbt"
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
                                            <tr>
                                                <td> 收回部门：</td>
                                                <td>
                                                    <asp:DropDownList ID="shbm" Width="450px" runat="server" AutoPostBack="True" Height="16px" OnSelectedIndexChanged="shbm_SelectedIndexChanged" Enabled="False">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator4"
                                                        runat="server"
                                                        ControlToValidate="shbm"
                                                        ErrorMessage="请选择收回部门">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td> 收回仓库：</td>
                                                <td>
                                                    <asp:DropDownList ID="shck" runat="server" Width="450" AutoPostBack="True" OnSelectedIndexChanged="shck_SelectedIndexChanged" Enabled="False">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator8"
                                                        runat="server"
                                                        ControlToValidate="shck"
                                                        ErrorMessage="请选择收回仓库">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp; 归还说明：</td>
                                                <td>
                                                    <asp:TextBox ID="ghsm" runat="server" Width="450" Rows="3" TextMode="multiLine" Enabled="False"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
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
                                                DataKeyNames="lymx_tid"
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
                                                    <asp:TemplateField HeaderText="归还单号">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("ghdh") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="lymx_tid" HeaderText="领用明细单号">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <FooterStyle CssClass="hidden" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpxh" HeaderText="商品型号">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ckmc" HeaderText="收回仓库">
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
        <asp:Label ID="lblghid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffckid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblghdh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblghzt" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
