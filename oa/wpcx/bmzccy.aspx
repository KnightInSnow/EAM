<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bmzccy.aspx.cs" Inherits="FCSystem.oa.wpcx.bmzccy" %>


<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" rel="stylesheet" type="text/css" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>部门资产查询</title>
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">部门资产查询</div>
        </div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td style="text-align:right;padding-right:10px;">查看部门：</td>
                            <td>
                                <asp:DropDownList ID="cybm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BM_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Value="" Text=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            
                            <td style="text-align:right;padding-right:10px;">人员:</td>
                            <td>
                                <asp:DropDownList ID="ddl_bmry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BMry_SelectedIndexChanged" CssClass="form-control">
                                    <asp:ListItem Text="" Value=""></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>                            
                            <td align="right">
                                <asp:Button ID="CYBtn" runat="server" CssClass="btn btn-primary active" OnClick="CYBtn_Click" Text="查阅" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="rkmxid"
                    EmptyDataText="暂时没有资产信息">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="lymx_tid" HeaderText="领用明细单号">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="资产编码">
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>

                                <a href="#" onclick="javascript:popMiniMod('/oa/wprk/rkshqr_mx_mod.aspx?id=<%# Eval("rkmxid") %>')">
                                    <font color="#3366ff"><asp:Label ID="lblzcbm" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label></font>
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--  <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>--%>
                        <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zczt" HeaderText="资产状态">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="资产型号">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="lysj" HeaderText="领用时间">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="syr" HeaderText="使用人">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_id" HeaderText="使用人代码">
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="sybm" HeaderText="所属部门">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zcly" HeaderText="资产来源">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bzsm" HeaderText="备注说明">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </div>

            <div class="PageBody-Bottom-Pager" style="text-align:right;">
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
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
                    SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged">
                </webdiyer:AspNetPager>
            </div>
            <!--隐藏label-->
            <asp:Label ID="ycxx" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="ID" runat="server" Visible="false"></asp:Label>
            <asp:Label ID="lblCktid" runat="server" Visible="False"></asp:Label>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>
</html>
