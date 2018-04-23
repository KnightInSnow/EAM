<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rkcx_view.aspx.cs" Inherits="FCSystem.OA.wprk.rkcx_view" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>����ѯ - ��Ʒ��ϸ</title>
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>    

    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript">
        function loadpage() {
            var ckinput = document.getElementsByTagName("input");
            for (var i = 0; i < ckinput.length; i++) {
                if (ckinput[i].type == 'checkbox') {
                    if (ckinput[i].id.indexOf('GridView1') > -1) {
                        ckinput[i].checked = true;
                    }
                }
            }
        }
    </script>
</head>
<body class="main" onload="loadpage();">
    <form id="form1" runat="server">

        <div class="PopHead">
            <table style="table-layout: fixed;">
                <tr>
                    <td>
                        <input type="button" name="BackBtn" value="�ر�" class="btn btn-xs btn-default active" onclick="javascript: window.close()" accesskey="q" />
                        <asp:Image ID="Image3" runat="server" ImageUrl="../../images/print.gif" Visible="false" />
                        <asp:Label ID="PrnLbl" runat="server" Text="��ӡ��ⵥ" Font-Underline="True" Font-Names="����" Font-Size="X-Small" Visible="false"></asp:Label>
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="False" />
                        <asp:LinkButton ID="PrnSelectLbl" runat="server" Font-Bold="True" Font-Names="����" Font-Size="X-Small" Font-Underline="True" ForeColor="White" OnClick="PrnSelectLbl_Click" Visible="false">��ӡ�ʲ���ǩ</asp:LinkButton>
                    </td>
                    <td class="td_oa"></td>
                    <td class="td_oa" style="width: 20%"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = ������Ϣ</td>
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
                    <td></td>
                    <td colspan="4">
                        <asp:Label ID="rkdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>���ֿ⣺</td>
                    <td colspan="4">
                        <asp:TextBox ID="rkck" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>��ע��</td>
                    <td colspan="4">
                        <asp:TextBox ID="rkbz" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="2" Enabled="false"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>���������</td>
                    <td colspan="4">
                        <asp:TextBox ID="spyj" runat="server" CssClass="form-control" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox>
                    </td>
                </tr>               
            </table>
        </div>

        <div class="PopBodyGrid">
            <asp:Panel ID="plContent" runat="server" ScrollBars="Auto">

                <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False" 
                    DataKeyNames="rkmxid" 
                    EmptyDataText="��ʱû�еǼ��κ������Ϣ">
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
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="rkmxid" HeaderText="����">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="�ʲ�����">
                            <HeaderStyle ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                            <ItemTemplate>
                                <a href="#" onclick="javascript:popMiniMod('rkshqr_mx_mod.aspx?id=<%# Eval("rkmxid") %>')"><font color="#3366ff"><asp:Label ID="lblzcbm" runat="server" Text='<%# Bind("zcbmfull") %>'></asp:Label></font></a>
                            </ItemTemplate>
                            <ControlStyle CssClass="navigate" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="zcgg" HeaderText="��Ʒ���">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gysmc" HeaderText="��Ӧ��">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="�������">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="Label2cc" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="��ⵥ��">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdj") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>

                <asp:GridView ID="GridView2" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"
                    AutoGenerateColumns="False" 
                    DataKeyNames="rkmxid" 
                    EmptyDataText="��ʱû�еǼ��κ������Ϣ">
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
                                <input id="chkall" type="checkbox" onclick="chkAll();" title="ȫѡ��ȫ��ѡ" style="width: 16px; height: 16px" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="rkmxid" HeaderText="����">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            <FooterStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="fl_mc" HeaderText="��Ʒ����">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="��Ʒ�ͺ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="gysmc" HeaderText="��Ӧ��">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="�������">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="Label2cc" runat="server" Text='<%# Bind("rksl") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="��ⵥ��">
                            <ItemStyle HorizontalAlign="center" />
                            <HeaderStyle ForeColor="Black" />
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("rkdj") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="GridViewRowStyle" />
                    <HeaderStyle CssClass="GridViewHeaderStyle" />
                    <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                    <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                </asp:GridView>

            </asp:Panel>
        </div>

        <!--����label-->
        <asp:Label ID="rkzt" runat="server" Visible="false" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="yngdzc" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblrkdzt" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
