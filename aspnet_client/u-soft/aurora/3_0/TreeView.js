/***********************************************************
TreeView class created by JScript

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 2.0
Created: 2005.03.12 02:35
Last Updated: 2005.09.07 14:29

Todo:
	1. All functions call SetCheck() must handle return value. [2005.08.09]

History:
	1. The code created at 2005.03.12
	2. Basic function was completed. [2005.03.13]
	3. Dynamic load child nodes feature was completed. [2005.03.31]
	4. Implement event support on TreeNode. [2005.04.06]
	5. Fix bug, child tree loaded dynamic while has no node. [2005.04.23]
	6. Add operation icon path customize feature. [2005.05.16]
	7. If has no checkbox on node, do not checked it. [2005.06.03]
	8. Add reload child nodes method named ReloadNodes. [2005.07.02]
	9. Modify Tree.Render method, add subtree node to every node.
	10. Optimize tree render performance, add IsChildRendered flag.[2005.07.16]
	11. Refact the multiple selection features. [2005.07.21]
	12. Modify SetCheck function to return value. [2005.08.09]
	13. Fix variable 'm_LastSelected' equal null bug. [2005.09.07]
	14. Add max count of children node limited. [2006.05.15]
	15. Support Drag & Drop ability on tree node. [2006.05.16]

***********************************************************/

__GlobalTreeCache__ =
{
	m_Count : 0,
	m_IdPrefix : "__TreeObject__",

	NewId : function()
	{
		return this.m_IdPrefix + this.m_Count++;
	},

	Remove : function(mi)
	{
		delete this[mi.m_Id];
		this.m_Count--;
	},
	
	Dispose : function()
	{
		for ( var key in this )
		{
			this.Remove(this[key]);
		}
	}
};

function TreeInnerCache()
{
	this.m_Selecteds = new CollectionBase();
	this.m_Checkeds = new CollectionBase();

	this.m_LastSelected = null;

	this.toString = function()
	{
		return '[class TreeInnerCache]';
	}
}

TreeInnerCache.prototype.UnselectAll = function()
{
	for ( var i=0 ; i < this.m_Selecteds.m_Count ; )
	{
		var node = this.m_Selecteds.Items(0);
		node.SetSelected(false);
	}
};

TreeInnerCache.prototype.UncheckedAll = function()
{
	for ( var i=0 ; i < this.m_Checkeds.m_Count ; )
	{
		var node = this.m_Checkeds.Items(0);
		node.SetChecked(false);
	}
};

function TreeStyle()
{
	this.m_NormalForeColor = 'windowtext';
	this.m_NormalBackColor = 'window';
	this.m_SelectedForeColor = 'highlighttext';
	this.m_SelectedBackColor = 'highlight';
	this.m_CheckedForeColor = 'green';
	this.m_CheckedBackColor = 'window';

	this.toString = function()
	{
		return '[class TreeStyle]';
	};
}

TreeStyle.OpIconPath = 'Skins/Square/3DBlue/';

TreeStyle.OpIcon = function(imageName)
{
	return TreeStyle.OpIconPath + imageName + '.gif'; 
};

function TreeAttribute()
{
	this.m_TextIndent = 2;
	this.m_HasCheckBox = true;
	this.m_IsMultipleSelected = false;
	this.m_ClientId = 'CID';
	this.m_ServerId = 'NID';
	this.m_TypeId = 'TYP';
	this.m_HasStaticRoot = false;
	this.m_HideSingleRoot = false;
	this.m_MaxChildrenForbidden = Number.MAX_VALUE; // 512;
	this.m_MaxChildrenWarning = 128;
	this.m_MoreNodesCount = 200;
	this.m_AllowDragDrop = false;

	this.m_Url = 'http://s.h.i.t/TreeView/GetTreeNodes.aspx';

	this.toString = function()
	{
		return '[class TreeAttribute]';
	};
}

function Tree(attribute, style, cache)
{
	this.Extends(CollectionBase);
	this.m_Nodes = this.m_InnerArray;

	this.m_ParentNode = null;
	this.m_ActiveNode = null;
	this.m_Element = null;
	this.m_Container = null;
	this.m_IsEventAttached = false;
	this.m_Id = __GlobalTreeCache__.NewId();
	__GlobalTreeCache__[this.m_Id] = this;
	
	this.m_Attributes = attribute ? attribute : new TreeAttribute();
	this.m_Styles = style ? style : new TreeStyle();
	this.m_InnerCache = cache ? cache : new TreeInnerCache();
	
	// this.m_InnerCache[this.m_Id] = this;

	this.InsertAt = function(node, index)
	{
		this.base.InsertAt.Call(this, node, index);
		node.m_Tree = this;
		this.ApplySingleton(); 
	};  
	    
	this.toString = function()
	{
		return '[class Tree]';
	};  
}

Tree.prototype.ApplySingleton = function()
{
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var node = this.Items(i);
		if ( node.m_ChildTree && node.m_ChildTree !== true )
		{
			var subtree = node.m_ChildTree;
			subtree.m_ParentNode = node;
			subtree.m_Styles = this.m_Styles;
			subtree.m_Attributes = this.m_Attributes;
			subtree.m_InnerCache = this.m_InnerCache;
			node.m_ChildTree.ApplySingleton();
		}
	}
};

Tree.prototype.Show = function(elmt)
{
	if ( !elmt || !elmt.tagName )
	{
		return;
	}

	var doc = elmt.document;
	elmt.appendChild(this.Render(doc));

	elmt.tabIndex = 1;
	// this.m_Container = elmt;
	elmt.Object = this;
	elmt.Comment = 'Tree';
	elmt.runtimeStyle.overflow = 'auto';
	if ( !this.Attributes('AllowDragDrop' ) )
	{
		elmt.onselectstart = function() { return false; };
	}
	else
	{
		elmt.ondragover = function()
		{
			event.returnValue = false;
			event.dataTransfer.dropEffect = 'move';
		};
	}
	elmt.onkeydown = Tree.__ContainerOnKeyDown;
};

Tree.prototype.Attributes = function(key)
{
	return this.m_Attributes['m_' + key];
};

