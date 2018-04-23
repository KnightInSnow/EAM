<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wxqr_mod.aspx.cs" Inherits="FCSystem.OA.wpwx.wxqr_mod" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>维修确认</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function openwin_mini(src) {
            var vDialog = null;
            vDialog = showModalDialog(src, window, "status:no;resizable:off;dialogHeight:130px;dialogWidth:300px;unadorne:yes;help:no");
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <input type="button" name="BackBtn" value="关闭" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /><asp:Button cssclass="mybutton" ID="SpBtn" runat="server" Text="审批通过" OnClick="Sp_Click" Visible="false" /><asp:Button cssclass="mybutton" ID="ThBtn" runat="server" Text="审批退回" OnClick="Th_Click" Visible="false" /></td>
            </tr>
        </table>
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <asp:Label ID="lblwxdmc" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="15%">申请人员：</td>
                <td>
                    <asp:TextBox ID="tbx_sqry" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%">所属部门：</td>
                <td>
                    <asp:TextBox ID="tbx_ssbm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="15%">备注：</td>
                <td>
                    <asp:TextBox ID="tbx_wxd_sm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                <tr>
                    <td width="15%">意见追述：</td>
                    <td>
                        <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500px" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox></td>
                </tr>
            </asp:Panel>
        </table>
        </br>
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False"
                        CellSpacing="1"
                        DataKeyNames="wxzc_tid"
                        BorderStyle="None"
                        BorderWidth="0px"
                        BackColor="Silver"
                        EmptyDataText="暂时没有登记任何信息"
                        Width="750px">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                <HeaderTemplate>
                                    <%-- <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />--%>
                                </HeaderTemplate>
                                <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:CheckBox ID="chkevery" runat="server" CssClass="mybox" />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="wxd_id" HeaderText="维修单id">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wxzc_bm" HeaderText="资产编码">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fl_mc" HeaderText="分类类别">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpdj" HeaderText="商品单价">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wxzc_sm" HeaderText="故障说明">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wxfs" HeaderText="维修方式">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wxbz" HeaderText="维修备注">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="维修图">
                                <HeaderStyle ForeColor="Black" />
                                <ItemStyle HorizontalAlign="center" />
                                <ItemTemplate>
                                    <asp:HyperLink ID="ckqm" Enabled="true" Target="_blank" runat="server" CssClass="navigate" ToolTip="查看图片" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="wxzt" HeaderText="维修状态" HeaderStyle-CssClass="hidden">
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
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
                <td style="height: 22px">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                        OnPageChanged="AspNetPager1_PageChanged"
                        ShowCustomInfoSection="left"
                        ShowInputBox="Auto"
                        AlwaysShow="false"
                        CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                        NumericButtonCount="10"
                        FirstPageText="首页"
                        LastPageText="末页"
                        NextPageText="下页"
                        PrevPageText="上页"
                        CustomInfoSectionWidth="250px"
                        CssClass="page_text"
                        ShowBoxThreshold="11"
                        InputBoxClass="AspNetPagerInputBox"
                        SubmitButtonClass=“AspNetPagerButton”
                        SubmitButtonText="Go">
                    </webdiyer:AspNetPager>
                </td>
            </tr>
        </table>
        </br>
        <asp:Panel ID="Panel_jsfs" runat="server" Visible="false">
            <table border="0" cellpadding="1" cellspacing="1" width="100%">
                <tr>
                    <td colspan="3"><font color="red">维修结束后请勾选资产设置维修方式</font></td>
                </tr>
                <tr>
                    <td></td>
                </tr>
                <tr>
                    <td width="15%">
                        <asp:RadioButton ID="rbtn1" runat="server" Text="保内维修" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn1_CheckedChanged" />
                    </td>
                    <td width="8%">维修备注：</td>
                    <td width="77%">
                        <asp:TextBox ID="tbx_bngh" runat="server" Width="400px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                        <asp:RadioButton ID="rbtn2" runat="server" Text="保内换新" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn1_CheckedChanged" />
                    </td>
                    <td width="10%">维修备注：</td>
                    <td>
                        <asp:TextBox ID="tbx_bnhx" runat="server" Width="400px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                        <asp:RadioButton ID="rbtn3" runat="server" Text="保外维修" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn1_CheckedChanged" />
                    </td>
                    <td width="8%">维修费用：</td>
                    <td>
                        <asp:TextBox ID="tbx_bwwx" runat="server" Width="100px" Enabled="false"></asp:TextBox><asp:Label ID="Label2" Text=" " runat="server" Width="20px"></asp:Label><asp:Label ID="lblbwwxsm" Text="维修说明:" runat="server" Width="80px"></asp:Label><asp:TextBox ID="tbx_bwwssm" runat="server" Width="200px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="15%">
                        <asp:RadioButton ID="rbtn4" runat="server" Text="保外报废" GroupName="rbtn" AutoPostBack="True" OnCheckedChanged="rbtn1_CheckedChanged" />
                    </td>
                    <td width="10%">维修说明：</td>
                    <td>
                        <asp:TextBox ID="tbx_bwbf" runat="server" Width="400px" Enabled="false"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator17" runat="server" ControlToValidate="tbx_bwwx" ErrorMessage="维修费用必须为数值型" ValidationExpression="\d+\.\d+|\d{0,9}">
                        </asp:RegularExpressionValidator></td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td></td>
                    <td align="center"></td>
                    <td align="left">
                        <asp:Button ID="btn_set" runat="server" Enabled="false" Text="确认维修" cssclass="mybutton" OnClick="btn_set_Click" /></td>
                </tr>
            </table>
        </asp:Panel>
        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>

        <!--隐藏label-->
        <asp:Label ID="lblwxdid" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblwxdzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblwxfs" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblbmcode" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblwxdh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffcktid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
