<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcbfMod.aspx.cs" Inherits="FCSystem.OA.wpth_new.zcbfMod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>���ϵǼ�</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed">
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px"></td>
                    <td class="td_oa" style="width: 20%">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:LinkButton ID="lbtnPrnDoc" runat="server" Visible="false">��ӡ���ϵ�</asp:LinkButton></td>
                </tr>
            </table>
        </div>


        <div class="PopBodyInputs">
            <table style="table-layout: fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>���ϱ��⣺</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_bfbt" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>���벿�ţ�</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbxSqbm" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>������Ա��</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbxSqry" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <asp:Panel ID="plShowTP" runat="server" Visible="false">
                    <tr>
                        <td>ͼƬ�ϴ���</td>
                        <td colspan="4">
                            <asp:FileUpload ID="UploadPic" runat="server" />
                        </td>
                        <td>
                            <asp:Button ID="btn_upload" runat="server" Text="�ϴ�" OnClick="btn_upload_Click" CausesValidation="False" CssClass="btn btn-primary active"/></td>
                    </tr>
                    <tr>
                        <td>�鿴ͼƬ��</td>
                        <td colspan="4">
                            <asp:HyperLink ID="cktp" runat="server"></asp:HyperLink>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td>����˵����</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_bfsm" runat="server" CssClass="form-control" Rows="3" TextMode="multiLine" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>


        <div class="PopBodyGrid">
            <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">

                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="rkmxid"
                    EmptyDataText="��ʱû�еǼ��κ���Ϣ"
                    Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
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
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckmc" HeaderText="�����ֿ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gysmc" HeaderText="��Ʒ��Ӧ��">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="��Ʒ����">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("wpdj") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
                <table>
                    <tr>
                        <td style="text-align: center">
                            <asp:Button ID="btnQr" CssClass="mybutton" runat="server" Text="����" Visible="false" OnClick="btnQr_Click" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </div>


        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <!--����label-->
        <asp:Label ID="lblBfzt" runat="server" Visible="False" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="lblBfid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblYngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblSqrytid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblShcktid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblynzjbf" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