Tree.__ContainerOnKeyDown = function()
{
	var evt = this.document.parentWindow.event;
	var keyCode = evt.keyCode;
	var innerCache = null;
	if ( evt.srcElement.Comment == 'Tree' )
	{
		innerCache = evt.srcElement.Object.m_InnerCache;
	}
	else
	{
		var elmtNode = FindParentElement(evt.srcElement, 'TR');
		if ( !elmtNode || !elmtNode.Object )
		{
			return; // loading 鎻愮ず鑺傜偣琚偣鍑荤殑鎯呭喌瑕佸拷鐣?
		}
		innerCache = elmtNode.Object.m_Tree.m_InnerCache;
	}
	if ( innerCache.m_Selecteds.m_Count == 0 )
	{
		return;
	}
	else
	{
		// 濡傛灉琚€夋嫨鑺傜偣鏄瀯寤篢reeView鏃惰缃殑锛宮_LastSelected灏变负绌恒€?
		if ( !innerCache.m_LastSelected )
		{
			innerCache.m_LastSelected = innerCache.m_Selecteds.Items(0);
		}
	}
	var currentNode = innerCache.m_LastSelected;
	var divRect = this.getBoundingClientRect();
	var scrollContainerRect = this;
	if ( this.scrollHeight == this.offsetHeight )
	{
		scrollContainerRect = this.parentElement;
	}
	switch(keyCode)
	{
		case 38 : // Up
		{
			var previousNode = currentNode;
			if ( !evt.shiftKey || !currentNode.Attributes('IsMultipleSelected') )
			{
				if ( currentNode.m_OffsetCount !== undefined )
				{
					if ( currentNode.m_OffsetCount < 0 )
					{
						for ( var i=0 ; i > currentNode.m_OffsetCount ; --i )
						{
							previousNode = previousNode.GetPreviousRowNode();
						}
					}
					else
					{
						for ( var i=0 ; i < currentNode.m_OffsetCount ; ++i )
						{
							previousNode = previousNode.GetNextRowNode();
						}
					}
					currentNode.m_OffsetCount = undefined;
				}
				else
				{
					var tempNode = currentNode.GetPreviousRowNode();
					if ( tempNode )
					{
						previousNode = tempNode;
					}
				}
				if ( previousNode )
				{
					if ( innerCache.m_Selecteds.m_Count == 1 )
					{  
						currentNode.SetSelected(false);
					}
					else
					{
						innerCache.UnselectAll(); 
					}
					previousNode.SetSelected(true);
					innerCache.m_LastSelected = previousNode;
					currentNode.m_OffsetCount == undefined;
				}
			}
			else
			{
				if ( currentNode.m_OffsetCount == undefined )
				{
					currentNode.m_OffsetCount = 0;
				}
				if ( currentNode.m_OffsetCount > 0 )
				{
					var tempNode = currentNode.GetNextRowNode();
					for ( var i=0 ; i < currentNode.m_OffsetCount-1 ; ++i )
					{
						tempNode = tempNode.GetNextRowNode();
					}
					nextNode = tempNode.GetPreviousRowNode();
					tempNode.SetSelected(false);
					currentNode.m_OffsetCount--;
				}
				else
				{
					var tempNode = currentNode.GetPreviousRowNode();
					if ( tempNode )
					{
						previousNode = tempNode;
						for ( var i=0 ; i > currentNode.m_OffsetCount ; --i )
						{
							tempNode = tempNode.GetPreviousRowNode();
							if ( tempNode )
							{
								previousNode = tempNode;
							}
						}
						if ( tempNode && previousNode != currentNode )
						{
							previousNode.SetSelected(true);
							currentNode.m_OffsetCount--;
						}
					}
				}
				// status = currentNode.m_OffsetCount;
			}
			// status += ', ' + previousNode.m_Text;

			// previousNode.SetSelected(true);
			// innerCache.m_LastSelected = previousNode;
			if ( previousNode != currentNode )
			{
				evt.cancelBubble = true;
				evt.returnValue = null;
			}

			var nodeRect = previousNode.m_Element.getBoundingClientRect();
			var nodeOffset = nodeRect.top - divRect.top -1;
			if ( nodeOffset < 0 )
			{
				scrollContainerRect.scrollTop += nodeOffset;
			}
			var divHeight = divRect.bottom - divRect.top - 1;
			if ( nodeOffset > divHeight )
			{
				var nodeHeight = nodeRect.bottom-nodeRect.top;
				scrollContainerRect.scrollTop += nodeOffset-divHeight+nodeHeight;
			}
			break;
		}
		case 40 : // Down
		{
			var nextNode = currentNode;
			if ( !evt.shiftKey || !currentNode.Attributes('IsMultipleSelected') )
			{
				if ( currentNode.m_OffsetCount !== undefined )
				{
					if ( currentNode.m_OffsetCount < 0 )
					{
						for ( var i=0 ; i > currentNode.m_OffsetCount ; --i )
						{
							nextNode = nextNode.GetPreviousRowNode();
						}
					}
					else
					{
						for ( var i=0 ; i < currentNode.m_OffsetCount ; ++i )
						{
							nextNode = nextNode.GetNextRowNode();
						}
					}
					currentNode.m_OffsetCount = undefined;
				}
				else
				{
					var tempNode = currentNode.GetNextRowNode();
					if ( tempNode )
					{
						nextNode = tempNode;
					}
				}
				if ( nextNode )
				{
					if ( innerCache.m_Selecteds.m_Count == 1 )
					{  
						currentNode.SetSelected(false);
					}
					else
					{
						innerCache.UnselectAll();
					}
					nextNode.SetSelected(true);
					innerCache.m_LastSelected = nextNode;
				}
			}
			else
			{
				if ( currentNode.m_OffsetCount == undefined )
				{
					currentNode.m_OffsetCount = 0;
				}
				if ( currentNode.m_OffsetCount < 0 )
				{
					var tempNode = currentNode.GetPreviousRowNode();
					for ( var i=0 ; i > currentNode.m_OffsetCount+1 ; --i )
					{
						tempNode = tempNode.GetPreviousRowNode();
					}
					nextNode = tempNode.GetNextRowNode();
					tempNode.SetSelected(false);
					currentNode.m_OffsetCount++;
				}
				else
				{
					var tempNode = currentNode.GetNextRowNode();
					if ( tempNode )
					{
						nextNode = tempNode;
						for ( var i=0 ; i < currentNode.m_OffsetCount ; ++i )
						{
							tempNode = tempNode.GetNextRowNode();
							if ( tempNode )
							{
								nextNode = tempNode;
							}
						}
						if ( tempNode && nextNode != currentNode )
						{
							nextNode.SetSelected(true);
							currentNode.m_OffsetCount++;
						}
					}
				}
				// status = currentNode.m_OffsetCount;
			}
			// status += ', ' + nextNode.m_Text;
			// innerCache.m_LastSelected = nextNode;
			if ( nextNode != currentNode )
			{
				evt.cancelBubble = true;
				evt.returnValue = null;
			}

			var nodeRect = nextNode.m_Element.getBoundingClientRect();
			var nodeOffset = nodeRect.bottom - divRect.bottom;
			if ( nodeOffset > 0 )
			{
				scrollContainerRect.scrollTop += nodeOffset;
			}
			var divHeight = divRect.bottom - divRect.top - 1;
			if ( nodeOffset < -divHeight )
			{
				var nodeHeight = nodeRect.bottom-nodeRect.top;
				scrollContainerRect.scrollTop += nodeOffset-nodeHeight+divHeight;
			}
			break;
		}
		case 107 :
		case 187 : // +
		{
			if ( innerCache.m_Selecteds.m_Count == 1 )
			{
				var activeNode = innerCache.m_Selecteds.Items(0);
				activeNode.Expand(); 
			}
			break;
		}
		case 109 :
		case 189 : // -
		{
			if ( innerCache.m_Selecteds.m_Count == 1 )
			{
				var activeNode = innerCache.m_Selecteds.Items(0);
				if ( activeNode.m_Element.cells(0).style.display != 'none' )
				{
					activeNode.Collapse();
				}
			}
			break;
		}
		case 56 : // 8
		case 106 : // *
		{
			// has bug ... can't expand the second level nodes
			if ( keyCode == 56 && !evt.shiftKey )
			{
				break;
			}
			if ( innerCache.m_Selecteds.m_Count == 1 )
			{
				var activeNode = innerCache.m_Selecteds.Items(0);
				activeNode.ExpandAll();
			}
			break;
		}
		case 32 : // Space
		{
			if ( innerCache.m_Selecteds.m_Count > 0 )
			{
				var bSelected = true; 
				var selects = innerCache.m_Selecteds;
				if ( selects.m_InnerArray[0].Attributes('HasCheckBox') )
				{ 
					for ( var i=0 ; i < selects.m_Count ; ++i )
					{
						var selectedNode = selects.m_InnerArray[i];
						if ( selectedNode.m_HasCheckBox )
						{
							bSelected &= selectedNode.m_Checked;
						}
					}
					bSelected = !bSelected;
					for ( var i=0 ; i < selects.m_Count ; ++i )
					{
						var selectedNode = selects.m_InnerArray[i];
						if ( selectedNode.m_HasCheckBox )
						{
							if ( !selectedNode.SetChecked(bSelected) )
							{
								break;
							}
						}
					}
					evt.cancelBubble = true;
					evt.returnValue = null;
				}
			}
			break;
		}
		case 27 : // Esc
		{
			innerCache.UnselectAll();
			break;
		}
	}
};

