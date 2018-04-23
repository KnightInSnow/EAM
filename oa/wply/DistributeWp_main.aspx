<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="DistributeWp_main.aspx.cs" Inherits="FCSystem.OA.wply.DistributeWp_main" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>物品直接派发</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tr>
                <td style="height: 20px; background-color: #8CA1AE;">
                    <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="center" style="background-image: url(../../images/bg.gif);">物品直接派发</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" width="100%">
                    <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                        <br />
                        <table style="table-layout:fixed;">
                            <tbody>
                                <tr width="100%">
                                    <td align="left">快速检索：</td>
                                    <td align="left" width="15%">
                                        <asp:DropDownList ID="query_tj" runat="server" Height="21px" Width="90%">
                                            <asp:ListItem Value="lybt" Selected="True">领用标题</asp:ListItem>
                                            <asp:ListItem Value="jjcd">紧急程度</asp:ListItem>
                                            <asp:ListItem Value="lysm">领用说明</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td align="left" width="20%">
                                        <asp:TextBox ID="query_content" runat="server" Width="90%" Height="21px"></asp:TextBox>
                                    </td>
                                    <td width="5%"></td>
                                    <td align="left"></td>
                                    <td align="left" width="15%"></td>
                                    <td style="width: 30%"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                                <tr width="100%">
                                    <td align="right" colspan="7">
                                        <asp:Button cssclass="mybutton" ID="QueryBtn" runat="server" Text="查询" OnClick="Query_Click" CausesValidation="False" AccessKey="f" /><asp:Button ID="AddBtn" Text="新增物品派发" cssclass="mybutton" runat="server" Visible="true" CausesValidation="false" /><asp:Button cssclass="mybutton" ID="RefBtn" runat="server" Text="刷新" OnClick="Query_Click" CausesValidation="False" AccessKey="e" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>

                        <table id="search2" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                            <tr>
                                <td>
                                    <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                        <asp:GridView ID="GridView1" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="lyid"
                                            
                                            EmptyDataText="没有查到符合条件的数据！"
                                            >
                                            <Columns>
                                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="30px" />
                                                </asp:TemplateField>

                                                <asp:BoundField DataField="lyid" HeaderText="领用单编号">
                                                    <HeaderStyle CssClass="hidden" />
                                                    <ItemStyle CssClass="hidden" />
                                                    <FooterStyle CssClass="hidden" />
                                                </asp:BoundField>
                                                <asp:TemplateField HeaderText="领用单编号">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <ItemTemplate>
                                                        <a href="#" onclick="javascript:popAdd2('/oa/wply/wply_mod.aspx?id=<%# Eval("lyid") %>')">
                                                            <font color="#3366ff"><asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("lydh") %>'></asp:Label></font>
                                                        </a>
                                                    </ItemTemplate>
                                                    <ControlStyle CssClass="navigate" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="lybt" HeaderText="领用标题">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="jjcd" HeaderText="紧急程度">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lx" HeaderText="资产类型">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sqsj" HeaderText="申请时间" HtmlEncode="False">
                                                    <HeaderStyle ForeColor="Black" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sqr_name" HeaderText="申请人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="sqr_bmmc" HeaderText="申请部门">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lysm" HeaderText="备注">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lyzt" HeaderText="状态">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="spr" HeaderText="审批人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="spsj" HeaderText="审批时间">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="spyj" HeaderText="审批意见">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
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
                                <td></td>
                            </tr>
                            <tr>
                                <td style="height: 22px">
                                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                        OnPageChanged="AspNetPager1_PageChanged"
                                        ShowCustomInfoSection="left"
                                        ShowInputBox="Auto"
                                        AlwaysShow="true"
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
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
