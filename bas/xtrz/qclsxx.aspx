<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="qclsxx.aspx.cs" Inherits="FCSystem.BAS.xtrz.qclsxx" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
     <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
       <title>清除历史消息</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">清除历史消息</div>
        </div>
        <div class="Page-EmptyLine-Large"></div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="text-align:right;padding-right:10px;">清除日期(自)：<ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtbegintime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator8"
                                    runat="server"
                                    EnableClientScript="false"
                                    ControlToValidate="txtbegintime"
                                    ErrorMessage="必输">
                                </asp:RequiredFieldValidator></td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="text-align:right;padding-right:10px;">清除日期(至)：<ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtendtime"
                                CssClass="MyCalendar" Format="yyyy-MM-dd">
                            </ajaxToolkit:CalendarExtender>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator9"
                                    runat="server"
                                    EnableClientScript="false"
                                    ControlToValidate="txtendtime"
                                    ErrorMessage="必输">
                                </asp:RequiredFieldValidator></td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                        </table>
                    <table style="table-layout:fixed;">
                        <tr>
                            <td style="text-align:right;padding-bottom:10px;">
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="清除历史消息" OnClick="Del_Click" AccessKey="d" OnClientClick="return confirm('确认要清除历史消息吗？')" CausesValidation="true"></asp:Button>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
