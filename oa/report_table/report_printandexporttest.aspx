<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="report_printandexporttest.aspx.cs" Inherits="FCSystem.OA.report_table.report_printandexporttest" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/print.js"></script>
    <title>��ӡ�ʲ����ˣ��ʲ�������</title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 24px">
            &nbsp;
           
            &nbsp;

          

        </div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <!--startprint-->
        <table id="table1" cellspacing="0" cellpadding="0" width="100%" style="height: 100%" border="0">
            <tr>
                <td>
                    <center>
                    <h3>
                        <br />
                        �̶��ʲ����ˣ��ʲ���<hr align="center" width="100%" size="1" noshade /></h3>
  <table id="Table3" cellspacing="0" cellpadding="0" width="100%"  border="0" >
            <tbody>
                       <tr style="height:30px">
          
                <td align="center">��ѯ���ڣ�<asp:Label runat="server" ID="rq_start" Font-Underline="true" />��<asp:Label runat="server" ID="rq_end" Font-Underline="true" />&nbsp;&nbsp;��ӡ�ˣ�<asp:Label runat="server" ID="dyr" Font-Underline="true" />&nbsp;&nbsp;</td>
              </tr>
               
           </tbody>
          </table>
    
           

<asp:Panel ID="panel1" runat="server">

    <table id="Table2" cellspacing="0" cellpadding="0" width="100%"  border="0" >
            <tbody>
   

 </tbody>
          </table>

<table id="search" cellspacing="0" cellpadding="0" width="100%"  border="0" >
            <tbody>



            <tr> 
            <td>
 
            <table style ="background-color:#CCCCCC" cellspacing="1" cellpadding="1" width="100%"  border="0">
           
              <tr style="background-color:#ffffff" align ="center" ><td> 
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                OnRowDataBound="OnRow_Bound"  
                                AutoGenerateColumns="False"  
                                AllowPaging="false"
                                DataKeyNames="zcbmfull" 
                                EmptyDataText="��ʱû�еǼ��κ���Ʒ�����Ϣ" 
                                ShowFooter="True">
                                <Columns>                        
                                    <asp:TemplateField HeaderText="���" HeaderImageUrl="~/images/refresh.gif">
                                        <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                        <HeaderStyle Width="30px" />
                                    </asp:TemplateField>
                                <asp:BoundField DataField="zcbmfull" HeaderText="�ʲ�����">
                                    <HeaderStyle ForeColor="black"/>
                                    
                                </asp:BoundField>
                                    <asp:BoundField DataField="wpmc" HeaderText="�ʲ�����">
                                    <HeaderStyle ForeColor="black"/>
                                   
                                </asp:BoundField>
                              
                                <asp:BoundField DataField="spsj" HeaderText="����">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="qcslz" HeaderText="����">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="qcjez" HeaderText="���">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                    <asp:BoundField DataField="zjsl" HeaderText="����">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="zjje" HeaderText="���">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                <asp:BoundField DataField="jsslz" HeaderText="����">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                     <asp:BoundField DataField="jsjez" HeaderText="���">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                    <asp:BoundField DataField="qmslz" HeaderText="����">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                     <asp:BoundField DataField="qmjez" HeaderText="���">
                                    <HeaderStyle ForeColor="black" />
                                </asp:BoundField>
                                
                            </Columns>
                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                        <RowStyle CssClass="GridViewRowStyle" />
                        <FooterStyle CssClass="GridViewFooterStyle" />
                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                    </asp:GridView> 
              </td></tr>
             
                                <tr>
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                            OnPageChanged="AspNetPager1_PageChanged"
                                            ShowCustomInfoSection="left"
                                            ShowInputBox="Auto"
                                            AlwaysShow="false"
                                            CustomInfoHTML="<font color='#333333'>�� %RecordCount% ��/ÿҳ%PageSize%�� ��%CurrentPageIndex%/%PageCount%ҳ</font>"
                                            NumericButtonCount="100"
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

            </table>
                   <!--endprint-->
            </td>

            </tr>
             
            </tbody>
          </table>
</asp:Panel>

                    </center>
                </td>
            </tr>
        </table>
        <asp:Label ID="rkdidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="buttonlx" runat="server" Text="" Visible="false"></asp:Label>


    </form>
</body>
</html>
