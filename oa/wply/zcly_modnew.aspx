<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcly_modnew.aspx.cs" Inherits="FCSystem.OA.wply.zcly_modnew" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>领用资产</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/html">
        a:link{
        color:#ffffff;
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server" method="post">
        <table style="table-layout: fixed">
            <tr>
                <td class="td_oa" style="width: 60%; height: 25px">资产领用信息</td>
                <td class="td_oa" style="width: 20%">
                    <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="true" /><a href="#"><asp:Label ID="lblprn" runat="server" Text="打印领用单" Font-Underline="True" Font-Names="仿宋" Font-Size="X-Small" Visible="true" ForeColor="White"></asp:Label></a>
                    &nbsp;&nbsp;<asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:Label ID="PrnLbl" runat="server" Text="打印资产标签" Font-Names="仿宋" Font-Underline="true" Visible="false"></asp:Label>
                </td>
                <td width="20%"><span class="td_yes">&nbsp;&nbsp;&nbsp</span>=必填信息</td>
            </tr>
            <tr>
                <td valign="top" colspan="3">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <br />
                    <table style="table-layout:fixed;">
                        <tr>
                            <td colspan="2">
                                <table style="table-layout: fixed">
                                    <tr>
                                        <td> 领用标题：</td>
                                        <td>
                                            <asp:TextBox ID="lybt" runat="server" Width="450" Enabled="false"></asp:TextBox>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator1"
                                                runat="server"
                                                ControlToValidate="lybt"
                                                ErrorMessage="请输入领用标题">&nbsp;</asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> 发放部门：</td>
                                        <td class="auto-style1">
                                            <asp:DropDownList ID="ddl_ffbm" Width="450" Enabled="false" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_ffbm_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator2"
                                                runat="server"
                                                ControlToValidate="ddl_ffbm"
                                                ErrorMessage="请选择商品发放部门">&nbsp;
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td> 发放仓库：</td>
                                        <td>
                                            <asp:DropDownList ID="ddl_ffck" Width="450" Enabled="false" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddl_ffck_SelectedIndexChanged">
                                                <asp:ListItem Text="" Value=""></asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator4"
                                                runat="server"
                                                ControlToValidate="ddl_ffck"
                                                ErrorMessage="请选择商品发放仓库">&nbsp;
                                            </asp:RequiredFieldValidator>
                                        </td>
                                    </tr>
                                    <asp:Panel ID="plNew" runat="server" Visible="false">
                                        <tr>
                                            <td> 资产分类：</td>
                                            <td>
                                                <asp:DropDownList ID="ddl_zcfl" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddl_zcfl_SelectedIndexChanged">
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator3"
                                                    runat="server"
                                                    ControlToValidate="ddl_zcfl"
                                                    ErrorMessage="请选择资产分类">&nbsp;
                                                </asp:RequiredFieldValidator>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td> 领用资产：</td>
                                            <td>
                                                <asp:DropDownList ID="ddlWp" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlWp_SelectedIndexChanged">
                                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                                </asp:DropDownList>
                                                <asp:RequiredFieldValidator
                                                    ID="RequiredFieldValidator5"
                                                    runat="server"
                                                    ControlToValidate="ddlWp"
                                                    ErrorMessage="请选择领用资产">&nbsp;
                                                </asp:RequiredFieldValidator>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp; 出库方式：</td>
                                            <td>
                                                <asp:DropDownList ID="ddl_lcfs" runat="server" Width="450px" Enabled="false" AutoPostBack="true" OnSelectedIndexChanged="ddl_lcfs_SelectedIndexChanged">
                                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                </asp:DropDownList></td>
                                        </tr>
                                    </asp:Panel>
                                    <asp:Panel ID="plGhsj" runat="server" Visible="false">
                                        <tr>
                                            <td> 归还时间：</td>
                                            <td>
                                                <asp:TextBox ID="tbx_ghsj" runat="server" Width="450px"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbx_ghsj" CssClass="MyCalendar" Format="yyyy-MM-dd">
                                                </ajaxToolkit:CalendarExtender>
                                                <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="日期格式不正确"
                                                    ControlToValidate="tbx_ghsj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                            </td>
                                        </tr>
                                    </asp:Panel>
                                    <tr>
                                        <td>&nbsp; 紧急程度：</td>
                                        <td>
                                            <asp:DropDownList ID="jjcd" Width="450px" runat="server" Enabled="false">
                                                <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                                                <asp:ListItem Text="重要" Value="重要"></asp:ListItem>
                                                <asp:ListItem Text="紧急" Value="紧急"></asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp; 领用说明：</td>
                                        <td>
                                            <asp:TextBox ID="lysm" runat="server" Width="450" Rows="3" TextMode="multiLine" Enabled="false"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td></td>
                                        <td style="height: 30px">
                                            <asp:ValidationSummary
                                                ID="ValidationSummary2"
                                                runat="server"
                                                EnableClientScript="true"
                                                ShowMessageBox="true"
                                                ShowSummary="false"></asp:ValidationSummary>
                                            <asp:RequiredFieldValidator
                                                ID="RequiredFieldValidator6"
                                                runat="server"
                                                ControlToValidate="tbx_sqsl"
                                                ErrorMessage="请填写申请数量">&nbsp;
                                            </asp:RequiredFieldValidator>
                                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="tbx_sqsl" ErrorMessage="申请数量数据格式不正确" MaximumValue="1000" MinimumValue="1" Type="Integer">*</asp:RangeValidator>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <asp:Panel ID="plAddnew" runat="server" Visible="false">
            <table cellpadding="1" cellspacing="1" border="0" width="600px" align="center">
                <tr>
                    <td>&nbsp; 库存数量
                    </td>
                    <td width="20%">
                        <asp:Label ID="lblkcinfo" runat="server" Text=""></asp:Label>
                    </td>
                    <td>&nbsp; 申请数量：
                    </td>
                    <td>
                        <asp:TextBox ID="tbx_sqsl" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="right">
                        <asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="添加" OnClick="Add_Click" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <table style="table-layout: fixed">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False"
                        CellSpacing="1"
                        DataKeyNames="lymx_tid"
                        BorderStyle="None"
                        BorderWidth="0px"
                        BackColor="Silver"
                        EmptyDataText="暂时没有登记资产领用信息"
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
                                    <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_zydm" HeaderText="使用人代码">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpxh" HeaderText="型号">
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
                </td>
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td align="right">
                    <asp:Button cssclass="mybutton" ID="btn_songshen" runat="server" Text="申请领用" OnClick="SongShen_Click" Visible="false" Enabled="false" CausesValidation="False"></asp:Button>
                </td>
            </tr>
        </table>
        <asp:Label ID="lbllyid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="kcbz" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblsqzs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblLcfs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSqrtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblKcsl" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lblysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lbldlrysqsl" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lbldlyhtid" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>
