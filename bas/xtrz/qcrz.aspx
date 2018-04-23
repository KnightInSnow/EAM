<%@ Page Language="C#" AutoEventWireup="True" CodeBehind="qcrz.aspx.cs" Inherits="FCSystem.BAS.xtrz.qcrz" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE HTML>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link href="../../Content/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="../../css/Main.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src="../../csjs/Date.js"></script>
    <script type="text/javascript" src="../../csjs/Date2.js"></script>
    <link href="../../css/MyCalendar.css" type="text/css" rel="stylesheet">
    <link href="../../css/Layout.css" type="text/css" rel="stylesheet" />
    <title>�����־</title>
</head>
<body class="main">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True"></asp:ScriptManager>
        <div class="PageHead">
            <div style="margin-top:57px;color:#70708f;">�����־</div>
        </div>
        <div class="PageBody">
            <div class="PageBody-Top">
                <div class="PageBody-Top-Inputs">
                    <table style="table-layout: fixed">
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="text-align:right;padding-right:10px;">�������(��)��</td>
                            <td>
                                <asp:TextBox ID="txtbegintime" runat="server" CssClass="form-control"></asp:TextBox>
                            </td>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtbegintime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator8"
                                    runat="server"
                                    EnableClientScript="false"
                                    ControlToValidate="txtbegintime"
                                    ErrorMessage="����">
                                </asp:RequiredFieldValidator></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td style="text-align:right;padding-right:10px;">�������(��)��</td>
                            <td>
                                <asp:TextBox ID="txtendtime" runat="server"  CssClass="form-control"></asp:TextBox>
                            </td>
                            <td>
                                <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtendtime"
                                    CssClass="MyCalendar" Format="yyyy-MM-dd">
                                </ajaxToolkit:CalendarExtender>
                                <asp:RequiredFieldValidator
                                    ID="RequiredFieldValidator9"
                                    runat="server"
                                    EnableClientScript="false"
                                    ControlToValidate="txtendtime"
                                    ErrorMessage="����">
                                </asp:RequiredFieldValidator></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
                <div class="PageBody-Top-Buttons">
                    <table style="table-layout:fixed;">
                        <tr>
                            <td></td>
                            <td></td>
                            <td colspan="2" align="center">
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn" runat="server" Text="�����¼��־" OnClick="Del_Click" AccessKey="d" OnClientClick="return confirm('ȷ��Ҫִ�������¼��־��')" CausesValidation="true"></asp:Button>
                                <asp:Button CssClass="btn btn-primary active" ID="DelBtn_Cz" runat="server" Text="���������־" OnClick="DelCz_Click" AccessKey="d" OnClientClick="return confirm('ȷ��Ҫִ�����������־��')" CausesValidation="true"></asp:Button>
                            </td>
                            <td></td>
                            <td></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
