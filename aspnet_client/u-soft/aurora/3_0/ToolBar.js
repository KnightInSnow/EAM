/***********************************************************
ToolBar class created by JScript
Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 1.5
Created: 2005.01.24 18:30
Last Updated: 2006.10.21 13:23

History:
	1. The code created at 2005.01.24
	2. Basic function was completed. [2005.01.25]
	3. Event handler was attached. [2005.01.26]
	4. Support horizontal layout. [2005.01.28]
	5. Fix disabled element occur OnMouseOver event bug. [2005.02.18]
	6. Refactoring ToolBarButtonBase & ToolBarButton. [2005.02.23]
	7. Implement ToolBarCheckButton & ToolBarRadioButton. [2005.02.25]
	8. Implement ToolBarMenuButton. [2005.03.24]
	9. Fixed Dispose bug for new button. [2005.03.25]
	10. Add ToolBarDropDownButton. [2005.04.26]
	11. Modify ToolBar UI. [2006.10.23]

***********************************************************/

__ToolBarCache__ =
{
	m_Count : 0,
	m_IdPrefix : "__ToolBarObject__",

	NewId : function()
	{
		return this.m_IdPrefix + this.m_Count++;
	},

	Remove : function(mi)
	{
		delete this[mi.m_Id];
	}
};

function ToolBar()
{
	this.Extends(CollectionBase);
	this.m_Buttons = this.m_InnerArray;

	this.m_Size = 22;
	this.m_Padding = 0;
	this.m_FontSize = 0;
	this.m_IsHorizontalLayout = true;
	this.m_IsVisibility = true;
	this.m_ButtonPadding = 1;
	this.m_ActiveButton = null;
	this.m_Container = null;
	this.m_Id = __ToolBarCache__.NewId();
	// __ToolBarCache__[this.m_Id] = this;

	this.InsertAt = function(toolbutton, index)
	{
		if ( toolbutton && typeof(index) != 'undefined' )
		{
			toolbutton.m_ToolBar = this;
			this.base.InsertAt.Call(this, toolbutton, index);
		}
	};

	this.toString = function()
	{
		return '[class ToolBar]';
	};
}

ToolBar.prototype.Initialize = function(container)
{
	if ( !container || !container.document )
	{
		return;
	}
	if ( !container.ToolBar )
	{
		this.m_Container = container;
		var toolBar = this.Render(container.document);
		container.appendChild(toolBar);
		container.ToolBar = toolBar;
	}
};

ToolBar.prototype.Render = function(doc)
{
	var bar = doc.createElement('TABLE');
	__ToolBarCache__[this.m_Id] = bar;
	bar.id = this.m_Id;
	bar.Object = this;
	bar.onselectstart = function () { return false; };
	bar.oncontextmenu = function () { return false; };
	bar.cellSpacing = 0;
	bar.cellPadding = this.m_ButtonPadding;
	var tbody = doc.createElement('TBODY');
	bar.appendChild(tbody);
	if ( this.m_IsHorizontalLayout )
	{
		var tr = doc.createElement('TR');
		for ( var i=0 ; i < this.m_Count ; ++i )
		{
			tr.appendChild(this.m_Buttons[i].Render(doc));
		}
		tbody.appendChild(tr);
	}
	else
	{
		for ( var i=0 ; i < this.m_Count ; i++ )
		{
			var tr = doc.createElement('TR');
			tr.appendChild(this.m_Buttons[i].Render(doc));
			tbody.appendChild(tr);
		}
	}
	return bar;
};

ToolBar.prototype.Dispose = function()
{
	var elmt = this.GetElement();
	if ( elmt )
	{
		elmt.onselectstart = '';
		elmt.oncontentmenu = '';
		elmt.clearAttributes();
	}
	
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		this.m_Buttons[i].Dispose();
		// 实现Remove的Array.splice方法会导致内存不能释�?
		// 即使在调用splice前已做了delete操作也同样无�?
		// this.Remove(this.m_Buttons[i]);
		delete this.m_Buttons[i];
	}

	this.m_Container.removeNode(true);
	this.m_Container.clearAttributes();
	this.m_Container.innerHTML = '';
	this.m_Container = null;
	this.base = null;
};

ToolBar.prototype.GetElement = function()
{
	return __ToolBarCache__[this.m_Id];
};

