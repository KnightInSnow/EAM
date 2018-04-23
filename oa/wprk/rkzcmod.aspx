<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkzcmod.aspx.cs" Inherits="FCSystem.OA.wprk.rkzcmod" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>入库资产信息修改</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">

            <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true">
            </asp:ScriptManager>

            <table>
                <tbody>
                    <tr>
                        <td class="td_oa" style="width: 50%; height: 25px">入库资产信息</td>
                        <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                    </tr>
                    <tr>
                        <td>
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody>

                                    <tr>
                                        <td>
                                            <table width="680" border="0" align="center" cellpadding="1" cellspacing="1">
                                                <tr>
                                                    <td>标准分类编码：</td>
                                                    <td>
                                                        <asp:Label ID="bzflbm" runat="server" Text="" Width="152px"></asp:Label>
                                                    </td>

                                                    <td>分类编码选择：</td>
                                                    <td>
                                                        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="wz_id " DataValueField="wz_id" Height="16px" Width="152px" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>部门代码：</td>
                                                    <td>
                                                        <asp:Label ID="lbl_bmid" runat="server" Width="152"></asp:Label>
                                                    </td>

                                                    <td>资产编码前缀：</td>
                                                    <td>
                                                        <asp:TextBox ID="lbl_zcbmqz" runat="server" Width="152px" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>资产唯一编码：</td>
                                                    <td>
                                                        <asp:TextBox ID="lbl_zcbmuqi" runat="server" Width="152px"></asp:TextBox>
                                                    </td>
                                                    <td>商品唯一编码：</td>
                                                    <td>
                                                        <asp:TextBox ID="lbl_oldcode" runat="server" Width="152"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>商品信息选择：</td>
                                                    <td colspan="2">
                                                        <%--<asp:TextBox ID="wpbm" runat="server" Width="152" AutoPostBack="true" OnTextChanged="Wpbm_Changed"></asp:TextBox>&nbsp;<img src="/images/fd.gif" onclick="openA('/choose/spview_zc.aspx?id=t2')" alt="选择要查询的商品编码" />&nbsp;<asp:ImageButton ID="RefBtn" runat="server" OnClick="Wpbm_Changed" ImageUrl="~/images/refresh.gif" ToolTip="刷新物品信息" CausesValidation="false" />--%>
                                                        <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" AutoPostBack="true">
                                                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>商品所属分类：</td>
                                                    <td>
                                                        <asp:TextBox ID="ssfl" runat="server" Width="152" ReadOnly="true" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td>商品名称：</td>
                                                    <td>
                                                        <asp:TextBox ID="wpmc" runat="server" Enabled="False" ReadOnly="true" Width="152"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>商品供应商：</td>
                                                    <td>
                                                        <asp:TextBox ID="gys" runat="server" Width="152" ReadOnly="true" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td>商品品牌：</td>
                                                    <td>
                                                        <asp:TextBox ID="wppp" runat="server" Width="152" ReadOnly="true" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>商品型号：</td>
                                                    <td>
                                                        <asp:TextBox ID="wpxh" runat="server" Width="152" ReadOnly="true" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td>商品规格：</td>
                                                    <td>
                                                        <asp:TextBox ID="wpgg" runat="server" Width="152"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>商品产地：</td>
                                                    <td>
                                                        <asp:TextBox ID="wpcd" runat="server" Width="152" ReadOnly="true" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td>商品建议单价：</td>
                                                    <td>
                                                        <asp:TextBox ID="wpdj" runat="server" Width="152" ReadOnly="true" Enabled="False"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>商品条形码：</td>
                                                    <td>
                                                        <asp:TextBox ID="txm" runat="server" Width="152" ReadOnly="true" Enabled="False"></asp:TextBox>
                                                    </td>
                                                    <td>保修开始时间：</td>
                                                    <td>
                                                        <asp:TextBox ID="txtBxkssj" runat="server" Width="152"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtBxkssj"
                                                            CssClass="MyCalendar" Format="yyyy-MM-dd">
                                                        </ajaxToolkit:CalendarExtender>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator8"
                                                            runat="server"
                                                            ControlToValidate="txtBxkssj"
                                                            ErrorMessage="请输入保修开始时间">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>报废时间：</td>
                                                    <td>
                                                        <asp:TextBox ID="tbx_bfsj" runat="server" Width="152"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="tbx_bfsj"
                                                            CssClass="MyCalendar" Format="yyyy-MM-dd">
                                                        </ajaxToolkit:CalendarExtender>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator9"
                                                            runat="server"
                                                            ControlToValidate="tbx_bfsj"
                                                            ErrorMessage="请输入报废时间">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>保修结束时间：</td>
                                                    <td>
                                                        <asp:TextBox ID="txtBxjssj" runat="server" Width="152"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtBxjssj"
                                                            CssClass="MyCalendar" Format="yyyy-MM-dd">
                                                        </ajaxToolkit:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>备注信息：</td>
                                                    <td colspan="2">
                                                        <asp:TextBox ID="tbx_zcbz" runat="server" TextMode="MultiLine"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4">
                                                        <hr size="1" noshade />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>入库数量：</td>
                                                    <td>
                                                        <asp:TextBox ID="rksl" runat="server" Width="152" Text="1" Enabled="false"></asp:TextBox>
                                                    </td>
                                                    <td>入库单价：</td>
                                                    <td>
                                                        <asp:TextBox ID="rkdj" runat="server" Width="152" AutoPostBack="True" CausesValidation="True"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>原始图像：</td>
                                                    <td colspan="3">
                                                        <asp:FileUpload ID="yst" runat="server" Height="21px" Width="420px" /><%--<input id="yst" runat="server" type="file" style="width: 300px; height: 20px" class="mytext" />--%><asp:Button ID="btn_ystsc" runat="server" Height="21px" Width="80px" Text="上传" OnClick="btn_ystsc_Click" CausesValidation="False" /></td>
                                                </tr>
                                                <tr>
                                                    <td>已上传图片：</td>
                                                    <td colspan="3">
                                                        <asp:Panel ID="panel_filename" runat="server" ScrollBars="Auto">
                                                            <asp:Label ID="lblPostedFilename" runat="server" Text=""></asp:Label>
                                                        </asp:Panel>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>资产来源： 
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_zcly" runat="server" Width="152px" Enabled="false">
                                                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>折旧起始价：</td>
                                                    <td>
                                                        <asp:TextBox ID="txt_zjqsj" runat="server" Width="152px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>折旧起始期：</td>
                                                    <td>
                                                        <asp:TextBox ID="txt_zjqsq" runat="server" Width="152px"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txt_zjqsq"
                                                            CssClass="MyCalendar" Format="yyyy-MM-dd">
                                                        </ajaxToolkit:CalendarExtender>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="*"
                                                            ControlToValidate="txt_zjqsq" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)"></asp:RegularExpressionValidator>

                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator6"
                                                            runat="server"
                                                            ControlToValidate="txt_zjqsq"
                                                            ErrorMessage="请输入折旧开始时间">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                    <td>折旧期(月)：</td>
                                                    <td>
                                                        <asp:TextBox ID="txt_zjq" runat="server" Width="152px"></asp:TextBox>
                                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txt_zjq" ErrorMessage="折旧期应为具体月数" MaximumValue="240" MinimumValue="1" Type="Integer">*</asp:RangeValidator>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>计提方式：</td>
                                                    <td>
                                                        <asp:DropDownList ID="ddl_jtfs" runat="server" Width="152px">
                                                            <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>残值：</td>
                                                    <td>
                                                        <asp:TextBox ID="txt_cz" runat="server" Width="152px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td colspan="3" style="height: 30px">
                                                        <asp:Button ID="SaveBtn" runat="server" AccessKey="s" CssClass="mybutton" OnClick="Save_Click" Text="保存" Visible="false" /><asp:Button ID="Button2" runat="Server" Visible="false" AccessKey="r" CausesValidation="false" CssClass="mybutton" OnClick="Clear_Click" Text="清空" /><input type="button" name="BackBtn" value="关闭" class="mybutton" onclick="javascript: window.close()" accesskey="q" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td style="height: 12px" colspan="3">&nbsp;<asp:ValidationSummary ID="ValidationSummary2" runat="server" EnableClientScript="true" ShowMessageBox="true" ShowSummary="false" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="rkdj" ErrorMessage="请输入入库单价">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="*"
                                                            ControlToValidate="txtBxjssj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)"></asp:RegularExpressionValidator>

                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="*"
                                                            ControlToValidate="tbx_bfsj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)"></asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator5"
                                                            runat="server"
                                                            ControlToValidate="txtBxjssj"
                                                            ErrorMessage="请输入保修结束时间">*
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="lbl_zcbmuqi" ErrorMessage="资产编码不能为空">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="rkdj" Display="none" ErrorMessage="入库单价必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}">
                                                        </asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="wpmc" ErrorMessage="商品编码不存在，无法继续保存">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="lbl_zcbmuqi" ErrorMessage="资产编码格式不正确（后四位需为数字）" Display="None" ValidationExpression="^\w*\d{4}$">
                                                        </asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            <asp:Label ID="IDlabel" runat="server" Visible="false" />
            <asp:Label ID="gys_tidLabel1" runat="server" Visible="false" />
            <asp:Label ID="lbl_maxuqi" runat="server" Visible="false" />
            <asp:Label ID="lblid" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblicount" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblfltid" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblfltidExist" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lbl_tpmc" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lbl_tplj" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblflqz" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblflmin" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblflmax" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblwpjm" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblcurmax" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblcurmin" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lbl_upfltid" runat="server" Visible="False"></asp:Label>
            <asp:Label ID="lblzcbm" runat="server" Visible="False"></asp:Label>
        </asp:Panel>

    </form>
</body>
</html>
