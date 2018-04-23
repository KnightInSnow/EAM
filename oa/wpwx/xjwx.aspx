<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="xjwx.aspx.cs" Inherits="FCSystem.OA.wpwx.xjwx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>询价维修</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout:fixed;">
            <tr>
                <td></td>
            </tr>
        </table>
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <asp:Label ID="lblwxdmc" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="12%">申请人员：</td>
                <td>
                    <asp:TextBox ID="tbx_sqry" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="12%">所属部门：</td>
                <td>
                    <asp:TextBox ID="tbx_ssbm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td width="12%">维修单说明：</td>
                <td>
                    <asp:TextBox ID="tbx_wxd_sm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                </td>
            </tr>
        </table>
        </br>
        <table style="table-layout:fixed;">
            <tr>
                <td><font color="red">待维修的资产信息</font></td>
            </tr>
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
                        Width="700px">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
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
                            <asp:BoundField DataField="wxzc_sm" HeaderText="维修说明">
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
                <td class="td_q_space"></td>
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
                            <table id="wxgys" cellspacing="1" cellpadding="1" width="100%" border="0">
                                <tr>
                                    <td><font color="red">提供维修服务的供应商信息</font></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView2" runat="server"
                                            OnRowDataBound="OnRow_Bound"
                                            AutoGenerateColumns="False"
                                            CellSpacing="1"
                                            DataKeyNames="gys_tid"
                                            BorderStyle="None"
                                            BorderWidth="0px"
                                            BackColor="Silver"
                                            EmptyDataText="没有查到符合条件的数据！"
                                            Width="700px">
                                            <Columns>
                                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                    <HeaderStyle Width="5%" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderStyle HorizontalAlign="Center" Width="30px" />
                                                    <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="selectgys" runat="server" CssClass="mybox" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="gysmc" HeaderText="维修商名称">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lxr" HeaderText="联系人">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="lxdh" HeaderText="联系电话">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="dz" HeaderText="地址">
                                                    <HeaderStyle ForeColor="black" />
                                                    <ItemStyle HorizontalAlign="center" />
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
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager2" runat="server"
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
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager2_PageChanged">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="700px" align="right">
                                        <asp:Button ID="btn_xj" runat="server" Text="询价"  Enabled="false"  cssclass="mybutton" OnClick="btn_xj_Click" /></td>
                                </tr>
                            </table>
        <!--隐藏label-->
        <asp:Label ID="lblwxdid" runat="server" Text="" Visible="false"></asp:Label>
        <asp:Label ID="lblwxdzt" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
