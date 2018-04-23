<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wxsbj_gysmx.aspx.cs" Inherits="FCSystem.OA.wpwx.wxsbj_gysmx" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产维修报价</title>
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
                                <td align="center" style="background-image: url(../../images/bg.gif);">资产维修报价</td>
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
                                                EmptyDataText="没有查到符合条件的数据！"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="5%" />
                                                    </asp:TemplateField>
                                                   
                                                    <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                        <HeaderStyle Width="25%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                                        <HeaderStyle Width="20%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wxyy" HeaderText="维修原因">
                                                        <HeaderStyle Width="20%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="wxje" HeaderText="维修金额">
                                                        <HeaderStyle Width="20%" ForeColor="Black" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <ItemStyle HorizontalAlign="Center" />
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
                                    <td class="td_q_space"></td>
                                </tr>

                                <tr>
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                            ShowCustomInfoSection="left"
                                            ShowInputBox="Auto"
                                            AlwaysShow="false"
                                            CustomInfoHTML="<font color='#333333'>共 %RecordCount% 行/每页%PageSize%行 第%CurrentPageIndex%/%PageCount%页</font>"
                                            NumericButtonCount="10"
                                            FirstPageText="首页"
                                            LastPageText="末页"
                                            NextPageText="下页"
                                            PrevPageText="上页"
                                            CustomInfoSectionWidth="250px"
                                            CssClass="page_text"
                                            ShowBoxThreshold="11"
                                            InputBoxClass="AspNetPagerInputBox"
                                            SubmitButtonClass=“AspNetPagerButton”
                                            SubmitButtonText="Go" OnPageChanged="AspNetPager1_PageChanged"></webdiyer:AspNetPager>
                                    </td>
                                </tr>

                                  
                            </table>
                             <table id="Table1" cellspacing="0" cellpadding="0" width="95%" align="center" border="0">

                                   

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
