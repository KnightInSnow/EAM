<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcly_add.aspx.cs" Inherits="FCSystem.OA.wply.zcly_add" %>

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
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("lybt");  //初始化设置光标焦点
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
</head>
<body class="main" onload="SetFocus();" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">新增资产领用</td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td>
                        <asp:ScriptManager ID="SMReport" runat="server" EnableScriptGlobalization="true" EnableScriptLocalization="true"> 
                            </asp:ScriptManager>
                        <br />
                        
                                        <table style="table-layout: fixed;">

                                            <tr>
                                                <td> 领用标题：</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="lybt" runat="server" Width="450"></asp:TextBox>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator1"
                                                        runat="server"
                                                        ControlToValidate="lybt"
                                                        ErrorMessage="请输入领用标题">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>

                                            <%-- <tr>
                                                <td> 申请部门：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="sqbm" Width="450" runat="server" AutoPostBack="True" OnSelectedIndexChanged="sqbm_SelectedIndexChanged">
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
                                                <td colspan="3">
                                                    <asp:DropDownList ID="lyry" runat="server" Width="450">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td> 资产分类：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="wpfl" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator3"
                                                        runat="server"
                                                        ControlToValidate="wpfl"
                                                        ErrorMessage="请选择物品分类">&nbsp;
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
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="请选择领用物品">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> 发放部门：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ffbm" Width="450" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ffbm_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator2"
                                                        runat="server"
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="请选择物品发放部门">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td> 发放仓库：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="ffck" Width="450" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ffck_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="RequiredFieldValidator4"
                                                        runat="server"
                                                        ControlToValidate="ffbm"
                                                        ErrorMessage="请选择物品发放仓库">&nbsp;
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>&nbsp; 出库方式：</td>
                                                <td>
                                                    <asp:DropDownList ID="ddl_lcfs" runat="server" Width="180px" AutoPostBack="true" OnSelectedIndexChanged="ddl_lcfs_SelectedIndexChanged">
                                                        <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <asp:Panel ID="Panelghsj" runat="server" Visible="false">
                                                <tr>
                                                    <td> 归还时间：</td>
                                                    <td> 
                                                        <asp:TextBox ID="tbx_ghsj" runat="server" Width="180px"></asp:TextBox> 
                                                        <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="tbx_ghsj" CssClass="MyCalendar" Format="yyyy-MM-dd">
                                                        </ajaxToolkit:CalendarExtender>
                                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="日期格式不正确"
                                                         ControlToValidate="tbx_ghsj" ValidationExpression="(?!0000)[0-9]{4}-((0[1-9]|1[0-2])-(0[1-9]|1[0-9]|2[0-8])|(0[13-9]|1[0-2])-(29|30)|(0[13578]|1[02])-31)">&nbsp</asp:RegularExpressionValidator>
                                                    </td>
                                                </tr>
                                            </asp:Panel>
                                            <tr>
                                                <td>&nbsp; 紧急程度：</td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="jjcd" Width="180" runat="server">
                                                        <asp:ListItem Text="正常" Value="正常" Selected="true"></asp:ListItem>
                                                        <asp:ListItem Text="重要" Value="重要"></asp:ListItem>
                                                        <asp:ListItem Text="紧急" Value="紧急"></asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>

                                            </tr>

                                            <tr>
                                                <td>&nbsp; 领用说明：</td>
                                                <td colspan="3">
                                                    <asp:TextBox ID="lysm" runat="server" Width="450" Rows="3" TextMode="multiLine"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="td_q_space"></td>
                                                <td colspan="3"></td>
                                            </tr>
                                            <%--<tr>
                                                <td style="width: 90" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:DropDownList ID="jsr" runat="server">
                                                        <asp:ListItem Text="选择下一步审批人" Value=""></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:HyperLink ID="flsm" runat="server" Target="_blank" Enabled="false">点击查看分类流程说明</asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90" class="td_no"></td>
                                                <td colspan="3">
                                                    <asp:CheckBox ID="xxtz" runat="server" Text="站内消息通知下一步审批人" Checked="true" />
                                                    <asp:CheckBox ID="dxtz" runat="server" Text="手机短信通知下一步审批人" />
                                                </td>
                                            </tr>--%>
                                            <tr>
                                                <td></td>
                                                <td colspan="3" style="height: 30px">
                                                    <%-- <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="确认领用" OnClick="Save_Click" Enabled="False"></asp:Button><asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false" CssClass="mybutton" AccessKey="r" /><input type="button" name="BackBtn" value=" 关闭 " class="mybutton" onclick="javascript: window.close()" accesskey="q" />--%>
                                                    <asp:ValidationSummary
                                                        ID="ValidationSummary2"
                                                        runat="server"
                                                        EnableClientScript="true"
                                                        ShowMessageBox="true"
                                                        ShowSummary="false"></asp:ValidationSummary>
                                                    <asp:RequiredFieldValidator
                                                        ID="validatorbm"
                                                        runat="server"
                                                        ControlToValidate="ddlZcbmfull"
                                                        ErrorMessage="请选择物品编号">&nbsp
                                                    </asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
                                   
                    </td>
                </tr>
            </tbody>
        </table>
        <br />
        <table width="600px" align="center">
            <tr>
                <td><font color="red">请先添加需要领用的资产信息</font></td>
            </tr>
        </table>
        <asp:Panel ID="Panel1" runat="server">
            <table cellspacing="0" cellpadding="0" border="0" width="600px" align="center">
                <tr>
                    <td>
                        <asp:Label ID="a03" Text="资产编号：" runat="server"></asp:Label>
                    </td>
                    <td width="20%">
                        <asp:DropDownList ID="ddlZcbmfull" Width="150px" runat="server">
                            <asp:ListItem Text="" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button CssClass="mybutton" ID="AddBtn" runat="server" Text="添加资产" OnClick="Add_Click" /><asp:Button CssClass="mybutton" ID="DelBtn" runat="server" Text="删除" OnClick="Del_Click" CausesValidation="False" />
                    </td>
                </tr>
            </table>
        </asp:Panel>

        <asp:Panel ID="Panel2" runat="server">
            <table style="table-layout: fixed">
                <tr>
                    <td style="height: 10px"></td>
                </tr>
                <tr>
                    <td>
                        <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                            OnRowDataBound="OnRow_Bound"
                            AutoGenerateColumns="False" 
                            DataKeyNames="lymx_tid" 
                            EmptyDataText="暂时没有分配物品领用信息"
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
                                        <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16; height: 16" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="lymx_tid" HeaderText="领用详单tid编码">
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle CssClass="hidden" />
                                    <FooterStyle CssClass="hidden" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ui_zydm" HeaderText="使用人代码">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpxh" HeaderText="型号">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                    <HeaderStyle ForeColor="black" />
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
                    </td>
                </tr>
                <tr>
                    <td class="td_q_space"></td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Button CssClass="mybutton" ID="SaveBtn" runat="server" Text="确认领用" OnClick="Save_Click" Enabled="False"></asp:Button><asp:Button ID="Button2" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false" CssClass="mybutton" AccessKey="r" /><input type="button" name="BackBtn" value=" 关闭 " class="mybutton" onclick="javascript: window.close()" accesskey="q" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Label ID="lblMaxLYID" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lbl_maxlyindex" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="splx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="fpid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="kcbz" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="sqsl" runat="server" Text="0" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