Tree.prototype.Render = function(doc)
{
	var tbl = doc.createElement('TABLE');
	tbl.Object = this;
	this.m_Element = tbl;
	tbl.runtimeStyle.cursor = 'default';
	tbl.border = 0;
	tbl.cellSpacing = 0;
	tbl.cellPadding = 0;

	var tbody = doc.createElement('TBODY');
	tbl.appendChild(tbody);

	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var node = this.m_Nodes[i];
		tbody.appendChild(node.Render(doc));
		var trSubTree = doc.createElement('TR');
		trSubTree.runtimeStyle.display = 'none';
		var tdHeader = doc.createElement('TD');
		var tdNode = doc.createElement('TD');
		trSubTree.appendChild(tdHeader);
		trSubTree.appendChild(tdNode);
		if ( !node.IsLastNode() )
		{
			tdHeader.background = TreeStyle.OpIcon('MiddleLine');
		}
		if ( node.m_ChildTree || node.m_IsLazyLoad )
		{ 
			if ( !node.m_IsLazyLoad )
			{
				if ( node.m_IsChildExpanded )
				{
					tdNode.appendChild(node.m_ChildTree.Render(doc));
					node.m_IsLoaded = true;
					node.m_IsChildRendered = true;
					trSubTree.runtimeStyle.display = 'inline';
				}
			}
			else
			{
				if ( node.m_IsLoaded )
				{
					trSubTree.runtimeStyle.display = 'inline';
				}
				else
				{
					trSubTree.runtimeStyle.display = 'none';
				}
			}
		}
		tbody.appendChild(trSubTree);
	}
	if ( this.IsRootLevel() && this.m_Nodes.length == 1 )
	{
		if ( this.Attributes('HideSingleRoot') )
		{
			tbl.rows(0).cells(0).style.display = 'none';
			tbl.rows(1).cells(0).style.display = 'none';
		}
	}
	return tbl;
};

Tree.prototype.Dispose = function()
{
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var node = this.m_Nodes[i];
		node.Dispose();
		delete this.m_Nodes[i];
	}
	for ( var key in this )
	{
		delete this[key];
	}
	
	if ( this.m_Element )
	{
		var tbl = this.m_Element;
		tbl.onselectstart = null;
		this.m_Element.clearAttributes();
		this.m_Element = null;
	}
	if ( !this.m_ParentNode && this.m_Container )
	{
		var elmt = this.m_Container;
		elmt.clearAttributes();
		elmt.onkeydown = '';
		this.m_Container = null;
	}
};

Tree.prototype.IsRootLevel = function()
{
	if ( !this.Attributes('HasStaticRoot') )
	{
		return this.m_ParentNode === null;
	}
	else
	{
		return false;
	}
};

Tree.prototype.GetLastExpandedNode = function()
{
	if ( this.m_ParentNode && this.m_ParentNode.m_IsChildExpanded )
	{
		var lastNode = this.m_Nodes[this.m_Count-1];
		if ( lastNode.m_ChildTree )
		{
			return lastNode.m_ChildTree.GetLastExpandedNode();
		}
		else
		{
			return lastNode;
		}
	}
	else
	{
		return this.m_ParentNode;
	}
};

Tree.prototype.GetFirstExpandedNode = function()
{
	if ( this.m_ParentNode && this.m_ParentNode.m_IsChildExpanded )
	{
		var node = this.m_ParentNode; 
		if ( node.IsLastNode() )
		{
			var node = this.m_ParentNode.m_Tree.GetFirstExpandedNode();
		}
		else
		{
			if ( node )
			{
				return node.m_Tree.m_Nodes[node.m_Tree.IndexOf(node)+1];
			}
			else
			{
				return null;
			}
		}
		return node;
	}
	else
	{
		return null;
	}
};

Tree.prototype.SetChecked = function(isChecked)
{
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		if ( !this.m_Nodes[i].SetChecked(isChecked) )
		{
			return false;
		}
	}
	return true;
};

Tree.prototype.SetAllChecked = function(isChecked)
{
	if ( this.SetChecked(isChecked) )
	{
		for ( var i=0 ; i < this.m_Count ; ++i )
		{
			if ( !this.m_Nodes[i].CheckAllChildren(isChecked) )
			{
				return false;
			}
		}
		return true;
	}
	return false;
};

Tree.prototype.SetAllExpandedChecked = function(isChecked)
{
	if ( this.SetChecked(isChecked) )
	{
		for ( var i=0 ; i < this.m_Count ; ++i )
		{
			if ( this.m_Nodes[i].m_IsChildExpanded )
			{
				if ( !this.m_Nodes[i].CheckAllExpandedChildren(isChecked) )
				{
					return false;
				}
			}
		}
		return true;
	}
	return false;
};

Tree.prototype.RuntimeAdd = function(treeNode)
{
	this.Add(treeNode);
	var doc = this.m_Element.document;
	var lastRow = this.m_Element.rows(this.m_Element.rows.length-1);
	lastRow.insertAdjacentElement('afterEnd', treeNode.Render(doc));
	var elmtNode = lastRow;
	if ( !lastRow.Object )
	{
		elmtNode = lastRow.previousSibling;
		lastRow.cells(0).background = TreeStyle.OpIcon('MiddleLine');
	}
	elmtNode.OpIcon.src = TreeStyle.OpIcon(elmtNode.Object.GetOpIconName());
};

