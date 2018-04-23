<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wphb_sample.aspx.cs" Inherits="FCSystem.OA.wpgl.wphb_sample" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>资产合并</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript">
        //function SetFocus() {
        //    var obj = document.getElementById("wpmc");  //初始化设置光标焦点
        //    if (obj.value == "") {
        //        obj.focus();
        //    }
        //    else
        //        obj.select();
        //}
    </script>
</head>
<body class="main" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">资产合并</td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table id="Table1" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">
                            <tbody>

                                <tr>
                                    <td width="3%"></td>

                                    <td align="right" width="20%">需要合并资产编码：</td>
                                    <td align="center" width="10%">
                                        <asp:TextBox ID="hbszcbm" runat="server" AutoPostBack="true" OnTextChanged="QueryContents_changed"></asp:TextBox>
                                    </td>
                                    <td align="right" width="8%"></td>

                                    <td align="left" width="15%">
                                        <asp:DropDownList ID="query_s" runat="server" Width="95%">
                                            <asp:ListItem Value="i.ui_id" Selected="True">使用人代码</asp:ListItem>
                                            <asp:ListItem Value="i.ui_desc">使用人姓名</asp:ListItem>
                                            <asp:ListItem Value="e.wpmc">资产名称</asp:ListItem>
                                            <asp:ListItem Value="e.wptxm">条形码</asp:ListItem>
                                            <asp:ListItem Value="f.mc">资产品牌</asp:ListItem>
                                            <asp:ListItem Value="e.wpxh">资产型号</asp:ListItem>

                                        </asp:DropDownList>
                                    </td>
                                    <td align="left" width="15%">
                                        <asp:TextBox ID="query_content_s" runat="server" AutoPostBack="true" OnTextChanged="Query_changed"></asp:TextBox>
                                    </td>
                                    <td width="10%"></td>
                                    <td align="right" width="10%">
                                        <asp:Button cssclass="mybutton" ID="QueryBtn_s" runat="server" Text="查询" OnClick="Query_Click_s" CausesValidation="False" AccessKey="f" Width="100%" />
                                    </td>

                                </tr>
                            </tbody>
                        </table>


                        <table id="Table2" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">

                            <tr>
                                <td>
                                    <asp:GridView ID="GridView2" runat="server"
                                        OnRowDataBound="OnRow_Bound"
                                        AutoGenerateColumns="False"
                                        DataKeyNames="zcbmfull_s"
                                        EmptyDataText="暂时没有资产信息"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
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
                                                    <asp:CheckBox ID="del_s" runat="server" CssClass="mybox" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="资产编码">
                                                <HeaderStyle ForeColor="Black" Width="65" />
                                                <ItemTemplate>
                                                    <font color="black"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("zcbmfull_s") %>'></asp:Label></font></a>                       
                                                </ItemTemplate>
                                                <ControlStyle CssClass="navigate" />
                                                <ItemStyle HorizontalAlign="center" />
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="wpmc_s" HeaderText="资产名称">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wppp_s" HeaderText="资产品牌">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpxh_s" HeaderText="资产型号">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpgg_s" HeaderText="资产规格">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <%--<asp:TemplateField HeaderText="操作">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_ghview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("yngh") %>'></asp:Label></font></a>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_bfview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelbf" runat="server" Text='<%# Bind("ynbf") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>--%>
                                            <asp:BoundField DataField="ui_desc_s" HeaderText="使用人">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ui_id_s" HeaderText="使用人代码">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="sybm_s" HeaderText="使用部门">
                                                <HeaderStyle ForeColor="black" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="zfzt_s" HeaderText="主附状态">
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
                                <td style="height: 22px">
                                    <webdiyer:AspNetPager ID="AspNetPager2" runat="server"
                                        OnPageChanged="AspNetPager2_PageChanged"
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
                                        PageSize="4"
                                        InputBoxClass="AspNetPagerInputBox"
                                        SubmitButtonClass=“AspNetPagerButton”
                                        SubmitButtonText="Go">
                                    </webdiyer:AspNetPager>
                                </td>
                            </tr>
                        </table>
                        <asp:Panel ID="Panel1" runat="server" Width="100%">
                            <table>


                                <tr>
                                    <td width="3%"></td>
                                    <td>
                                        <asp:Label ID="a02" Text="合并说明：" runat="server"></asp:Label>
                                    </td>

                                    <td colspan="3" width="40%">
                                        <asp:TextBox ID="hbbz" runat="server" Width="99%" Rows="3" TextMode="multiLine"></asp:TextBox>
                                    </td>



                                    <td width="20%"></td>

                                </tr>

                                <tr align="right">
                                    <td style="height: 25"></td>
                                    <td style="height: 25"></td>
                                    <td style="height: 25"></td>
                                    <td style="height: 25"></td>
                                    <td style="height: 25"></td>

                                    <td style="height: 25" align="right">
                                        <asp:Button CssClass="mybutton" ID="SaveBtn_cf" runat="server" Text="确认合并" OnClick="HB_Click"></asp:Button>
                                    </td>
                                </tr>





                            </table>
                        </asp:Panel>
                        <table style="table-layout: fixed">
                            <tbody>
                                <tr>

                                    <td colspan="2">资产已经合并资产列表：
                                    </td>

                                </tr>
                                <tr>

                                    <td colspan="2">

                                        <table style="table-layout:fixed;">
                                            <tr>
                                                <td style="height: 10"></td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GridView1" runat="server"
                                                        OnRowDataBound="OnRow_Bound"
                                                        AutoGenerateColumns="False"
                                                        CellSpacing="1"
                                                        DataKeyNames="zcbmfull_s"
                                                        BorderStyle="None"
                                                        BorderWidth="0px"
                                                        BackColor="Silver"
                                                        EmptyDataText="暂时没有资产信息"
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
                                                            <asp:TemplateField HeaderText="主资产编码">
                                                                <HeaderStyle ForeColor="Black" Width="65" />
                                                                <ItemTemplate>
                                                                    <font color="black"><asp:Label ID="Label_z" runat="server" Text='<%# Bind("zzcbm_s") %>'></asp:Label></font></a>                       
                                                                </ItemTemplate>
                                                                <ControlStyle CssClass="navigate" />
                                                                <ItemStyle HorizontalAlign="center" />
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderText="附属资产编码">
                                                                <HeaderStyle ForeColor="Black" Width="65" />
                                                                <ItemTemplate>
                                                                    <font color="black"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("zcbmfull_s") %>'></asp:Label></font></a>                       
                                                                </ItemTemplate>
                                                                <ControlStyle CssClass="navigate" />
                                                                <ItemStyle HorizontalAlign="center" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="wpmc_s" HeaderText="资产名称">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="wppp_s" HeaderText="资产品牌">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="wpxh_s" HeaderText="资产型号">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="wpgg_s" HeaderText="资产规格">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <%--<asp:TemplateField HeaderText="操作">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_ghview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("yngh") %>'></asp:Label></font></a>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_bfview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelbf" runat="server" Text='<%# Bind("ynbf") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>--%>
                                                            <asp:BoundField DataField="ui_desc_s" HeaderText="使用人">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="ui_ssbm_s" HeaderText="使用部门">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="zfzt_s" HeaderText="主附状态">
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
                                                <td colspan="2" style="height: 22px">
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
                                                        PageSize="4"
                                                        InputBoxClass="AspNetPagerInputBox"
                                                        SubmitButtonClass=“AspNetPagerButton”
                                                        SubmitButtonText="Go">
                                                    </webdiyer:AspNetPager>
                                                </td>
                                            </tr>
                                        </table>

                                        <table id="Table3" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                                            <tr>
                                                <td width="3%"></td>
                                                <td>
                                                    <asp:Label ID="Label2" Text="撤销说明：" runat="server" Visible="false"></asp:Label>
                                                </td>

                                                <td colspan="3" width="40%">
                                                    <asp:TextBox ID="cxbz" runat="server" Width="99%" Rows="3" Visible="false" TextMode="multiLine"></asp:TextBox>
                                                </td>



                                                <td width="20%"></td>

                                            </tr>

                                            <tr align="right">
                                                <td style="height: 25"></td>
                                                <td style="height: 25"></td>
                                                <td style="height: 25"></td>
                                                <td style="height: 25"></td>
                                                <td style="height: 25"></td>

                                                <td style="height: 25" align="right">
                                                    <asp:Button CssClass="mybutton" ID="DelBtn_cf" runat="server" Text="撤销合并" Visible="false" OnClick="Del_Click" CausesValidation="False" />
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


        <asp:Label ID="yzcbmfull" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="cfruiid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="ssbmid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="bmmax" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="lyid" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="pagestyle" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="hblx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="szcbmfull" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="query" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>