ToolBar.prototype.Resume = function()
{
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var button = this.m_Buttons[i];
		if ( button.Resume )
		{
			button.Resume();
		}
	}
};

ToolBar.prototype.Disable = function()
{
	for ( var i=0 ; i < this.m_Buttons.length ; ++i )
	{
		var button = this.m_Buttons[i];
		if ( button.Disable )
		{
			button.Disable();
		}
	}
};

ToolBar.prototype.Enable = function()
{
	for ( var i=0 ; i < this.m_Buttons.length ; ++i )
	{
		var button = this.m_Buttons[i];
		if ( button.Enable )
		{
			button.Enable();
		}
	}
};

ToolBar.prototype.Show = function()
{
	this.m_IsVisibility = true;
	this.ApplyUIChange();
};

ToolBar.prototype.Hide = function()
{
	this.m_IsVisibility = false;
	this.ApplyUIChange();
};

ToolBar.prototype.ApplyUIChange = function()
{
	if ( !this.m_IsVisibility )
	{
		this.GetElement().runtimeStyle.display = 'none';
	}
	else
	{
		this.GetElement().runtimeStyle.display = '';
	}
};

//
// ToolBarButtonBase class goes here
//
function ToolBarButtonBase()
{
	this.m_ToolBar = null;
	this.m_IsVisibility = true;
	this.m_Id = __ToolBarCache__.NewId();

	this.toString = function()
	{
		return '[class ToolBarButtonBase]';
	};	
}

ToolBarButtonBase.prototype.Render = function(doc)
{
	var btnContainer = doc.createElement('TD');
	__ToolBarCache__[this.m_Id] = btnContainer;
	btnContainer.id = this.m_Id;	
	btnContainer.noWrap = true;
	btnContainer.Object = this;
	this.ApplyUIChange();	
	return btnContainer;
};

ToolBarButtonBase.prototype.Dispose = function()
{
	var elmt = this.GetElement();
	elmt.clearAttributes();
	elmt.innerHTML = '';
};

ToolBarButtonBase.prototype.GetElement = function()
{
	return __ToolBarCache__[this.m_Id];
};

ToolBarButtonBase.prototype.ApplyUIChange = function()
{
	with(this.GetElement().runtimeStyle)
	{
		if ( this.m_IsVisibility )
		{
			display = '';
		}
		else
		{
			display = 'none';
		}	
	}
};

ToolBarButtonBase.prototype.Show = function()
{
	this.m_IsVisibility = true;
	this.ApplyUIChange();
};

ToolBarButtonBase.prototype.Hide = function()
{
	this.m_IsVisibility = false;
	this.ApplyUIChange();
};

//
// ToolBarButton Class goes here
//
function ToolBarButton(caption, icon, tooltip)
{
	this.Extends(ToolBarButtonBase);

	this.m_Caption = caption;
	this.m_Icon = icon;
	this.m_Tooltip = tooltip || caption;

	this.m_IsActived = false;
	this.m_IsClicked = false;
	this.m_IsDisabled = false;
	
	this.m_IsPlain = true;
	this.m_IsShowText = true;
	
	this.e_Clicked = null;
	this.e_Actived = null;
	
	this.toString = function()
	{
		return '[class ToolBarButton]';
	};
}

