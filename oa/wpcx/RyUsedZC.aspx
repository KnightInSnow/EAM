<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RyUsedZC.aspx.cs" Inherits="FCSystem.oa.wpcx.RyUsedZC" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <title>曾经使用过的资产</title>
</head>
<body>
    <form id="form1" runat="server">
        <br/>
        <table style="table-layout:fixed;">
            <tr>
                <td>
                    <asp:Label runat="server" ID="lblShowtip" ForeColor="Red" Visible="true">使用人：曾经使用过的资产:</asp:Label></font></td>
            </tr> 
            <tr>
                <td class="td_q_space"></td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="Panel3" runat="server" ScrollBars="Auto">
                        <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle"
                            OnRowDataBound="OnRow_Bound"
                            AutoGenerateColumns="False" 
                            DataKeyNames="his_tid" 
                            EmptyDataText="没有查到符合条件的数据！"
                            Width="100%" Visible="true">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle Width="30px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                    <HeaderStyle ForeColor="black" Width="80px" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="flmc" HeaderText="分类">
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wppp" HeaderText="品牌">
                                    <ItemStyle HorizontalAlign="Center" />
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="wpxh" HeaderText="型号">
                                    <HeaderStyle ForeColor="black" />
                                    <ItemStyle HorizontalAlign="center" />
                                </asp:BoundField>
                                <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                                    <ItemStyle HorizontalAlign="center" />
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="spr" HeaderText="接收人">
                                    <HeaderStyle Width="70px" ForeColor="black" />
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
                <td style="height: 22px">
                    <webdiyer:aspnetpager id="AspNetPager2" runat="server"
                        showcustominfosection="left"
                        showinputbox="Auto"
                        alwaysshow="false"
                        custominfohtml="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                        numericbuttoncount="10"
                        firstpagetext="首页"
                        lastpagetext="末页"
                        nextpagetext="下页"
                        prevpagetext="上页"
                        custominfosectionwidth="250px"
                        cssclass="page_text"
                        showboxthreshold="11"
                        inputboxclass="AspNetPagerInputBox"
                        submitbuttonclass=“AspNetPagerButton”
                        submitbuttontext="Go"
                        onpagechanged="AspNetPager2_PageChanged" visible="true"></webdiyer:aspnetpager>
                </td>
            </tr>
        </table>
        <asp:Label ID="lblYhtid" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>
