<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcyk_sq.aspx.cs" Inherits="FCSystem.OA.wpgl.zcyk_sq" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <title>�ʲ��ƿ�����</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("ykbt");  //��ʼ�����ù�꽹��
            if (obj.value == "") {
                obj.focus();
            }
            else
                obj.select();
        }
    </script> 
</head>
<body class="main" onload="SetFocus();" method="post">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td class="td_oa" style="width: 80%; height: 25px">�ʲ��ƿ�</td>
                    <td class="td_oa" style="width: 20%; height: 25px"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
                </tr>
                <tr>
                    <td width="100%" align="center" colspan="2">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            
                            <table style="table-layout:fixed;">
                                <tbody>
                                    <tr>
                                        <td>
                                            <table style="table-layout: fixed;">

                                                <tr>
                                                    <td> �ƿ���⣺</td>
                                                    <td>
                                                        <asp:TextBox ID="ykbt" runat="server" Width="450"></asp:TextBox>
                                                        <asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator1"
                                                            runat="server"
                                                            ControlToValidate="ykbt"
                                                            ErrorMessage="�������ƿ����">&nbsp;
                                                        </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>



                                                <tr>
                                                    <td>&nbsp; �ƿ�˵����</td>
                                                    <td>
                                                        <asp:TextBox ID="yksm" runat="server" Width="450" Rows="3" TextMode="multiLine"></asp:TextBox>
                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <table style="table-layout: fixed">
                            </table>
                            <table>
                                <tr>
                                    <td>&nbsp; �Ƴ��ֿ⣺</td>
                                    <td width="15%">
                                        <asp:DropDownList ID="ycck" runat="server" Width="99%">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                       
                                    </td>
                                    <td width="1%"></td>
                                    <td>&nbsp; �ʲ����ࣺ</td>
                                    <td width="11%">
                                        <asp:DropDownList ID="wpfl" Width="99%" runat="server" AutoPostBack="True" OnSelectedIndexChanged="wpfl_SelectedIndexChanged">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                       
                                    </td>


                                </tr>
                                <tr>
                                    <td>&nbsp; �ʲ����ƣ�</td>
                                    <td width="15%">
                                        <asp:DropDownList ID="wpmc" runat="server" Width="99%" AutoPostBack="True">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                       
                                    </td>
                                    <td width="1%"></td>
                                   

                                    <td align="left" width="6%">

                                        <asp:DropDownList ID="query_c" runat="server" Width="100%">
                                            <asp:ListItem Value="b.zcbmfull" Selected="True">�ʲ�����</asp:ListItem>
                                             <asp:ListItem Value="f.ui_id">ʹ���˴���</asp:ListItem>
                                            <asp:ListItem Value="f.ui_desc">ʹ��������</asp:ListItem>
                                     

                                        </asp:DropDownList>
                                    </td>
                                    <td align="center" width="11%">
                                        <asp:TextBox ID="query_content_c" runat="server" AutoPostBack="true" OnTextChanged="query_content_c_TextChanged"></asp:TextBox>
                                    </td>
                                   

                                </tr>
                                 
                                <tr>
 <td width="5%"></td>
                                    <td ></td>
                                    <td ></td>
                                    <td ></td>
                                    <td align="right" >
                                        <asp:Button cssclass="mybutton" ID="QueryBtn_y" runat="server" Text="��ѯ�ʲ�" OnClick="Query_Click" CausesValidation="False" AccessKey="f" />
                                    </td>
                                </tr>



                            </table>

                            <table style="table-layout: fixed">
                                <tr>
                                    <td style="height: 18px"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull"
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
                                                            <asp:CheckBox ID="CheckEvery" runat="server" CssClass="mybox" />
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
                                                    <asp:BoundField DataField="wpxh" HeaderText="�ʲ��ͺ�">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="zt" HeaderText="�ʲ�״̬">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="ʹ����">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sybm" HeaderText="ʹ���˲���">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>        
                                                      <asp:BoundField DataField="ssckmc" HeaderText="�����ֿ�">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>                                       
                                                    <asp:BoundField DataField="zcsm" HeaderText="�ʲ�˵��">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                </Columns>
                                                <RowStyle CssClass="GridViewRowStyle" />
                                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                            </asp:GridView>
                                        </asp:Panel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                            OnPageChanged="AspNetPager1_PageChanged"
                                            ShowCustomInfoSection="left"
                                            ShowInputBox="Auto"
                                            AlwaysShow="false"
                                            CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="10"
                                            FirstPageText="��ҳ"
                                            LastPageText="ĩҳ"
                                            NextPageText="��ҳ"
                                            PrevPageText="��ҳ"
                                            CustomInfoSectionWidth="250px"
                                            CssClass="page_text"
                                            ShowBoxThreshold="11"
                                            InputBoxClass="AspNetPagerInputBox"
                                            SubmitButtonClass=��AspNetPagerButton��
                                            SubmitButtonText="Go">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 18px">&nbsp;</td>
                                </tr>
                            </table>
                            <table style="table-layout: fixed">

                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td> ���ղ��ţ�</td>
                                    <td>
                                        <asp:DropDownList ID="jsbm" Width="450px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="jsbm_SelectedIndexChanged" Height="16px">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator4"
                                            runat="server"
                                            ControlToValidate="jsbm"
                                            ErrorMessage="��ѡ����ղ���">&nbsp;
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>

                                <tr>
                                    <td> ���ղֿ⣺</td>
                                    <td>
                                        <asp:DropDownList ID="jsck" runat="server" Width="450">
                                            <asp:ListItem Text="" Value=""></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator
                                            ID="RequiredFieldValidator8"
                                            runat="server"
                                            ControlToValidate="jsck"
                                            ErrorMessage="��ѡ����ղֿ�">&nbsp;
                                        </asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button CssClass="mybutton" ID="OK_�ƿ�" runat="server" Text="ȷ���ƿ�" OnClick="OK_yk_Click"></asp:Button><asp:Button ID="Button3" Text="���" OnClick="Clear_Click" runat="Server" CausesValidation="false" CssClass="mybutton" AccessKey="r" />&nbsp;
                                    <asp:ValidationSummary
                                        ID="ValidationSummary1"
                                        runat="server"
                                        EnableClientScript="true"
                                        ShowMessageBox="true"
                                        ShowSummary="false"></asp:ValidationSummary>
                                    </td>
                                </tr>

                            </table>
                        </asp:Panel>
                    </td>
                </tr>

            </tbody>
        </table>
        <asp:Label ID="lblmaxthid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblmaxindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ffckid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="chaxunlx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="QueryContent" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="actionbm" runat="server" Visible="false"></asp:Label>
        <br />
    </form>
</body>
</html>
