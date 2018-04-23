<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpcf_yuan_sample.aspx.cs" Inherits="FCSystem.OA.wpgl.wpcf_yuan_sample" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>资产拆分</title>
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
                    <td class="td_oa" style="width: 80%; height: 25px">资产拆分</td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
                <tr>
                    <td>
                        <br />
                           <asp:Panel ID="Panel1" runat="server" Width="100%">
            <table style="table-layout: fixed">

                <tr>
                    <td>现拆分资产零件说明：
                    </td>
                    <td width="20%"></td>

                    <td></td>
                    <td width="20%"></td>
                </tr>
                <tr>
                    <td width="20%"></td>
                    <td>
                        <asp:Label ID="a02" Text="拆分说明：" runat="server"></asp:Label>
                    </td>

                    <td colspan="3" width="20%">
                        <asp:TextBox ID="cfsm" runat="server" Width="99%" Rows="3" TextMode="multiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td width="20%"></td>
                    <td>
                        <asp:Label ID="a03" Text="拆分新资产名称：" runat="server"></asp:Label>
                    </td>
                    <td width="20%">
                        <asp:TextBox ID="xzcmc" runat="server" Width="99%"></asp:TextBox>
                    </td>

                </tr>

                <tr align="right">
                    <td style="height: 25"></td>
                    <td style="height: 25"></td>
                    <td style="height: 25"></td>
                    <td style="height: 25"></td>
                    <td style="height: 25"></td>

                    <td style="height: 25" align="right">
                        <asp:Button CssClass="mybutton" ID="SaveBtn_cf" runat="server" Text="确认拆分" OnClick="Add_Click"></asp:Button>
                    </td>
                </tr>





            </table>
        </asp:Panel>
                        <table style="table-layout: fixed">
                            <tbody>
                                <tr>

                                    <td>资产已经拆分资产列表：
                                    </td>


                                </tr>
                                <tr>

                                    <td align="right">
                                        <asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:LinkButton ID="PrnSelectLbl" runat="server" Visible="false" Font-Bold="True" Font-Names="仿宋" Font-Size="X-Small" Font-Underline="True" ForeColor="#4579B5" OnClick="PrnSelectLbl_Click">打印资产标签</asp:LinkButton>

                                    </td>


                                </tr>
                                <tr>

                                    <td colspan="2">

                                        <table style="table-layout:fixed;">
                                            <tr>
                                                <td>
                                                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                        OnRowDataBound="OnRow_Bound"
                                                        AutoGenerateColumns="False" 
                                                        DataKeyNames="zcbmfull_z" 
                                                        EmptyDataText="暂时没有拆分资产信息"
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
                                                            <%-- <asp:BoundField DataField="zcbmfull_z" HeaderText="物品编码">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>   --%>
                                                            <asp:BoundField DataField="zccf_gx" HeaderText="资产拆分关系">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="资产编码">
                                                                <HeaderStyle ForeColor="Black" />
                                                                <ItemTemplate>
                                                                    <font color="black"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("zcbmfull_z") %>'></asp:Label></font></a>                       
                                                                </ItemTemplate>
                                                                <ControlStyle CssClass="navigate" />
                                                                <ItemStyle HorizontalAlign="center" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="wpmc_z" HeaderText="资产名称">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="zcsm" HeaderText="资产说明">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="cfsm" HeaderText="拆分说明">
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
                                                            <asp:BoundField DataField="ui_desc_z" HeaderText="使用人名称">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="bm_mc" HeaderText="使用人部门">
                                                                <HeaderStyle ForeColor="black" />
                                                            </asp:BoundField>
                                                            <%--  <asp:BoundField DataField="zfzt_z" HeaderText="主附状态">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>     --%>
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
                                        <table style="table-layout:fixed;">
                                            <tr>
                                                <td width="20%"></td>
                                                <td>
                                                    <asp:Label ID="cxsmlb" Text="撤销拆分说明：" runat="server" Visible="false"></asp:Label>
                                                </td>

                                                <td colspan="3">
                                                    <asp:TextBox ID="cxsm" runat="server" Width="99%" Rows="3" TextMode="multiLine" Visible="false"></asp:TextBox>
                                                </td>
                                                <td width="20%"></td>

                                            </tr>
                                        </table>
                                        <table style="table-layout:fixed;">
                                            <tr>
                                                <td width="20%"></td>
                                                <td width="20%"></td>
                                                <td width="20%"></td>

                                                <td style="height: 25" align="right" width="20%">
                                                    <asp:Button CssClass="mybutton" ID="DelBtn_cf" runat="server" Text="撤销拆分" CausesValidation="False" Visible="false" />

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
          <asp:Label ID="sscktid" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>

