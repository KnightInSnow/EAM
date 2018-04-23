<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zcykqr_mod.aspx.cs" Inherits="FCSystem.OA.wpgl.zcykqr_mod" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ƿ�ȷ��</title>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function loadpage() {
            var chkEvery = document.getElementsByTagName("input");
            for (var i = 0; i < chkEvery.length; i++) {
                if (chkEvery[i].type == 'checkbox') {
                    if (chkEvery[i].id.indexOf('GridView1') > -1) {
                        chkEvery[i].checked = true;
                    }
                }
            }
        }
    </script>
</head>
<body class="main" onload="loadpage();">
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td width="80%">
                        <asp:Button cssclass="mybutton" ID="SpBtn" runat="server" Text="����ͨ��" OnClick="Sp_Click" Visible="false" /><asp:Button cssclass="mybutton" ID="ThBtn" runat="server" Text="�����˻�" OnClick="Th_Click" Visible="false" /><input type="button" name="BackBtn" value="�ر�" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /></td>
                    <td class="td_oa">&nbsp;&nbsp;&nbsp;<asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:LinkButton ID="PrnSelectLbl" runat="server" Font-Bold="True" Font-Names="����" Font-Size="X-Small" Font-Underline="True" ForeColor="White" Visible="false" OnClick="PrnSelectLbl_Click">��ӡ�ʲ���ǩ</asp:LinkButton></td>
                </tr>

                <tr>
                    <td colspan="2" valign="top">
                        <center>
                    <table style="table-layout:fixed;">
                        <tr>
                            <td colspan="2" align="center" style="height:25px"><asp:Label ID="ykdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                            </td>
                        </tr>
				        <tr>
                            <td style="width:15%">���ղֿ⣺</td>
                            <td><asp:TextBox ID="jsck" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                            </td>
                        </tr>

                    <%--    <asp:Panel ID="spyijpanel" runat="server" Visible="false">
                            <tr>
                             <td>���������</td>
                             <td>
                                 <asp:DropDownList ID="spyjxz" runat="server" Width="500px" >
                                 </asp:DropDownList>
                             </td>
                         </tr>
                        </asp:Panel>--%>

                        <asp:panel id="spyjpanel" runat="server" Visible="false">
                        <tr>
                            <td style="width:15%">���׷����</td>
                            <td><asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500px" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox>&nbsp;<%--<img src="/images/fd.gif" onclick="openA('/choose/spyjview.aspx?page=xpsp')" alt="ѡ��ϵͳ�ṩ���������" />--%></td>
                        </tr>
                        </asp:panel>

                        <tr><td colspan="2" style="height:5px"></td></tr>
			        </table>

                    <table style="table-layout:fixed;">
                        <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                OnRowDataBound="OnRow_Bound"  
                                AutoGenerateColumns="False" 
                                DataKeyNames="ykid"
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
                                        <HeaderStyle Width="30px" />
                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="Center" />
                                        <HeaderTemplate>
                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ���߲�ѡ" style="width: 16px ; height: 16px" />
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:BoundField DataField="ykid" HeaderText="����">
                                    <HeaderStyle CssClass ="hidden"/>
                                    <ItemStyle CssClass ="hidden"/>
                                    <FooterStyle CssClass ="hidden" />
                                </asp:BoundField>
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
                                                    <asp:BoundField DataField="ckmc" HeaderText="�����ֿ�">
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
                                                    <asp:BoundField DataField="ui_zydm" HeaderText="ʹ���˴���">
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
			        </table>
			</center>
                    </td>
                </tr>
            </tbody>
        </table>

        <asp:ValidationSummary
            ID="ValidationSummary2"
            runat="server"
            EnableClientScript="true"
            ShowMessageBox="true"
            ShowSummary="false"></asp:ValidationSummary>
        <%--        <asp:RequiredFieldValidator
            ID="RequiredFieldValidator2"
            runat="server"
            ControlToValidate="spyjxz"
            ErrorMessage="����д�������">&nbsp;
        </asp:RequiredFieldValidator>--%>

        <!--����label-->
        <asp:Label ID="ykzt" runat="server" Visible="False" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="ykidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="kcsl" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="yngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ykdhlab" runat="server" Visible="false" />
        <asp:Label ID="jscktid" runat="server" Visible="false" />
    </form>
</body>
</html>

