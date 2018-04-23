<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Showht.aspx.cs" Inherits="FCSystem.Showht" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <script type="text/javascript">
        var wMin = null;
        function loadPic() {
            var img = document.getElementById("Image1");
            wMin = img.scrollWidth;
        }
        function zoominpic() {
            var img = document.getElementById("Image1"); 
            var widthi = img.scrollWidth;
            var heighti = img.scrollHeight;
            if (widthi < wMin * 3) {
                img.style.width = widthi * 1.2 + "px";
                img.style.height = heighti * 1.2 + "px";
            }
        }
        function zoomoutpic() {
            var img = document.getElementById("Image1");
            var widthi = img.scrollWidth;
            var heighti = img.scrollHeight;
            if (widthi > wMin / 3) {
                img.style.width = widthi * 0.8 + "px";
                img.style.height = heighti * 0.8 + "px";
            }
        }
    </script>
</head>
<body onload="loadPic();">
    <form id="form1" runat="server">
        <table id="img_cz">
            <tr>
                <td>
                    <asp:Button ID="ShowFirst" runat="server" Text="首页" CssClass="mybutton" OnClick="ShowFirst_Click" /><asp:Button ID="ShowUpper" runat="server" Text="上一张" CssClass="mybutton" OnClick="ShowUpper_Click" /><asp:Button ID="DeleteHt" runat="server" Text="删除本张" CssClass="mybutton" OnClientClick="return confirm('确认要执行删除吗?')" OnClick="DeleteHt_Click" Visible="False" /><asp:Button ID="ShowNextht" runat="server" CssClass="mybutton" Text="下一张" OnClick="ShowNextht_Click" /><asp:Button ID="ShowLast" runat="server" Text="末页" CssClass="mybutton" OnClick="ShowLast_Click" /><input type="button" name="BackBtn" value=" 关闭 " class="mybutton" onclick="javascript: window.close()" accesskey="q" /><input type="button" name="btnZoomin" value="放大图片" class="mybutton" onclick="zoominpic();" /><input type="button" name="btnZoomout" value="缩小图片" class="mybutton" onclick="zoomoutpic();" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSum" runat="server" Font-Names="仿宋" Font-Size="Medium"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="img_panel" runat="server" Width="600px" Height="800px">
                        <asp:Image ID="Image1" runat="server" />
                    </asp:Panel>
                </td>
            </tr>
        </table>





        <br />







        <br />
        <br />

        <br />
        <asp:Label ID="HtSum" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Flag" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="Htbsid" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="HtidAll" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="HtStart" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="HtEnd" runat="server" Visible="False"></asp:Label>

        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>

        <asp:Label ID="lblNumber" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="yn_kfgly" runat="server" Visible="False"></asp:Label>
        <asp:Label ID="lblPJZL" runat="server" Visible="False"></asp:Label>
    </form>
</body>
</html>
