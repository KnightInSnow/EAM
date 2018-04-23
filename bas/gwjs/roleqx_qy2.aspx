<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="roleqx_qy2.aspx.cs" Inherits="FCSystem.BAS.gwjs.roleqx_qy2" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>��ҵ��ɫȨ��</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">
        <div class="PageHead">
            <div style="margin-top:60px;color:#70708f;">
                ģ��Ȩ��[ְԱ]
            </div>
        </div>

        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td colspan="3" align="left">���á�<asp:Label ID="LabelRole" runat="server" />��ģ��Ȩ��&nbsp;&nbsp;&nbsp;·����<a href="roleqx_qy.aspx?id=2">��ʼ</a>>
                                            <asp:Label ID="Lbl_Parentmodel" runat="server" />
                            </td>
                            <td></td>
                            <td></td>
                            <td align="right">
                                <asp:Button ID="btnBack" runat="server" Text="ȷ������" OnClick="btnBack_Click" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-AutoHeight">

                <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                    <asp:DataGrid ID="dg" runat="server" CssClass="GridViewStyle"
                        AutoGenerateColumns="False"
                        OnItemDataBound="dg_ItemDataBound" BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px">
                        <Columns>
                            <asp:BoundColumn DataField="modu_id" HeaderText="ģ�����">
                                <HeaderStyle HorizontalAlign="center" Font-Bold="true" />
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="ģ������">
                                <ItemStyle HorizontalAlign="Center" />
                                <ItemTemplate>
                                    <a href="roleqx_qy2.aspx?upid=<%# Eval("modu_id") %>&roleid=<%# ViewState["roleid"] %>&rolename=<%# ViewState["rolename"] %>" target="mainframe"><font color="#3366FF"><asp:Label ID="Label1" runat="server" Text='<%# DataBinder.Eval(Container, "DataItem.modu_mc") %>'></asp:Label></font></a>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="center" Font-Bold="true" />
                            </asp:TemplateColumn>
                            <asp:BoundColumn DataField="modu_bz" HeaderText="ģ��˵��">
                                <HeaderStyle HorizontalAlign="center" Font-Bold="true" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:BoundColumn>
                            <asp:TemplateColumn HeaderText="Ȩ������">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:CheckBox ID="CkboxRole" runat="server" AutoPostBack="True" OnCheckedChanged="CkboxRole_CheckedChanged" />
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="center" Font-Bold="true" />
                            </asp:TemplateColumn>
                        </Columns>
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <AlternatingItemStyle CssClass="GridViewAlternatingRowStyle" />
                        <ItemStyle CssClass="GridViewRowStyle" />
                    </asp:DataGrid>
                </asp:Panel>
            </div>
        </div>

        <div class="PageFoot"></div>
    </form>
</body>
</html>
