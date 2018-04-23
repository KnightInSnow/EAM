/***********************************************************
Tree View Class created by javascript

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. ? All rights reserved.
Version: 1.2
Created: 2004.12.19 05:05
Updated: 2005.01.19 16:33

History:
	1. The code created at 2004.12.19
	2. TreeView prototype is completed. [2004.12.20]
	3. Find memory leak bug in IE 6.0 sp1. [2004.12.21]
	4. Finish dynamic load tree node data. [2004.12.24]
	5. Improve dynamic load UI, use setTimeout fire Load(). [2004.12.25]
	6. Modify the tree as a dimension tree. [2004.12.28]
	7. Attach context menu to TreeNode. [2004.12.29]
	8. Checked nodes collection by __TreeCache__. [2004.12.30]
	9. Implement Reverse synch dimenstion tree. [2004.12.31]
	10. Optimize reverse synch by use JScript Object as Array. [2005.01.04]
	11. Add __defaultExectue mothed to handle event. [2005.01.18]
	12. Support single node header image symbol. [2005.01.19]
	13. If node text is empty, display L_Untitled as default. [2005.12.16]

***********************************************************/

var __TreeCache__ =
{
	m_Count :		0,
	m_IdPrefix :	"__TreeObject__",
	m_ActiveNode : null,
	m_CheckedNodes : [], 	// it's a two dimension array.

	NewId : function()
	{
		return this.m_IdPrefix + this.m_Count++;
	},

	Remove : function(mi)
	{
		delete this[mi.m_Id];
	},
	
	AddCheckedNode : function(node)
	{
		var firstLevelNode = node;
		while( firstLevelNode.m_Tree.m_TreeLevel != 0 )
		{
			firstLevelNode = firstLevelNode.m_Tree.m_ParentNode;
		}
		var dimNode = firstLevelNode;
		var dimUniqueName = dimNode.m_Attributes['UniqueName'];
		if ( !this.m_CheckedNodes[dimUniqueName] )
		{
			this.m_CheckedNodes[dimUniqueName] = [];
		}
		this.m_CheckedNodes[dimUniqueName].push(node);	
	},
	
	RemoveCheckedNode : function(node)
	{
		var firstLevelNode = node;
		while( firstLevelNode.m_Tree.m_TreeLevel != 0 )
		{
			firstLevelNode = firstLevelNode.m_Tree.m_ParentNode;
		}
		var dimNode = firstLevelNode;
		var dimUniqueName = dimNode.m_Attributes['UniqueName'];
		if ( this.m_CheckedNodes[dimUniqueName] )
		{
			this.m_CheckedNodes[dimUniqueName].remove(node);	
		}
	},
	
	SelectedNodesSerialize : function()
	{
		var checkedNodes = {};
		for ( var dim in this.m_CheckedNodes )
		{
			var serialize = '';
			if ( dim.length > 2 && dim.charAt(0) == '[' && dim.charAt(dim.length-1) == ']' )
			{
				var nodes = this.m_CheckedNodes[dim];
				for ( var i=0 ; i < nodes.length ; ++i )
				{
					var node = nodes[i];
					serialize += '\t<Member UniqueName="' + node.m_Attributes['UniqueName']
						+ '" Caption="' + node.m_Attributes['Caption'] + '"></Member>\r\n';
				}
				checkedNodes[dim] = serialize;
			}
		}
		return checkedNodes;
	}
};

var __TreeNodeCache__ = {};

var __TreeAttributes__ =
{
	DocumentPath : GetDocumentPath(document),
	RelativePath : '../images/TreeView/default/',
	PatchCache: null,
	Image : function(filename)
	{
		return "<img align='absmiddle' border='0' src='" + this.ImageSrc(filename) + "' />";
	},

	ImageSrc : function(filename)
	{
		if ( !filename )
		{
			throw new Error('need filename.');
		}
		if ( filename.indexOf('.') == -1 )
		{
			filename += '.gif';
		}
		if ( !this.PathCache ) // lazy load
		{
			this.PathCache = this.DocumentPath;
		}
		return this.PathCache + this.RelativePath + filename;
	},

	ShowIcon : true,
	IconPath : '',
	IconSrc : function(filename)
	{
		if ( !filename )
		{
			filename = 'default.gif';
		}
		if ( filename.indexOf('.') == -1 )
		{
			filename += '.gif';
		}
		return this.PathCache + this.IconPath + filename;
	},
	
	HasCheckBox : true,
	NormalForeColor : 'windowtext',
	NormalBackColor : 'window',
	ActiveForeColor : 'highlighttext',
	ActiveBackColor : 'highlight',
	NodeCheckedColor : 'green'
};

