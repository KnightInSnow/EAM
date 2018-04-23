<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zczjgh_add.aspx.cs" Inherits="FCSystem.OA.wpth_new.zczjgh_add" %>

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

    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("ghbt");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script>
</head>

<body class="main" method="post">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed">

                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">�黹�Ǽ�</td>
                    <td class="td_oa" style="width: 20%; height: 25px"><span style="color:red;">*Ϊ������Ϣ</span></td>
                </tr>
            </table>
        </div>

        <div class="PopBodyInputs">
            <table style="table-layout: fixed">
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
                        <asp:TextBox ID="ghbt" runat="server" CssClass="form-control"></asp:TextBox>
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
                    <td>���벿�ţ�<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="ddlbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlbm_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="ddlbm"
                            ErrorMessage="��ѡ�����벿��">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>������Ա��<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="ddlry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlry_SelectedIndexChanged"></asp:DropDownList></td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="ddlry"
                            ErrorMessage="��ѡ��������Ա">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>ͼƬ�ϴ���</td>
                    <td colspan="4">
                        <asp:FileUpload ID="UploadPic" runat="server" />
                    </td>
                    <td>
                        <asp:Button ID="btn_upload" runat="server" Text="�ϴ�" Width="52px" OnClick="btn_upload_Click" CausesValidation="False" CssClass="btn btn-primary active"/></td>
                </tr>

                <tr>
                    <td>�黹˵����</td>
                    <td colspan="4">
                        <asp:TextBox ID="ghsm" runat="server" CssClass="form-control" Rows="3" TextMode="multiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>

        <div class="PopBodyGrid">
            <asp:Panel CssClass="sPopPanel fPopPanel" ID="Panel1" runat="server" ScrollBars="Auto">
                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False"
                    DataKeyNames="lymx_tid"
                    EmptyDataText="��ʱû���ʲ���Ϣ">
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
                        <asp:BoundField DataField="lymx_tid" HeaderText="������ϸ����">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <ItemStyle HorizontalAlign="Center" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckmc" HeaderText="���Ųֿ�">
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
                        <asp:BoundField DataField="zcsm" HeaderText="�ʲ�˵��">
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
        </div>

        <div class="PopBodyInputs">
            <table style="table-layout: fixed">
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
                    <td></td>
                    <td colspan="2" style="text-align: center">
                        <asp:Button ID="OK_gh" runat="server" Text="ȷ��" OnClick="OK_gh_Click" CssClass="btn btn-primary active"></asp:Button>
                        <asp:Button ID="Button3" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false" AccessKey="r" CssClass="btn btn-primary active"/>
                        <asp:ValidationSummary
                            ID="ValidationSummary1"
                            runat="server"
                            EnableClientScript="true"
                            ShowMessageBox="true"
                            ShowSummary="false"></asp:ValidationSummary>
                    </td>
                    <td></td>
                </tr>
            </table>

        </div>

        <asp:Label ID="lblmaxthid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblmaxindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffckid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblyhtid" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
