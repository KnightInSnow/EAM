<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="default.aspx.cs" Inherits="FCSystem.default1" %>

<!DOCTYPE HTML>

<html>
<head>
    <title>欢迎使用固定资产管理系统！</title>
    <script type="text/javascript">
    function openMain() {
        //if (window.name != 'miswin') {
          //  url = '/login.aspx?formurl=MyLogin';
            //.self.window.navigate(url); 
            //s = window.open(url, foot, 'resizable=yes');
            //try {
                //s.moveTo(0, 0);
                //s.resizeTo(screen.availWidth, screen.availHeight);
                //self.window.opener = null; 
                //s.focus(); 
              //  self.window.moveTo(0, 0);
                //self.window.resizeTo(screen.availWidth, screen.availHeight);
            //} catch (e) { }
        //}
        window.location.href = "login.aspx?formurl=MyLogin";

    }
    </script>
</head>
<body class="background-color:#ffffff" onload="openMain();">
</body>
</html>
