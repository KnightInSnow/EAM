<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SyncData.aspx.cs" Inherits="FCSystem.oa.sq.SyncData1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="/csjs/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="/csjs/jquery-ui-jqLoding.js?=1.0.3"></script>
    <script type="text/javascript">
        function SyncData() {
            var status = $("#hifDbStatus").val();
            if (status == "1") {
                $.fn.jqLoading({ height: 100, width: 280, text: "正在同步数据，请勿做任何操作...." });
                $.ajax({
                    type: "Post",
                    timeout: 60000, //超时时间设置，单位毫秒
                    url: "/oa/sq/SyncData.ashx",
                    //方法传参的写法
                    contentType: "application/text; charset=utf-8",
                    dataType: "text",
                    success: function (data) {
                        //返回的数据用data.d获取内容
                        if (data == "0") {
                            alert('初始数据导入成功!');
                            window.location.href = "/login.aspx";
                        } else {
                            alert(data);
                        }
                    },
                    error: function (err) {
                        alert(err);
                    }
                });
            }
        }
    </script>
</head>
<body onload="SyncData()">
    <form id="form1" runat="server">
    <div>
    
        <asp:HiddenField ID="hifDbStatus" runat="server" Value="0" />
    </div>
    </form>
</body>
</html>
