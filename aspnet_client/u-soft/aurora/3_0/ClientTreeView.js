/***********************************************************
ClientTreeView class created by JScript

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 2.0
Created: 2005.07.23
Last Updated: 2005.08.19 10:59

Caution:
	1. The file depended on ClientTreeView.cs each other.

History:
	1. The code created at 2005.07.23
	2. Basic function was completed. [2005.08.19]
	3. Support darg&drop feature. [2006.08.21]

***********************************************************/
	
function ClientTreeView() {}

function ClientTreeView.Initialize(controlId)
{
	if ( !controlId )
	{
		return;
	}

	var control = document.getElementById(controlId);
	
	control.SelectedNodes = this.GetAllSelectedNodes(control);
	control.CheckedNodes = this.GetAllCheckedNodes(control);

	control.onclick = function()
	{
		try
		{
			ClientTreeView.ContentOnClick(this);
		}catch(e){}
	};
	if ( BooleanHelper.Parse(control.AllowDragDrop) )
	{
		control.onselectstart = function()
		{
			var node = ClientTreeView.GetTreeNodeByEvent(event);
			if ( node )
			{
				var isDragDrop = BooleanHelper.Parse(node.AllowDragDrop);
				if ( node && isDragDrop && node.__PreviousEventType == 'mousedown' )
				{
					node.__PreviousEventType = null;
					return true;
				}
				return false;
			}
		};
		control.ondragstart = function()
		{
			try
			{
				ClientTreeView.ContentDragStart(this);
			}catch(e){}
		};
		control.ondragover = function()
		{
			event.returnValue = false;
			event.dataTransfer.dropEffect = 'move';
		};
		control.ondragend = function()
		{
			try
			{
				ClientTreeView.ContentDragEnd(this);
			}
			catch(e){}
			return false;
		};
	}
	control.onmousedown = function()
	{
		try
		{
			ClientTreeView.ContentMouseDown(this);
		}catch(e){}
	};
	control.onmouseover = function()
	{
		try
		{
			ClientTreeView.ContentMouseOver(this);
		}catch(e){}
	};
	control.onmouseout = function()
	{
		try
		{
			ClientTreeView.ContentMouseOut(this);
		}catch(e){}
	};
	control.onkeydown = function()
	{
		try
		{
			ClientTreeView.ContentKeyDown(this);
		}catch(e){}
	};

	// this.AttachEvents(tree);
};

function ClientTreeView.ContentMouseOver(elmt)
{
	var evt = elmt.document.parentWindow.event;
	var div = FindChildElement(evt.srcElement, 'DIV');
	if ( div )
	{
		var span = div.children(div.children.length-1);
		span.runtimeStyle.textDecoration = 'underline';
	}
	var node = FindParentElement(div, 'TR');
	if ( node && node.ClientMouseOver )
	{
		this.FireClientEvent(node, 'ClientMouseOver', evt);
	}
};

function ClientTreeView.ContentMouseOut(elmt)
{
	var evt = elmt.document.parentWindow.event;
	var div = FindChildElement(evt.srcElement, 'DIV');
	if ( div )
	{
		var span = div.children(div.children.length-1);
		span.runtimeStyle.textDecoration = '';
	}
};

function ClientTreeView.ContentMouseDown(elmt)
{
	var evt = elmt.document.parentWindow.event;
	var node = this.GetTreeNodeByEvent(evt)
	if ( node )
	{
		this.UnselectedAll(elmt);
		if ( !this.SetSelected(node, true) )
		{
			this.OpIconClicked(FindChildElement(node, 'IMG'));
		}
		
		if ( BooleanHelper.Parse(node.AllowDragDrop) && evt.button == 1 && evt.srcElement.tagName == 'SPAN')
		{
			var body = node.document.body;
			if ( body.onselectstart )
			{
				body.__onselectstart = body.onselectstart;
				body.onselectstart = null;
			}
			node.__PreviousEventType = evt.type;
			var range = elmt.document.body.createTextRange();
			var span = FindChildElement(node, 'SPAN');
			range.moveToElementText(span);
			range.select();
			evt.cancelBubble = true;
			if ( body.__onselectstart )
			{
				body.onselectstart = body.__onselectstart;
				body.__onselectstart = null;
			}
		}

		// status = 'Selected Nodes Count: ' + elmt.SelectedNodes.length;
	}
};