// TODO: coding...
Tree.prototype.RuntimeRemove = function(treeNode)
{
	if ( this.m_Count <= 0 )
	{
		throw new Error("Can't delete the last node.");
	}
	if ( treeNode )
	{
		var index = this.IndexOf(treeNode);
		if ( index == 0 && this.m_Count == 1 )
		{
			
		}
		

		treeNode.Dispose();
		this.Remove(treeNode);
		
	}
};

function TreeNode(text, action, icon, subtree)
{
	this.Extends(TreeNodeBase, text, action, icon, subtree);
	
	this.m_IsEventAttached = false;
	this.m_CanLoad = true;
	this.m_UserData = {};
	
	this.e_Clicked = null;
	this.e_DblClicked = null;
	this.e_PreLoad = null;
	this.e_SelectedChanged = null;
	this.e_CheckedChanged = null;
	this.e_CheckChanging = null;
	this.e_NodeCreating = null;
	this.e_Expanded = null;
	this.e_Collapsed = null;
	this.e_Appended = null;
	this.e_ContextMenu = null;
	this.e_PreDragStart = null;
	this.e_MoreNodes = null;

	this.m_Id = __GlobalTreeCache__.NewId();
	__GlobalTreeCache__[this.m_Id] = this;

	this.toString = function()
	{
		return '[class TreeNode]';
	};
}

TreeNode.prototype.Render = function(doc)
{
	if ( this.m_ServerId === null )
	{
		this.m_ServerId = this.m_Id;
	}
	if ( !this.InnerCache(this.m_ServerId) )
	{
		this.m_Tree.m_InnerCache[this.m_ServerId] = this;
	}

	var tr = this.base.Render.Call(this, doc);

	tr.OpIcon.onclick = TreeNode.__OpIconOnClick;
	if ( tr.CheckBox )
	{
		tr.CheckBox.onclick = TreeNode.__CheckBoxOnClick;
	}

	var tdContent = FindParentElementEx(tr.Content, 'DIV');
	tdContent.onmousedown = TreeNode.__ContentOnMouseDown;
	tdContent.onmouseover = TreeNode.__ContentOnMouseOver;
	tdContent.onmouseout = TreeNode.__ContentOnMosueOut;
	tdContent.onmousemove = TreeNode.__ContentOnMouseMove;
	tdContent.onmouseup = TreeNode.__ContentOnMouseUp;
	tdContent.oncontextmenu = TreeNode.__ContentOnContextMenu;
	tdContent.ondblclick = TreeNode.__ContentDblClicked;
	tdContent.onclick = TreeNode.__ContentClicked;
	
	// drag support events
	tdContent.ondragstart = TreeNode.__ContentDragStart;
	tdContent.ondragend = TreeNode.__ContentDragEnd;
	return tr;
};

TreeNode.prototype.Dispose = function()
{
	__GlobalTreeCache__.Remove(this);
	var innerCache = this.m_Tree.m_InnerCache;
	if ( innerCache )
	{
		innerCache.m_Selecteds.Remove(this);
		innerCache.m_Checkeds.Remove(this);
	}
	innerCache[this.m_ServerId] = null;

	if ( this.m_Element )
	{
		var tr = this.m_Element;
		if ( tr.Content )
		{
			var tdContent = tr.Content;
			tdContent.onmousedown = null;
			tdContent.onmouseover = null;
			tdContent.onmouseout = null;
			tdContent.onmousemove = null;
			tdContent.oncontextmenu = null;
			tdContent.ondblclick = null;
			tdContent.onclick = null;
		}

		tr.OpIcon.onclick = null;
		if ( tr.CheckBox )
		{
			tr.CheckBox.onclick = null;
		}
	}
	if ( this.m_ChildTree && this.m_IsChildRendered )
	{
		this.m_ChildTree.Dispose();
	}
	this.base.Dispose.Call(this);
};

TreeNode.__ContentDragStart = function()
{
	var node = FindParentElement(this, 'TR').Object;
	if ( node )
	{
		var dt = event.dataTransfer;
		dt.effectAllowed = 'copyMove';
		var matadata;
		if ( node.e_PreDragStart )
		{
			matadata = node.e_PreDragStart.Execute(dt);
			if ( matadata === false )
			{
				dt.effectAllowed = 'none';
				return;
			}
		}
		else
		{
			matadata = StringHelper.ArrayToString(node.m_Text, node.m_Type);
		}
		dt.setData('text', matadata);
	}
}

TreeNode.__ContentDragEnd = function()
{
	var doc = event.srcElement.document;
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
}

TreeNode.__ContentOnContextMenu = function()
{
	var node = FindParentElement(this, 'TR').Object;
	if ( node.e_ContextMenu )
	{
		node.e_ContextMenu.Execute(null);
	}
	return false;
};

TreeNode.__OpIconOnClick = function()
{
	var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		objNode = elmtNode.Object;
		if ( objNode.m_IsChildExpanded )
		{
			objNode.Collapse();
		}
		else
		{
			objNode.Expand();
		}
	}
};

TreeNode.__CheckBoxOnClick = function()
{
	var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		var objNode = elmtNode.Object;
		if ( objNode )
		{
			objNode.SetChecked(this.checked);
		}
	}
};

TreeNode.__ContentOnMouseDown = function()
{
	var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		var objNode = elmtNode.Object;
		if ( objNode )
		{
			var innerCache = objNode.m_Tree.m_InnerCache;
			if ( innerCache.m_LastSelected )
			{
				innerCache.m_LastSelected.m_OffsetCount = undefined;
			}
			var evt = this.document.parentWindow.event;
			if ( (!evt.shiftKey && !evt.ctrlKey) || !objNode.Attributes('IsMultipleSelected') )
			{
				innerCache.UnselectAll();
				objNode.SetSelected(true);
				innerCache.m_LastSelected = objNode;
			}
			else if ( evt.shiftKey && !evt.ctrlKey )
			{
				if ( innerCache.m_Selecteds.m_Count == 0 )
				{
					objNode.SetSelected(true);
					innerCache.m_LastSelected = objNode;
				}
				TreeNode.__SectionSelected(objNode);
			}
			else if ( evt.ctrlKey )
			{
				objNode.SetSelected(!objNode.m_Selected);
				innerCache.m_LastSelected = objNode;
			}
			if ( objNode.m_IsSelectable && objNode.Attributes('AllowDragDrop') && evt.button == 1 )
			{
				var range = this.document.body.createTextRange();
				range.moveToElementText(objNode.m_Element.Content);
				range.select();
				evt.cancelBubble = true;
			}
		}
	}
};