//Need set class name
//1.ButtonIsPlain
//2.ButtonNotPlain
ToolBarButton.prototype.Render = function(doc)
{
	var btn = this.base.Render.Call(this, doc);
	var size = this.m_ToolBar.m_Size;
	
	var div = doc.createElement('DIV');
	div.style.textAlign = 'center';
	div.style.padding = this.m_ToolBar.m_Padding;
	btn.Button = div;
	div.Object = this;
	
	if ( !this.m_IsShowText )
	{
		div.title = this.m_Tooltip;
	}
	div.style.width = size;
	div.style.height = size;
	div.noWrap = 'nowrap';
	if ( this.m_IsPlain )
	{
		div.className = 'ButtonIsPlain';
	}
	else
	{
		div.className = 'ButtonNotPlain';
	}
	div.onmouseover = function()
	{
		if ( event )
		{
			var fromElement = FindParentElement(event.fromElement, 'DIV');
			var toElement = FindParentElement(event.toElement, 'DIV');
			if ( this === fromElement && fromElement === toElement )
			{
				return ;
			}
		}
		if ( div.disabled || event === null )
		{
			return;
		}
		var objButton = this.Object;
		if ( !objButton.m_Clicked )
		{
			objButton.m_IsClicked = false;
			objButton.m_ToolBar.Resume();
			objButton.m_IsActived = true;
			objButton.ApplyUIChange();
			objButton.FireEvents();
		}
	};	
	div.onmouseout = function()
	{
		if ( event )
		{
			var fromElement = FindParentElement(event.fromElement, 'DIV');
			var toElement = FindParentElement(event.toElement, 'DIV');
			if ( this === fromElement && fromElement === toElement )
			{
				return ;
			}
		}
		if ( event === null )
		{
			return ;
		}
		var objButton = this.Object;
		objButton.m_IsActived = false;
		objButton.m_IsClicked = false;
		// objButton.ApplyUIChange();
		if ( this.onmouseup )
		{
			this.onmouseup();
		}
	};
	if ( this.m_Icon )
	{
		var img = doc.createElement('IMG');
		btn.Icon = img;
		img.align = 'absMiddle';
		img.Object = this;
		img.border = 0;
		img.vspace = 2;
		img.hspace = 2;
		img.src = this.m_Icon;
		// img.style.position = 'relative';
		div.appendChild(img);
	}
	if ( this.m_IsShowText )
	{
		var span = doc.createElement('SPAN');
		btn.Span = span;
		span.Object = this;
		span.innerHTML = this.m_Caption;
		span.style.cursor = 'default';
		// span.style.position = 'relative';
		span.style.padding = '2 2 0 2px !important';
		if ( this.m_ToolBar.m_FontSize )
		{
			span.style.fontSize = this.m_ToolBar.m_FontSize;
		}
		div.appendChild(span);
	}
	else
	{
		div.style.padding = '1 1 0 1px';
	}
	div.onmousedown = function()
	{
		var evt = this.document.parentWindow.event;
		if ( evt && ( this.disabled || evt.button == 2 ) )
		{
			return;
		}
		this.setCapture();
		objButton = this.Object;
		objButton.m_IsClicked = true;
		objButton.ApplyUIChange();
		objButton.FireEvents();
	};
	div.onmouseup = function()
	{
		if ( this.disabled )
		{
			return;
		}
		this.releaseCapture();
		objButton = this.Object;
		objButton.m_IsClicked = false;
		objButton.ApplyUIChange();
	};
	this.ApplyUIChange();
	btn.appendChild(div);
	return btn;
};

ToolBarButton.prototype.Dispose = function()
{
	var elmt = this.GetElement();
	with(elmt.Button)
	{
		onmouseover = '';
		onmouseout = '';
		onmousedown = '';
		onmouseup = '';
		clearAttributes();
		innerHTML = '';
	}
	elmt.removeNode(true);
	this.base.Dispose.Call(this);
	this.base = null;
};

ToolBarButton.prototype.SetIcon = function(icon)
{
	if ( icon )
	{
		this.m_Icon = icon;
		var elmt = this.GetElement();
		elmt.Icon.src = this.m_Icon;
	}
};

//Need set class name
//1.ButtonIsActive
//2.ButtonNotActive
ToolBarButton.prototype.ApplyUIChange = function()
{
	this.base.ApplyUIChange.Call(this);
	var elmt = this.GetElement();
	if ( !elmt.Button ) return;
	
	if( this.m_IsActived )
	{
		elmt.Button.className = 'ButtonIsActive';
	}
	else
	{
		elmt.Button.className = 'ButtonNotActive';
	}
	
	if ( elmt.Icon )
	{
		with(elmt.Icon.runtimeStyle)
		{
			if ( this.m_IsClicked )
			{
				position = 'relative';
				top = 1;
				left = 1;
			}
			else
			{
				top = '';
				left = '';
			}
		}
	}
	if ( elmt.Span )
	{
		with(elmt.Span.runtimeStyle)
		{
			if ( this.m_IsClicked )
			{
				position = 'relative';
				top = 1;
				left = 1;
			}
			else
			{
				top = '';
				left = '';
			}
		}
	}	
	elmt.Button.disabled = this.m_IsDisabled;
	if ( elmt.Icon )
	{
		with(elmt.Icon)
		{
			disabled = this.m_IsDisabled;
			if ( this.m_IsDisabled )
			{
				runtimeStyle.filter = 'gray(1)';
			}
			else
			{
				runtimeStyle.filter = '';
			}
		}
	}
	if ( this.m_ToolTip )
	{
		elmt.Button.title = this.m_ToolTip;
	}
};