function ClientTreeView.ContentOnClick(elmt)
{
	var evt = elmt.document.parentWindow.event;
	var srcElement = evt.srcElement;
	if ( srcElement.tagName == 'IMG' && srcElement.ActType == 'OpIcon' )
	{
		this.OpIconClicked(srcElement);
	}
	if ( srcElement.tagName == 'INPUT' )
	{
		this.CheckBoxClicked(srcElement);
	}
	
	
};

function ClientTreeView.ContentDragStart(elmt)
{
	var evt = elmt.document.parentWindow.event;
	var node = this.GetTreeNodeByEvent(evt);
	if ( node )
	{
		// evt.dataTransfer.effectAllowed = 'copyMove';
		if ( !node.ClientDragStart )
		{
			evt.dataTransfer.setData('text', node.innerText);
		}
		else
		{
			this.FireClientEvent(node, 'ClientDragStart', evt);
		}
	}
};

function ClientTreeView.ContentDragEnd(elmt)
{
	var doc = elmt.document;
	var range = doc.body.createTextRange();
	if ( !doc.body.__SelectionParkForTreeNode )
	{
		var span = doc.createElement('SPAN');
		doc.body.appendChild(span);
		span.style.position = 'absolute';
		span.style.display = 'none';
		doc.body.__SelectionParkForTreeNode = span;
	}
	range.moveToElementText(doc.body.__SelectionParkForTreeNode);
	range.select();
	
	var evt = elmt.document.parentWindow.event;
	var node = this.GetTreeNodeByEvent(evt);
	if ( node )
	{
		this.FireClientEvent(node, 'ClientDragEnd', evt);
	}
};

function ClientTreeView.ContentKeyDown(elmt)
{
	var evt = elmt.document.parentWindow.event;
	var keyCode = evt.keyCode;
	if ( keyCode == 0x1B )
	{
		if ( elmt.SelectedNodes.length > 0 )
		{
			this.UnselectedAll(elmt);
		}
	}
	else if ( elmt.SelectedNodes.length == 0 )
	{
		if ( keyCode == 0x26 || keyCode == 0x28 )
		{
			var nodes = this.GetTreeNodes(elmt.children(0));
			if ( nodes.length > 0 )
			{
				this.SetSelected(nodes[0], true);
				evt.cancelBubble = true;
				evt.returnValue = false;
			}
		}
	}
	else if ( elmt.SelectedNodes.length > 1 )
	{
		if ( keyCode == 0x26 || keyCode == 0x28 )
		{
			var nodes = elmt.SelectedNodes;
			var node = null;
			if ( keyCode == 0x26 )
			{
				node = nodes[0];
			}
			else
			{
				node = nodes[nodes.length-1];
			}
			this.UnselectedAll(elmt);
			this.SetSelected(node, true);
			evt.cancelBubble = true;
			evt.returnValue = false;
		}
	}
	else
	{
		// TODO: move up or down...
		
	}
	if ( keyCode == 0x20 )
	{
		var nodes = elmt.SelectedNodes;
		if ( nodes.length > 0 )
		{
			var bAllChecked = true;
			for ( var i=0 ; i < nodes.length ; ++i )
			{
				bAllChecked &= this.GetChecked(nodes[i]);
			}
			var nodeCount = nodes.length;
			for ( var i=0 ; i < nodeCount ; ++i )
			{
				this.SetChecked(nodes[i], !bAllChecked);
			}
			evt.cancelBubble = true;
			evt.returnValue = false;
		}
	}
};

function ClientTreeView.OpIconClicked(opIcon)
{
	var node = FindParentElement(opIcon, 'TR');
	if ( this.GetChildTree(node) )
	{
		if ( this.IsChildExpanded(node) )
		{
			this.CollapseChildTree(node);
		}
		else
		{
			this.ExpandChildTree(node);
		}
		this.UpdateOpIcon(node);
	}
};

function ClientTreeView.CheckBoxClicked(chkb)
{
	var node = FindParentElement(chkb, 'TR');
	this.SetChecked(node, chkb.checked);
	this.ScrollToView(node);
	
	var elmt = this.GetClientTreeView(node);
	// status = 'Checked Nodes Count: ' + elmt.CheckedNodes.length;
};

