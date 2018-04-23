<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Hotkeys.aspx.cs" Inherits="FCSystem.OA.wpcx.Hotkeys" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>资产明细</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="PopHead">
            <table style="table-layout: fixed;" align="center">
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">资产明细</td>
                    <td class="td_oa" style="width: 20%"></td>
                </tr>
            </table>
        </div>

        <div class="PopBodyGrid">

            <asp:Panel ID="Panel1" runat="server" Width="100%" Style="min-height: 200px!important;" ScrollBars="Auto">

                <asp:Panel ID="Panel2" runat="server" Style="min-height: 200px!important;">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                        OnRowDataBound="OnRow_Bound"
                        AutoGenerateColumns="False"
                        DataKeyNames="zcbmfull"
                        EmptyDataText="没有查到符合条件的数据！"
                        Width="100%">
                        <Columns>
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="30px" />
                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="资产编码">
                                                            <ItemStyle HorizontalAlign="Center" />
                                                            <ItemTemplate>
                                                              <a href="#" onclick="javascript:popAdd2('/oa/wpcx/Hotkeys.aspx?id=<%#Eval("zcbmfull") %>&id2=<%#Eval("wpmc")%>')"><font color="#3366ff"><asp:Label id="lblzc" runat="server" text='<%#Bind("zcbmfull") %>'>'></asp:Label></font></a>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>--%>

                            <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>

                            <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="fl_mc" HeaderText="商品分类">
                                <HeaderStyle ForeColor="black" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wppp" HeaderText="品牌">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="wpxh" HeaderText="型号">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="yn_gdzc" HeaderText="资产类型">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <%--   <asp:ImageField DataImageUrlField="yn_gdzc" DataImageUrlFormatString="~/images/{0}.gif" HeaderText="是否固定资产">
                                                            <ItemStyle HorizontalAlign="center" />
                                                            <HeaderStyle Width="30px" ForeColor="black" />
                                                        </asp:ImageField>--%>

                            <asp:BoundField DataField="zczt" HeaderText="资产状态">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="领用人">
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <asp:Label ID="Labellyrname" runat="server" Text='<%# Bind("ui_desc") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="lybm" HeaderText="领用部门">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ckmc" HeaderText="发放仓库">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--<asp:BoundField DataField="ffbm" HeaderText="发放部门">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>--%>
                            <asp:BoundField DataField="gysmc" HeaderText="供应商">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="lxdh" HeaderText="供应商电话">
                                <HeaderStyle ForeColor="black" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundField>
                            <%--  <asp:TemplateField HeaderText="入库单">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <a href="#" onclick="javascript:popAdd2('/oa/wpcx/Hotkeys.aspx?id=<%#Eval("zcbmfull") %>&id2=<%#Eval("wpmc")%>')"><font color="#3366ff"><asp:Label id="lblrkd" runat="server" text='<%#Bind("rkdh") %>'>'></asp:Label></font></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="领用单">
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <a href="#" onclick="javascript:popAdd2('/oa/wpcx/Hotkeys.aspx?id=<%#Eval("zcbmfull") %>&id2=<%#Eval("wpmc")%>')"><font color="#3366ff"><asp:Label id="lbllyd" runat="server" text='<%#Bind("lydh") %>'>'></asp:Label></font></a>
                                                </ItemTemplate>
                                            </asp:TemplateField>--%>
                            <%--  <asp:BoundField DataField="ffsj" HeaderText="领用时间" DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                                            <HeaderStyle Width="80px" ForeColor="Black" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="spr" HeaderText="审批人">
                                                            <HeaderStyle ForeColor="black" />
                                                            <ItemStyle HorizontalAlign="center" />
                                                        </asp:BoundField>--%>
                        </Columns>
                        <RowStyle CssClass="GridViewRowStyle" />
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                    </asp:GridView>
                </asp:Panel>

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
                    SubmitButtonClass="“AspNetPagerButton”"
                    SubmitButtonText="Go"></webdiyer:AspNetPager>

            </asp:Panel>

        </div>

        <br />
        <br />

        <div class="PopBodyInputs">
            <table style="table-layout: fixed;">
                <tr align="center">
                    <td>
                        <font color="red">点击下列快捷键查看当前资产相应的凭证、历史信息</font>
                    </td>
                </tr>
            </table>

            <table style="table-layout: fixed;" align="center">
                <tr>
                    <td>
                        <br />
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>


                <tr>
                    <td></td>
                    <td>
                        <asp:Button CssClass="btn btn-primary active" ID="Button7" runat="server" Text="原始图" OnClick="Yst_Click"></asp:Button></td>
                    <td>
                        <asp:Button CssClass="btn btn-primary active" ID="cx_ht" runat="server" Text="合同" OnClick="cxht_Click"></asp:Button></td>
                    <td>
                        <asp:Button CssClass="btn btn-primary active" ID="Button2" runat="server" Text="购买申请" OnClick="Gmsqs_Click"></asp:Button></td>
                    <td>
                        <asp:Button CssClass="btn btn-primary active" ID="Button3" runat="server" Text="发票凭证" OnClick="Fppz_Click"></asp:Button></td>
                    <td></td>
                </tr>

                <tr>
                    <td>
                        <br />
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>


                <tr>
                    <td></td>
                    <td>
                        <asp:Button CssClass="btn btn-primary active" ID="Button6" runat="server" Text="领用申请" OnClick="Lysqs_Click"></asp:Button></td>
                    <td>
                        <asp:Button CssClass="btn btn-primary active" ID="Button4" runat="server" Text="报废申请" OnClick="Bfsqs_Click"></asp:Button></td>
                    <td>
                        <asp:Button CssClass="btn btn-primary active" ID="Button8" runat="server" Text="报废图" OnClick="Bft_Click"></asp:Button></td>
                    <td>
                        <asp:Button CssClass="btn btn-primary active" ID="Button9" runat="server" Text="历史追溯" OnClick="Lszs_Click"></asp:Button></td>
                    <td></td>
                </tr>
            </table>
        </div>

        <asp:Label ID="zcbmfull" runat="server" Text="" Visible="false"></asp:Label>

    </form>

</body>
</html>