function Tree()
{
	this.m_Nodes = [];
	this.m_Invalidate = false;
	this.m_ParentNode = null;
	this.m_ActiveNode = null;
	this.m_Element = null;
	this.m_TreeType = Tree.TreeType.NormalTree;
	this.m_TreeLevel = 0;
	this.m_IsEventAttached = false;
	this.m_Id = __TreeCache__.NewId();
	__TreeCache__[this.m_Id] = this;
	
	this.toString = function()
	{
		return '[class Tree]';
	};
}

/*
Tree.m_ABIS = 'http://192.168.0.55:80/ABIS/';
Tree.m_CubeName = 'Sales';
Tree.m_ConnString = 'DataSource=192.168.0.55;ConnectTo=8.0';
*/

Tree.Attributes = __TreeAttributes__;

Tree.TreeType = 
{
	NormalTree : 0,
	DimensionTree : 1
};

Tree.prototype.Add = function(node)
{
	this.AddAt(node, this.m_Nodes.length);
};

Tree.prototype.AddAt = function(node, index)
{
	node.m_Tree = this;
	if ( node.m_ChildTree )
	{
		if ( this.Contains(node.m_ChildTree) )
		{
			node.m_ChildTree = null;
			node.m_ChildTree.m_TreeType = node.m_Tree.m_TreeType;
			node.m_ChildTree.m_TreeLevel = node.m_Tree.m_TreeLevel+1;
			node.m_ChildTree.m_ParentTree = node;
		}
	}
	this.m_Nodes.splice(index, 0, node);
	this.m_Invalidate = true;
};

Tree.prototype.Remove = function(node)
{
	if ( this.m_Nodes.contains(node) )
	{
		var nodes = [];
		for ( var i=0 ; i < this.m_Nodes.length ; ++i )
		{
			if ( this.m_Nodes[i] != node )
			{
				nodes.push(this.m_Nodes[i]);
			}
		}
		this.m_Nodes = nodes;
		// __TreeCache__.Remove(mi); do not remove them
	}
	this.m_Invalidate = true;
};

Tree.prototype.Contains = function()
{
     // TODO: ...
     return false;
};

Tree.prototype.Show = function(elmt)
{
	if ( elmt && elmt.document )
	{
		// elmt.onselectstart = 'return false'; 
		elmt.onmousedown = function()
		{
			this.setCapture();
		};
		elmt.onmouseup = function()
		{
			this.releaseCapture();
		};
		var doc = elmt.document;
		var input = doc.createElement('INPUT');
		input.style.border = 'solid 0px black';
		input.style.backgoundColor = 'window';
		input.style.width = 1;
		input.style.height = 1;
		elmt.appendChild(input);
		elmt.focusPark = input;
		
		/*
		doc.body.attachEvent('onunload', function()
		{
			for( var key in __TreeCache__ )
			{
				if ( key.indexOf(__TreeCache__.m_IdPrefix) != -1 )
				{
					__TreeCache__.Remove(__TreeCache__[key]);
				}
			}
		});
		*/
		
		var popup = doc.parentWindow.createPopup();
		var tooltipElmt = popup.document.createElement('SAPN');
		tooltipElmt.attachEvent('onclick', function(evt)
		{
			if ( !evt || !evt.srcElement )
			{
				return;
			}
			var tdNode = evt.srcElement.TreeNode.m_Element.cells[1];
			var span = FindChildElement(tdNode, 'SPAN');
			span.click();
		});
		tooltipElmt.attachEvent('onmousedown', function(evt)
		{
			// if ( evt.button == 2 ) //need fix
			{
				tooltipElmt.click();
			}
		});
		tooltipElmt.style.color = Tree.Attributes.NormalForeColor;
		tooltipElmt.style.backgroundColor = Tree.Attributes.NormalBackColor;
		tooltipElmt.style.border = 'solid 1px ' + Tree.Attributes.NormalForeColor;
		tooltipElmt.style.fontFamily = 'Tahoma';
		tooltipElmt.style.cursor = 'default';
		popup.document.body.appendChild(tooltipElmt);
		// popup.document.body.innerHTML = tooltipElmt.outerHTML;
		popup.document.body.style.backgroundColor = Tree.Attributes.NormalBackColor;
		popup.document.body.style.borderTop = 'solid 1px ' + Tree.Attributes.NormalForeColor;
		popup.document.body.style.borderBottom = 'solid 1px ' + Tree.Attributes.NormalForeColor;
		popup.document.body.popup = popup;
		popup.document.body.onmouseout = function()
		{
			if ( this.popup.isOpen )
			{
				this.popup.hide();
			}
		};
		elmt.ToolTip = popup;
	}
	elmt.appendChild(this.Render(doc));
};

