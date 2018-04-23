//<!--
//改变当前行颜色

function setSelectOption(curSelect, zcbm) {
    //大于最大长度不再执行
    if (requestIndex > maxLength - 1) {
        return;
    }
    //设置初始选项
    $.ajax({
        type: "post",
        url: "zcstatechange.aspx/GetZcState",
        data: "{'szcbm':'" + zcbm + "'}",
        dataType: "json",
        contentType: "application/json; charset=utf-8",

        success: function (data) {
            //当前默认状态更新
            switch (data.d) {
                case '正常':
                    $(curSelect).find("option[value='0']").attr('selected', 'selected');
                    requestIndex++;
                    getParam();
                    break;
                case '故障':
                    $(curSelect).find("option[value='1']").attr('selected', 'selected');
                    requestIndex++;
                    getParam();
                    break;
                case '待报废':
                    $(curSelect).find("option[value='2']").attr('selected', 'selected');
                    requestIndex++;
                    getParam();
                    break;

                default:
                    requestIndex++;
                    getParam();
            }
        },

        error: function (err) {
            alert('信息获取失败!');
        }
    });
}

function getParam() {
    selects = $("[id*=select_zt]");
    maxLength = selects.length;
    //当前控件
    var select = $(selects[requestIndex]);
    //资产编码值  
    var zcbm = $(selects[requestIndex]).parent().parent().find('span[id*=lblzcbm]').text();

    //递归调用设置默认选项
    setSelectOption(select, zcbm);
}

function statechange(obj) {
    //选择值value
    var selectedVal = $(obj).val();
    //资产编码值
    var zcbm = $(obj).parent().parent().find('span[id*=lblzcbm]').text();
    //alert(zcbm + '-----' + selectedVal);     

    $.ajax({
        type: "post",
        url: "zcstatechange.aspx/ChangeState",
        data: "{'szt1':'" + selectedVal + "','szcbm':'" + zcbm + "'}",
        dataType: "json",
        contentType: "application/json; charset=utf-8",

        success: function (data) {
            if (data.d == 0) {
                alert('变更成功!');
            } else {
                alert('变更失败!');
            }
        },

        error: function (err) {
            alert('变更失败!');
        }
    });
}

var orObj;
var orBg;

function changeBg(obj) {
    if (orObj) {
        orObj.style.backgroundColor = orBg;
    }
    orObj = obj;
    orBg = obj.style.backgroundColor;
    obj.style.backgroundColor = '#FCFAC8';
}

//最新全选/全不选
function chkAll() {
    var chkall = document.all["chkall"];
    var chkother = document.getElementsByTagName("input");
    for (var i = 0; i < chkother.length; i++) {
        if (chkother[i].type == 'checkbox') {
            if (chkother[i].id.indexOf('GridView1') > -1) {
                if (chkall.checked == true) {
                    chkother[i].checked = true;
                }
                else {
                    chkother[i].checked = false;
                }
            }
        }
    }
}

//全选或取消复选框
function CheckAll(form) {
    for (var k = 0; k < form.elements.length; k++) {
        var e = form.elements[k];
        //判断不是选框本身
        if (e.name != 'chkall') {
            //判断选框不是 高级检索 
            if (e.name != 'gjjs') {
                //判断选框不是 关联条件 
                if (e.name != 'gltj') {
                    e.checked = form.chkall.checked;
                }
            }
        }
    }
}

//删除前确认
function check(objName) {
    var o = document.getElementsByName(objName)
    for (i = 0; i < o.length; i++) if (o[i].checked) return;
    alert("请先选择再删除！");

    location.reload();
}

//刷新按钮
function reload() {
    var name = navigator.appName
    var vers = navigator.appVersion
    if (name == 'Netscape') {
        window.location.reload(true)
    }
    else {
        history.go(0)
    }
}

//铺位明细弹出窗口
function openwin(src) {
    var vDialog = null;
    vDialog = showModalDialog(src, window, "status:no;scrollbars:no;resizable:off;dialogHeight:750px;dialogWidth:1000px;unadorne:yes;help:no");
}

//铺位明细弹出小窗口
function openwin_s(src) {
    var vDialog = null;
    vDialog = showModalDialog(src, window, "status:no;resizable:off;dialogHeight:400px;dialogWidth:550px;unadorne:yes;help:no");
}

//检索方案弹出窗口
var X = 250; // x position
var Y = 250; // y position
var W = 650; // width
var H = 360; // height
var s = "resizable=no,left=" + X + ",top=" + Y + ",screenX=" + X + ",screenY=" + Y + ",width=" + W + ",height=" + H; // Do not edit below this line.
function popZdy(U) {
    var SGW = window.open(U, 'TheWindow', s)
}

