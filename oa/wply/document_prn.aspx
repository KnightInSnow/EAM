<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="document_prn.aspx.cs" Inherits="FCSystem.OA.wply.document_prn" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>清单打印</title>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="PopHead">
            <div style="height: 24px">
                &nbsp;
            <input type="button" name="print" class="mybutton" value="打印" onclick="preview()" accesskey="p">
                <input type="button" id="CloseBtn" class="mybutton" value="退出" onclick="javascript: window.close()" accesskey="q" />
            </div>
        </div>

        <!--startprint-->
        <table id="table1" cellspacing="0" cellpadding="0" style="background-color: #ffffff; width: 720px; height: 100%" border="0">
            <tr>
                <td>
                    <h3>
                        <br />
                        <asp:Label ID="lbldocname" runat="server" ForeColor="#000000"></asp:Label>[<asp:Label ID="lbldh" runat="server" ForeColor="#FF0000"></asp:Label>]
                        <hr align="center" width="100%" size="1" noshade />
                    </h3>
                    <asp:Panel ID="panel1" runat="server">
                        <table id="search" cellspacing="0" cellpadding="0" width="100%" border="0" runat="server">
                            <tbody>
                                <tr>
                                    <td colspan="8">
                                        <table style="background-color: #cccccc" cellspacing="0" cellpadding="0" width="100%" border="1">
                                            <tr style="background-color: #ffffff">
                                                <td style="height: 28px; width: 20%" align="center"><strong>仓库名称：</strong></td>
                                                <td align="left" colspan="3">
                                                    <asp:Label runat="server" ID="lblckmc" Font-Underline="true" /></td>
                                            </tr>
                                            <tr style="background-color: #ffffff">
                                                <td style="height: 28px; width: 20%" align="center"><strong>备注信息：</strong></td>
                                                <td colspan="3" align="left">
                                                    <asp:Label runat="server" ID="lblbz" Font-Underline="true" Text="" /></td>
                                            </tr>
                                            <tr style="background-color: #ffffff">
                                                <td style="height: 28px; width: 20%" align="center"><strong>申请人：</strong> </td>
                                                <td align="left">
                                                    <asp:Label runat="server" ID="lblsqr" Font-Underline="true" /></td>
                                                <td style="height: 28px; width: 20%" align="center"><strong>申请时间：</strong> </td>
                                                <td align="left">
                                                    <asp:Label runat="server" ID="lblsqsj" Font-Underline="true" /></td>
                                            </tr>
                                            <tr align="center" style="background-color: #ffffff">
                                                <td colspan="4">
                                                    <asp:GridView ID="GridView1" runat="server"
                                                        OnRowDataBound="OnRow_Bound"
                                                        AutoGenerateColumns="False"
                                                        CellSpacing="0"
                                                        DataKeyNames="tid"
                                                        BorderStyle="None"
                                                        BorderWidth="1px"
                                                        BackColor="#999999"
                                                        EmptyDataText="暂时没有登记任何信息"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="序号">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle Width="30px" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="zcbm" HeaderText="资产编码">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="spmc" HeaderText="商品名称">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="fl_mc" HeaderText="分类名称">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="spxh" HeaderText="商品型号">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="申请数量">
                                                                <ItemStyle HorizontalAlign="center" />
                                                                <HeaderStyle ForeColor="Black" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblsqsl" runat="server" Text='<%# Bind("sqsl") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="jldwmc" HeaderText="计量单位">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <HeaderStyle BackColor="#CCCCCC" Height="22px" />
                                                        <RowStyle CssClass="GridViewRowStyle" />
                                                        <FooterStyle CssClass="GridViewFooterStyle" />
                                                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                            <tr align="center" style="background-color: #ffffff">
                                                <td colspan="4">
                                                    <asp:GridView ID="GridView2" runat="server"
                                                        OnRowDataBound="OnRow_Bound"
                                                        AutoGenerateColumns="False"
                                                        CellSpacing="0"
                                                        DataKeyNames="tid"
                                                        BorderStyle="None"
                                                        BorderWidth="1px"
                                                        BackColor="#999999"
                                                        EmptyDataText="暂时没有登记任何信息"
                                                        Width="100%">
                                                        <Columns>
                                                            <asp:TemplateField HeaderText="序号">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                                </ItemTemplate>
                                                                <ItemStyle HorizontalAlign="Center" />
                                                                <HeaderStyle Width="30px" HorizontalAlign="Center" />
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="spmc" HeaderText="商品名称">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="fl_mc" HeaderText="分类名称">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:BoundField DataField="spxh" HeaderText="商品型号">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                            <asp:TemplateField HeaderText="申请数量">
                                                                <ItemStyle HorizontalAlign="center" />
                                                                <HeaderStyle ForeColor="Black" />
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblsqsl" runat="server" Text='<%# Bind("sqsl") %>'></asp:Label>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:BoundField DataField="jldwmc" HeaderText="计量单位">
                                                                <HeaderStyle ForeColor="black" />
                                                                <ItemStyle HorizontalAlign="Center" />
                                                            </asp:BoundField>
                                                        </Columns>
                                                        <HeaderStyle BackColor="#CCCCCC" Height="22px" />
                                                        <RowStyle CssClass="GridViewRowStyle" />
                                                        <FooterStyle CssClass="GridViewFooterStyle" />
                                                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                                    </asp:GridView>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="background-color: #ffffff"></td>
                                </tr>
                                <tr style="height: 35px">
                                    <td width="8%"><strong>申请人:</strong></td>
                                    <td width="13%"></td>
                                    <td width="15%"><strong>申请部门领导:</strong></td>
                                    <td width="11%"></td>
                                    <td width="15%"><strong>发放部门领导:</strong></td>
                                    <td width="11%"></td>
                                    <td width="12%"><strong>发放人:</strong></td>
                                    <td width="15%"></td>
                                </tr>
                            </tbody>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <!--endprint-->

        <asp:Label ID="lbldjid" runat="server" Visible="False"></asp:Label><asp:Label ID="lbldjbj" runat="server" Text="Label" Visible="false"></asp:Label>
        <asp:Label ID="lblcklx" runat="server" Visible="False"></asp:Label>

    </form>
</body>
</html>

