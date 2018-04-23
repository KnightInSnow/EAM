<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YstShow.aspx.cs" Inherits="FCSystem.YstShow" %>

<!DOCTYPE html>

<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <title></title>
    <script type="text/javascript">
        var wMin = null;
        function loadPicture() {
            var img = document.getElementById("Image");
            wMin = img.scrollWidth;
        }
        function zoominpic() {
            var img = document.getElementById("Image");
            var widthi = img.scrollWidth;
            var heighti = img.scrollHeight;
            if (widthi < wMin * 3) {
                img.style.width = widthi * 1.2 + "px";
                img.style.height = heighti * 1.2 + "px";
            }
        }
        function zoomoutpic() {
            var img = document.getElementById("Image");
            var widthi = img.scrollWidth;
            var heighti = img.scrollHeight;
            if (widthi > wMin / 3) {
                img.style.width = widthi * 0.8 + "px";
                img.style.height = heighti * 0.8 + "px";
            }
        }
    </script>
</head>
<body onload="loadPicture();">
    <form id="form1" runat="server">
        <table id="tbImage">
            <tr>
                <td>
                    <asp:Button ID="ShowFirst" runat="server" Text="首页" CssClass="btn btn-primary active" OnClick="ShowFirst_Click" />
                    <asp:Button ID="ShowUpper" runat="server" Text="上一张" CssClass="btn btn-primary active" OnClick="ShowUpper_Click" />
                    <asp:Button ID="DeleteHt" runat="server" Text="删除本张" CssClass="btn btn-primary active" OnClientClick="return confirm('确认要执行删除吗?')" OnClick="DeleteHt_Click" Visible="true" />
                    <asp:Button ID="ShowNextht" runat="server" CssClass="btn btn-primary active" Text="下一张" OnClick="ShowNextht_Click" />
                    <asp:Button ID="ShowLast" runat="server" Text="末页" CssClass="btn btn-primary active" OnClick="ShowLast_Click" />
                    <input type="button" name="BackBtn" value=" 关闭 " class="btn btn-primary active" onclick="javascript: window.close()" accesskey="q" />
                    <input type="button" name="btnZoomin" value="放大图片" class="btn btn-primary active" onclick="    zoominpic();" />
                    <input type="button" name="btnZoomout" value="缩小图片" class="btn btn-primary active" onclick="    zoomoutpic();" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblMsg" runat="server" Font-Names="仿宋" Font-Size="Medium"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Panel ID="plImage" runat="server" Width="600px">
                        <asp:Image ID="Image" runat="server" />
                    </asp:Panel>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