ToolBarButton.prototype.FireEvents = function()
{
	if ( this.m_IsActived && this.e_Actived )
	{
		this.e_Actived.Execute(this);
	}
	if ( this.m_IsClicked && this.e_Clicked )
	{
		this.e_Clicked.Execute(this);
	}
};

ToolBarButton.prototype.Resume = function()
{
	this.m_IsActived = false;
	this.ApplyUIChange();
};

ToolBarButton.prototype.Disable = function()
{
	this.m_IsDisabled = true;
	this.ApplyUIChange();
};

ToolBarButton.prototype.Enable = function()
{
	this.m_IsDisabled = false;
	this.ApplyUIChange();
};

// ToolBarSeparator class goes here

function ToolBarSeparator()
{
	this.Extends(ToolBarButtonBase);
	
	this.toString = function()
	{
		return '[class ToolBarSeparator]';
	};
}

ToolBarSeparator.Width = 4;

//Need set className
//1.HorizontalSeparator
//2.VerticalSeparator
ToolBarSeparator.prototype.Render = function(doc)
{
	var btn = this.base.Render.Call(this, doc);
	var size = this.m_ToolBar.m_Size;

	btn.align = 'center';
	btn.vAlign = 'middle';
	if ( this.m_ToolBar.m_IsHorizontalLayout )
	{
		btn.width = ToolBarSeparator.Width;
		btn.height = size;
		btn.className = 'HorizontalSeparator';
	}
	else
	{
		btn.width = size;
		btn.height = ToolBarSeparator.Width;
		btn.className = 'VerticalSeparator';
	}
	return btn;
};

ToolBarSeparator.prototype.Dispose = function()
{
	this.GetElement().removeNode(true);
	this.base.Dispose.Call(this);
	this.base = null;
};

// ToolBarCheckButton class goes here

function ToolBarCheckButton(caption, icon)
{
	this.Extends(ToolBarButton, caption, icon);
	
	this.m_IsPinned = false;
	this.m_PinnedColor = '#c1d2ee';

	this.e_Checked = null;
	this.e_Unchecked = null;

	this.toString = function()
	{
		return '[class ToolBarCheckButton]';
	}		
}

ToolBarCheckButton.prototype.Render = function(doc)
{
	var elmt = this.base.Render.Call(this, doc);
	
	//elmt.Button.onmouseover = '';
	//elmt.Button.onmouseout = '';
	//在此使用attachEvent方法，会出现事件处理函数错误触发
	/*elmt.Button.attachEvent('onmousedown', function(evt)
	{
		var elmtButton = FindParentElementEx(evt.srcElement, 'TD');
		var objButton = elmtButton.Object;
		objButton.m_IsPinned = !objButton.m_IsPinned;
		objButton.ApplyUIChange();
		objButton.FireEvents();
	});*/
	elmt.Button.onmouseover = function()
	{
		if( !this.Object.m_IsPinned )
		{
			this.className = "CheckButtonOnMouseOver";
		}
	};
	elmt.Button.onmouseout = function()
	{
		if ( !this.Object.m_IsPinned )
		{
			this.className = "CheckButtonCommon";
		}
	};
	elmt.Button.onmousedown = function()
	{
		var evt = this.document.parentWindow.event;
		if ( this.disabled || evt.button == 2 )
		{
			return;
		}	
		var objButton = this.Object;
		objButton.m_IsPinned = !objButton.m_IsPinned;
		objButton.ApplyUIChange();
		objButton.FireEvents();
	};
	elmt.Button.onmouseup = '';
	return elmt;
}

ToolBarCheckButton.prototype.Dispose = function()
{
	if ( this.e_Checked )
	{
		this.e_Checked = null;
	}
	if ( this.e_Unchecked )
	{
		this.e_Unchecked = null;
	}
	this.base.Dispose.Call(this);
	this.base = null;
};

