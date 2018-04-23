<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wplcsm.aspx.cs" Inherits="FCSystem.OA.wpgl.wplcsm" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>领用流程说明</title>
<link href="../../css/Main.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="../../csjs/myjs.js"></script>
    <style type="text/css">
          .auto-style1
        {
            height: 40px;
            width: 500px;
        }
    </style>
</head>
<body class="main">
<form id="form1" runat="server">
  <table style="table-layout: fixed">
    <tbody>
      <tr> 
        <td style="height:20px;background-color: #8CA1AE;">
          <table width="157" style="height:100%" border="0" cellpadding="0" cellspacing="0">
            <tr> 
              <td align="center" style="background-image: url(../../images/bg.gif);">领用流程说明</td>
            </tr>
          </table>
        </td>
      </tr>
      <tr > 
        <td width="100%" align="center">
            <asp:Panel ID="Panel1" runat="server"  ScrollBars="Auto" Width="100%" >
            <table id="search" cellspacing="0" cellpadding="0" width="100%" align="left" border="0" >
            <tbody>
                 <tr> 
                <td style="width: 100%">

                     <table style="table-layout:fixed;">
              <tr> 
                <td class="auto-style1"><font color="red">提示：您只能维护或查看本部门的物品流程说明！</font>
                </td>                  
                <td align="right">
                    <input type="button" name="AddBtn" value="增加" class="qq_btn_100px" onclick="javascript:popAdd('wplcsm_view.aspx');" accesskey="a" /><asp:button cssclass="mybutton" ID="RefBtn" runat="server" Text="刷新" onclick="ChangeType" causesvalidation="False" AccessKey="e" />
                </td>
              </tr>
               </table>
                   </td> 
              </tr>
              <tr> 
                <td style="width: 100%">
				
                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                    OnRowDataBound="OnRow_Bound"  
                    AutoGenerateColumns="False" 
                    DataKeyNames="smid" 
                    EmptyDataText="没有查到符合条件的数据！"
                    width="100%">
                        <Columns>                        
                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
                                <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# GridView1.Rows.Count+ 1 %>"></asp:Label>
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                                <HeaderStyle Width="60px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="smid" HeaderText="说明编码">
                                <HeaderStyle CssClass ="hidden"/>
                                <ItemStyle  CssClass ="hidden" />
                                <FooterStyle CssClass ="hidden" />
                            </asp:BoundField>   
                            <asp:TemplateField HeaderText="物品流程说明">
                                <HeaderStyle ForeColor="Black" />
                                <ItemTemplate>
                                    <a href="#" onclick="javascript:popMod('/oa/wpgl/wplcsm_view.aspx?id=<%# Eval("smid") %>')"><font color="#3366ff"><asp:Label ID="Labelyjje" runat="server" Text='<%# Bind("smmc") %>'></asp:Label></font></a>
                                </ItemTemplate>
                                <ControlStyle CssClass="navigate" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="bm_mc" HeaderText="所属部门" >
                                <HeaderStyle ForeColor="Black" Width="150px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ui_desc" HeaderText="创建人" >
                                <HeaderStyle ForeColor="Black" Width="130px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cjsj" HeaderText="创建时间"  DataFormatString="{0:yyyy-MM-dd}" HtmlEncode="False">
                                <HeaderStyle Width="120px" ForeColor="Black" />
                                <ItemStyle HorizontalAlign="Center" />
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
                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" 
                      OnPageChanged="AspNetPager1_PageChanged"  
                      ShowCustomInfoSection="left" 
                      ShowInputBox="Auto" 
                      AlwaysShow="true"
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
                </td></tr>
            </tbody>
          </table>
           </asp:Panel>
                </td>
      </tr>
    </tbody>
  </table>
</form>
</body>
</html>