TreeNode.__SectionSelected = function(objNode)
{
	var innerCache = objNode.m_Tree.m_InnerCache;
	var startNode = innerCache.m_LastSelected;
	if ( !startNode )
	{
		return false;
	}
	var endNode = objNode;
	var posStart = GetAbsoluteLocation(startNode.m_Element).absoluteTop;
	var posEnd = GetAbsoluteLocation(endNode.m_Element).absoluteTop;
	innerCache.UnselectAll();
	if ( startNode != endNode )
	{  
		if ( posStart > posEnd )
		{
			var tmp = startNode;
			startNode = endNode;
			endNode = tmp;
		}
		var curNode = startNode;
		do
		{
			curNode.SetSelected(true);
			curNode = curNode.GetNextRowNode();
		}
		while(curNode && curNode != endNode);
		endNode.SetSelected(true);
	}
	else
	{
		endNode.SetSelected(true);
	}
}

TreeNode.__ContentOnMouseOver = function()
{
	/*var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		var objNode = elmtNode.Object;
		if ( objNode )
		{
			objNode.m_IsActive = true;
			objNode.ApplyUIChange();
		}
	}*/
	var span = this.children(0);
	span.runtimeStyle.textDecoration = 'underline';
};

TreeNode.__ContentOnMosueOut = function()
{
	/*var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		var objNode = elmtNode.Object;
		if ( objNode )
		{
			objNode.m_IsActive = false;
			objNode.ApplyUIChange(); 
		}
	}*/
	var span = this.children(0);
	span.runtimeStyle.textDecoration = '';
};

TreeNode.__ContentOnMouseMove = function()
{
	var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		var objNode = elmtNode.Object;
		if ( objNode )
		{
			var evt = this.document.parentWindow.event;
			if ( evt.button == 1 && objNode.Attributes('IsMultipleSelected') )
			{
				TreeNode.__SectionSelected(objNode);
			}
		}
	}
};

TreeNode.__ContentOnMouseUp = function()
{
	var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		var evt = this.document.parentWindow.event;
		if ( !evt.shiftKey )
		{
			var objNode = elmtNode.Object;
			objNode.m_Tree.m_InnerCache.m_LastSelected = objNode;
		}
	}
};

TreeNode.__ContentClicked = function()
{
	var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		var objNode = elmtNode.Object;
		if ( objNode && objNode.e_Clicked )
		{
			objNode.e_Clicked.Execute(objNode);
		}
	}
};

TreeNode.__ContentDblClicked = function()
{
	var elmtNode = FindParentElement(this, 'TR');
	if ( elmtNode && elmtNode.Comment == 'TreeNode' )
	{
		var objNode = elmtNode.Object;
		if ( objNode && objNode.e_DblClicked )
		{
			objNode.e_DblClicked.Execute(objNode);
		}
	}
};

TreeNode.prototype.SetCustomizeIcon = function(iconPath)
{
	if ( this.m_Element.Icon )
	{
		this.m_Icon = iconPath;
		this.m_Element.Icon.src = iconPath;
	}
};

TreeNode.prototype.SetNodeText = function(text)
{
	if ( this.m_Element.Content )
	{
		this.m_Text = text;
		this.ApplyUIChange();
	}
};

TreeNode.prototype.SetChecked = function(isChecked, eventCancelled)
{
	if ( this.m_HasCheckBox )
	{
		if ( this.m_Checked != isChecked )
		{
			if ( this.e_CheckChanging && !eventCancelled)
			{
				if ( !this.e_CheckChanging.Execute(isChecked) )
				{
					this.ApplyUIChange();
					return false;
				}
			}
		}
		var innerCache = this.m_Tree.m_InnerCache;
		if ( isChecked )
		{
			if ( !innerCache.m_Checkeds.Contains(this) )
			{
				innerCache.m_Checkeds.Add(this);
			}
		}
		else
		{
			innerCache.m_Checkeds.Remove(this);
		}
		if ( this.m_Checked != isChecked )
		{
			this.m_Checked = isChecked;
			if ( this.e_CheckedChanged )
			{
				if(!this.e_CheckedChanged.Execute(isChecked))
				{
				    // for fixing bug 6956
			        this.ApplyUIChange();			       	    
				}
			}
			this.ApplyUIChange();
		}
		if ( this.m_Checked )
		{
			var node = this.m_Tree.m_ParentNode;
			while(node)
			{
				node.Expand();
				node = node.m_Tree.m_ParentNode;
			}
		}
	}
	return true; // flag right work flow only
};

TreeNode.prototype.SetSelected = function(isSelected)
{
	if ( !this.m_IsSelectable )
	{
		return;
	}
	var innerCache = this.m_Tree.m_InnerCache;
	if ( isSelected )
	{
		if ( !innerCache.m_Selecteds.Contains(this) ) 
		{
			innerCache.m_Selecteds.Add(this);
		}
	}
	else
	{
		innerCache.m_Selecteds.Remove(this);
	}
	if ( this.m_Selected != isSelected )
	{
		this.m_Selected = isSelected;
		if ( this.e_SelectedChanged )
		{
			this.e_SelectedChanged.Execute(isSelected);
		}
	}
	this.ApplyUIChange();
};

TreeNode.prototype.CheckChildren = function(isChecked)
{
	if ( !isChecked )
	{
		// this.Collapse();
	}
	if ( this.m_ChildTree )
	{
		var childTree = this.m_ChildTree;
		for ( var i=0 ; i < childTree.m_Count ; ++i )
		{
			if ( !childTree.m_Nodes[i].SetChecked(isChecked) )
			{
				return false;
			}
		}
		return true;
	}
	return true;
};

TreeNode.prototype.CheckAllExpandedChildren = function(isChecked)
{
	if ( this.m_ChildTree && this.m_IsChildExpanded )
	{
		if ( this.CheckChildren(isChecked) )
		{
			var tree = this.m_ChildTree;
			for ( var i=0 ; i < tree.m_Count ; ++i )
			{
				var node = tree.m_Nodes[i];
				if ( !node.CheckAllExpandedChildren(isChecked) )
				{
					return false;
				}
			}
			return true;
		}
		return false;
	}
	return true;
};

TreeNode.prototype.CheckAllChildren = function(isChecked)
{
	if ( this.m_ChildTree )
	{
		if ( this.CheckChildren(isChecked) )
		{
			var tree = this.m_ChildTree;
			for ( var i=0 ; i < tree.m_Count ; ++i )
			{
				var node = tree.m_Nodes[i];
				if ( !node.CheckAllChildren(isChecked) )
				{
					return false;
				}
			}
			return true;
		}
		return false;
	}
	return true; // flag for right flow
};

TreeNode.prototype.Collapse = function()
{
	if ( this.m_ChildTree )
	{
		var elmtNode = this.m_Element;
		var childTree = elmtNode.nextSibling;
		if ( childTree )
		{
			childTree.runtimeStyle.display = 'none';
			this.m_IsChildExpanded = false;
			elmtNode.OpIcon.src = TreeStyle.OpIcon(this.GetOpIconName());
			if ( this.e_Collapsed )
			{
				this.e_Collapsed.Execute('collapse');
			}
		}
	}
};