Tree.prototype.Render = function(doc)
{
	var tbl = doc.createElement('TABLE');
	tbl.Object = this;
	tbl.border = 0;
	// tbl.onselectstart = 'return false';
	tbl.cellSpacing = 0;
	tbl.cellPadding = 0;

	var tbody = doc.createElement('TBODY');
	tbl.appendChild(tbody);

	for ( var i=0 ; i < this.m_Nodes.length ; ++i )
	{
		var node = this.m_Nodes[i];
		tbody.appendChild(node.Render(doc));
		if ( node.m_ChildTree )
		{ 
			var trSubTree = doc.createElement('TR');
			var tdHeader = doc.createElement('TD');
			if ( node != this.m_Nodes[this.m_Nodes.length-1] )
			{
				var img = doc.createElement(Tree.Attributes.Image('MiddleLine.gif'));
				tdHeader.background = img.src;
			}			
			trSubTree.appendChild(tdHeader);
			var tdNode = doc.createElement('TD');
			
			if ( !node.m_IsLazyLoad )
			{
				tdNode.appendChild(node.m_ChildTree.Render(doc));
				node.m_IsLoaded = true;
				if ( !node.m_IsChildExpanded )
				{
					trSubTree.style.display = 'none';
				}
			}
			else
			{
				if ( node.m_IsLoaded )
				{
					trSubTree.style.display = 'inline';	
				}
			}
			trSubTree.appendChild(tdNode);
			tbody.appendChild(trSubTree);
		}   
	} 
	return tbl;
};

Tree.EventHandler = function(evt)
{
	if ( !evt || !evt.srcElement )
	{
		return null;
	}
	var span = evt.srcElement;
	Alert(span.TreeNode);
};

Tree.__generateContextMenu = function()
{
	var miArray = [
		'&Select my child nodes',
		'Select &all child nodes(nested)',
		'-',
		'&Invert select my child nodes',
		'In&vert select all child nodes(nested)',
		'-',
		'&Cancel my child nodes selected',
		'Ca&ncel all child nodes selected(nested)'];
	var cmdArray = ['SELECT', 'N-SELECT', '-', 'INVERT', 'N-INVERT', '-', 'CANCEL', 'N-CANCEL'];
	var m = new Menu();
	for ( var i=0 ; i < miArray.length ; ++i )
	{
		var mi = new MenuItem(miArray[i], Tree.ContextMenuClicked);
		mi.m_Attributes['Command'] = cmdArray[i];
		m.Add(mi);
	}
	return m;
};

Tree.ContextMenuClicked = function(evt)
{
	if ( !evt || !evt.srcElement )
	{
		return;
	}
	var span = evt.srcElement;
	var miHtml = FindParentElement(span, 'TR');
	if ( miHtml && !miHtml.Command )
	{
		miHtml = FindParentElement(miHtml.parentElement, 'TR');
	}
	var cmd = miHtml.Command;
	var activeNode =__TreeCache__.m_ActiveNode;
	var tree = activeNode.m_ChildTree;
	if ( typeof(tree) == 'object' ) // must judge Object!!!, tree default equal 'true'.
	{
		activeNode.Expand(false);
		if ( cmd.indexOf('SELECT') != -1 )
		{
			tree.SelectChild(cmd.charAt(0) == 'N');
		}
		else if ( cmd.indexOf('INVERT') != -1 )
		{
			tree.InvertSelectChild(cmd.charAt(0) == 'N');
		}
		else if ( cmd.indexOf('CANCEL') != -1 )
		{
			tree.CancelSelectChild(cmd.charAt(0) == 'N');
		}
		window.status = cmd + ': ' + activeNode.m_Element.innerText;
	}
	Menu.HideAllPopups();
};

Tree.prototype.SelectChild = function(isNested)
{
	this.__doCheck(true, isNested);
};

Tree.prototype.InvertSelectChild = function(isNested)
{
	this.__doCheck(null, isNested);
};

Tree.prototype.CancelSelectChild = function(isNested)
{
	this.__doCheck(false, isNested);
};

Tree.prototype.__doCheck = function(checked, isNested)
{
	var nodes = this.m_Nodes;
	for ( var i=0 ; i < nodes.length ; ++i )
	{
		var node = nodes[i];
		if ( !node.m_IsChildExpanded )
		{
			node.Expand(false);
		}
		if ( checked == null )
		{
			node.SetChecked(!node.GetChecked());
		}
		else
		{
			node.SetChecked(checked);
		}
		if ( isNested && node.m_ChildTree && node.m_IsLoaded )
		{
			node.m_ChildTree.__doCheck(checked, isNested);
		}
	}
};

