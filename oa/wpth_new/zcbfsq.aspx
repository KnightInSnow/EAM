<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="zcbfsq.aspx.cs" Inherits="FCSystem.OA.wpth_new.zcbfsq" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>申请资产报废</title>
    <script type="text/javascript" src="../../csjs/entercode.js" for="document" event="onkeydown"></script>
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <script type="text/javascript" src="../../csjs/choose.js"></script>

    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/AutoComplete.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript">
        function SetFocus() {
            var obj = document.getElementById("bfbt");  //初始化设置光标焦点
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
            <table style="table-layout:fixed;">
                <tr>
                    <td class="td_oa" style="width: 60%; height: 25px">资产报废</td>
                    <td class="td_oa" style="width: 20%; text-align: right">
                        <asp:Image ID="Image1" runat="server" ImageUrl="../../images/print.gif" Visible="false" /><asp:LinkButton ID="lbtnPrnDoc" runat="server" Font-Bold="True" Font-Names="仿宋" Font-Size="X-Small" Font-Underline="True" ForeColor="White" Visible="false" OnClick="lbtnPrnDoc_OnClick">打印报废单</asp:LinkButton></td>
                    <td class="td_oa" style="width: 20%; height: 25px"><span class="td_yes">&nbsp;&nbsp;&nbsp;&nbsp;</span> = 必填信息</td>
                </tr>
            </table>
        </div>
         
        <div class="PopBodyInputs">
            <table style="table-layout:fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                </tr>

                <tr>
                    <td>
                        报废标题：</td>
                    <td colspan="4">
                        <asp:TextBox ID="bfbt" runat="server"></asp:TextBox>
                    </td>
                    <td><asp:RequiredFieldValidator
                            ID="RequiredFieldValidator1"
                            runat="server"
                            ControlToValidate="bfbt"
                            ErrorMessage="请输入报废标题">&nbsp;
                        </asp:RequiredFieldValidator></td>
                </tr>

                <tr>
                    <td>报废说明：</td>
                    <td colspan="4">
                        <asp:TextBox ID="bfsm" runat="server" CssClass="MultiLineText" Rows="3" TextMode="multiLine"></asp:TextBox>
                    </td>
                </tr>
            </table>
        </div>


        <div class="PopBodyGrid">
            请先选择需要报废的资产                            
                                        <asp:Panel ID="Panel1" runat="server" ScrollBars="Auto" Height="200px">
                                            <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                                OnRowDataBound="OnRow_Bound"
                                                AutoGenerateColumns="False"
                                                DataKeyNames="rkmxid"
                                                EmptyDataText="暂时没有资产信息"
                                                EnableModelValidation="True">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
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
                                                            <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="del" runat="server" CssClass="mybox" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="zcbmfull" HeaderText="资产编码">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="wpmc" HeaderText="资产名称">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="领用单号">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_lydh" runat="server" Text='<%# Bind("lydh") %>'></asp:Label>
                                                        </ItemTemplate>
                                                        <ItemStyle HorizontalAlign="Center" />
                                                        <ControlStyle CssClass="navigate" />
                                                    </asp:TemplateField>
                                                    <asp:BoundField DataField="lymx_tid" HeaderText="领用明细单号">
                                                        <HeaderStyle CssClass="hidden" />
                                                        <ItemStyle CssClass="hidden" />
                                                        <FooterStyle CssClass="hidden" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="bmmc" HeaderText="所在部门">
                                                        <HeaderStyle ForeColor="Black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ui_desc" HeaderText="使用人">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:BoundField DataField="ckmc" HeaderText="领用仓库">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>

                                                    <asp:BoundField DataField="zcsm" HeaderText="资产说明">
                                                        <HeaderStyle ForeColor="black" />
                                                        <ItemStyle HorizontalAlign="Center" />
                                                    </asp:BoundField>
                                                    <asp:TemplateField HeaderText="报废图片" HeaderStyle-HorizontalAlign="Center">
                                                        <ItemStyle Width="260px" Height="18px" HorizontalAlign="center" />
                                                        <ItemTemplate>
                                                            <input id="bft" runat="server" type="file" style="width: 140px; height: 20px" class="mytext" /><asp:Button ID="btn_bftsc" runat="server" Height="20px" CommandArgument='<%# Container.DataItemIndex %>' OnClick="ShCh" Text="上传" /><asp:Label ID="lblFilename" runat="server" Text=""></asp:Label>
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

        <br />

        <div class="PopBodyInputs">
            <table style="table-layout:fixed;">
                <tr>
                    <td></td>
                    <td></td>
                    <td>
                        <asp:Button CssClass="mybutton" ID="OK_bf" runat="server" Text="确认报废" OnClick="OK_bf_Click"></asp:Button></td>
                    <td>
                        <asp:Button ID="Button3" Text="清空" OnClick="Clear_Click" runat="Server" CausesValidation="false" CssClass="mybutton" AccessKey="r" /></td>
                    <td></td>
                    <td>
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

        <asp:Label ID="lblmaxbfid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblmaxindex" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="shckid" runat="server" Visible="False"></asp:Label>
        <br />
    </form>
</body>
</html>