//Need set className
//1.CheckButtonIsPinned
//2.CheckButtonNotPinned
ToolBarCheckButton.prototype.ApplyUIChange = function()
{
	this.base.ApplyUIChange.Call(this);
	var elmt = this.GetElement();
	if ( !elmt.Icon ) return;
	
	with( elmt )
	{
		if ( this.m_IsPinned )
		{
			Icon.runtimeStyle.position = 'relative';
			Icon.runtimeStyle.top = 1;
			Icon.runtimeStyle.left = 1;
			if ( this.m_IsShowText )
			{
				Span.runtimeStyle.position = 'relative';
				Span.runtimeStyle.top = 1;
				Span.runtimeStyle.left = 1;
			}
			Button.className = 'CheckButtonIsPinned';
		}
		else
		{
			Icon.runtimeStyle.top = 0;
			Icon.runtimeStyle.left = 0;
			if ( this.m_IsShowText )
			{
				Span.runtimeStyle.top = 0;
				Span.runtimeStyle.left = 0;
			}
			Button.className = 'CheckButtonCommon';
		}
	}
};

ToolBarCheckButton.prototype.FireEvents = function()
{
	if ( this.m_IsPinned )
	{
		if ( this.e_Checked )
		{
			this.e_Checked.Execute(this);
		}
	}
	else
	{
		if ( this.e_Unchecked )
		{
			this.e_Unchecked.Execute(this);
		}
	}
};

ToolBarCheckButton.prototype.Pinned = function(ignoreEvent)
{
	this.m_IsPinned = true;
	this.ApplyUIChange();
	if ( !ignoreEvent )
	{
		this.FireEvents();
	}
};

ToolBarCheckButton.prototype.Unpinned = function(ignoreEvent)
{
	this.m_IsPinned = false;
	this.ApplyUIChange();
	if ( !ignoreEvent )
	{
		this.FireEvents();
	}
};

// ToolBarRadioButton class goes here

function ToolBarRadioButton(caption, icon, group)
{
	this.Extends(ToolBarCheckButton, caption, icon);

	this.m_MutexGroup = 'default';
	if ( group != undefined )
	{
		this.m_MutexGroup = group;
	}

	this.toString = function()
	{
		return '[class ToolBarRadioButton]';
	};
}

ToolBarRadioButton.prototype.Render = function(doc)
{
	var elmt = this.base.Render.Call(this, doc);

	elmt.Button.onmousedown = function()
	{
		var evt = this.document.parentWindow.event;
		if ( this.disabled || evt.button == 2 )
		{
			return;
		}
		var objButton = this.Object;
		if ( objButton.m_IsDisabled )
		{
			return;
		}
		objButton.Pinned();
	};
	return elmt;
}

ToolBarRadioButton.prototype.Pinned = function()
{
	if ( !this.m_IsPinned )
	{
		this.ResumeGroup();
		this.base.Pinned.Call(this);
	}
};

ToolBarRadioButton.prototype.Unpinned = function()
{
	if ( this.m_IsPinned )
	{
		this.base.Unpinned.Call(this);
	}
};

ToolBarRadioButton.prototype.ResumeGroup = function()
{
	var mutexGroup = this.m_MutexGroup;
	var toolbar = this.m_ToolBar;
	for ( var i=0 ; i < toolbar.m_Count ; ++i )
	{
		var button = toolbar.Items(i);
		if ( button.m_MutexGroup && button.m_MutexGroup == mutexGroup )
		{
			button.Unpinned();
		}
	}
};	

// ToolBarMenuButton class goes here

function ToolBarMenuButton(caption, icon, menu)
{
	this.Extends(ToolBarButton, caption, icon);
	
	if ( !menu )
	{
		menu = new Menu()
	}
	if ( menu.m_Items.length == 0 )
	{
		var mi = new MenuItem('default item', null, 'Images/member.gif');
		menu.Add(mi);
	}
	this.m_Menu = menu;
	this.m_CurrentItem = null;
	menu.m_MenuButton = this;
	this.m_IsMenuButtonClick = false;
	this.m_ResumeTimer = null;
	
	this.e_PopupMenu = null;
	
	this.toString = function()
	{
		return '[class ToolBarMenuButton]';
	};
}