/*
Tree.SynchCheck = function(uniqueNames)
{
	Tree.__ensureMembersLoaded(uniqueNames)
	for ( var key in __TreeCache__ )
	{
		//if ( key.indexOf(__TreeCache__.m_IdPrefix) != -1 )
		{
			var node = __TreeCache__[key];
			if ( node && node.SetChecked )
			{
				var nodeUniqueName = node.m_Attributes['UniqueName'];
				for ( var i=0 ; i < uniqueNames.length ; ++i )
				{
					node.SetChecked(uniqueNames.contains(nodeUniqueName));
				}
			}
		}
	}
};*/

Tree.ClearAllCheck = function()
{
	for ( var key in __TreeNodeCache__ )
	{
		var node = __TreeNodeCache__[key];
		if ( node && node.SetChecked )
		{
			node.SetChecked(false);
		}
	}
};

Tree.SynchCheck = function(uniqueNames)
{
	if ( !uniqueNames || uniqueNames.length == 0 )
	{
		return null;
	}
	Tree.__ensureMembersLoaded(uniqueNames)
	for ( var i=0 ; i < uniqueNames.length ; ++i )
	{
		var node = __TreeNodeCache__[uniqueNames[i]];
		if ( node && node.SetChecked )
		{
			node.SetChecked(true);
		}
	}
};

function Tree.__ensureMembersLoaded(uniqueNames)
{
	for ( var i=0 ; i < uniqueNames.length ; ++i )
	{
		var memberExist = false;
		var uniqueName = uniqueNames[i];

		if ( !(uniqueName || uniqueName.length || uniqueName.length > 2 ||
			uniqueName.charAt(0) == '[' || 
			uniqueName.charAt(uniqueName.length-1) == ']') ) continue;

		/*for ( var id in __TreeCache__ )
		{
			// if ( id.indexOf(__TreeCache__.m_IdPrefix) != -1 )
			{
				var node = __TreeCache__[id];
				if ( node && node.m_Attributes &&
					node.m_Attributes['UniqueName'] == uniqueName )
				{
					memberExist = true;
					break;
				}
			}
		}*/

		var memberExist = true;
		if ( !__TreeNodeCache__[uniqueName] )
		{
			memberExist = false;
		}
		
		if ( !memberExist && uniqueName.length > 2 )
		{
			if ( uniqueName.charAt(0) == '[' && uniqueName.charAt(uniqueName.length-1) == ']' )
			{
				var dataSource = Tree.m_ConnString;
				var cubeName = Tree.m_CubeName;
				var data = Tree.GetMemberParents(uniqueName);
				var parents = eval(data);
				if ( parents )
				{
					for ( var i=parents.length-1 ; i > 0 ; i-- )
					{
						TreeNode.Loading(parents[i]);
					}
				}
			}
		}
	}
};

Tree.GetMemberParents = function(uniqueName)
{
	var url = Tree.m_ABIS + 'GetMemberParents.aspx?CS='
		+ Tree.m_ConnString + '&CN=' + encodeURIComponent(Tree.m_CubeName) + '&UN='
		+ encodeURIComponent(uniqueName) + '&TL=9527&t=' + (new Date()).getTime();
	var data = __XmlHttpPool__.GetRemoteDataEx(url);
	return data;
};

function TreeNode(text, action, icon, subtree)
{
	this.m_Text = text;
	this.m_Action = action;
	// this.m_Action = Tree.EventHandler;
	this.m_Icon = icon;
	this.m_ChildTree = subtree;
	if ( subtree )
	{
		subtree.m_ParentNode = this;
	}
	this.m_IsChildExpanded = false;
	this.m_IsLazyLoad = false;
	this.m_IsLoaded = false;
	this.m_IsEventAttached = false;
	this.m_Tree = null;
	this.m_Checked = false;
	this.m_Disabled = false;
	this.m_Tooltip = null;
	this.m_Attributes = [];
	this.m_Id = __TreeCache__.NewId();
	__TreeCache__[this.m_Id] = this;

	this.toString = function()
	{
		return '[class TreeNode]';
	};
}

TreeNode.prototype.AttachImageEvents = function(img)
{
	if ( !this.m_IsEventAttached )
	{
		img.attachEvent('onclick', this.NodeMouseClick);
		// img.attachEvent('onkeypress', this.NodeKeyPress);
		this.m_IsEventAttached = true;
	}
};

