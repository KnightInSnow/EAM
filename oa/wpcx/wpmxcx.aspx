<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wpmxcx.aspx.cs" Inherits="FCSystem.OA.wpcx.wpmxcx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>��Ʒ��ϸ��ѯ</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../csjs/myjs.js"></script>
<script type="text/javascript" src="../../csjs/Date.js"></script>
<script type="text/javascript" src="../../csjs/choose.js"></script>	
</head>
<body class="main">
<form id="form1" runat="server">
  <table style="table-layout: fixed">
    <tbody>
      <tr> 
        <td style="height:20px;background-color: #8CA1AE;">
          <table width="157" style="height:100%" border="0" cellpadding="0" cellspacing="0">
            <tr> 
              <td align="center" style="background-image: url(../../images/bg.gif);">��Ʒ��ϸ��ѯ</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr > 
        <td>
        <table id="Table1" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
          <tbody>
            <tr><td colspan="4" style="height:5px"></td></tr>
            <tr>
              <td align="left" style="height:25px">�ֿ⣺</td>
              <td><asp:DropDownList id="rkck" runat="server" Width="150">
                      <asp:ListItem Text="" Value=""></asp:ListItem>
                </asp:DropDownList>
              </td>
              <td align="left" style="height:25px">��Ʒ���룺</td>
                <td><asp:textbox id="wpbm" runat="server" Width="150px" Height="21px"></asp:textbox>&nbsp;<img src="/images/fd.gif" onclick="openA('/choose/spview_all_ckwp.aspx?id=t2')" alt="ѡ��Ҫ��ѯ����Ʒ����" />&nbsp;
                </td>
                 <td align="left" style="height:25px">ҵ�����ͣ�</td>              
              <td><asp:DropDownList ID="Ywlx" runat="server" Width="150" >
                        <asp:ListItem Text ="" Value ="" Selected ="true" ></asp:ListItem>
                      <asp:ListItem Text="���" Value="���" ></asp:ListItem>
                      <asp:ListItem Text="����" Value="����" ></asp:ListItem>
                      <asp:ListItem Text="�黹" Value="�黹" ></asp:ListItem>
                      <asp:ListItem Text="�˻�" Value="�˻�" ></asp:ListItem>
                    </asp:DropDownList>
              </td>
            </tr>
            <tr>
            <td align="left" style="height:25px">��ʼ���ڣ�</td>
            <td><asp:textbox id="txtbegintime" onfocus="setday(this);" runat="server"	CssClass="mytext" Width="150" MaxLength ="10"></asp:textbox></td>
            <td align="left" style="height:25px">�������ڣ�</td>
            <td><asp:textbox id="txtendtime" onfocus="setday(this);" runat="server" Width="150" MaxLength ="10"></asp:textbox>
            </td>
            <td style="height:25px" colspan="2" align="left"><div style="text-align:center;"><asp:Label ID="kcqk" runat="server" Width="80" Height="20"></asp:Label></div></td>            
            </tr>
            <tr>
            <td colspan="6" style="height:25px" align ="left"><font color="#999999">������ =��� +�黹 +�˻� -����</font>&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">��ǰʣ����&nbsp;<asp:Label ID="dqkc" runat="server" ></asp:Label>&nbsp;������������ˮ(��ȫ������)&nbsp;<asp:Label ID="jskc" runat="server"></asp:Label>&nbsp;��</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:button cssclass="mybutton" ID="QueryBtn" runat="server" Text="��ѯ" onclick="Query_Click" causesvalidation="False" AccessKey="f" Height="21px" Width="50px" /><asp:button cssclass="mybutton" id="ClearBtn" runat="server" text="���" AccessKey="r" CausesValidation = "false" OnClick="Clear_Click" Height="21px" Width="50px"></asp:button><asp:Button ID="OutBtn" runat="server" CssClass="mybutton" Text="����" Height="21px" Width="50px" />
            </td>
            </tr>
          </tbody>
        </table>         
        <table style="table-layout:fixed;">
            <tbody>
              <tr> 
                <td colspan="2">
				<asp:Panel ID="Panel1" runat="server"  ScrollBars="Auto">
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"  
                    AutoGenerateColumns="False" 
                    DataKeyNames="Kcmxid" 
                    EmptyDataText="û�в鵽�������������ݣ�"
                    width="100%">
                        <Columns>                        
                        <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                            <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                            <HeaderStyle Width="30px" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="jzrq" HeaderText="��������"  DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                            <HeaderStyle Width="80px" ForeColor="Black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpbm" HeaderText="��Ʒ����">
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpmc" HeaderText="��Ʒ����">
                            <HeaderStyle ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Ywlx" HeaderText="ҵ������">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="jzsl" HeaderText="��������">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="jykcsl" HeaderText="������">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="bm_mc" HeaderText="���ò���">
                            <HeaderStyle  ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ui_desc" HeaderText="������">
                            <HeaderStyle  ForeColor="black" />
                        </asp:BoundField>
                        <asp:BoundField DataField="mc" HeaderText="Ʒ��">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="wpxh" HeaderText="�ͺ�">
                            <HeaderStyle ForeColor="black" />
                            <ItemStyle HorizontalAlign="center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ckmc" HeaderText="�ֿ�">
                            <HeaderStyle  ForeColor="black" />
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
                <td colspan="2" style="height: 22px">
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
                </td></tr>
            </tbody>
          </table></td>
      </tr>
    </tbody>
  </table>
</form>
</body>
</html>