function ClientTreeView.UnselectedAll(treeView)
{
	var selects = treeView.SelectedNodes;
	var selectsCount = selects.length;
	for ( var i=0 ; i < selectsCount ; ++i )
	{
		this.SetSelected(selects[0], false);
	}
	treeView.SelectedNodes = [];
};

function ClientTreeView.UpdateOpIcon(node)
{
	var iconName = this.GetOpIconName(node);
	var img = node.cells(0).children(0);
	var path = img.src.substr(0, img.src.lastIndexOf('/')+1);
	img.src = path + iconName + '.gif';
};

function ClientTreeView.UpdateIcon(node, path)
{
	var div = node.all.tags('DIV')[0];
	var img = div.childNodes[0];
	if ( img && img.tagName == 'IMG' )
	{
		img.src = path;
	}
};

function ClientTreeView.IsFirstNode(node)
{
	return !node.previousSibling;
};

function ClientTreeView.IsLastNode(node)
{
	return !node.nextSibling.nextSibling;
};

function ClientTreeView.GetTree(node)
{
	return node.parentElement.parentElement;
};

function ClientTreeView.GetParentTreeNode(elmt)
{
	if ( elmt && ( elmt.ActType == 'Tree' || elmt.ActType == 'TreeNode' ) )
	{
		var tree = elmt;
		if ( elmt.ActType == 'TreeNode' )
		{
			tree = this.GetTree(elmt);
		}
		return tree.parentElement.parentElement.previousSibling;
	}
}

function ClientTreeView.IsRootHierarchy(tree)
{
	return tree.parentElement.tagName == 'SPAN';
};

function ClientTreeView.GetOpIconName(node)
{
	var iconName;
	var isRoot = this.IsRootHierarchy(this.GetTree(node));
	var nodeCount = this.GetTreeNodes(this.GetTree(node)).length;
	if ( ( nodeCount > 1 ) && !this.IsLastNode(node) )
	{
		if ( !this.GetChildTree(node) )
		{
			if ( this.IsFirstNode(node) && isRoot )
			{
				iconName = 'TopLine';
			}
			else
			{
				iconName = 'MiddleCrossLine';
			}
		}
		else
		{
			if ( this.IsChildExpanded(node) )
			{
				if ( this.IsFirstNode(node) && isRoot )
				{
					iconName = 'TopMinus';
				}
				else
				{
					iconName = 'MiddleMinus';
				}
			}
			else
			{
				if ( this.IsFirstNode(node) && isRoot )
				{
					iconName = 'TopPlus';
				}
				else
				{
					iconName = 'MiddlePlus';
				}
			}
		}
	}
	else
	{
		if ( !this.GetChildTree(node) )
		{
			if ( this.IsFirstNode(node) && isRoot )
			{
				iconName = 'SingleNode';
			}
			else
			{
				iconName = 'BottomLine';
			}
		}
		else
		{
			if ( this.IsChildExpanded(node) )
			{
				if ( this.IsFirstNode(node) && isRoot )
				{
					iconName = 'SingleMinus';
				}
				else
				{
					iconName = 'BottomMinus';
				}
			}
			else
			{
				if ( this.IsFirstNode(node) && isRoot )
				{
					iconName = 'SinglePlus';
				}
				else
				{
					iconName = 'BottomPlus';
				}
			}
		}
	}
	return iconName;
};

function ClientTreeView.GetSelectedNodes(tree)
{
	var selectedNodes = [];
	var nodes = this.GetTreeNodes(tree);
	for ( var i=0 ; i < nodes.length ; ++i )
	{
		var node = nodes[i];
		if ( this.GetSelected(node) )
		{
			selectedNodes.push(node);
		}
		var childTree = this.GetChildTree(node);
		if ( childTree )
		{
			var selects = this.GetSelectedNodes(childTree);
			selectedNodes = selectedNodes.concat(selects);
		}
	}
	return selectedNodes;
};

function ClientTreeView.GetCheckedNodes(tree)
{
	var checkedNodes = [];
	var nodes = this.GetTreeNodes(tree);
	for ( var i=0 ; i < nodes.length ; ++i )
	{
		var node = nodes[i];
		var childTree = this.GetChildTree(node);
		if ( childTree )
		{
			var checks = this.GetCheckedNodes(childTree);
			checkedNodes.concat(checks);
		}
		if ( this.GetChecked(node) )
		{
			checkedNodes.push(node);
		}
	}
	return checkedNodes;
};