TreeNode.prototype.Expand = function()
{
	var elmtNode = this.m_Element;
	var childTree = elmtNode.nextSibling;
	if ( childTree )
	{
		if ( this.m_ChildTree )
		{
			if ( !this.m_IsChildRendered )
			{
				var doc = childTree.document;
				childTree.cells(1).appendChild(this.m_ChildTree.Render(doc));
				this.m_IsChildRendered = true;
				this.m_IsLoaded = true;
			}
			childTree.runtimeStyle.display = 'inline';
			this.m_IsChildExpanded = true;
			elmtNode.OpIcon.src = TreeStyle.OpIcon(this.GetOpIconName());
			if ( this.e_Expanded )
			{
				this.e_Expanded.Execute('expand');
			}
		}
		else
		{
			if ( this.m_IsLazyLoad && this.m_CanLoad )
			{
				if ( this.e_PreLoad )
				{
					if ( this.e_PreLoad.Execute(null) )
					{
						this.LoadNodes();
					}
				}
				else
				{
					this.LoadNodes();
				}
			}
		}
	}
};

TreeNode.prototype.ExpandAll = function()
{
	this.Expand();
	if ( this.m_ChildTree )
	{
		var childTree = this.m_ChildTree;
		for ( var i=0 ; i < childTree.m_Count ; ++i )
		{
			childTree.Items(i).ExpandAll();
		}
	}
};

TreeNode.prototype.LoadNodes = function(hint, callback)
{
	if ( !hint )
	{
		hint = L_Loading;
	}
	var childTree = this.m_Element.nextSibling;
	childTree.runtimeStyle.display = 'inline';
	this.m_IsChildExpanded = true;
	this.m_Element.OpIcon.src = TreeStyle.OpIcon(this.GetOpIconName());
	childTree.cells(1).innerHTML = '<img src="' + TreeStyle.OpIcon('BottomLine')
		+ '" border="0" align="absMiddle"><span style="color:blue;"> ' + hint + ' ...</span>';
	var url = this.Attributes('Url');
	var separator = '?';
	if ( url.indexOf('?') != -1 )
	{
		separator = '&';
	}
	url += separator + this.Attributes('ServerId') + '=' + encodeURIComponent(this.m_ServerId)
		+ '&' + this.Attributes('ClientId') + '=' + this.m_Id + '&' + this.Attributes('TypeId')
		+ '=' + this.m_Type + '&t=' + new Date().getTime();
	if ( !callback )
	{
		__XmlHttpPool__.GetRemoteData(url, this.LoadingNodes);
	}
	else
	{
		__XmlHttpPool__.GetRemoteData(url, callback);
	}
};

TreeNode.prototype.LoadingNodes = function(metadata)
{
	try
	{
		var clientId = metadata.substring(0, metadata.indexOf('$'));
		var data = metadata.substring(metadata.indexOf('$')+1);
		// refact, if retrieve data error, objNode equal null.
		var objNode = __GlobalTreeCache__[clientId];
		var elmtNode = objNode.m_Element;
		var aryData = eval(data);
		if ( aryData && aryData.length > 0 )
		{
			var extraFormat = '<span style="color:{1}" title="{2}">({0})</span>';
			var maxChildrenForbbiden = objNode.Attributes('MaxChildrenForbidden');
			if ( aryData.length < maxChildrenForbbiden )
			{
				var maxChildrenWarning = objNode.Attributes('MaxChildrenWarning');
				if ( aryData.length > maxChildrenWarning )
				{
					// alert(StringHelper.Format(L_TooManyChildrenWarning, maxChildrenWarning));
				}
				var tree = new Tree();
				objNode.m_ChildTree = tree;
				objNode.m_Tree.ApplySingleton();
				objNode.m_IsChildExpanded = true;
				objNode.m_IsChildRendered = true;
				objNode.m_IsLazyLoad = false;
				tree.m_ParentNode = objNode;
				var moreCount = objNode.Attributes('MoreNodesCount');
				for ( var i=0 ; i < aryData.length ; ++i )
				{
					var node = new TreeNode();
					tree.Add(node);
					if ( objNode.e_NodeCreating )
					{
						var curData = aryData[i];
						objNode.e_NodeCreating.Execute([node, curData]);
					}
					else
					{
						objNode.CreateNode(node, aryData[i]);
					}
					if ( i >= moreCount-1 && i != aryData.length-1 )
					{
						if ( objNode.e_MoreNodes )
						{
							objNode.e_MoreNodes.Execute({Nodes : aryData, Offset : i-1, Tree : tree});
							break;
						}
					}
				}
				var childTree = objNode.m_Element.nextSibling;
				var childNode = childTree.cells(1);
				childNode.innerHTML = '';
				childNode.appendChild(tree.Render(childTree.document));
				if ( objNode.e_Expanded )
				{
					objNode.e_Expanded.Execute('expand');
				}
				if ( objNode.e_Appended )
				{
					objNode.e_Appended.Execute(childTree);
				}
			}
			else
			{
				objNode.m_CanLoad = false;
				objNode.m_ChildTree = null;
				objNode.m_IsChildExpanded = false; 
				var tooltip = StringHelper.Format(L_TooManyChildrenForbidden, maxChildrenForbbiden);
				alert(tooltip);
				objNode.SetExtraContent(StringHelper.Format(extraFormat, aryData.length, 'red', tooltip));
				elmtNode.nextSibling.runtimeStyle.display = 'none';
			}
		}
		else
		{
			objNode.m_IsLazyLoad = false;
			objNode.m_ChildTree = null;
			objNode.m_IsChildExpanded = false;
			objNode.SetExtraContent('');
			elmtNode.nextSibling.runtimeStyle.display = 'none';
		}
		elmtNode.OpIcon.src = TreeStyle.OpIcon(objNode.GetOpIconName());
	}
	catch(e)
	{
		if ( typeof(GetErrorMessage) == 'function' )
		{
			var fmt = '{0}: {1}';
			var errorInfo = GetErrorMessage(metadata);
			if ( !errorInfo )
			{
				errorInfo = L_LoginChildNodesException;
			}
			alert(StringHelper.Format(fmt, L_ErrorInfo, errorInfo));
		}
		else
		{
			__Debug__(e, metadata);
		}
	}
};

TreeNode.prototype.ReloadNodes = function(isExtraCleared)
{
	if ( isExtraCleared )
	{
		this.SetExtraContent('');
	}
	if ( this.m_ChildTree && !this.m_IsLazyLoad )
	{
		this.LoadNodes(L_Reloading, this.ReloadingNodes);
	}
	else
	{
		this.LoadNodes(L_Loading, this.LoadingNodes);
	}
};

