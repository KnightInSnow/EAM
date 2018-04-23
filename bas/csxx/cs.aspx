<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cs.aspx.cs" Inherits="FCSystem.BAS.csxx.cs" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>参数选项</title>
</head>
<body class="main">
    <form id="sform1" runat="server">
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">参数选项</div>
        </div>
        <div class="Page-EmptyLine-Large"></div>
        <div class="PageBody">
            <div class="PageBody-Middle-AutoHeight">
                <tr>
                    <td style="height: 40px"><font color="red">提示：部分参数设置后需要重新登录系统方可生效！</font></td>
                    <td align="right"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                            OnRowDataBound="RowDataBound"
                            AutoGenerateColumns="False"
                            DataSourceID="SqlDataSource1" 
                            DataKeyNames="Paramt"
                            EmptyDataText="对不起，检索不出任何记录！">
                            <Columns>
                                <asp:BoundField DataField="Paramt" HeaderText="参数编码" ReadOnly="True" SortExpression="Paramt" Visible="False" />
                                <asp:TemplateField HeaderText="参数名称" SortExpression="P_name" >
                                    <EditItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("P_name") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("P_name") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle Width="180px" />
                                </asp:TemplateField>
                                <asp:BoundField DataField="P_Comm" HeaderText="说明" SortExpression="P_comm" ReadOnly="True"></asp:BoundField>
                                <asp:TemplateField HeaderText="值" SortExpression="P_string">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="value" runat="server" Text='<%# Bind("P_string") %>' CssClass="form-control"></asp:TextBox>
                                    </EditItemTemplate>
                                    <HeaderStyle Width="140px" />
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("P_string") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField ButtonType="Image" CancelImageUrl="~/images/cancel.gif" CancelText="取消修改"
                                    EditImageUrl="~/images/edit.gif" EditText="修改参数" HeaderText="操作" ShowEditButton="True"
                                    UpdateImageUrl="~/images/save2.gif" UpdateText="保存修改">
                                    <HeaderStyle Width="60px" />
                                    <ItemStyle HorizontalAlign="Center" />
                                </asp:CommandField>
                            </Columns>
                            <RowStyle CssClass="GridViewRowStyle" />
                            <HeaderStyle CssClass="GridViewHeaderStyle" />
                            <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                            <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                        </asp:GridView>
                    </td>
                </tr>
            </div>
        </div>
        <div class="PageFoot"></div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EamSqlConnectionString %>"
            SelectCommand="SELECT * FROM csda ORDER BY p_id"
            UpdateCommand="UPDATE [csda] SET [P_string] = @P_string WHERE [Paramt] = @Paramt"
            DeleteCommand="DELETE FROM [csda] WHERE [Paramt] = @Paramt"
            CancelSelectOnNullParameter="false">
            <UpdateParameters>
                <asp:Parameter Name="P_string" />
                <asp:Parameter Name="Paramt" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
