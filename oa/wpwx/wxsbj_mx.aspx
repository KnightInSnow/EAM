<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wxsbj_mx.aspx.cs" Inherits="FCSystem.OA.wpwx.wxsbj_mx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>�ʲ�ά�ޱ���</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript">
        function IsDigit(str) {
            var reg = new RegExp("^[0-9]*[1-9][0-9]*$");
            return (reg.test(str));
        }
        function validType(name, value) {
            if (!IsDigit(value)) {
                var obj = document.getElementsByName(name);
                obj[0].value = "";
            }
        }
    </script>
</head>
<body class="main">
    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>
                <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">�ʲ�ά�ޱ���</td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center" width="100%">
                        <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto">
                            <br />
                            <table style="table-layout:fixed;">
                                <tbody>
                                
                                   <tr>
                            <td align="center" style="height:25px"><asp:Label ID="wxdh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                            </td>
                        </tr>
                                    <tr>
                                        <td class="td_q_space"></td>
                                    </tr>
                                </tbody>
                            </table>

                            <table id="search2" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">
                                <tr>
                                    <td>
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="GridView1_RowDataBound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull"
                                                EmptyDataText="û�в鵽�������������ݣ�"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                                        <HeaderStyle Width="25%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="�ʲ�����">
                                                        <HeaderStyle Width="20%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxyy" HeaderText="ά��ԭ��">
                                                        <HeaderStyle Width="20%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="ά�޽��">
                                                        <HeaderStyle ForeColor="black" Width="30%" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="txt_wxje" runat="server" Width="90%" align="center" ToolTip="������������"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
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
                                    <td class="td_q_space"></td>
                                </tr>

                                <tr>
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                            ShowCustomInfoSection="left"
                                            ShowInputBox="Auto"
                                            AlwaysShow="true"
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
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged"></webdiyer:AspNetPager>
                                    </td>
                                </tr>

                                  
                            </table>
                             <table id="Table1" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">

                                    <tr>
                      <td width="20%">
                       
                   </td>
                    <td >                                              
                        <asp:Label ID="cxsmlb" Text="ά�޵���˵����" runat="server"></asp:Label>
                        </td>
                 
                       <td colspan="3" width="10%">
                                                    <asp:TextBox ID="wxzsm" runat="server" Width="99%" Rows="3" TextMode="multiLine"></asp:TextBox>                                                    
                                                </td>
                                          <td width="10%">
                       
                   </td>
                                                  
                                                  
                       </tr> 

                            <tr>
                                       
                                        <td align="left" width="12%"></td>
                                 <td width="10%">
                       
                   </td>
                                  <td width="10%">
                       
                   </td>
                                 <td width="10%">
                       
                   </td>
                                 <td width="10%">
                       
                   </td>
                                        <td width="28%" align="right">
                                            <asp:Button ID="btnSave" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Text="ά�ޱ���" OnClick="btnSave_Click" /> <asp:Button ID="btnfinish" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Text="ά�����" OnClick="btnfinish_Click" /><asp:Button ID="btngriveup" runat="server" AccessKey="f" CausesValidation="False" cssclass="mybutton" Text="��������" OnClick="btngriveup_Click" Visible="false" />
                                        </td>

                                    </tr>
                                    </table>
                        </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
        <asp:Label ID="wxdzt" runat="server" Text="" Visible="false"></asp:Label>
         <asp:Label ID="wxsid" runat="server" Text="" Visible="false"></asp:Label>
    </form>
</body>
</html>