ToolBarMenuButton.prototype.Render = function(doc)
{
	var td = this.base.Render.Call(this, doc); 
	var menuIcon = doc.createElement('IMG');
	td.MenuIcon = menuIcon;
	menuIcon.src = 'images/menuicon.gif';
	menuIcon.align = 'absmiddle';
	menuIcon.onmousedown = ToolBarMenuButton.__OnMouseDown;
	menuIcon.onmouseup = ToolBarMenuButton.__OnMouseUp;
	menuIcon.onmouseover = ToolBarMenuButton.__OnMouseOver;
	menuIcon.onmouseout = ToolBarMenuButton.__OnMouseOut;
	menuIcon.onclick = ToolBarMenuButton.__OnClick;
	td.Button.style.display = 'inline';
	//td.className = 'MenuButtonImg';
	td.appendChild(menuIcon);
	this.ApplyUIChange();
	if ( !this.m_CurrentItem )
	{
		if ( this.m_Menu && this.m_Menu.m_Items.length > 0 )
		{
			this.m_CurrentItem = this.m_Menu.m_Items[0];
		}
	}
	this.SendToButton(this.m_CurrentItem);
	return td;
};

ToolBarMenuButton.prototype.Dispose = function()
{
	this.m_Menu.m_MenuButton = null;
	this.m_CurrentItem = null;
	this.m_Menu = null;
	var elmt = this.GetElement();
	if ( elmt.MenuIcon )
	{
		with(elmt.MenuIcon)
		{
			onmouseup = '';
			onmousedown = '';
			onmouseover = '';
			onmouseout = '';
			onclick = '';
			removeNode(true);
			clearAttributes();
		}
	}
	this.base.Dispose.Call(this);
	this.base = null;
};

ToolBarMenuButton.__OnMouseDown = function()
{
	var button = this.previousSibling;
	button.onmouseover();
	this.setCapture();
	button.Object.m_IsMenuButtonClick = true;
};

ToolBarMenuButton.__OnMouseUp = function()
{
	this.releaseCapture();
};

ToolBarMenuButton.__OnMouseOver = function()
{
	var button = this.previousSibling;
	button.onmouseover();
};

ToolBarMenuButton.__OnMouseOut = function()
{
	var button = this.previousSibling;
	if ( button )
	{
		var evt = button.document.parentWindow.event;
		if ( evt )
		{
			var toElmt = FindParentElementEx(evt.toElement, 'DIV') || evt.toElement;
			if ( ( toElmt && toElmt != button && evt.fromElement ) 
				|| ( !toElmt && (!button.Object.m_Menu.m_Popup 
				|| !button.Object.m_Menu.m_Popup.isOpen) ) )
			{
				var objButton = button.Object;
				objButton.m_IsMenuButtonClick = false;
				button.onmouseout();
				this.onmouseup();
				objButton.m_Menu.Hide();
			}
		}
	}
};

ToolBarMenuButton.__OnClick = function()
{
	var button = this.previousSibling;
	if ( button )
	{
		var objButton = button.Object;
		var win = this.document.parentWindow;
		if ( objButton.m_ResumeTimer )
		{
			win.clearInterval(objButton.m_ResumeTimer);
		}
		button.onmouseover();
		if ( objButton.m_Menu )
		{
			var btnRect = button.getBoundingClientRect();
			var menu = objButton.m_Menu;
			var x = btnRect.left+event.screenX-event.x;
			var y = btnRect.top+event.screenY-event.y;
			y += parseInt(button.currentStyle.height)-1;
			if ( objButton.e_PopupMenu )
			{
				objButton.e_PopupMenu.Execute(menu);
			}
			menu.ShowXY(x, y, window);
			objButton.m_ResumeTimer = win.setInterval(function()
			{
				var menu = objButton.m_Menu;
				if ( !menu.m_Popup.isOpen )
				{
					objButton.m_IsMenuButtonClick = false;
					objButton.GetElement().Button.fireEvent('onmouseout');
					win.clearInterval(objButton.m_ResumeTimer);
				}
			}, 200);
		}
		objButton.ApplyUIChange();
	}
};

ToolBarMenuButton.prototype.Disable = function()
{
	this.base.Disable.Call(this);
	var elmt = this.GetElement();
	if ( elmt.MenuIcon )
	{
		elmt.MenuIcon.disabled = true;
	}
};

ToolBarMenuButton.prototype.Enable = function()
{
	this.base.Disable.Call(this);
	var elmt = this.GetElement();
	if ( elmt.MenuIcon )
	{
		elmt.MenuIcon.disabled = false;
	}
};