function ClientTreeView.GetAllSelectedNodes(treeView)
{
	return this.GetSelectedNodes(treeView.children(0));
};

function ClientTreeView.GetAllCheckedNodes(treeView)
{
	return this.GetCheckedNodes(treeView.children(0));
};

function ClientTreeView.GetTreeNodes(tree)
{
	var nodes = [];
	for ( var i=0 ; i < tree.rows.length ; i+=2 )
	{
		nodes.push(tree.rows(i));
	}
	return nodes;
};

function ClientTreeView.GetChildTree(node)
{
	var children = node.nextSibling.cells(1).children;
	if ( children.length )
	{
		return children(0);
	}
	else
	{
		return null;
	}
};

function ClientTreeView.IsChildExpanded(node)
{
	return node.nextSibling.currentStyle.display != 'none';
};

function ClientTreeView.ExpandChildTree(node)
{
	node.nextSibling.runtimeStyle.display = 'inline';
	if ( node.ExpandIcon )
	{
		this.UpdateIcon(node, node.ExpandIcon);
	}
};

function ClientTreeView.CollapseChildTree(node)
{
	node.nextSibling.runtimeStyle.display = 'none';
	if ( node.CollapseIcon )
	{
		this.UpdateIcon(node, node.CollapseIcon);
	}
};

function ClientTreeView.GetChecked(node)
{
	var chkb = node.children(1).children(0);
	if ( chkb.tagName == 'INPUT' )
	{
		return chkb.checked;
	}
	return false;
};

function ClientTreeView.SetChecked(node, isChecked)
{
	var content = node.cells(1);
	var chkb = content.children(0);
	if ( chkb.tagName == 'INPUT' )
	{
		chkb.checked = isChecked;
		var div = content.children(content.children.length-1);
		var elmtText = div.children(div.children.length-1);

		var attributes = this.GetClientTreeView(node);
		if ( !this.GetSelected(node) )
		{
			if ( isChecked )
			{
				elmtText.runtimeStyle.color = attributes.CheckedForeColor;
				elmtText.runtimeStyle.backgroundColor = attributes.CheckedBackColor;
			}
			else
			{
				elmtText.runtimeStyle.color = attributes.NormalForeColor;
				elmtText.runtimeStyle.backgroundColor = attributes.NormalBackColor;
			}
		}
		if ( isChecked )
		{
			attributes.CheckedNodes.push(node);
		}
		else
		{
			attributes.CheckedNodes.remove(node);
		}
	}
};

function ClientTreeView.GetSelected(node)
{
	return node.Selected;
};

function ClientTreeView.SetSelected(node, isSelected)
{
	if ( !node.Selected == !isSelected || node.Unselectable )
	{
		return false;
	}
	node.Selected = isSelected;
	var content = node.cells(1);
	var div = content.children(content.children.length-1);
	var elmtText = div.children(div.children.length-1);

	var attributes = this.GetClientTreeView(node);
	if ( isSelected )
	{
		elmtText.runtimeStyle.color = attributes.SelectedForeColor;
		elmtText.runtimeStyle.backgroundColor = attributes.SelectedBackColor;
		attributes.SelectedNodes.push(node);
		this.ScrollToView(node);
	}
	else
	{
		if ( this.GetChecked(node) )
		{
			elmtText.runtimeStyle.color = attributes.CheckedForeColor;
			elmtText.runtimeStyle.backgroundColor = attributes.CheckedBackColor;
		}
		else
		{
			elmtText.runtimeStyle.color = attributes.NormalForeColor;
			elmtText.runtimeStyle.backgroundColor = attributes.NormalBackColor;
		}
		attributes.SelectedNodes.remove(node);
	}
	this.FireClientEvent(node, 'ClientSelectedEvent', isSelected);
	return true;
};

function ClientTreeView.GetClientTreeView(elmt)
{
	do
	{
		elmt = elmt.parentElement;
	}	
	while( elmt.tagName != 'SPAN' && elmt.ActType != 'ClientTreeView' );
	return elmt;
};

function ClientTreeView.GetTreeNodeByEvent(evt)
{
	var srcElmt = evt.srcElement;
	if ( srcElmt.tagName == 'DIV' || srcElmt.parentElement.tagName == 'DIV' )
	{
		var node = FindParentElement(srcElmt, 'TR');
		if ( node && node.ActType == 'TreeNode' )
		{
			return node;
		}
	}
};