TreeNode.prototype.NodeMouseClick = function(evt)
{
	if ( !evt || !evt.srcElement )
	{
		return;
	}
	var img = evt.srcElement;
	if ( img.TreeNode )
	{
		var node = img.TreeNode;
		if ( node.m_IsChildExpanded )
		{
			node.Collapse();
		}
		else
		{
			node.Expand(true);
		}
	}
};

TreeNode.prototype.Expand = function(bIsLoading)
{
	var node = this;
	var img = FindChildElement(node.m_Element, 'IMG');
	var elmtSubTree = node.m_Element.nextSibling;
	if ( node.m_IsLoaded )
	{
		if ( !node.m_IsChildExpanded )
		{
			elmtSubTree.style.display = 'inline';
			node.m_IsChildExpanded = true;
			img.src = Tree.Attributes.ImageSrc(node.GetHeaderImage());
		}
	}
	else
	{
		var doc = img.document;
		if ( node.m_IsLazyLoad && bIsLoading )
		{
			// romete lazy load.
			TreeNode.DelayLoad.srcImage = img;
			TreeNode.DelayLoad.parentAction = node.m_Action;
			window.setTimeout(TreeNode.DelayLoad, 1);
			elmtSubTree.cells(1).innerHTML = Tree.Attributes.Image('BottomLine.gif')
				+ "&nbsp;<font style='color:blue'>" + L_Loading + " ...</font>";
			doc.body.style.cursor = 'wait';
		}
		else
		{
			// local lazy load.
		}
	}
};

TreeNode.prototype.Collapse = function()
{
	var node = this;
	var img = FindChildElement(node.m_Element, 'IMG');
	var elmtSubTree = node.m_Element.nextSibling;
	if ( node.m_IsLoaded )
	{
		if ( node.m_IsChildExpanded )
		{
			elmtSubTree.style.display = 'none';
			node.m_IsChildExpanded = false;
			img.src = Tree.Attributes.ImageSrc(node.GetHeaderImage());
		}
	}
};

TreeNode.DelayLoad = function()
{
	var img = TreeNode.DelayLoad.srcImage;
	var action = TreeNode.DelayLoad.parentAction;
	if ( img.TreeNode )
	{
		var node = img.TreeNode;
		TreeNode.Loading(node, action);
	}
	img.document.body.style.cursor = 'default';
};

TreeNode.Loading = function(node, action)
{
	if ( typeof(node) == 'string' )
	{
		for ( var key in __TreeCache__ )
		{
			if ( key.indexOf(__TreeCache__.m_IdPrefix ) != -1 )
			{
				var tmpNode = __TreeCache__[key];
				if ( tmpNode.m_Attributes && tmpNode.m_Attributes['UniqueName'] == node )
				{
					node = tmpNode;
					break;
				}
			}
		}
	}
	if ( typeof(node) == 'string' )
	{
		return;
	}
	else
	{
		if ( node.m_IsLoaded )
		{
			return;
		}
	}
	
	var elmtSubTree = node.m_Element.nextSibling;
	var doc = elmtSubTree.document;
	if ( node.m_IsLazyLoad )
	{
		elmtSubTree.cells(1).innerHTML = '';
		var uniqueName = node.m_Attributes['UniqueName'];
		var level = node.m_Tree.m_TreeLevel;
		var subtree = TreeNode.LoadTree(uniqueName, level+1, action);
		if ( subtree )
		{
			node.m_ChildTree = subtree;
			subtree.m_ParentNode = node;
			subtree.m_TreeType = node.m_Tree.m_TreeType;
			subtree.m_TreeLevel = node.m_Tree.m_TreeLevel+1;
			elmtSubTree.cells(1).appendChild(subtree.Render(doc));
			node.m_IsLoaded = true;
			var nodeHtml = node.m_Element;
			var img = FindChildElement(nodeHtml, 'IMG');
			if ( node.IsLastNode() )
			{
				if ( node.IsFirstNode() && node.m_Tree.m_ParentNode == null )
				{
					img.src = Tree.Attributes.ImageSrc('SingleMinus.gif');
				}
				else
				{
					img.src = Tree.Attributes.ImageSrc('BottomMinus.gif');
				}
			}
			else
			{
				if ( node.IsFirstNode() && node.m_Tree.m_ParentNode == null )
				{
					img.src = Tree.Attributes.ImageSrc('TopMinus.gif');
				}
				else
				{
					img.src = Tree.Attributes.ImageSrc('MiddleMinus.gif');
				}
			}
			node.m_IsChildExpanded = true;
		}
	}
};