TreeNode.prototype.ReloadingNodes = function(metadata)
{
	try
	{
		var clientId = metadata.substring(0, metadata.indexOf('$'));
		var data = metadata.substring(metadata.indexOf('$')+1);
		var objNode = __GlobalTreeCache__[clientId];
		var elmtNode = objNode.m_Element;
		var tree = objNode.m_ChildTree;
		var nodeCount = tree.m_Count;
		for ( var i=0 ; i < nodeCount ;  ++i )
		{
			var tempNode = tree.m_Nodes[0];
			tempNode.Dispose();
			tree.Remove(tempNode);
		}
		var aryData = eval(data);
		if ( aryData && aryData.length > 0 )
		{
			objNode.m_IsChildExpanded = true;
			objNode.m_IsLazyLoad = false;
			for ( var i=0 ; i < aryData.length ; ++i )
			{
				var node = new TreeNode();
				tree.Add(node);
				if ( objNode.e_NodeCreating )
				{
					var args = new Array(2);
					args[0] = node;
					args[1] = aryData[i];
					// objNode.e_NodeCreating.Execute([node, aryData[i]]);
					objNode.e_NodeCreating.Execute(args);
				}
				else
				{
					objNode.CreateNode(node, aryData[i]);
				}
			}
			var childTree = objNode.m_Element.nextSibling;
			var childNode = childTree.cells(1);
			childNode.innerHTML = '';
			childNode.appendChild(tree.Render(childTree.document));
			if ( objNode.e_Appended )
			{
				objNode.e_Appended.Execute(childTree);
			}
		}
		else
		{
			objNode.m_IsLazyLoad = false;
			objNode.m_ChildTree = null;
			objNode.m_IsChildExpanded = false; 
			elmtNode.nextSibling.runtimeStyle.display = 'none';
			tree.Dispose();
		}
		elmtNode.OpIcon.src = TreeStyle.OpIcon(objNode.GetOpIconName());
	}
	catch(e)
	{
		__Debug__(e, metadata);
	}
};

TreeNode.prototype.CreateNode = function(node, data)
{
	// ["1","Movie","-1","Mar 29 07:23", "1"],
	node.m_Text = data[1];
	if ( data[0] != -1 )
	{
		node.m_IsLazyLoad = true;
	}
	node.m_ServerId = data[4];
	return node;
};

TreeNode.prototype.RuntimeRemoveTree = function()
{
	var trSubtree = this.m_Element.nextSibling;
	trSubtree.runtimeStyle.display = 'none';
	var tdNode = trSubtree.cells(1);
	if ( this.m_ChildTree )
	{
		this.m_ChildTree.Dispose();
		tdNode.innerHTML = '';
	}
	this.m_ChildTree = null;
	this.m_IsChildExpanded = false;
	this.m_IsChildRendered = false;
	this.m_Element.OpIcon.src = TreeStyle.OpIcon(this.GetOpIconName());
	return tdNode;
};

TreeNode.prototype.RuntimeAppendTree = function(subtree, isForceAppend)
{
	if ( !isForceAppend && ( this.m_ChildTree || this.m_IsLazyLoad ) )
	{
		throw new Error(L_ChildTreeExist);
	}
	/*trSubtree.runtimeStyle.display = 'inline';
	var tdNode = trSubtree.cells(1);
	if ( this.m_ChildTree )
	{
		this.m_ChildTree.Dispose();
		tdNode.innerHTML = '';
	}*/
	if ( subtree && subtree.m_Nodes.length > 0 )
	{
		var tdNode = this.RuntimeRemoveTree();
		tdNode.parentElement.runtimeStyle.display = 'inline';
		this.m_ChildTree = subtree;
		subtree.m_ParentNode = this;
		subtree.m_Styles = this.m_Tree.m_Styles;
		subtree.m_Attributes = this.m_Tree.m_Attributes;
		subtree.m_InnerCache = this.m_Tree.m_InnerCache;
		this.m_Tree.ApplySingleton();	
		this.m_IsChildExpanded = true;
		this.m_IsChildRendered = true;
		this.m_Element.OpIcon.src = TreeStyle.OpIcon(this.GetOpIconName());
		var doc = this.m_Element.document;
		tdNode.appendChild(subtree.Render(doc)); // must run render in last step.
	}
};

TreeNode.prototype.GetRootNode = function()
{
	var that = this;
	while(that.m_Tree.m_ParentNode)
	{
		that = that.m_Tree.m_ParentNode;
	}
	return that;
};

TreeNode.prototype.SetUserData = function(key, value)
{
	this.m_UserData[String(key)] = value;
};

TreeNode.prototype.GetUserData = function(key)
{
	return this.m_UserData[String(key)];
};

function TreeNodeBase(text, action, icon, subtree)
{
	this.m_Text = text;
	this.m_Tooltip = '';
	this.m_Atction = action;
	this.m_ChildTree = subtree;
	this.m_ExtraHTML = null;
	this.m_Tree = null;
	this.m_Icon = icon;
	this.m_IconPath = null;
	this.m_HasCheckBox = true;
	this.m_IsSelectable = true;
	this.m_ServerId = null;
	this.m_Type = 'default';

	this.m_IsActive = false;
	this.m_IsChildExpanded = false;
	this.m_IsChildRendered = false;
	this.m_IsLazyLoad = false;
	this.m_IsLoaded = false;
	this.m_Selected = false;
	this.m_Checked = false;
	this.m_Disabled = false;
	
	this.m_Element = null;

	this.toString = function()
	{
		return '[class TreeNodeBase]';
	};
}

TreeNodeBase.prototype.Attributes = function(key)
{
	return this.m_Tree.m_Attributes['m_' + key];
};

TreeNodeBase.prototype.Styles = function(key)
{
	return this.m_Tree.m_Styles['m_' + key];
};

TreeNodeBase.prototype.InnerCache = function(key)
{
	return this.m_Tree.m_InnerCache[key];
};

