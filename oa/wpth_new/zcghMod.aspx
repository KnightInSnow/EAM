<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcghMod.aspx.cs" Inherits="FCSystem.OA.wpth_new.zcghMod" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�黹�Ǽ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
</head>
<body class="main" method="post">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed">
                <tr>
                    <td class="td_oa" style="width: 60%; height: 25px">�黹�Ǽ�</td>
                    <td class="td_oa" style="width: 20%">&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:LinkButton ID="lbtnPrnDoc" runat="server" Font-Bold="True"  Visible="false" OnClick="lbtnPrnDoc_Click">��ӡ�黹��</asp:LinkButton></td>
                    <td class="td_oa" style="width: 20%; height: 25px"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
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
                    <td>�黹���⣺</td>
                    <td colspan="4">
                        <asp:TextBox ID="ghbt" runat="server" Enabled="False" CssClass="form-control"></asp:TextBox>

                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="ghbt"
                            ErrorMessage="������黹����">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>���벿�ţ�</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_sqbm" Enabled="false" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>������Ա��</td>
                    <td colspan="4">
                        <asp:TextBox ID="tbx_sqry" Enabled="false" runat="server" CssClass="form-control"></asp:TextBox>
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
                        <td>
                            <asp:HyperLink ID="cktp" runat="server"></asp:HyperLink>
                        </td>
                    </tr>
                </asp:Panel>

                <tr>
                    <td>�黹˵����</td>
                    <td colspan="4">
                        <asp:TextBox ID="ghsm" runat="server" CssClass="form-control" Rows="3" TextMode="multiLine" Enabled="False"></asp:TextBox>
                    </td>
                </tr>
            </table>

            </div>

        <div class="PopBodyGrid">
            <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="lymx_tid"
                    EmptyDataText="��ʱû����Ʒ��Ϣ"
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
                        <asp:BoundField DataField="wpmc" HeaderText="�ʲ�����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="���õ���">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="Center" />
                            <ItemTemplate>
                                <asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("lydh") %>'></asp:Label>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckmc" HeaderText="�����ֿ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_zydm" HeaderText="ʹ���˴���">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>
            </asp:Panel>

            <table>
                <tr>
                    <td style="text-align: center">
                        <asp:Button ID="btnQr" runat="server" Text="����" Visible="false" CssClass="mybutton" OnClick="btnQr_Click" />
                    </td>
                </tr>
            </table>


            <table style="table-layout: fixed">
                <tr>
                    <td>
                        <asp:ValidationSummary
                            ID="ValidationSummary1"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                    </td>
                </tr>
            </table>
        </div>


        <asp:Label ID="lblghid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffckid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblghdh" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblghzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblsqrytid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblshcktid" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