TreeNode.LoadTree = function(uniqueName, treeLevel, action)
{
	var dataSource = Tree.m_ConnString;
	var cubeName = Tree.m_CubeName;
	var data = TreeNode.GetTreeMember(uniqueName, treeLevel);
	if ( data )
	{
		var treeData = eval(data);
		var treeObj = new Tree();
		treeObj.m_IsChildExpanded = true;
		for ( var i=0 ; i < treeData.length ; ++i )
		{
			var tnData = treeData[i];
			var tnObj = new TreeNode(StringHelper.QuotUnescpe(tnData[0]), action);
			tnObj.SetAttribute('Caption', tnData[0]);
			tnObj.SetAttribute('UniqueName', tnData[2]);
			
			// test preformance
			__TreeNodeCache__[tnData[2]] = tnObj;

			tnObj.SetAttribute('DimensionType', tnData[4]);
			if ( tnData[3].toLowerCase() == 'true' )
			{
				tnObj.m_ChildTree = true;
				tnObj.m_IsLazyLoad = true;
			}
			treeObj.Add(tnObj);
		}
		return treeObj;
	}
	return null;
};

TreeNode.GetTreeMember = function(uniqueName, treeLevel)
{
	var url = Tree.m_ABIS + 'xxxGetMemberTree.aspx?CS=' + Tree.m_ConnString + '&CN='
		+ encodeURIComponent(Tree.m_CubeName) + '&UN=' + encodeURIComponent(uniqueName)
		+ '&TL=' + treeLevel + '&t=' + (new Date()).getTime();
	var data = __XmlHttpPool__.GetRemoteDataEx(url);
	return data;	
};

TreeNode.prototype.IsFirstNode = function()
{
	var nodes = this.m_Tree.m_Nodes;
	return this == nodes[0];
};

TreeNode.prototype.IsLastNode = function()
{
	var nodes = this.m_Tree.m_Nodes;
	return this == nodes[nodes.length-1];
};

TreeNode.prototype.AttachMouseEvents = function(tnElmt)
{
	if ( !tnElmt.eventAttached )
	{
		var span = FindChildElement(tnElmt, 'SPAN');
		if ( span )
		{
			span.attachEvent('onclick', this.ActiveNode);
			if ( typeof(this.m_Action) == 'function' )
			{
				span.attachEvent('onclick', this.m_Action);
			}
			else if ( this.m_Action != null && typeof(this.m_Action) == 'object' )
			{
				var node = this;
				span.attachEvent('onclick', function()
				{
					var obj = node.m_Action;
					if ( typeof(obj) == 'object' && obj.__defaultExecute )
					{
						obj.__defaultExecute(obj, node);
					}
				});
			}
			span.attachEvent('onmousedown', function(evt)
			{
				if ( evt.button == 2 )
				{
					span.click();
				}
			});
			span.attachEvent('oncontextmenu', function(evt)
			{
				var childTree = span.TreeNode.m_ChildTree;
				if ( childTree && childTree.m_Nodes && childTree.m_Nodes.length > 0 )
				{
					var divTree = FindParentElement(span, 'DIV');
					if ( !divTree.TreeContextMenu )
					{
						divTree.TreeContextMenu = Tree.__generateContextMenu();
					}
					divTree.TreeContextMenu.Show(window.event || evt);
				}
				else
				{
					// 没有已load的子nodes
				}
				return false;
			});
			// 由于tooltip的popup窗口可能挡住旁边TreeNode的span而使mouseover事件失效
			// 所以在TreeNode里移动鼠标时补偿判断一下tooltip是否已显示�?		
			span.attachEvent('onmousemove', function(evt)
			{
				var spanElmt = evt.srcElement;
				var treeContainer = FindParentElement(span, 'DIV');
				var tooltip = treeContainer.ToolTip;
				if ( !tooltip.isOpen )
				{
					TreeNode.prototype.ShowOverflowTip(evt);
				}
			});
			span.attachEvent('onmouseover', this.ShowOverflowTip);
			span.attachEvent('onmouseout', function(evt)
			{
				var spanElmt = evt.srcElement;
				spanElmt.blur();
			});
			tnElmt.eventAttached = true;
		}		
	}	
};

TreeNode.prototype.ShowOverflowTip = function(evt)
{
	var spanElmt = evt.srcElement;
	var frame = spanElmt.document.frames;
	
	//如果Tree在Frame内，忽略ToolTip，因为取不到scrollLeft属�?(
	var treeInFrame = false;
	if ( frame && frame.frameElement && frame.frameElement.tagName == 'FRAME' )
	{
		treeInFrame = true;
	}
	
	var spanOffset = GetAbsoluteLocationEx(spanElmt);
	var treeContainer = FindParentElement(spanElmt, 'DIV');
	var tooltip = treeContainer.ToolTip;
	if ( treeInFrame || spanOffset.absoluteLeft + spanElmt.offsetWidth 
		< treeContainer.clientWidth + treeContainer.scrollLeft )
	{
		tooltip.hide();
		// spanElmt.focus();
	}
	else
	{
		var span = tooltip.document.body.childNodes[0];
		span.innerText = spanElmt.innerText;
		span.TreeNode = spanElmt.TreeNode;		
		var w = spanElmt.offsetWidth + 2;
		var h = spanElmt.offsetHeight + 1;
		tooltip.show(-1, -1, w, h, spanElmt);
	}
	// window.status = 'Current Node: ' + spanElmt.innerText;
};

