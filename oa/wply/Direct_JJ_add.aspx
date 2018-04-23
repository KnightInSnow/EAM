<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="Direct_JJ_add.aspx.cs" Inherits="FCSystem.OA.wply.Direct_JJ_add" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�����Ǽ�</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("jjbt");  //��ʼ�����ù�꽹��
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
                    <td style="width: 80%; height: 25px">�����Ǽ�</td>
                    <td style="width: 20%">
                        <span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ
                    </td>
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
                    <td>���ӱ��⣺</td>
                    <td colspan="4">
                        <asp:TextBox ID="jjbt" runat="server" CssClass="form-control"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="jjbt"
                            ErrorMessage="�����뽻�ӱ���">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>���Ӳ��ţ�<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="jjbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="jjbm_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator2"
                            runat="server"
                            ControlToValidate="jjbm"
                            ErrorMessage="��ѡ�񽻽Ӳ���">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>������Ա��<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="jjry" runat="server" AutoPostBack="true" OnSelectedIndexChanged="jjry_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator3"
                            runat="server"
                            ControlToValidate="jjry"
                            ErrorMessage="��ѡ�񽻽���Ա">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>ͼƬ�ϴ���</td>
                    <td colspan="4">
                        <asp:FileUpload ID="UploadPic" runat="server"/>
                    </td>
                    <td>
                        <asp:Button ID="btn_upload" runat="server" Text="�ϴ�" OnClick="btn_upload_Click" CausesValidation="False" CssClass="btn btn-primary active"/></td>
                </tr>
                <tr>
                    <td>����˵����</td>
                    <td colspan="4">
                        <asp:TextBox ID="jjsm" runat="server" Rows="3" TextMode="multiLine" CssClass="form-control"></asp:TextBox>
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
                    EmptyDataText="�����ʲ���Ϣ">
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
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_zydm" HeaderText="ʹ���˴���">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
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
                        <div class="Pop-EmptyLine-Normal"></div>
                    </td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>���ղ��ţ�<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="jsbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="jsbm_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator4"
                            runat="server"
                            ControlToValidate="jsbm"
                            ErrorMessage="��ѡ����ղ���">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td>������Ա��<span style="color:red;">*</span></td>
                    <td colspan="4">
                        <asp:DropDownList CssClass="form-control" ID="jsry" runat="server" AutoPostBack="True" OnSelectedIndexChanged="jsry_SelectedIndexChanged">
                            <asp:ListItem Text="" Value=""></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator
                            ID="RequiredFieldValidator8"
                            runat="server"
                            ControlToValidate="jsry"
                            ErrorMessage="��ѡ�������Ա">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>
                        <div class="Pop-EmptyLine-Normal"></div>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td></td>
                    <td colspan="2" align="center">
                        <asp:Button ID="OK_jj" runat="server" Text="ȷ��" OnClick="JJ_Click" CssClass="btn btn-primary active"></asp:Button>
                        <asp:Button ID="Button3" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false" AccessKey="r" CssClass="btn btn-primary active"/>
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


        <asp:Label ID="lblmaxjjid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblmaxjjindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbljjyear" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblyhtid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblbmtid" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
