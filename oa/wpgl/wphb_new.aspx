<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wphb.aspx.cs" Inherits="FCSystem.OA.wpgl.wphb" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>资产合并</title>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>

   
   
</head>

 




    <script language="javascript">
        function chuan(mobj)
            //双击将选定行的名称赋值给母窗口并关闭,wpbm_view中赋的是名称 wpbm中赋的是编码
        {
            window.opener.document.body.all.wpbm_view.value = mobj.childNodes[1].innerText;
            window.opener.document.body.all.wpbm.value = mobj.childNodes[0].innerText;
            window.close();
        }

        function chuan1(mobj) {
            window.opener.document.body.all.wpbm.value = mobj.childNodes[0].innerText;
            window.close();
        }

        function chuan_null()
            //将母文本框置空并关闭，暂时不用
        {
            window.opener.document.body.all.wpbm_view.value = "";
            window.opener.document.body.all.wpbm.value = "";
            window.close();
        }
    </script>

<body class="main">

    <form id="form1" runat="server">
        <table style="table-layout: fixed">
            <tbody>

                 <tr>
                    <td style="height: 20px; background-color: #8CA1AE;">
                        <table width="157" style="height: 100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="center" style="background-image: url(../../images/bg.gif);">资产合并</td>
                            </tr>
                        </table>
                    </td>
                </tr>










                <tr>
                   <td align="center" width="100%">
                         <asp:Panel ID="Panel2" runat="server" ScrollBars="Auto" align="center">
                        <br>
                        <table style="table-layout:fixed;">
                            <tbody>                                
                                <tr>
                                     <td width="10%"></td>
                                      <td align="right" width="8%">需要合并资产编码：</td>
                                     <td align="center" width="10%">
                                        <asp:TextBox ID="hbzcbm" runat="server"  AutoPostBack="true" OnTextChanged="zcbm_content_c_TextChanged"></asp:TextBox>
                                            </td>
                                     <td align="right"  width="10%"></td>
                                    <td align="left" width="10%">
                                  
                    <asp:DropDownList ID="query_c" runat="server" Width="100%">                       
                         <asp:ListItem Value="i.ui_id" Selected="True">使用人代码</asp:ListItem>
                        <asp:ListItem Value="i.ui_desc">使用人姓名</asp:ListItem>
                                                                   
                        <asp:ListItem Value="e.wpmc">资产名称</asp:ListItem>
                        <asp:ListItem Value="e.wptxm">条形码</asp:ListItem>
                        <asp:ListItem Value="f.mc">资产品牌</asp:ListItem>
                        <asp:ListItem Value="e.wpxh">资产型号</asp:ListItem>
                    </asp:DropDownList>
                                        </td>
                                        <td align="center" width="10%">
                                        <asp:TextBox ID="query_content_c" runat="server"  AutoPostBack="true" OnTextChanged="query_content_c_TextChanged"></asp:TextBox>
                                            </td>
                                        <td align="right" width="13%">
                                        <asp:Button cssclass="mybutton" ID="QueryBtn_y" runat="server" Text="查询资产" OnClick="Query_Click" CausesValidation="False" AccessKey="f" />
                                             </td>
                                     <td width="9%"></td>
                                   
                                </tr>
                                  <tr>
                                      <td width="2%"></td>
                                    <td colspan="2" style="height: 25px">
                                      <%--  <font color="red"><%=%></font>--%>
                                    </td>
                                </tr>
                                       </tbody>
                            </table>

          <table id="Table1" cellspacing="0" cellpadding="0" width="90%" align="center" border="0">
                                 
                                <tr>
                                    <td>
                                        <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull_z"
                                                EmptyDataText="暂时没有资产信息"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField> 
                                                    <asp:BoundField DataField="zcbmfull_z" HeaderText="资产编码">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ItemTemplate>
                                                            <asp:Button ID="btn_hb" runat="server" Text="合并" OnClick="btnhb_click" CommandArgument='<%# Container.DataItemIndex %>'/>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="wpmc_z" HeaderText="资产名称">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>                                                   
                                                    <asp:BoundField DataField="wppp_z" HeaderText="资产品牌">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                      <asp:BoundField DataField="wpxh_z" HeaderText="资产型号">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                      <asp:BoundField DataField="wpgg_z" HeaderText="资产规格">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <%--<asp:TemplateField HeaderText="操作">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_ghview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("yngh") %>'></asp:Label></font></a>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_bfview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelbf" runat="server" Text='<%# Bind("ynbf") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>--%>                                                
                                                    <asp:BoundField DataField="ui_desc_z" HeaderText="使用人">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                         <asp:BoundField DataField="ui_id_z" HeaderText="使用人代码">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="sybm_z" HeaderText="使用部门">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="zcsm" HeaderText="资产说明">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                   <%--  <asp:BoundField DataField="zfzt_z" HeaderText="主附状态">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>     --%> 
                                                  
                                                    
                                                  
                                                </Columns>
                                                <RowStyle CssClass="GridViewRowStyle" />
                                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                            </asp:GridView>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server"
                                            OnPageChanged="AspNetPager1_PageChanged"
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
                                            SubmitButtonText="Go">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>

              </table>
               

                   <table id="Table3" cellspacing="0" cellpadding="0" width="100%" align="center" border="0">
                     
                               
                                  <tr>
                                      <td></td>
                                      <td width="30%"></td>
                                     <td width="10%"></td>  
                                      <td align="right" width="30%">                                                     
                                        <%-- <asp:Button cssclass="mybutton" ID="QueryBtn_s" runat="server" Text="查看合并信息" OnClick="Query_Click_s" CausesValidation="False" AccessKey="f" Enabled="false" Visible="false"/>--%>
                                         <asp:Button cssclass="mybutton" ID="flesh" runat="server" Text="查看拆分合并历史" OnClick="chakan_Click" Visible="false" /></asp:Button><asp:Button cssclass="mybutton" ID="OK_cf" runat="server" Text="进入合并界面" Visible="false"></asp:Button>
                                        
                                    </td>
                                       <td width="30%"></td>
                                      <td width="4%"></td>
                                       
                                </tr>
                                <tr>
                                      <td width="2%"></td>
                                    <td colspan="2" style="height: 25px">
                                    <%--    <font color="red"><%=tishi_hbs%></font>--%>
                                    </td>
                                </tr>
                             
                                  <tr>
                                    <td>
                                        <asp:GridView ID="GridView2" runat="server"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="zcbmfull_s"
                                                EmptyDataText="暂时没有资产信息"
                                                Width="100%">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                                        <ItemTemplate>
                                                            <asp:Label ID="Label1" runat="server" Text="<%# GridView2.Rows.Count+ 1 %>"></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <HeaderStyle Width="30px" />
                                                    </asp:TemplateField>
                                                   <%-- <asp:TemplateField>
                                                        <HeaderStyle Width="30px"></HeaderStyle>
                                                        <ItemStyle Width="30px" Height="18px" HorizontalAlign="center" />
                                                        <HeaderTemplate>
                                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="del_s" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>    --%> 
                                                    <asp:TemplateField HeaderText="主资产编码">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                          <font color="black"><asp:Label ID="Label_z" runat="server" Text='<%# Bind("zzcbm_s") %>'></asp:Label></font></a>                       
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="附属资产编码">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                          <font color="black"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("zcbmfull_s") %>'></asp:Label></font></a>                       
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="wpmc_s" HeaderText="资产名称">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wppp_s" HeaderText="资产品牌">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                      <asp:BoundField DataField="wpxh_s" HeaderText="资产型号">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                      <asp:BoundField DataField="wpgg_s" HeaderText="资产规格">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <%--<asp:TemplateField HeaderText="操作">
                                                        <HeaderStyle ForeColor="Black" Width="65" />
                                                        <ItemTemplate>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_ghview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelgh" runat="server" Text='<%# Bind("yngh") %>'></asp:Label></font></a>
                                                            <a href="#" onclick="javascript:popAdd2('/oa/wply/wdwp_bfview.aspx?id=<%# Eval("lyid") %>')"><font color="#3366ff"><asp:Label ID="Labelbf" runat="server" Text='<%# Bind("ynbf") %>'></asp:Label></font></a>
                                                        </ItemTemplate>
                                                        <ControlStyle CssClass="navigate" />
                                                        <ItemStyle HorizontalAlign="center" />
                                                    </asp:TemplateField>--%>                                                
                                                    <asp:BoundField DataField="ui_desc_s" HeaderText="使用人">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_ssbm_s" HeaderText="使用部门">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                     <asp:BoundField DataField="zfzt_s" HeaderText="主附状态">
                                                        <HeaderStyle ForeColor="black" />
                                                    </asp:BoundField>
                                                  
                                                </Columns>
                                                <RowStyle CssClass="GridViewRowStyle" />
                                                <HeaderStyle CssClass="GridViewHeaderStyle" />
                                                <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                                <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                            </asp:GridView>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="height: 22px">
                                        <webdiyer:AspNetPager ID="AspNetPager2" runat="server"
                                            OnPageChanged="AspNetPager2_PageChanged"
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
                                            SubmitButtonText="Go">
                                        </webdiyer:AspNetPager>
                                    </td>
                                </tr>
 </table>
                     


                                 <tr>
                                    <td></td>
                                    <td align="center">
                                       
                                    <asp:ValidationSummary
                                        ID="ValidationSummary1"
                                        runat="server"
                                        EnableClientScript="true"
                                        ShowMessageBox="true"
                                        ShowSummary="false"></asp:ValidationSummary>
                                        
                                    
                                    </td>
                                </tr>


                           
                         </asp:Panel>
                    </td>
                </tr>
            </tbody>
        </table>
         <asp:Label ID="chaxunlx" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="QueryContent" runat="server" Visible="false"></asp:Label>
        <asp:Label ID="zcbmfull" runat="server" Visible="false"></asp:Label>
    </form>
</body>
</html>