//输出Excel弹出窗口，尽寸为横向A4纸
function popOut(Q) {
    window.open(Q, 'newwindow1', 'height=550,width=750,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
}

function popWXD(I) {
    var win = window.open(I, null, 'width=900, height=680,top=' + (screen.height - 700) / 2 + ',left=' + (screen.width - 850) / 2 + ', scrollbars=yes,resizable=yes');
    win.focus();
}

function popPlan(P) {
    var win = window.open(P, null, 'width=900, height=650,top=' + (screen.height - 700) / 2 + ',left=' + (screen.width - 850) / 2 + ', scrollbars=yes,resizable=yes');
    win.focus();
}

//弹出增加窗口，禁止滚动条的
function popAdd(V) {
    var win = window.open(V, 'newwindow6', 'height=550,width=750,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')
    win.focus();
}

//弹出增加窗口，放开滚动条的
function popAdd2(X) {
    var win = window.open(X, 'newwindow2', 'height=550,width=750,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')
    win.focus();
}

//弹出修改窗口
function popMod(W) {
    var win = window.open(W, 'newwindow3', 'height=550,width=780,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',scrollbars=yes,resizable=no,toolbar=no,menubar=no,location=no,status=no')
    win.focus();
}

//打印预览窗口，尽寸为横向A4纸
function popPrn(U) {
    var win = window.open(U, 'newwindow4', 'height=550,width=750,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no')
    win.focus();
}

//输出图表弹出窗口，尽寸为横向A4纸
function popChart(P) {
    window.open(P, 'newwindow5', 'height=550,width=800,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 800) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no')
}

//注册页面
function popReg(Y) {
    window.open(Y, 'newwindow7', 'height=300,width=450,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 450) / 2 + ',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
}

//迷你短消息窗口
function MiniX(U) {
    var MSGW = window.open(U, 'TheWindow', 'resizable=no,scrollbars=no,top=' + (screen.height - 260) / 2 + ',left=' + (screen.width - 350) / 2 + ',width=350,height=260')
}

//邮递标签打印窗口
function popYdbq(G) {
    window.open(G, 'ydbqwindow', 'height=500,width=400,top=' + (screen.height - 500) / 2 + ',left=' + (screen.width - 400) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')
}

//多选用户弹出窗口
function selyh() {
    window.open("/choose/selyh.aspx", null, 'height=300,width=450,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 450) / 2 + ',directories = no,status=no,toolbar=no,menubar=no,location=no,titlebar = no,scrollbars = yes');
}

//多选会员弹出窗口
function selhy() {
    window.open("/choose/selhy.aspx", null, 'height=300,width=450,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 450) / 2 + ',directories = no,status=no,toolbar=no,menubar=no,location=no,titlebar = no,scrollbars = yes');
}

//弹出迷你修改窗口
function popMiniMod(J) {
    window.open(J, 'newwindowJ', 'height=450,width=650,top=' + (screen.height - 450) / 2 + ',left=' + (screen.width - 650) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')
}

/*页面查找定位开始*/

var NS4 = (document.layers);    // Which browser?
var IE4 = (document.all);

var win = window;    // window to search.
var n = 0;

function findInPage(str) {

    var txt, i, found;

    if (str == "")
        return false;

    // Find next occurance of the given string on the page, wrap around to the
    // start of the page if necessary.

    if (NS4) {

        // Look for match starting at the current point. If not found, rewind
        // back to the first match.

        if (!win.find(str))
            while (win.find(str, false, true))
                n++;
        else
            n++;

        // If not found in either direction, give message.

        if (n == 0)
            alert("Not found.");
    }

    if (IE4) {
        txt = win.document.body.createTextRange();

        // Find the nth match FROM the top of the page.

        for (i = 0; i <= n && (found = txt.findText(str)) != false; i++) {
            txt.moveStart("character", 1);
            txt.moveEnd("textedit");
        }

        // If found, mark it and scroll it into view.

        if (found) {
            txt.moveStart("character", -1);
            txt.findText(str);
            txt.select();
            txt.scrollIntoView();
            n++;
        }

            // Otherwise, start over at the top of the page and find first match.

        else {
            if (n > 0) {
                n = 0;
                findInPage(str);
            }

                // Not found anywhere, give message.

            else
                alert("Not found.");
        }
    }

    return false;
}
/*页面查找定位结束*/

//-->