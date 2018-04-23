//<!--
//�ı䵱ǰ����ɫ

function setSelectOption(curSelect, zcbm) {
    //������󳤶Ȳ���ִ��
    if (requestIndex > maxLength - 1) {
        return;
    }
    //���ó�ʼѡ��
    $.ajax({
        type: "post",
        url: "zcstatechange.aspx/GetZcState",
        data: "{'szcbm':'" + zcbm + "'}",
        dataType: "json",
        contentType: "application/json; charset=utf-8",

        success: function (data) {
            //��ǰĬ��״̬����
            switch (data.d) {
                case '����':
                    $(curSelect).find("option[value='0']").attr('selected', 'selected');
                    requestIndex++;
                    getParam();
                    break;
                case '����':
                    $(curSelect).find("option[value='1']").attr('selected', 'selected');
                    requestIndex++;
                    getParam();
                    break;
                case '������':
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
            alert('��Ϣ��ȡʧ��!');
        }
    });
}

function getParam() {
    selects = $("[id*=select_zt]");
    maxLength = selects.length;
    //��ǰ�ؼ�
    var select = $(selects[requestIndex]);
    //�ʲ�����ֵ  
    var zcbm = $(selects[requestIndex]).parent().parent().find('span[id*=lblzcbm]').text();

    //�ݹ��������Ĭ��ѡ��
    setSelectOption(select, zcbm);
}

function statechange(obj) {
    //ѡ��ֵvalue
    var selectedVal = $(obj).val();
    //�ʲ�����ֵ
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
                alert('����ɹ�!');
            } else {
                alert('���ʧ��!');
            }
        },

        error: function (err) {
            alert('���ʧ��!');
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

//����ȫѡ/ȫ��ѡ
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

//ȫѡ��ȡ����ѡ��
function CheckAll(form) {
    for (var k = 0; k < form.elements.length; k++) {
        var e = form.elements[k];
        //�жϲ���ѡ����
        if (e.name != 'chkall') {
            //�ж�ѡ���� �߼����� 
            if (e.name != 'gjjs') {
                //�ж�ѡ���� �������� 
                if (e.name != 'gltj') {
                    e.checked = form.chkall.checked;
                }
            }
        }
    }
}

//ɾ��ǰȷ��
function check(objName) {
    var o = document.getElementsByName(objName)
    for (i = 0; i < o.length; i++) if (o[i].checked) return;
    alert("����ѡ����ɾ����");

    location.reload();
}

//ˢ�°�ť
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

//��λ��ϸ��������
function openwin(src) {
    var vDialog = null;
    vDialog = showModalDialog(src, window, "status:no;scrollbars:no;resizable:off;dialogHeight:750px;dialogWidth:1000px;unadorne:yes;help:no");
}

//��λ��ϸ����С����
function openwin_s(src) {
    var vDialog = null;
    vDialog = showModalDialog(src, window, "status:no;resizable:off;dialogHeight:400px;dialogWidth:550px;unadorne:yes;help:no");
}

//����������������
var X = 250; // x position
var Y = 250; // y position
var W = 650; // width
var H = 360; // height
var s = "resizable=no,left=" + X + ",top=" + Y + ",screenX=" + X + ",screenY=" + Y + ",width=" + W + ",height=" + H; // Do not edit below this line.
function popZdy(U) {
    var SGW = window.open(U, 'TheWindow', s)
}

//���Excel�������ڣ�����Ϊ����A4ֽ
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

//�������Ӵ��ڣ���ֹ��������
function popAdd(V) {
    var win = window.open(V, 'newwindow6', 'height=550,width=750,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')
    win.focus();
}

//�������Ӵ��ڣ��ſ���������
function popAdd2(X) {
    var win = window.open(X, 'newwindow2', 'height=550,width=750,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')
    win.focus();
}

//�����޸Ĵ���
function popMod(W) {
    var win = window.open(W, 'newwindow3', 'height=550,width=780,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',scrollbars=yes,resizable=no,toolbar=no,menubar=no,location=no,status=no')
    win.focus();
}

//��ӡԤ�����ڣ�����Ϊ����A4ֽ
function popPrn(U) {
    var win = window.open(U, 'newwindow4', 'height=550,width=750,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 750) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no')
    win.focus();
}

//���ͼ�������ڣ�����Ϊ����A4ֽ
function popChart(P) {
    window.open(P, 'newwindow5', 'height=550,width=800,top=' + (screen.height - 550) / 2 + ',left=' + (screen.width - 800) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=yes,location=no,status=no')
}

//ע��ҳ��
function popReg(Y) {
    window.open(Y, 'newwindow7', 'height=300,width=450,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 450) / 2 + ',toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no,status=no')
}

//�������Ϣ����
function MiniX(U) {
    var MSGW = window.open(U, 'TheWindow', 'resizable=no,scrollbars=no,top=' + (screen.height - 260) / 2 + ',left=' + (screen.width - 350) / 2 + ',width=350,height=260')
}

//�ʵݱ�ǩ��ӡ����
function popYdbq(G) {
    window.open(G, 'ydbqwindow', 'height=500,width=400,top=' + (screen.height - 500) / 2 + ',left=' + (screen.width - 400) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')
}

//��ѡ�û���������
function selyh() {
    window.open("/choose/selyh.aspx", null, 'height=300,width=450,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 450) / 2 + ',directories = no,status=no,toolbar=no,menubar=no,location=no,titlebar = no,scrollbars = yes');
}

//��ѡ��Ա��������
function selhy() {
    window.open("/choose/selhy.aspx", null, 'height=300,width=450,top=' + (screen.height - 300) / 2 + ',left=' + (screen.width - 450) / 2 + ',directories = no,status=no,toolbar=no,menubar=no,location=no,titlebar = no,scrollbars = yes');
}

//���������޸Ĵ���
function popMiniMod(J) {
    window.open(J, 'newwindowJ', 'height=450,width=650,top=' + (screen.height - 450) / 2 + ',left=' + (screen.width - 650) / 2 + ',toolbar=no,menubar=no,scrollbars=yes,resizable=no,location=no,status=no')
}

/*ҳ����Ҷ�λ��ʼ*/

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
/*ҳ����Ҷ�λ����*/

//-->