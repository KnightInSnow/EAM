// Ԥ������ӡ
function preview() {
    var bdhtml = window.document.body.innerHTML;
    sprnstr = "<!--startprint-->";
    eprnstr = "<!--endprint-->";
    prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
    prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
    //PageSetup_Null();
    window.document.body.innerHTML = prnhtml;
    window.print();
}

function printDiv(myDiv) {
    var newstr = document.all.item(myDiv).innerHTML;
    var oldstr = document.body.innerHTML;
    document.body.innerHTML = newstr;
    window.print();
    document.body.innerHTML = oldstr;
    return false;
}

var HKEY_Root, HKEY_Path, HKEY_Key;
HKEY_Root = "HKEY_CURRENT_USER";
HKEY_Path = "\\Software\\Microsoft\\Internet Explorer\\PageSetup\\";
//������ҳ��ӡ��ҳüҳ��Ϊ��   06.
function PageSetup_Null() {
    try {
        var Wsh = new ActiveXObject("WScript.Shell");
        HKEY_Key = "header";
        Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "");
        HKEY_Key = "footer";
        Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "");
    }
    catch (e) { }
}

//������ҳ��ӡ��ҳüҳ��ΪĬ��ֵ   
function PageSetup_Default() {
    try {
        var Wsh = new ActiveXObject("WScript.Shell");
        HKEY_Key = "header";
        Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "&w&bҳ��,&p/&P");
        HKEY_Key = "footer";
        Wsh.RegWrite(HKEY_Root + HKEY_Path + HKEY_Key, "&u&b&d");
    }
    catch (e) { }
}


function doPrint() {
    bdhtml = window.document.body.innerHTML;
    sprnstr = "<!--startprint-->";
    eprnstr = "<!--endprint-->";
    prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 17);
    prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
    window.document.body.innerHTML = prnhtml;
    var obj = window.document.body;
    doZoom(obj, 12); //�Ŵ��ӡ
    window.print();
}

function doZoom(artibody, size) {
    if (!artibody) {
        return;
    }
    setChildNodesByCurrentNode(artibody, size);
}

function setChildNodesByCurrentNode(node, size) {
    for (var i = 0; i < node.childNodes.length; i++) {
        var artibodyChild = node.childNodes[i];
        if (artibodyChild.nodeType == 1) {
            artibodyChild.className = "";
            artibodyChild.style.fontSize = size + 'px';
            artibodyChild.style.fontFamily = '����_GB2312,����,"Times New Roman",Georgia,serif';
            artibodyChild.style.fontWeight = 400;
            if (artibodyChild.childNodes.length > 0) {
                setChildNodesByCurrentNode(artibodyChild, size);
            }
        }
    }
}