TreeNode.prototype.SetAttribute = function(key, value)
{
	this.m_Attributes[key] = value;
};

TreeNode.prototype.ActiveNode = function(evt)
{
	if ( !evt || !evt.srcElement )
	{
		return;
	}
	var span = evt.srcElement;
	var trElmt = FindParentElement(span, 'TR');
	var node = trElmt.TreeNode;
	// var activeNodes = __TreeCache__.m_ActiveNode;
	node.__resumeNode();
	// delete activeNodes[node];
	__TreeCache__.m_ActiveNode = node;
	node.__activeNode();
};

TreeNode.prototype.__activeNode = function()
{
	var node = __TreeCache__.m_ActiveNode;
	if ( node )
	{
		var trElmt = node.m_Element;
		var span = FindChildElement(trElmt.cells(1), 'SPAN');
		span.style.color = Tree.Attributes.ActiveForeColor;
		span.style.backgroundColor = Tree.Attributes.ActiveBackColor;
	}
};

TreeNode.prototype.__resumeNode = function()
{
	var node = __TreeCache__.m_ActiveNode;
	if ( node )
	{
		var trElmt = node.m_Element;
		var tdSpan = trElmt.cells(1);
		var span = FindChildElement(trElmt.cells(1), 'SPAN');
		if ( node.CheckBox && node.CheckBox.checked )
		{
			span.style.color = Tree.Attributes.NodeCheckedColor;
		}
		else
		{
			span.style.color = Tree.Attributes.NormalForeColor;
		}
		span.style.backgroundColor = Tree.Attributes.NormalBackColor;
	}
};

TreeNode.prototype.SetChecked = function(checked)
{
	var changed = false;
	if ( this.CheckBox )
	{
		if ( this.CheckBox.checked != checked )
		{
			this.CheckBox.checked = checked;
			changed = true;
		}
		span = this.CheckBox.TextSpan;
		if ( span )
		{
			if ( checked )
			{
				if ( changed )
				{
					if ( this != __TreeCache__.m_ActiveNode )
					{
						span.style.color = Tree.Attributes.NodeCheckedColor;
					}
					__TreeCache__.AddCheckedNode(this);
				}
			}
			else
			{
				if ( changed )
				{
					if ( this != __TreeCache__.m_ActiveNode )
					{
						span.style.color = Tree.Attributes.NormalForeColor;
					}
					__TreeCache__.RemoveCheckedNode(this);
				}
			}
		}
	}
};

TreeNode.prototype.GetChecked = function()
{
	if ( this.CheckBox )
	{
		return this.CheckBox.checked;
	}
};

TreeNode.prototype.GetHeaderImage = function()
{
	var nodeCount = this.m_Tree.m_Nodes.length;
	if ( ( nodeCount > 1 || this.m_IsLazyLoad ) && !this.IsLastNode() )
	{
		if ( !this.m_ChildTree )
		{
			if ( this.IsFirstNode() && this.m_Tree.m_ParentNode == null )
			{
				return 'TopLine.gif';
			}
			else
			{
				return 'MiddleCrossLine.gif';
			}
		}
		else
		{
			if ( this.m_IsChildExpanded )
			{
				if ( this.IsFirstNode() && this.m_Tree.m_ParentNode == null )
				{
					return 'TopMinus.gif';
				}
				else
				{
					return 'MiddleMinus.gif';
				}
			}
			else
			{
				if ( this.IsFirstNode() && this.m_Tree.m_ParentNode == null )
				{
					return 'TopPlus.gif';
				}
				else
				{
					return 'MiddlePlus.gif';
				}
			}
		}
	}
	else
	{
		if ( !this.m_ChildTree )
		{
			if ( this.IsFirstNode() && this.m_Tree.m_ParentNode == null )
			{
				return 'SingleNode.gif';
			}
			else
			{	
				return 'BottomLine.gif';
			}
		}
		else
		{
			if ( this.m_IsChildExpanded )
			{
				if ( this.IsFirstNode() && this.m_Tree.m_ParentNode == null )
				{
					return 'SingleMinus.gif';
				}
				else
				{
					return 'BottomMinus.gif';
				}
			}
			else
			{
				if ( this.IsFirstNode() && this.m_Tree.m_ParentNode == null )
				{
					return 'SinglePlus.gif';
				}
				else
				{
					return 'BottomPlus.gif';
				}
			}
		}
	}
	return 'default.gif';
};

