<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="wplyqr_modnew.aspx.cs" Inherits="FCSystem.OA.wply.wplyqr_modnew" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>领用确认</title>
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
    <%-- <object id='prt' type="application/x-oleobject" classid='Clsid:72DC2E22-F8D1-4AFA-8E38-46C4198BF8B5' class="hidden"></object>
    <object id='fileup' type="application/x-oleobject" classid='Clsid:868B7CE6-0891-420D-9292-CC414D50349D' class="hidden"></object>
    <script type="text/javascript">
        var print = null;
        var clear = null;
        var label = null;
        var currentTime = null;
        var i;

        function updown() {
            //上传文件夹图片 传递文件夹地址 path  赋予单号  上传到表中的字段
            //               资产的编号     ProductNum
            //               传递图片类型    IfHt       合同 /付款凭证  判断传递图片的表 ( ture  HTH表)   ( false FKPZ表 )
            //               传递数据库连接字符串 strConn
            //
            var path;
            var strConn;
            var ProductNum;
            var IfHt;
            var Number;
            var Path;
            var IfSuccess;
            var Sl;
            //跟换以下连接字符串
            // strConn = document.getElementById("conn").innerText;
            //strConn = " server = WIN-PC\\SQL2012 ;database=fc_eam;user id=sa;password=123456 ";      
            Sl = i;

            strConn = "<%=conn.Text%>";

            path = "<%=path.Text%>";

            //ProductNum = document.getElementById("lblRKDH").innerHTML;

            ProductNum = "<%=lbllydh.Text%>";

            var obj = document.getElementById("fileup");

            IfHt = "<%=ifht.Text%>";

            Number = "<%=lblhth.Text%>";

            Path = "<%=lblpath.Text%>";

            IfSuccess = obj.UploadFolderFiles(path, strConn, ProductNum, IfHt, Number, Path, currentTime, Sl);

            if (IfSuccess == true) {
                alert("扫描成功!");
            }
            else {
                alert("扫描失败,请重新扫描!");
            }

            //文件删除
            // obj.del(path);

            //读取文件夹图片 
            //                资产的编号     ProductNum
            //                传递图片类型    IfHt       合同 /付款凭证  判断传递图片的表 ( ture  HTH表)   ( false FKPZ表 )
            //                传递数据库连接字符串 strConn
            //       返回值  bmpt 可以直接赋值给picturebox.image
            //updown.read(strConn, "9527", false);
        }
        function deletelydjdir() {
            var path;
            path = "<%=lydjljDel.Text%>";
            var obj = document.getElementById("fileup");
            obj.DeleteDirectory(path);
        }

        function ScanUpload() {
            print = document.getElementById("prt");
            var filename = "370104LYDJ";
            label = "<%=lbllyid.Text%>";
            currentTime = "<%=lblcurTime.Text%>";
            filename = filename + label + "_" + currentTime;

            i = print.DPK("C:\\fc_lydj_temp\\", filename, "", 33, 2, 1, 200, "bj-seefefedfeeg4oouiouujhjuu345]hhu", "");
            //document.getElementById("smhtsl").innerText = i;
            //alert(i);
            if (i > 0) {
                updown();
            }
            else {
                alert('扫描失败,请重新扫描!');
            }
            print = null;
        }
    </script>--%>
    <form id="form1" runat="server">
        <table>
            <tbody>
                <tr>
                    <td>
                        <asp:Button CssClass="mybutton" ID="SpBtn" runat="server" Text="审批通过" OnClick="Sp_Click" Visible="false" /><asp:Button CssClass="mybutton" ID="ThBtn" runat="server" Text="审批退回" OnClick="Th_Click" Visible="false" /><input type="button" name="BackBtn" value="关闭" class="qq_btn_100px" onclick="javascript: window.close()" accesskey="q" /><asp:Button ID="btnNext" runat="server" CssClass="mybutton" Text="审批下一单" Visible="false" OnClick="btnNext_Click" />
                    </td>
                    <td class="td_oa" style="width: 20%"></td>
                </tr>
                <tr>
                    <td colspan="2" valign="top">
                        <table style="table-layout: fixed;">
                            <tr>
                                <td>
                                    <asp:Label ID="lydh" runat="server" Font-Size="12pt" Font-Bold="true" ForeColor="red"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>发放仓库：</td>
                                <td>
                                    <asp:TextBox ID="ffck" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>备注：</td>
                                <td>
                                    <asp:TextBox ID="tbxBzsm" runat="server" Width="500px" Enabled="false"></asp:TextBox>
                                </td>
                            </tr>
                            <asp:Panel ID="spyjpanel" runat="server" Visible="false">
                                <tr>
                                    <td>意见追述：</td>
                                    <td>
                                        <asp:TextBox ID="spyj" runat="server" CssClass="mytextarea" Width="500px" ReadOnly="true" TextMode="multiLine" Rows="2"></asp:TextBox>&nbsp;</td>
                                </tr>
                            </asp:Panel>
                            <%-- <tr>
                            <td></td>
                            <td><asp:TextBox ID="djsm" Width="420px" runat="server" Visible="false"></asp:TextBox><asp:Button ID="btnsmdj" Visible="false" runat="server" Text="扫描单据" CssClass="mybutton" OnClick="btnsmdj_Click"></asp:Button></td>
                        </tr>--%>

                            <tr>
                                <td colspan="2" style="height: 5px"></td>
                            </tr>
                        </table>
                        <table style="table-layout: fixed;">
                            <tr>
                                <td>
                                    <asp:GridView ID="GridView1" runat="server" CssClass="GridViewStyle"
                                        OnRowDataBound="OnRow_Bound"
                                        AutoGenerateColumns="False"
                                        DataKeyNames="lymxtid"
                                        EmptyDataText="暂时没有登记任何信息"
                                        Width="100%">
                                        <Columns>
                                            <asp:TemplateField HeaderText="序号" HeaderImageUrl="~/images/refresh.gif">
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
                                                    <input id="chkall" type="checkbox" onclick="chkAll();" title="全选或全不选" style="width: 16px; height: 16px" />
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="selectItem" runat="server" CssClass="mybox" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="wpbm" HeaderText="商品编码">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpmc" HeaderText="商品名称">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="fl_mc" HeaderText="分类名称">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpxh" HeaderText="型号">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:TemplateField>
                                                <HeaderTemplate>申请数量</HeaderTemplate>
                                                <ItemStyle HorizontalAlign="Center" />
                                                <ItemTemplate>
                                                    <asp:TextBox ID="tbx_sqsl" runat="server" Width="80%" Text='<%# Bind("sqsl")%>'></asp:TextBox><asp:RegularExpressionValidator
                                                        ID="RegularExpressionValidator1"
                                                        runat="server"
                                                        ControlToValidate="tbx_sqsl"
                                                        ValidationExpression="^[1-9]\d*|0$"
                                                        ErrorMessage="申请数量必须为正整数">&nbsp;</asp:RegularExpressionValidator><asp:RequiredFieldValidator
                                                            ID="RequiredFieldValidator2"
                                                            runat="server"
                                                            ControlToValidate="tbx_sqsl"
                                                            ErrorMessage="申请数量不能为空">&nbsp;</asp:RequiredFieldValidator>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="ckmc" HeaderText="仓库名称">
                                                <HeaderStyle ForeColor="black" />
                                                <ItemStyle HorizontalAlign="Center" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="ck_tid" HeaderText="仓库tid">
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                                <FooterStyle CssClass="hidden" />
                                            </asp:BoundField>
                                            <asp:BoundField DataField="wpid" HeaderText="wptid">
                                                <HeaderStyle CssClass="hidden" />
                                                <ItemStyle CssClass="hidden" />
                                                <FooterStyle CssClass="hidden" />
                                            </asp:BoundField>
                                        </Columns>
                                        <RowStyle CssClass="GridViewRowStyle" />
                                        <HeaderStyle CssClass="GridViewHeaderStyle" />
                                        <AlternatingRowStyle CssClass="GridViewAlternatingRowStyle" />
                                        <EmptyDataRowStyle CssClass="GridViewEmptyDataStyle" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
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

        <!--隐藏label-->
        <asp:Label ID="lyzt" runat="server" Visible="false" />
        <asp:Label ID="ycxx" runat="server" Visible="false" />
        <asp:Label ID="lyidstr" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="kcsl" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllyid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllydh" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="htsl" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="pzsl" runat="server" Text="" Visible="False"></asp:Label>
        <asp:Label ID="conn" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="ifht" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="path" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblhth" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblpath" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lydjljDel" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="smhtsl" runat="server" Visible="False"></asp:Label>
        <input id="smzsl" type="hidden" runat="server" />
        <asp:Label ID="lblcurTime" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lbllydzt" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblLYDHZ" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblyhtid" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
