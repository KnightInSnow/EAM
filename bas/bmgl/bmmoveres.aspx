<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="BmMoveRes.aspx.cs" Inherits="FCSystem.BAS.bmgl.BmMoveRes" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE HTML>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script type="text/javascript" src="../../csjs/myjs.js"></script>
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>部门维护</title>

  <meta name="viewport" content="width=device-width, initial-scale=1">

    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
    <%--<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>

    <script src="../../jquery-ui-1.12.1/external/jquery/jquery.js"></script>
    <script src="../../jquery-ui-1.12.1/jquery-ui.js"></script>
    <link rel="stylesheet" href="../../jquery-ui-1.12.1/jquery-ui.css">

  <script>

      //$(function () {
      //    $(".widget input[type=submit], .widget a, .widget button").button();
      //    $("button, input, a").click(function (event) {
      //        event.preventDefault();
      //    });
      //});
     
      $(function () {
          $("#tabs").tabs();
      });
  </script>
</head>
<body class="main">
    <form id="form1" runat="server">

        <div class="PageHead">部门维护</div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td>选择部门</td>
                            <td>
                                <asp:DropDownList ID="bmsjbm" runat="server" AutoPostBack="True" OnSelectedIndexChanged="BmSelectChanged" Width="100%"></asp:DropDownList>
                            </td>
                            <td><asp:Label ID="Label5" runat="server" Text="目标部门"></asp:Label></td>
                            <td><asp:DropDownList ID="ddlTargetDepartment" runat="server" Width="100%"></asp:DropDownList></td>
                            <td></td>
                            <td>
                                <asp:Button ID="MoveResToTargetDepartmentButton" CssClass="mybutton" runat="server" Text="移动资源" OnClick="MoveResToTargetDepartmentButton_Click" />
                            </td>                
                        </tr>
                    </table>
                </div>

                <div class="PageBody-Top-Buttons">                    
                </div>
            </div>
            
            <div class="Page-EmptyLine-Normal"></div>

            <div class="PageBody-Middle-MinHeight">

                <div id="tabs">
                    <ul>
                        <li><a href="#tabs-1">部门下的直接人员</a></li>
                        <li><a href="#tabs-2">部门下的直接子部门</a></li>
                        <li><a href="#tabs-3">部门下的仓库</a></li>
                        <li><a href="#tabs-4">部门下的供应商</a></li>
                    </ul>
                        <br />
                    <div id="tabs-1">
                        <p>下面的人员表示当前部门下的直接人员，不包括子部门的人员</p>
                        <div style="width: 100%">
                            <asp:ListBox ID="listEmployee" runat="server" Width="100%" Height="400px" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                    <div id="tabs-2">
                        <p>下面的部门表示当前部门下的直接子部门，不显示子部门的子部门。但你移动该部门时，其下的子部门也跟随一起移动</p>
                        <div style="width: 100%">
                            <asp:ListBox ID="listSubDepartment" runat="server" Width="100%" Height="400px" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                    <div id="tabs-3">
                        <p>下面的供应商为当前部门定义的供应商，不包括上级部门定义的供应商</p>
                        <div style="width: 100%">
                            <asp:ListBox ID="listWarehouse" runat="server" Width="100%" Height="400px" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                    <div id="tabs-4">
                        <p>下面的仓库为当前部门定义的仓库，不包括上级部门定义的仓库</p>
                        <div style="width: 100%">
                            <asp:ListBox ID="listSupplier" runat="server" Width="100%" Height="400px" SelectionMode="Multiple"></asp:ListBox>
                        </div>
                    </div>
                </div>

            </div>
            
            <div class="PageBody-Bottom-Pager"> 
            </div>
        </div>
        <div class="PageFoot"></div>
    </form>
</body>
</html>