TreeNode.prototype.Render = function(doc)
{
	var trNode = doc.createElement('TR');
	trNode.TreeNode = this;
	this.m_Element = trNode;
	
	var tdHeader = doc.createElement('TD');

	var imgName = this.GetHeaderImage();
	if ( imgName == 'TopLine.gif' || imgName == 'MiddleCrossLine.gif' 
		|| imgName == 'SingleNode.gif' || imgName == 'ButtonLine.gif' )
	{
		tdHeader.innerHTML = Tree.Attributes.Image(imgName);
	}
	else
	{
		var img = doc.createElement(Tree.Attributes.Image(imgName));
		img.TreeNode = this;
		this.AttachImageEvents(img);
		tdHeader.appendChild(img);
	}
	
	tdHeader.width = 16;
	trNode.appendChild(tdHeader);
	
	var tdContent = doc.createElement('TD');
	tdContent.noWrap = 'nowrap';
	
	if ( Tree.Attributes.HasCheckBox )
	{
		var chkb = doc.createElement('INPUT');
		chkb.type = 'checkbox';
		chkb.setAttribute('hidefocus', 'hidefocus');
		chkb.checked = this.m_Checked;
		chkb.onfocus = function()
		{
			var container = FindParentElement(this, 'DIV');
			container.focusPark.select();
		};
		chkb.onclick = function()
		{
			var span = FindChildElement(this.parentElement, 'SPAN');
			var nodeHtml = FindParentElement(this, 'TR');
			if ( nodeHtml.TreeNode != __TreeCache__.m_ActiveNode )
			{
				if ( this.checked )
				{
					span.style.color = Tree.Attributes.NodeCheckedColor;
				}
				else
				{
					span.style.color = Tree.Attributes.NormalForeColor;
				}
			}
			if ( this.checked )
			{
				__TreeCache__.AddCheckedNode(span.TreeNode);
			}
			else
			{
				__TreeCache__.RemoveCheckedNode(span.TreeNode);
			}
			// for debug...
			var nodes = __TreeCache__.m_CheckedNodes;
			window.status = nodes.length + ': ';
			for ( var t=0 ; t < nodes.length ; ++t )
			{
				window.status += ', ' + nodes[t].m_Text;
			}
		};
		tdContent.appendChild(chkb);

		if ( this.m_Tree.m_TreeType == Tree.TreeType.DimensionTree )
		{
			if ( this.m_Tree.m_TreeLevel == 0 )
			{
				chkb.style.display = 'none';
			}
		}
		this.CheckBox = chkb;
	}
	
	if ( Tree.Attributes.ShowIcon )
	{
		var img = doc.createElement('IMG');
		img.align = 'absmiddle';
		if ( this.m_Icon )
		{
			img.src = this.m_Icon;
		}
		else
		{
			img.src = Tree.Attributes.IconSrc();
		}
		if ( this.m_Tree.m_TreeType == Tree.TreeType.DimensionTree )
		{
			if ( this.m_Tree.m_TreeLevel == 0 )
			{
				img.src = Tree.Attributes.IconSrc('Images/Dimension.gif');
			}
			else
			{
				img.src = Tree.Attributes.IconSrc('Images/Member.gif');
			}
			if ( this.m_Attributes['DimensionType'] == DimensionType.Measure )
			{
				img.src = Tree.Attributes.IconSrc('Images/Measure.gif');
			}
		}
		tdContent.appendChild(img);
	}
		
	var spanText = doc.createElement('SPAN');
	if ( this.CheckBox )
	{
		this.CheckBox.TextSpan = spanText;
	}
	spanText.style.cursor = 'default';
	spanText.noWrap = 'nowrap';
	spanText.style.fontFamily = 'Tahoma';
	spanText.style.color = Tree.Attributes.NormalForeColor;
	spanText.style.backgroundColor = Tree.Attributes.NormalBackColor;
	spanText.tabIndex = 1;
	spanText.TreeNode = this;
	if ( this.m_Text )
	{
		spanText.innerText = this.m_Text;
	}
	else
	{
		spanText.innerHTML = L_Untitled;
	}
	tdContent.appendChild(spanText);
	this.AttachMouseEvents(tdContent);
	trNode.appendChild(tdContent);
	return trNode;
};