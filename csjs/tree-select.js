//TreeView onclick 触发事件
// 示例：tv.onclick = "client_OnTreeNodeChecked(event)";
function client_OnTreeNodeChecked(event) {
    var objNode;
    if (!public_IsObjectNull(event.srcElement)) {
        objNode = event.srcElement; // IE
    }
    else {
        objNode = event.target; //FF
    }
    if (!public_IsCheckBox(objNode))
        return;

    var objCheckBox = objNode;
    if (objCheckBox.checked == true) {
        objCheckBox.indeterminate = false;
        setChildChecked(objCheckBox);
        setParentChecked(objCheckBox);
    }
    else {
        setChildUnChecked(objCheckBox);
        setParentUnChecked(objCheckBox);
    }
}

//判断对象是否为空
function public_IsObjectNull(element) {
    if (element == null || element == "undefined")
        return true;
    else
        return false;
}

//判断对象是否为 CheckBox
function public_IsCheckBox(element) {
    if (public_IsObjectNull(element))
        return false;

    if (element.tagName != "INPUT" || element.type != "checkbox")
        return false;
    else
        return true;
}
//得到包含所有子节点的 Node(Div 对象)
function public_CheckBox2Node(element) {
    var objID = element.getAttribute("ID");
    objID = objID.substring(0, objID.indexOf("CheckBox"));
    return document.getElementById(objID + "Nodes");
}
//得到父节点的 CheckBox
function public_Node2CheckBox(element) {
    var objID = element.getAttribute("ID");
    objID = objID.substring(0, objID.indexOf("Nodes"));
    return document.getElementById(objID + "CheckBox");
}

//得到本节点所在的 Node(Div 对象)
function public_GetParentNode(element) {
    var parent = element.parentNode;
    var upperTagName = "DIV";
    //如果这个元素还不是想要的 tag 就继续上溯
    while (parent && (parent.tagName.toUpperCase() != upperTagName)) {
        parent = parent.parentNode ? parent.parentNode : parent.parentElement;
    }
    return parent;
}

//设置节点的父节点 Checked
// state 取0, 1表示三态、选
function setParentChecked(currCheckBox, state) {
    var objParentNode = public_GetParentNode(currCheckBox);
    if (public_IsObjectNull(objParentNode))
        return;

    var objParentCheckBox = public_Node2CheckBox(objParentNode);
    if (!public_IsCheckBox(objParentCheckBox))
        return;

    if (state && state == 0) {
        objParentCheckBox.checked = false;
        objParentCheckBox.indeterminate = true;
    }
    else {
        if (IsMyChildCheckBoxsChecked(objParentNode)) {
            objParentCheckBox.indeterminate = false;
            objParentCheckBox.checked = true;
            state = 1;
        }
        else {
            objParentCheckBox.checked = false;
            objParentCheckBox.indeterminate = true;
            state = 0;
        }
    }
    setParentChecked(objParentCheckBox, state);
}

//当父节点的所有子节点都未被选中时,设置父节点 UnChecked
// state取0, 1分别为三态，不选
function setParentUnChecked(currCheckBox, state) {
    var objParentNode = public_GetParentNode(currCheckBox);
    if (public_IsObjectNull(objParentNode))
        return;

    var objParentCheckBox = public_Node2CheckBox(objParentNode);
    if (!public_IsCheckBox(objParentCheckBox))
        return;

    if (state && state == 0) {
        objParentCheckBox.checked = false;
        objParentCheckBox.indeterminate = true;
    }
    else {
        //判断 currCheckBox 的同级节点是否都为 UnChecked.
        if (IsMyChildCheckBoxsUnChecked(objParentNode)) {
            objParentCheckBox.checked = false;
            objParentCheckBox.indeterminate = false;
            state = 1;
        }
        else {
            objParentCheckBox.checked = false;
            objParentCheckBox.indeterminate = true;
            state = 0;
        }
    }

    setParentUnChecked(objParentCheckBox, state);
}

//设置节点的子节点 UnChecked
function setChildUnChecked(currObj) {
    var currNode;
    if (public_IsCheckBox(currObj)) {
        currNode = public_CheckBox2Node(currObj);
        if (public_IsObjectNull(currNode))
            return;
    }
    else
        currNode = currObj;

    var currNodeChilds = currNode.childNodes;
    var count = currNodeChilds.length;
    for (var i = 0; i < count; i++) {
        var childCheckBox = currNodeChilds[i];
        if (public_IsCheckBox(childCheckBox)) {
            childCheckBox.checked = false;
            childCheckBox.indeterminate = false;
        }
        setChildUnChecked(childCheckBox);
    }
}

//设置节点的子节点 Checked
function setChildChecked(currObj) {
    var currNode;
    if (public_IsCheckBox(currObj)) {
        currNode = public_CheckBox2Node(currObj);
        if (public_IsObjectNull(currNode))
            return;
    }
    else
        currNode = currObj;

    var currNodeChilds = currNode.childNodes;
    var count = currNodeChilds.length;
    for (var i = 0; i < count; i++) {
        var childCheckBox = currNodeChilds[i];
        if (public_IsCheckBox(childCheckBox)) {
            childCheckBox.checked = true;
            childCheckBox.indeterminate = false;
        }
        setChildChecked(childCheckBox);
    }
}

//判断该节点的子节点是否都为 UnChecked
function IsMyChildCheckBoxsUnChecked(currObj) {
    var retVal = true;
    var currNode;
    if (public_IsCheckBox(currObj) && currObj.checked == true) {
        return false;
    }
    else
        currNode = currObj;

    var currNodeChilds = currNode.childNodes;
    var count = currNodeChilds.length;
    for (var i = 0; i < count; i++) {
        if (retVal == false)
            break;
        var childCheckBox = currNodeChilds[i];
        if (public_IsCheckBox(childCheckBox) && childCheckBox.checked == true) {
            retVal = false;
            break;
        }
        else
            retVal = IsMyChildCheckBoxsUnChecked(childCheckBox);
    }
    return retVal;
}

//判断该节点的子节点是否都为 Checked
// 注意：currObj 不是 checkbox
function IsMyChildCheckBoxsChecked(currObj) {
    var retVal = true;
    var currNode = currObj;
    var currNodeChilds = currNode.childNodes;
    var count = currNodeChilds.length;
    for (var i = 0; i < count; i++) {
        var childCheckBox = currNodeChilds[i];
        if (public_IsCheckBox(childCheckBox) && childCheckBox.checked == false) {
            retVal = false;
            break;
        }
        else {
            retVal = IsMyChildCheckBoxsChecked(childCheckBox);
            if (!retVal) break;
        }
    }
    return retVal;
}