ToolBarMenuButton.prototype.SendToButton = function(menuItem, evt)
{
	var elmt = this.GetElement();
	elmt.Icon.src = menuItem.m_Icon;
	if ( this.m_IsShowText )
	{
		elmt.Span.innerText = menuItem.m_Text;
	}
	else
	{
		elmt.Button.title = menuItem.m_Text;
	}
	this.m_CurrentItem = menuItem;
	if ( menuItem.m_Tooltip )
	{
		elmt.Button.title = menuItem.m_Tooltip;
	}
	if ( evt )
	{
		with(elmt.Button)
		{
			onmousedown();
			onmouseup();
		}
	}
};

ToolBarMenuButton.Callback = function(evt)
{
	var mi = Menu.GetMenuItem(evt);
	var menu = mi.m_Menu;
	while(menu.m_ParentMenu)
	{
		menu = menu.m_ParentMenu;
	}
	var mb = menu.m_MenuButton;
	if ( mb )
	{
		mb.m_IsMenuButtonClick = false;
		mb.SendToButton(mi, evt);
	}
};

//Need Set className
//1.MenuButtonClick
//2.MenuButtonIsActive
//3.MenuButtonNotActive_IsPlain
//4.MenuButtonNotActive_NotPlain
ToolBarMenuButton.prototype.ApplyUIChange = function()
{
	if ( this.m_IsMenuButtonClick )
	{
		this.GetElement().Button.className = 'MenuButtonClick';
	}
	else
	{
		this.base.ApplyUIChange.Call(this);
		var elmt = this.GetElement();
		if ( elmt.MenuIcon )
		{
			with(elmt.MenuIcon.runtimeStyle)
			{
				height = parseInt(elmt.Button.clientHeight);
				if ( height == '0px' )
				{
					height = parseInt(elmt.Button.currentStyle.height)-1;
				}
				else if( !this.m_IsActived )
				{
					height = parseInt(height) - 1;
				}
			}
			if ( this.m_IsActived )
			{
				elmt.MenuIcon.className = 'MenuButtonIsActive';
			}
			else
			{
				if ( this.m_IsPlain )
				{
					elmt.MenuIcon.className = 'MenuButtonNotActive_IsPlain';
				}
				else
				{
					elmt.MenuIcon.className = 'MenuButtonNotActive_NotPlain';
				}
			}
		}
	}
};

//
// ToolBarDropDownButton class goes here
//
function ToolBarDropDownButton(caption, icon, menu)
{
	if ( menu == null )
	{
		throw new Error('menu can\'t equal null.');
	}
	
	this.Extends(ToolBarButton, caption, icon);
	
	this.m_Menu = menu;
	this.m_CurrentItem = null;
	menu.m_MenuButton = this;
	this.m_IsMenuButtonClick = false;
	this.m_ResumeTimer = null;
	
	this.e_PopupMenu = null;
	
	this.toString = function()
	{
		return '[class ToolBarDropDownButton]';
	};
}

ToolBarDropDownButton.prototype.Render = function(doc)
{
	var td = this.base.Render.Call(this, doc); 
	this.e_Clicked = null;
	var menuIcon = doc.createElement('IMG');
	td.Button.MenuIcon = menuIcon;
	// menuIcon.style.position = 'relative';
	menuIcon.src = 'images/menuicon.gif';
	menuIcon.align = 'absmiddle';
	td.Button.attachEvent('onmousedown', ToolBarDropDownButton.__OnMouseDown);
	td.Button.onmouseup = ToolBarDropDownButton.__OnMouseUp;
	//menuIcon.onmouseup = ToolBarDropDownButton.__OnMouseUp;
	//menuIcon.onmouseover = ToolBarDropDownButton.__OnMouseOver;
	td.Button.attachEvent('onmouseout', ToolBarDropDownButton.__OnMouseOut);
	td.Button.appendChild(menuIcon);
	this.ApplyUIChange();
	if ( !this.m_CurrentItem )
	{
		if ( this.m_Menu && this.m_Menu.m_Items.length > 0 )
		{
			this.m_CurrentItem = this.m_Menu.m_Items[0];
		}
	}
	return td;
};