function ClientTreeView.GetTreeNodeByAttribute(elmt, attribute, value)
{
	var ctv = this.GetClientTreeView(elmt);
	var nodes = ctv.all.tags('TR');
	for ( var i=0 ; i < nodes.length ; ++i )
	{
		if ( nodes[i].ActType == 'TreeNode' )
		{
			if ( nodes[i][attribute] == value )
			{
				return nodes[i];
			}
		}
	}
}

function ClientTreeView.GetTreeNodesByAttribute(elmt, attribute, value)
{
	var ctv = this.GetClientTreeView(elmt);
	var nodes = ctv.all.tags('TR');
	var matchedNodes = [];
	for ( var i=0 ; i < nodes.length ; ++i )
	{
		if ( nodes[i].ActType == 'TreeNode' )
		{
			if ( nodes[i][attribute] == value )
			{
				matchedNodes.push(nodes[i]);
			}
		}
	}
	return matchedNodes;
}

function ClientTreeView.SetStaticCheck(node, staticCheck, isBoldNormal)
{
	if ( node && node.ActType == 'TreeNode' )
	{
		if ( node.StaticCheck )
		{
			var img = node.cells(1).childNodes[0];
			SwapImage(img, node.StaticCheck, staticCheck);
			node.StaticCheck = staticCheck;
			var span = FindChildElement(node, 'SPAN');
			if ( !isBoldNormal && ( node.StaticCheck == 'Checked' || node.StaticCheck == 'Indeterminate' ) )
			{
				span.runtimeStyle.fontWeight = 'bold';
			}
			else
			{
				span.runtimeStyle.fontWeight = '';
			}
		}
		else
		{
		    if( !isBoldNormal && staticCheck == 'Checked' )
		    {
		        node.isBold = true;
		        node.runtimeStyle.fontWeight = 'bold';
		    }
		    else
		    {
		        node.isBold = false;
		        node.runtimeStyle.fontWeight = '';
		    }
		}
	}
}

function ClientTreeView.BubbleUpCheck(node)
{
	var parentNode = this.GetParentTreeNode(node);
	if ( parentNode )
	{
		var allChecked = true;
		var allUnchecked = false;
		var nodes = this.GetTreeNodes(this.GetTree(node));
		for ( var i=0 ; i < nodes.length ; ++i )
		{
			var node = nodes[i];
			var isChecked = node.StaticCheck == 'Checked' || node.isBold;
			allChecked &= isChecked;
			allUnchecked |= isChecked;
		}
		if ( allChecked )
		{
			this.SetStaticCheck(parentNode, 'Checked');
		}
		else if ( !allUnchecked )
		{
			this.SetStaticCheck(parentNode, 'Unchecked');
		}
		else
		{
			do
			{
				this.SetStaticCheck(parentNode, 'Indeterminate');
			}
			while(parentNode = this.GetParentTreeNode(parentNode) )
		}
	}
	return parentNode;
}

function ClientTreeView.ScrollToView(node)
{
	var treeView = this.GetClientTreeView(node);
	if ( treeView )
	{
		var rectTop = treeView.getBoundingClientRect().top;
		var rectBottom = rectTop + treeView.clientHeight;
		var nodeTop = node.getBoundingClientRect().top;
		var nodeBottom = nodeTop + node.clientHeight;
		if ( treeView.clientHeight > node.clientHeight )
		{
			var curScrollTop = parseInt(treeView.scrollTop);
			if ( rectTop > nodeTop )
			{
				treeView.scrollTop = curScrollTop - (rectTop - nodeTop);
			}
			if ( rectBottom < nodeBottom )
			{
				treeView.scrollTop = curScrollTop + (nodeBottom - rectBottom);
			}
		}
	}
};

function ClientTreeView.FireClientEvent(elmt, clientEvent, args)
{
	if ( !elmt[clientEvent] ) // need refact
	{
		return false;
	}
	if ( typeof elmt[clientEvent] != 'function' )
	{
		var codeBody = elmt[clientEvent].replace(/"/g, '\\"');
		codeBody = codeBody.replace(/\r/g, '\\r').replace(/\n/g, '\\n');
		var literalFunction = 'new Function("argument", "' + codeBody + '")';
		elmt[clientEvent] = eval(literalFunction);
	}
	elmt[clientEvent](args);
}