TreeNodeBase.prototype.Render = function(doc)
{
	var tr = doc.createElement('TR');
	tr.Comment = 'TreeNode'; 
	tr.Object = this;
	this.m_Element = tr;
	
	var tdOpIcon = doc.createElement('TD');
	tr.appendChild(tdOpIcon);
	tdOpIcon.ondragstart = function() { return false; };
	var opImg = doc.createElement('IMG');
	tr.OpIcon = opImg;
	opImg.src = TreeStyle.OpIcon(this.GetOpIconName());
	tdOpIcon.appendChild(opImg);

	var tdContent = doc.createElement('TD');
	tr.appendChild(tdContent); 
	tdContent.noWrap = 'noWrap'; 
	var hasCheckBox = this.Attributes('HasCheckBox');
	this.m_HasCheckBox = hasCheckBox && this.m_HasCheckBox;
	if ( this.m_HasCheckBox )
	{
		var inputHTML = '<input type="checkbox">';
		if ( this.m_Checked )
		{
			inputHTML = '<input type="checkbox" checked>';
		}
		var input = doc.createElement(inputHTML);
		input.hideFocus = true;
		tr.CheckBox = input;
		tdContent.appendChild(input);
	}
	var icon = doc.createElement('IMG');
	icon.align = 'absMiddle';
	if ( this.m_Icon )
	{
		icon.src = this.m_Icon;
	}
	else
	{
		if ( this.m_IconPath )
		{
			icon.src = this.m_IconPath;
		}
		else
		{
			icon.src = TreeStyle.OpIcon('default');
		}
	}
	tdContent.appendChild(icon);
	tr.Icon = icon;
	
	var wrapDiv = doc.createElement('DIV');
	wrapDiv.runtimeStyle.display = 'inline';
	wrapDiv.runtimeStyle.width = '100%';
	var span = doc.createElement('SPAN');
	wrapDiv.appendChild(span);
	span.noWrap = 'noWrap';
	wrapDiv.runtimeStyle.marginLeft = this.Attributes('TextIndent');
	// wrapDiv.runtimeStyle.marginRight = '2px';
	span.runtimeStyle.paddingRight = '2px';
	tdContent.appendChild(wrapDiv);
	// span.innerText = this.m_Text;
	tr.Content = span;
	if ( this.m_ExtraHTML )
	{
		var extraSpan = doc.createElement('SPAN');
		extraSpan.runtimeStyle.paddingLeft = '2px';
		extraSpan.innerHTML = this.m_ExtraHTML;
		tr.Content.parentElement.appendChild(extraSpan);
		tr.ExtraContent = extraSpan;
	}
	this.ApplyUIChange();
	return tr;
};

TreeNodeBase.prototype.Dispose = function()
{
	if ( this.m_Element )
	{
		this.m_Element.clearAttributes();
		this.m_Element.removeNode(true);
		this.m_Element = null;
	}
	for ( var key in this )
	{
		delete this[key];
	}
};

TreeNodeBase.prototype.GetExtraContent = function()
{
	if ( this.m_Element.ExtraContent )
	{
		return this.m_Element.ExtraContent.innerText;
	}
	else
	{
		return '';
	}
};

TreeNodeBase.prototype.SetExtraContent = function(html)
{
	if ( typeof(html) != 'undefined' )
	{
		if ( this.m_Element.ExtraContent )
		{
			this.m_Element.ExtraContent.innerHTML = html;
		}
		else
		{
			var extraSpan = this.m_Element.document.createElement('SPAN');
			this.m_Element.Content.parentElement.appendChild(extraSpan);
			this.m_Element.ExtraContent = extraSpan;
			extraSpan.innerHTML = html;
		}
	}
};

TreeNodeBase.prototype.IsFirstNode = function()
{
	var nodes = this.m_Tree.m_Nodes;
	return this == nodes[0];
};

TreeNodeBase.prototype.IsLastNode = function()
{
	var nodes = this.m_Tree.m_Nodes;
	return this == nodes[nodes.length-1];
};

TreeNodeBase.prototype.GetPreviousRowNode = function()
{
	if ( this.IsFirstNode() )
	{
		if ( this.m_Tree.IsRootLevel() )
		{
			return;
		}
		else
		{
			return this.m_Tree.m_ParentNode;
		}
	}
	else
	{
		var node = this.m_Tree.m_Nodes[this.m_Tree.IndexOf(this)-1];
		if ( node.m_ChildTree && node.m_ChildTree != true )
		{
			return node.m_ChildTree.GetLastExpandedNode();
		}
		return node;
	}
};

TreeNodeBase.prototype.GetNextRowNode = function()
{
	if ( this.m_ChildTree && this.m_ChildTree != true && this.m_IsChildExpanded )
	{
		if ( this.m_ChildTree.m_Count > 0 )
		{ 
			return this.m_ChildTree.m_Nodes[0];
		}
		else
		{
			return null;
		}  
	}
	else
	{
		if ( this.IsLastNode() )
		{
			return this.m_Tree.GetFirstExpandedNode();
		}
		else
		{
			return this.m_Tree.m_Nodes[this.m_Tree.IndexOf(this)+1];
		} 
	}
};

TreeNodeBase.prototype.GetOpIconName = function()
{
	var opIconName = '';
	var nodeCount = this.m_Tree.m_Nodes.length;
	if ( ( nodeCount > 1 ) && !this.IsLastNode() )
	{
		if ( !this.m_ChildTree && !this.m_IsLazyLoad )
		{
			if ( this.IsFirstNode() && this.m_Tree.IsRootLevel() )
			{
				opIconName = 'TopLine';
			}
			else
			{
				opIconName = 'MiddleCrossLine';
			}
		}
		else
		{
			if ( this.m_IsChildExpanded )
			{
				if ( this.IsFirstNode() && this.m_Tree.IsRootLevel() )
				{
					opIconName = 'TopMinus';
				}
				else
				{
					opIconName = 'MiddleMinus';
				}
			}
			else
			{
				if ( this.IsFirstNode() && this.m_Tree.IsRootLevel() )
				{
					opIconName = 'TopPlus';
				}
				else
				{
					opIconName = 'MiddlePlus';
				}
			}
		}
	}
	else
	{
		if ( !this.m_ChildTree && !this.m_IsLazyLoad )
		{
			if ( this.IsFirstNode() && this.m_Tree.IsRootLevel() )
			{
				opIconName = 'SingleNode';
			}
			else
			{
				opIconName = 'BottomLine';
			}
		}
		else
		{
			if ( this.m_IsChildExpanded )
			{
				if ( this.IsFirstNode() && this.m_Tree.IsRootLevel() )
				{
					opIconName = 'SingleMinus';
				}
				else
				{
					opIconName = 'BottomMinus';
				}
			}
			else
			{
				if ( this.IsFirstNode() && this.m_Tree.IsRootLevel() )
				{
					opIconName ='SinglePlus';
				}
				else
				{
					opIconName = 'BottomPlus';
				}
			}
		}
	}
	if ( !this.m_CanLoad )
	{
		return opIconName + 'X';
	}
	else
	{
		return opIconName;
	}
};

TreeNodeBase.prototype.ApplyUIChange = function()
{
	if ( this.m_Element.CheckBox )
	{
		this.m_Element.CheckBox.checked = this.m_Checked;
	} 
	var elmtNode = this.m_Element.Content;
	if ( elmtNode.innerText != this.m_Text )
	{
		elmtNode.innerText = this.m_Text;
	}
	if ( elmtNode.title != this.m_Tooltip )
	{
		elmtNode.title = this.m_Tooltip;
	}
	if ( this.m_Selected )
	{
		elmtNode.runtimeStyle.color = this.Styles('SelectedForeColor');
		elmtNode.runtimeStyle.background = this.Styles('SelectedBackColor');
	}
	else
	{
		if ( this.m_Checked )
		{
			elmtNode.runtimeStyle.color = this.Styles('CheckedForeColor');
			elmtNode.runtimeStyle.background = this.Styles('CheckedBackColor');
		}
		else
		{
			elmtNode.runtimeStyle.color = this.Styles('NormalForeColor');
			elmtNode.runtimeStyle.background = this.Styles('NormalBackColor');
		}
	}
};