ToolBarDropDownButton.prototype.Dispose = function()
{
	this.m_Menu.m_MenuButton = null;
	this.m_CurrentItem = null;
	this.m_Menu = null;
	var elmt = this.GetElement();
	if ( elmt.Button.MenuIcon )
	{
		with(elmt.Button.MenuIcon)
		{
			onmouseup = '';
			onmousedown = '';
			onmouseover = '';
			onmouseout = '';
			onclick = '';
			removeNode(true);
			clearAttributes();
		}
	}
	this.base.Dispose.Call(this);
	this.base = null;
};

ToolBarDropDownButton.__OnMouseDown = function(evt)
{
	if ( this.disabled || evt.button == 2 )
	{
		return;
	}
	var srcElement = evt.srcElement;
	var button = FindParentElement(srcElement, 'DIV');
	button.Object.m_IsMenuButtonClick = true;
	button.Object.ApplyUIChange();
	ToolBarDropDownButton.__ShowMenu(evt, button);
};

ToolBarDropDownButton.__OnMouseUp = function()
{
	this.releaseCapture();
};

ToolBarDropDownButton.__OnMouseOver = function()
{
	var button = FindParentElement(this, 'DIV');
	button.onmouseover();
};

ToolBarDropDownButton.__OnMouseOut = function(evt)
{
	var button = FindParentElement(evt.srcElement, 'DIV');
	if ( button )
	{
		var evt = button.document.parentWindow.event;
		if ( evt )
		{
			var toElmt = FindParentElementEx(evt.toElement, 'DIV') || evt.toElement;
			if ( ( toElmt && toElmt != button && evt.fromElement )
				|| ( !toElmt && (!button.Object.m_Menu.m_Popup
				|| !button.Object.m_Menu.m_Popup.isOpen) ) )
			{
				var objButton = button.Object;
				objButton.m_IsMenuButtonClick = false;
				if ( button.onmouseout )
				{
					button.onmouseout();
				}
				// this.onmouseup();
				objButton.m_Menu.Hide();
				objButton.ApplyUIChange();
			}
		}
	}
};

ToolBarDropDownButton.__ShowMenu = function(evt, button)
{
	if ( button )
	{
		var objButton = button.Object;
		var win = button.document.parentWindow;
		if ( objButton.m_ResumeTimer )
		{
			win.clearInterval(objButton.m_ResumeTimer);
		}
		if ( objButton.m_Menu )
		{
			var btnRect = button.getBoundingClientRect();
			var menu = objButton.m_Menu;
			var x = btnRect.left+evt.screenX-evt.clientX;
			var y = btnRect.top+evt.screenY-evt.clientY;
			y += parseInt(button.currentStyle.height);
			if ( objButton.e_PopupMenu )
			{
				objButton.e_PopupMenu.Execute(menu);
			}
			menu.ShowXY(x, y-1, win);
			objButton.m_ResumeTimer = win.setInterval(function()
			{
				var menu = objButton.m_Menu;
				if ( !menu.m_Popup || !menu.m_Popup.isOpen )
				{
					objButton.m_IsMenuButtonClick = false;
					objButton.GetElement().Button.onmouseout();
					objButton.ApplyUIChange();
					win.clearInterval(objButton.m_ResumeTimer);
				}
			}, 200);
		}
	}
};

ToolBarDropDownButton.prototype.ApplyUIChange = function()
{
	this.base.ApplyUIChange.Call(this);
	var btn = this.GetElement().Button;
	if ( btn && btn.Icon )
	{
		with(btn.Icon.runtimeStyle)
		{
			if ( this.m_IsClicked || this.m_IsMenuButtonClick )
			{
				position = 'relative';
				top = 1;
				left = 1;
			}
			else
			{
				top = '';
				left = '';
			}
		}
	}
	if ( btn && btn.Span )
	{
		with(btn.Span.runtimeStyle)
		{
			if ( this.m_IsClicked || this.m_IsMenuButtonClick )
			{
				position = 'relative';
				top = 1;
				left = 1;
			}
			else
			{
				top = '';
				left = '';
			}
		}
	}
	if ( btn && btn.MenuIcon )
	{
		with(btn.MenuIcon.runtimeStyle)
		{
			if ( this.m_IsClicked || this.m_IsMenuButtonClick )
			{
				position = 'relative';
				top = 1;
				left = 1;
			}
			else
			{
				top = '';
				left = '';
			}
		}
	}
};