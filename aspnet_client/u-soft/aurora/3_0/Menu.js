/***********************************************************
Context Menu Class created by JScript

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 1.5
Created: 2004.11.30 22:11
Last Updated: 2005.05.24 15:25

History:
	1. The code created at 2004.11.30
	2. Complete menu prototype [2004.12.01]
	3. Add submenu auto display [2004.12.02]
	4. All UI effect compleate [2004.12.03]
	5. Keyboard navigation support [2004.12.06]
	6. Remove Menu.prototype.Focus() method [2004.12.07]
	7. Show submenu on left of parent menu when screen width overflow [2004.12.08]
	8. Add show transition effect by filter [2004.12.12]
	9. Support menu text max width limited [2004.12.13]
	10. Support hover check menu item function. [2005.01.10]
	11. Improve event attach model, add __defaultExecute() method. [2005.01.17]
	12. Can't get parameter e in __defaulteExecute bug fixed. [2005.01.20]
	13. Add ShowXY method to show menu at x, y coordinate. [2005.01.20]
	14. Snap to element buttom when show menu. [2005.01.20]
	15. Fix call Show method by event argument bug. [2005.03.04]
	16. Fix bug when call Disable or Enable before control rendered. [2005.04.27]
	17. Add a menu attribute named DisplaySingleSeparator. [2005.05.19]
	18. Fix don't show menu item header blank bug. [2005.05.24]

***********************************************************/

var __MenuCache__ =
{
	m_Count :		0,
	m_IdPrefix :		"__MenuObject__",
	m_ActiveItem : null,

	NewId : function()
	{
		return this.m_IdPrefix + this.m_Count++;
	},

	Remove : function(mi)
	{
		delete this[mi.m_Id];
	}
};

function MenuAttributesDefault()
{
	this.MenuFontSize = '12pt';
	this.MenuBorderColor = 'threeddarkshadow';
	this.ActiveMenuBackColor = 'highlight';
	this.ActiveMenuForeColor = 'highlighttext';
	this.NormalMenuBackColor = 'menu';
	this.NormalMenuForeColor = 'menutext';
	this.MenuItemStartColor = 'captiontext';
	this.MenuItemEndColor = 'activecaption';
	this.ActiveMenuItemBorderColor= 'graytext';
	this.MenuDisplayTimeout = 450; 
	this.MenuItemHeaderWidth = 20;
	this.MaxContextMenuHeight = 400;
	this.MaxMenuItemTextWidth = 260;
	// GradientWipeLeft2Right | GradientWipeUp2Down | RevealTrans | Fade
	this.ShowMenuEffect = 'Fade';
	this.DisplaySingleSeparator = true;
}

function MenuAttributes()
{
	this.MenuFontSize = '11pt';
	this.MenuBorderColor = '#2254B1';
	this.ActiveMenuBackColor = '#ffeec2';
	this.ActiveMenuForeColor = 'black';
	this.NormalMenuBackColor = 'white';
	this.NormalMenuForeColor = 'black';
	this.MenuItemStartColor = '#E0EDFF';
	this.MenuItemEndColor = '#6192E0';
	this.ActiveMenuItemBorderColor= '#000080';
	this.MenuDisplayTimeout = 450; 
	this.MenuItemHeaderWidth = 20;
	this.MaxContextMenuHeight = 400;
	this.MaxMenuItemTextWidth = 260;
	// GradientWipeLeft2Right | GradientWipeUp2Down | RevealTrans | Fade
	this.ShowMenuEffect = 'Fade'
	this.DisplaySingleSeparator = true;
}

function Menu()
{
	this.Extends(CollectionBase);
	
	this.m_Items = this.m_InnerArray;
	this.m_Popup = null;
	this.m_IsInvalidate = false;
	this.m_IsDrawn = false;
	this.m_Opener = null;
	this.m_ParentMenu = null;
	this.m_ActiveItem = null;
	this.m_ShowTimer = null;
	this.m_Bounds = null;
	this.m_IsShowHeaderBlank = true;
	this.m_IsEventAttached = false;
	this.m_MenuAttributes = new MenuAttributes();
	this.m_Id = __MenuCache__.NewId();
	__MenuCache__[this.m_Id] = this;

	this.toString = function()
	{
		return '[class Menu]';
	};
}

Menu.HideAllPopups = function()
{
	for( var id in __MenuCache__ )
	{
		if ( id.indexOf(__MenuCache__.m_IdPrefix ) != -1 )
		{
			var miObj = __MenuCache__[id];
			var popup = miObj.m_Popup;
			if ( popup )
			{
				miObj.__resumeItem();
				popup.hide();
			}
		}
	}
	if ( __MenuCache__.m_ActiveItem )
	{
		var menu = __MenuCache__.m_ActiveItem.m_Menu;
		if ( menu.m_ShowTimer )
		{
			window.clearTimeout(menu.m_ShowTimer);
			menu.m_ShowTimer = null;
		}
		__MenuCache__.m_ActiveItem = null;
	}
};

Menu.prototype.Attribute = function(key)
{
	return this.m_MenuAttributes[key];
};

Menu.prototype.FadeinEffect = function(effect)
{
	if ( !this.m_Popup || !this.m_Popup.isOpen )
	{
		return;
	}
	var menuHtml = this.m_Popup.document.getElementById('menu');
	if ( !menuHtml )
	{
		return;
	}
	var filterString = 'progid:DXImageTransform.Microsoft.';
	switch(effect)
	{
		case 'GradientWipeLeft2Right' :
		{
			filterString += "GradientWipe(duration='0.5',gradientSize='0.75',motion='forward')";
			break;
		}
		case 'GradientWipeUp2Down' :
		{
			filterString += "GradientWipe(duration='0.5',gradientSize='0.25',motion='forward',wipeStyle='1')";
			break;
		}
		case 'RevealTrans' :
		{
			filterString += "RevealTrans(duration='0.5',transition='12')";
			break;
		}
		case 'Fade' :
		{
			filterString += 'Fade()';
			break;
		}
		default :
		{
			filterString = '';	// no effect
			break;
		}
	}
	if ( filterString )
	{
		try
		{
			menuHtml.style.visibility = 'hidden';
			menuHtml.style.filter = filterString;
			menuHtml.filters[0].apply();
			menuHtml.style.visibility = 'visible';
			menuHtml.filters[0].play(0.25);
		}
		catch(e)
		{
			menuHtml.style.visibility = 'visible';
		}
	}
};

Menu.prototype.AddAt = function(mi, index)
{
	this.InsertAt(mi, index);
};

Menu.prototype.InsertAt = function(mi, index)
{
	if ( this.m_MenuAttributes.DisplaySingleSeparator && mi.m_Text == '-' )
	{
		if ( index > 0 )
		{
			if ( this.m_Items[index-1].m_Text == '-' )
			{
				return;
			}
		}
		if ( index < this.m_Count-1 )
		{
			if ( this.m_Items[index+1].m_Text == '-' )
			{
				return;
			}
		}
	}
	mi.m_Menu = this;
	this.base.InsertAt.Call(this, mi, index);
	this.m_IsInvalidate = true;
	if ( mi.m_ChildMenu )
	{
		mi.m_ChildMenu.m_ParentMenu = this;
	}
};

Menu.prototype.AddSeparator = function()
{
	var mi = new MenuItem('-');
	mi.m_Disabled = true;
	this.Add(mi);
};

Menu.prototype.Render = function()
{
	if ( !this.m_Popup )
	{
		throw 'create popup window first, please.';
	}
	var doc = this.m_Popup.document;
	var menu = doc.createElement('TABLE');
	menu.id = 'menu';
	menu.setAttribute('uniqueId', this.m_Id);
	menu.border = 0;
	menu.onselectstart = 'return false;';
	menu.oncontextmenu = 'return false;';	
	menu.ondrag = 'return false;';//disable drag&drop operation	
	menu.cellpadding = 0;
	menu.cellspacing = 0;
	menu.rules = 'none';
	menu.style.cursor = 'default';
	menu.style.border = 'solid 1px ' + this.Attribute('MenuBorderColor');
	menu.style.fontFamily = 'tahoma';
	menu.style.fontSize = this.Attribute('MenuFontSize');
	var tbody = doc.createElement('TBODY');
	menu.appendChild(tbody);

	tbody.appendChild(this.__generatePaddingTR(doc));	
	for ( var i=0 ; i < this.m_Items.length ; ++i )
	{
		tbody.appendChild(this.m_Items[i].Render());
	}
	tbody.appendChild(this.__generatePaddingTR(doc));	

	return menu;
};

Menu.prototype.__generatePaddingTR = function(doc)
{
	var filterText = "progid:DXImageTransform.Microsoft.Gradient(GradientType="
		+ '1' + ", StartColorStr='" + this.Attribute('MenuItemStartColor')
		+ "', EndColorStr='" + this.Attribute('MenuItemEndColor') + "');";
	trPadding = doc.createElement('TR');
	trPadding.disabled = 'disabled';
	trPadding.bgColor = this.Attribute('NormalMenuBackColor');
	tdIconPadding = doc.createElement('TD');
	tdIconPadding.height = 1;
	tdIconPadding.colspan = 2;
	tdIconPadding.borderColor = this.Attribute('MenuItemStartColor');
	tdIconPadding.width = this.Attribute('MenuItemHeaderWidth');
	tdIconPadding.style.filter = filterText;
	tdItemPadding = doc.createElement('TD');
	tdItemPadding.colspan = 4;
	trPadding.appendChild(tdIconPadding);
	trPadding.appendChild(tdItemPadding);
	return trPadding;
};

Menu.prototype.AttachEvents = function(menu)
{
	var menuObj = __MenuCache__[menu.uniqueId];
	if ( menuObj.m_IsEventAttached )
	{
		return;
	}
	var doc = menuObj.m_Popup.document;
	for ( var i=0 ; i < menuObj.m_Items.length ; ++i )
	{
		var mItem = menuObj.m_Items[i];
		var trItem = doc.getElementById(mItem.m_Id);
		if ( mItem.m_Action && !mItem.m_ChildMenu )
		{
			if ( !mItem.IsSeparator() )
			{
				if ( typeof(mItem.m_Action) == 'function' )
				{
					trItem.attachEvent('onclick', mItem.m_Action);
					if ( !mItem.m_EnableHoverCheck )
					{
						trItem.attachEvent('onclick', Menu.HideAllPopups);
					}
				}
				else if ( typeof(mItem.m_Action) == 'object' )
				{
					var objItem = mItem;
					trItem.attachEvent('onclick', function()
					{
						var obj = objItem.m_Action;
						if ( typeof(obj) == 'object' && obj.__defaultExecute )
						{
							obj.__defaultExecute(obj, objItem.m_Menu.m_ActiveItem);
						}
					});
				}
			}
		}
		/* darg one icon to another, will occur bug
		if ( !mItem.m_Disabled )
		{
			var icon = FindChildElement(trItem, 'IMG');
			if ( icon )
			{
				icon.onmousedown = function()
				{
					this.setCapture(false);
				};
				icon.onmouseup = function()
				{
					document.releaseCapture();
				};
			}
		}*/
		if ( mItem.m_ChildMenu )
		{
			trItem.attachEvent('onmousedown', this.InnerShow);
		}
		if ( !mItem.IsSeparator() )
		{
			trItem.attachEvent('onmouseover', this.ActiveItem);
		}
	}
	menu.attachEvent('onmouseout', this.ResumeItem);
	if ( doc )
	{
		doc.attachEvent('onkeydown', this.Keydown);
	}
	menuObj.m_IsEventAttached = true;
};

Menu.prototype.DetachEvents = function()
{
	// var menuObj = __MenuCache__[menu.uniqueId];
	var menuObj = this;
	if ( !menuObj.m_IsEventAttached )
	{
		return;
	}
	var doc = menuObj.m_Popup.document;
	for ( var i=0 ; i < menuObj.m_Items.length ; ++i )
	{
		var mItem = menuObj.m_Items[i];
		var trItem = doc.getElementById(mItem.m_Id);
		if ( mItem.m_Action && !mItem.m_ChildMenu )
		{
			if ( !mItem.IsSeparator() )
			{
				if ( typeof(mItem.m_Action) == 'function' )
				{
					trItem.detachEvent('onclick', mItem.m_Action);
					if ( !mItem.m_EnableHoverCheck )
					{
						trItem.detachEvent('onclick', Menu.HideAllPopups);
					}
				}
				else if ( typeof(mItem.m_Action) == 'object' )
				{
					var objItem = mItem;
					trItem.detachEvent('onclick', function()
					{
						var obj = mItem.m_Action;
						if ( typeof(obj) == 'object' && obj.__defaultExecute )
						{
							obj.__defaultExecute(obj, objItem.m_Menu.m_ActiveItem);
						}
					});
				}
			}
		}
		if ( mItem.m_ChildMenu )
		{
			trItem.detachEvent('onmousedown', this.InnerShow);
		}
		if ( !mItem.IsSeparator() )
		{
			trItem.detachEvent('onmouseover', this.ActiveItem);
		}
	}
	// menu.detachEvent('onmouseout', this.ResumeItem);
	if ( doc )
	{
		doc.detachEvent('onkeydown', this.Keydown);
	}
	menuObj.m_IsEventAttached = false;
};

Menu.prototype.ActiveItem = function(evt)
{
	if ( !evt || !evt.srcElement )
	{
		return;
	}
	var elmt = FindParentElement(evt.srcElement, 'TR');
	if ( !elmt.id )
	{
		elmt = FindParentElement(elmt.parentElement, 'TR');
	}
	var mi = __MenuCache__[elmt.id];
	var ami = mi.m_Menu.m_ActiveItem;
	if ( ami && mi != ami)
	{
		if ( ami.m_Menu.m_ShowTimer )
		{
			window.clearTimeout(ami.m_Menu.m_ShowTimer);
			ami.m_Menu.m_ShowTimer = null;
		}
		ami.m_Menu.__resumeItem();
		if ( ami.m_ChildMenu )
		{
			var win = ami.m_ChildMenu.m_Popup;
			if ( win && win.isOpen )
			{
				ami.m_ChildMenu.Hide();
				ami.m_ChildMenu.__resumeItem();
				if ( ami.m_ChildMenu.m_ShowTimer )
				{
					window.clearTimeout(ami.m_ChildMenu.m_ShowTimer);
					ami.m_ChildMenu.m_ShowTimer = null;
				}
			}
		}
	}
	var activeObj = __MenuCache__.m_ActiveItem;
	if ( activeObj && activeObj.m_Menu.m_ShowTimer )
	{
		window.clearTimeout(activeObj.m_Menu.m_ShowTimer);
		activeObj.m_Menu.m_ShowTimer = null;
	}
	mi.m_Menu.m_ActiveItem = mi;
	var delayShow = mi.m_Menu.InnerShow;
	__MenuCache__.m_ActiveItem = mi;
	mi.m_Menu.__activeItem();
	var timeout = mi.m_Menu.Attribute('MenuDisplayTimeout');
	mi.m_Menu.m_ShowTimer = window.setTimeout(delayShow, timeout);
};

Menu.prototype.Hide = function()
{
	if ( this.m_Popup && this.m_Popup.isOpen )
	{
		this.m_Popup.hide();
	}
};

Menu.prototype.Keydown = function(evt)
{
	if ( !evt || !evt.srcElement )
	{
		return;
	}
	var menuBody = evt.srcElement;
	var menuHtml = FindChildElement(menuBody, 'TABLE');
	if ( !menuHtml || !menuHtml.uniqueId )
	{
		menuHtml = FindParentElement(menuBody, 'TABLE');
		if ( !menuHtml || !menuHtml.uniqueId )
		{
			return;
		}
	}
	var menuObj = __MenuCache__[menuHtml.uniqueId];
	if ( menuObj.HasSubMenuExpanded() )
	{
		return;
	}

	if ( menuObj.m_ShowTimer )
	{
		window.clearTimeout(menuObj.m_ShowTimer);
		menuObj.m_ShowTimer = null;
	}

	var activeIndex = -1;
	for ( var i=0 ; i < menuObj.m_Items.length ; ++i )
	{
		if ( menuObj.m_ActiveItem == menuObj.m_Items[i] )
		{
			activeIndex = i;
			break;
		}
	}
	var sign = -1; 
	switch( evt.keyCode )
	{
		case 37 : // left
		{
			if ( menuObj.m_ParentMenu )
			{
				menuObj.Hide();
			}
			break;
		}
		case 38 : // up | no break;
		{
			sign = 1;
			if ( activeIndex == -1 )
			{
				activeIndex = 0;
			}
		}
		case 40 : // down
		{
			var itemCount = menuObj.m_Items.length;
			for ( var i=1 ; i <= itemCount ; ++i )
			{
				var index = (itemCount+activeIndex-i*sign)%itemCount;
				var item = menuObj.m_Items[index];
				if ( !item.m_Disabled && item.m_Text != '-' )
				{
					menuObj.__resumeItem();
					menuObj.m_ActiveItem = item;
					menuObj.__activeItem();
					break;
				}
			}
			break;
		}
		case 39 : // right | no break;
		{
			var activeItem = menuObj.m_ActiveItem; 
			if ( !activeItem || !activeItem.m_ChildMenu )
			{
				break;
			}
		}
		case 13 : // enter
		{
			menuObj.Click();
			break;
		}
		case 32 : // Space
		{
			break;
			var activeItem = menuObj.m_ActiveItem; 
			if ( !activeItem.m_Disabled )
			{	
				activeItem.Disable();
			}
			else
			{
				activeItem.Enable();
			}
			break;
		}
		case 27 :
		{
			break;
		}
	}
	if ( evt.keyCode >= 48 && evt.keyCode <= 90 )
	{
		var keyList = '';
		var key = String.fromCharCode(evt.keyCode); 
		for ( var i=0 ; i < menuObj.m_Items.length ; ++i )
		{
			var item = menuObj.m_Items[i];
			if ( !item.m_Disabled && item.m_Mnemonic )
			{ 
				keyList += item.m_Mnemonic;
			}
			else
			{
				keyList += '-';
			}
		}
		var index = keyList.indexOf(key); 
		if ( index != -1 )
		{ 
			if ( keyList.indexOf(key) == keyList.lastIndexOf(key) )
			{
				if ( !menuObj.m_Items[index].m_Disabled )
				{
					menuObj.__resumeItem(); 
					menuObj.m_ActiveItem = menuObj.m_Items[index];
					menuObj.__activeItem();
					menuObj.Click();
				}
			}
			else
			{
				menuObj.__resumeItem();
				var newActive;
				if ( !evt.shiftKey )
				{
					newActive = keyList.indexOf(key, activeIndex+1);
				}
				else
				{
					if ( activeIndex == 0 )
					{
						newActive = -1;
						index = keyList.lastIndexOf(key);
					}
					else 
					{
						newActive = keyList.lastIndexOf(key, activeIndex-1);
					}
				}

				if ( newActive == -1 )
				{
					menuObj.m_ActiveItem = menuObj.m_Items[index];
				}
				else
				{
					menuObj.m_ActiveItem = menuObj.m_Items[newActive];
				}
				menuObj.__activeItem();
			}
		}
	}
	if ( evt.keyCode != 27 )
	{
		evt.returnValue = null;
		evt.cancelBubble = true; 
	}
};

Menu.prototype.Click = function()
{
	var miObj = this.m_ActiveItem;
	if ( !miObj || miObj.m_Disabled )
	{
		return;
	}
	var doc = this.m_Popup.document;
	var miHtml = doc.getElementById(miObj.m_Id);
	if ( !miObj.m_ChildMenu ) 
	{
		miHtml.click();
	}
	else
	{
		miObj.m_Menu.__show(miObj);
		var subMenu = miObj.m_ChildMenu; 
		for ( var i=0 ; i < subMenu.m_Items.length ; ++i )
		{
			var item = subMenu.m_Items[i];
			if ( !item.m_Disabled && !item.IsSeparator() )
			{
				subMenu.m_ActiveItem = item;
				subMenu.__activeItem();
				break;
			}
		}
	}
};

Menu.prototype.ResumeItem = function(evt)
{
	if ( !evt || evt.toElement )
	{
		return;
	}
	var menuElmt = FindParentElementEx(evt.srcElement, 'TABLE');
	if ( !menuElmt.uniqueId ) 
	{
		menuElmt = FindParentElementEx(menuElmt.parentElement, 'TABLE');
	}
	var menuObj = __MenuCache__[menuElmt.uniqueId];
	if ( menuObj.HasSubMenuExpanded() )
	{
		return;
	}
	if ( menuObj.m_ShowTimer )
	{
		window.clearTimeout(menuObj.m_ShowTimer);
		menuObj.m_ShowTimer = null;
	}
	menuObj.__resumeItem();
};

Menu.prototype.__resumeItem = function()
{
	if ( !this.m_ActiveItem )
	{
		return;
	}
	var doc = this.m_Popup.document;
	var miHtml = doc.getElementById(this.m_ActiveItem.m_Id);
	if ( !FindChildElement(miHtml.cells(2), 'SPAN') )
	{
		var tbl = FindChildElement(miHtml.cells(2), 'TABLE');
		tbl.style.color = this.Attribute('NormalMenuForeColor');
	}
	miHtml.style.color = this.Attribute('NormalMenuForeColor');
	miHtml.style.backgroundColor = this.Attribute('NormalMenuBackColor');
	this.m_ActiveItem.SetBorderColor(miHtml, 0, this.Attribute('NormalMenuBackColor'));
	var filterText = "progid:DXImageTransform.Microsoft.Gradient(GradientType="
		+ '1' + ", StartColorStr='" + this.Attribute('MenuItemStartColor')
		+ "', EndColorStr='" + this.Attribute('MenuItemEndColor') + "')";
	miHtml.cells(1).style.filter = filterText;
	this.m_ActiveItem = null;
};

Menu.prototype.__resumeAll = function()
{
	for ( var i=0 ; i < this.m_Items.length ; ++i )
	{
		var item = this.m_Items[i];
		if ( !item.m_Disabled && !item.IsSeparator() )
		{
			this.m_ActiveItem = this.m_Items[i];
			this.__resumeItem();
		}
	}
};

Menu.prototype.__activeItem = function()
{
	if ( !this.m_ActiveItem )
	{
		return;
	}
	var miObj = this.m_ActiveItem;
	var doc = miObj.m_Menu.m_Popup.document;
	var miHtml = doc.getElementById(miObj.m_Id);
	if ( !FindChildElement(miHtml.cells(2), 'SPAN') )
	{
		var tbl = FindChildElement(miHtml.cells(2), 'TABLE');
		tbl.style.color = this.Attribute('ActiveMenuForeColor');
	}
	miHtml.cells(1).style.filter = '';
	miHtml.style.color = this.Attribute('ActiveMenuForeColor');
	miHtml.style.backgroundColor = this.Attribute('ActiveMenuBackColor');
	miObj.SetBorderColor(miHtml, 1, this.Attribute('ActiveMenuItemBorderColor'));
};

Menu.prototype.HasSubMenuExpanded = function()
{
	for ( var i=0 ; i < this.m_Items.length ; ++i )
	{
		var item = this.m_Items[i];
		if ( item.m_ChildMenu )
		{
			var menu = item.m_ChildMenu;
			if ( menu.m_Popup && menu.m_Popup.isOpen )
			{
				return true;
			}
		}
	}
	return false;
};

Menu.prototype.__isEllipsis = function(menuObj, menuHtml)
{
	if ( menuHtml.offsetWidth > this.Attribute('MaxMenuItemTextWidth') )
	{
		for ( var i=0 ; i < menuHtml.rows.length ; ++i )
		{
			var tr = menuHtml.rows(i);
			if ( !tr.type || tr.type != 'normal' )
			{
				continue;
			}
			var td = tr.cells(2);
			var span = td.childNodes[0];
			
			if ( span.scrollWidth > this.Attribute('MaxMenuItemTextWidth') )
			{
				td.style.fontWeight = 'bold';
				var doc = menuObj.m_Popup.document;
				var tbl = doc.createElement('TABLE');
				tbl.border = 0;
				tbl.cellpadding = 0;
				tbl.cellspacing = 0;
				tbl.style.textOverflow = 'ellipsis';
				tbl.style.tableLayout = 'fixed';
				tbl.style.color = this.Attribute('NormalMenuForeColor');
				var tbody = doc.createElement('TBODY');
				tbl.appendChild(tbody);
				var tr = doc.createElement('TR');
				tbody.appendChild(tr);
				var td = doc.createElement('TD');
				tr.appendChild(td);
				td.innerHTML = span.innerHTML;
				menuHtml.rows(i).cells(2).innerHTML = '';
				menuHtml.rows(i).cells(2).appendChild(tbl);
				tbl.style.lineHeight = '85%';
				td.style.width = '100%';
				td.style.overflow = 'hidden';
				td.style.whiteSpace = 'nowrap';
				td.style.textOverflow = 'ellipsis';
				tbl.title = StringHelper.Trim(td.innerText);
			}
		}
		menuHtml.style.width = this.Attribute('MaxMenuItemTextWidth');
	}
	return menuHtml.offsetWidth;
};

Menu.prototype.Show = function(win)
{
	if ( !win.event )
	{
		win = win.srcElement.document.parentWindow;
	}
	this.ShowXY(win.event.screenX, win.event.screenY, win);
};

Menu.prototype.ShowXY = function(x, y, win)
{
	// 当窗口是IE的时候，event有window属性
	if ( !win )
	{
		return;
	}
	var menuObj = this;
	if ( menuObj.m_Items.length == 0 )
	{
		return;
	}
	menuObj.m_Opener = win;
	menuObj.__resumeItem();
	var win = menuObj.m_Opener;
	var popup, popwin, popdoc;
	// 判断菜单的容器popup是否建立
	if ( !menuObj.m_Popup )
	{
		popup = win.createPopup();
		popup.document.body.bgColor = 'windowtext';
		popup.document.body.style.backgroundColor = 'window';
		menuObj.m_Popup = popup;
	}
	else
	{
		popup = menuObj.m_Popup;
		menuObj.__resumeAll();
	}
	popdoc = popup.document;
	popwin = popdoc.parentWindow;
	// 判断是否需要重绘菜单的内容
	if ( menuObj.m_IsInvalidate || !menuObj.m_IsDrawn )
	{
		popdoc.body.innerHTML = menuObj.Render().outerHTML;
		// popdoc.body.appendChild(menuObj.Render());
		menuObj.m_IsInvalidate = false;
		menuObj.m_IsDrawn = true;
	}
	// 获取菜单的主table(菜单是使用table来实现的)
	var menuHtml = popup.document.getElementById('menu');
	// 这个show只是为了测量菜单的bounds而调用的
	popup.show(0, 0, 1, 1);
	var w = popdoc.body.scrollWidth;
	w = this.__isEllipsis(this, menuHtml);
	var h = popdoc.body.scrollHeight;
	// var x = win.event.clientX + win.screenLeft;
	// var y = win.event.clientY + win.screenTop;
	popup.show((x < 0 ? -x-w : x), (y < 0 ? -y-h : y), w, h);
	this.FadeinEffect(this.Attribute('ShowMenuEffect'));
	menuObj.m_Bounds = 
	{
		top: x, left: y,
		width: menuHtml.offsetWidth,
		height: menuHtml.offsetHeight
	};
	menuObj.AttachEvents(menuHtml);
};

Menu.prototype.InnerShow = function()
{
	var ami = __MenuCache__.m_ActiveItem;
	if ( !ami )
	{
		return;
	}
	var menuObj = ami.m_Menu;
	if ( !menuObj.m_Popup.isOpen )
	{
		return;
	}
	if ( (!ami.m_ChildMenu || (ami.m_ChildMenu.m_Popup
		&& ami.m_ChildMenu.m_Popup.isOpen)) )
	{
		return;
	}
	menuObj.__show(ami);
};

Menu.prototype.__show = function(miObj)
{
	var menuObj = miObj.m_Menu;
	var subMenuObj = miObj.m_ChildMenu;
	subMenuObj.m_ActiveItem = null;
	var popup = menuObj.m_Popup;
	var miHtml = popup.document.getElementById(miObj.m_Id);
	if ( !popup || !subMenuObj.m_Items || subMenuObj.m_Items.length <= 0 )
	{
		if ( miObj.m_Action ) // && miHtml.document.parentWindow.event )
		{
			// miObj.m_Action(miHtml.document.parentWindow.event);
			miObj.m_Action();
		}
		return;
	}
	var subpop, popdoc;
	if ( !subMenuObj.m_Popup )
	{
		subpop = popup.document.parentWindow.createPopup();
		subMenuObj.m_Popup = subpop;
		subpop.document.body.bgColor = 'windowtext';
		subpop.document.body.style.backgroundColor = 'window';
		subMenuObj.m_Opener = popup.document.parentWindow;
	}
	else
	{
		subpop = subMenuObj.m_Popup;
		subMenuObj.__resumeAll();
	}
	popdoc = subpop.document;
	if ( subMenuObj.m_IsInvalidate || !subMenuObj.m_IsDrawn )
	{
		popdoc.body.innerHTML = subMenuObj.Render().outerHTML;
		subMenuObj.m_IsInvalidate = false; 
		subMenuObj.m_IsDrawn = true;
	}
	subpop.show(0, 0, 1, 1);
	var menuHtml = subpop.document.getElementById('menu');
	var x, y, w, h;
	x = miHtml.offsetWidth-2;
	y = 0;
	w = menuHtml.offsetWidth;
	w = this.__isEllipsis(subMenuObj, menuHtml);
	h = menuHtml.offsetHeight;

	var availableScreenWidth = window.screen.width;
	var factWidth = popup.document.parentWindow.screenLeft
		+ menuObj.m_Bounds.width + w;
	if ( factWidth > availableScreenWidth )
	{
		x = - w + 2;
	}
	subpop.show(x, y, w, h, miHtml);
	subMenuObj.FadeinEffect(this.Attribute('ShowMenuEffect'));
	subMenuObj.m_Bounds = {top: x, left: y, width: w, height: h};
	subMenuObj.AttachEvents(menuHtml);
};

Menu.prototype.Disable = function()
{
	for ( var i=0 ; i < this.m_Items.length ; ++i )
	{
		this.m_Items[i].Disable();
	}
};

Menu.prototype.Enable = function()
{
	for ( var i=0 ; i < this.m_Items.length ; ++i )
	{
		this.m_Items[i].Enable();
	}
};

// return MenuItem object base 'evt'
Menu.GetMenuItem = function(evt)
{
	var miHtml = FindParentElement(evt.srcElement, 'TR');
	if ( !miHtml.id )
	{
		miHtml = FindParentElement(miHtml.parentElement, 'TR');
	}
	var objItem = null;
	if ( miHtml && miHtml.id )
	{
		objItem = __MenuCache__[miHtml.id];
		objItem.SetCheck(!objItem.m_Checked);
	}
	return objItem;
};

function MenuItem(text, action, icon, shortcut, menu)
{
	this.m_Text = text.toString();
	this.m_Action = action;
	this.m_Icon = icon;
	this.m_ChildMenu = menu;
	this.m_Menu = null;
	this.m_ShortCut = shortcut;
	this.m_Disabled = false;
	this.m_Mnemonic = null;
	this.m_Tooltip = null;
	this.m_Attributes = [];
	this.m_HasCheckBox = false;
	this.m_EnableHoverCheck = false;
	this.m_Checked = null;
	this.m_Id = __MenuCache__.NewId();
	__MenuCache__[this.m_Id] = this;

	this.toString = function()
	{
		return '[class MenuItem]';
	};
}

MenuItem.prototype.AttachChildMenu = function(menu)
{
	this.m_ChildMenu = menu;
	menu.m_ParentMenu = this.m_Menu;
};

MenuItem.prototype.SetCheck = function(checked)
{
	if ( this.m_HasCheckBox )
	{
		var objMenu = this.m_Menu;
		var doc = objMenu.m_Popup.document;
		var miElmt = doc.getElementById(this.m_Id);
		var tdCheckBox = miElmt.cells(1);
		if ( tdCheckBox )
		{
			this.m_Checked = checked;
			if ( checked )
			{
				tdCheckBox.innerText = 'a';
			}
			else
			{
				tdCheckBox.innerHTML = '';
			}
		}
	}
};

MenuItem.prototype.RuntimeShowSubMenu = function(menu)
{
	this.AttachChildMenu(menu);
	menu.__show(this);
}

MenuItem.prototype.SwapIcon = function(imageName)
{
	var objMenu = this.m_Menu;
	var iconPath = this.m_Icon;
	iconPath = iconPath.substr(0, iconPath.lastIndexOf('/')+1);
	this.m_Icon = iconPath + imageName;
	if ( objMenu.m_Popup )
	{
		var miElmt = objMenu.m_Popup.document.getElementById(this.m_Id);
		var imgs = miElmt.all.tags('IMG');
		if ( imgs && imgs.length == 1 )
		{
			// this.m_Element.Icon.src = this.m_Icon;
			// imgs[0].style.filter = 'gray(1)';
			imgs[0].src = this.m_Icon;
		}
	}
	else
	{
		this.m_IconPath = this.m_Icon;
	}
};

MenuItem.prototype.Contains = function(menu)
{
	if ( this.m_ChildMenu )
	{
		return this.m_ChildMenu.Contains(menu);
	}
	return false;
};

MenuItem.prototype.SetAttribute = function(key, value)
{
	this.m_Attributes[key] = value;
};

MenuItem.prototype.GetAttribute = function(key)
{
	return this.m_Attributes[key];
};

MenuItem.prototype.Invalidate = function()
{
	this.m_Menu.m_IsInvalidate = true;
};

MenuItem.prototype.IsSeparator = function()
{
	return this.m_Text == '-';
}

MenuItem.prototype.Render = function()
{
	var filterText = "progid:DXImageTransform.Microsoft.Gradient(GradientType="
		+ '1' + ", StartColorStr='" + this.m_Menu.Attribute('MenuItemStartColor')
		+ "', EndColorStr='" + this.m_Menu.Attribute('MenuItemEndColor') + "')	";
	if ( !this.m_Menu.m_Popup )
	{
		throw 'create popup window first, please.';
	}
	var doc = this.m_Menu.m_Popup.document;
	var tr = doc.createElement('TR');
	tr.id = this.m_Id;
	//tr.Object = this;
	//this.m_Element = tr;
	if ( this.m_Tooltip )
	{
		tr.title = this.m_Tooltip;
	}
	if ( this.m_Disabled )
	{
		tr.disabled = 'disabled';
	}
	else
	{
		tr.disabled = '';
	}
	tr.bgColor = this.m_Menu.Attribute('NormalMenuBackColor');
	tr.style.color = this.m_Menu.Attribute('NormalMenuForeColor');
	tr.setAttribute('id', this.m_Id);

	for ( var key in this.m_Attributes )
	{
		tr.setAttribute(key, this.m_Attributes[key]);
	}

	var tdLeftPadding = doc.createElement('TD');
	tdLeftPadding.bgColor = this.m_Menu.Attribute('MenuItemStartColor');
	tr.appendChild(tdLeftPadding);

	if ( this.m_Menu.m_IsShowHeaderBlank )
	{
		tdItemHeader = doc.createElement('TD');
		tdItemHeader.style.width = this.m_Menu.Attribute('MenuItemHeaderWidth');
		var startColor = this.m_Menu.Attribute('MenuItemStartColor');
		tdItemHeader.nowrap = 'nowrap';
		tdItemHeader.align = 'center';
		// if MenuItem has CheckBox, ignore customize Icon
		if ( !this.m_HasCheckBox )
		{
			if ( this.m_Icon )
			{
				var icon = doc.createElement('IMG');
				icon.src = this.m_Icon;
				icon.border = 0;
				tdItemHeader.appendChild(icon);
				tdItemHeader.style.filter = filterText;
				tr.Icon = icon;
			}
		}
		else
		{
			tdItemHeader.style.fontFamily = 'webdings';
			tdItemHeader.style.paddingRight = 2;
			if ( this.m_Checked )
			{
				tdItemHeader.style.textIndent = 2;
				tdItemHeader.innerText = 'a';
			}
		}
		tdItemHeader.style.filter = filterText;
		tdItemHeader.style.borderLeft = 'solid 1px ' + startColor;
		tr.appendChild(tdItemHeader);
	}

	var defaultBorderAttribute = 'solid 1px ' + this.m_Menu.Attribute('NormalMenuBackColor');

	if ( this.m_Text != '-' )
	{
		tr.setAttribute('type', 'normal');
		var tdText = doc.createElement('TD');
		tdText.nowrap = 'nowrap';
		if ( this.m_Text )
		{
			var miText = this.m_Text.replace(/\s*\r\s*/gm, ' ').replace(/\s*\n\s*/gm, ' ');
			var pos = miText.indexOf('&');
			if ( pos != -1 && this.m_Mnemonic !== false )
			{
				this.m_Mnemonic = miText.charAt(pos+1);
				miText = StringHelper.HtmlEncode(miText.substring(0, pos)) + '<u>'
					+ StringHelper.HtmlEncode(this.m_Mnemonic) + '</u>'
					+ StringHelper.HtmlEncode(miText.substring(pos+2));
				this.m_Mnemonic = this.m_Mnemonic.toUpperCase();
			}
			else
			{
				if ( this.m_Mnemonic && this.m_Mnemonic !== true )
				{ 
					upperText = miText.toUpperCase();
					this.m_Mnemonic = this.m_Mnemonic.toUpperCase();
					var pos = upperText.indexOf(this.m_Mnemonic);
					if ( pos != -1 )
					{
						miText = StringHelper.HtmlEncode(miText.substring(0, pos))
							+ '<u>' + StringHelper.HtmlEncode(miText.charAt(pos)) + '</u>'
							+ StringHelper.HtmlEncode(miText.substring(pos+1));
					}
					else
					{
						miText = StringHelper.Format('{0}(<u>{1}</u>)',
							StringHelper.HtmlEncode(miText), this.m_Mnemonic);
					}
				}
				else
				{
					miText = StringHelper.HtmlEncode(miText);
				}
			}
			var span = doc.createElement('SPAN');
			span.innerHTML = miText + '&nbsp; &nbsp;';
			tdText.appendChild(span);
		}
		tdText.style.textIndent = 4;
		tr.appendChild(tdText);

		var tdShortCut = doc.createElement('TD');
		tdShortCut.nowrap = 'nowrap';
		tdShortCut.innerText = ' ';
		if ( this.m_ShortCut )
		{
			tdShortCut.innerText += this.m_ShortCut;
		}
		tdShortCut.style.borderTop = defaultBorderAttribute;
		tdShortCut.style.borderBottom = defaultBorderAttribute;

		tr.appendChild(tdShortCut);

		var tdHint = doc.createElement('TD');
		tdHint.nowrap = 'nowrap';
		if ( this.m_ChildMenu )
		{
			tdHint.innerText = '4';
			tdHint.style.fontFamily = 'Webdings';
		}
		tdHint.style.borderRight = defaultBorderAttribute;
		tr.appendChild(tdHint);

		var tdRightPadding = doc.createElement('TD');
		tdRightPadding.bgColor = this.m_Menu.Attribute('NormalMenuBackColor');
		tr.appendChild(tdRightPadding);
	}
	else
	{
		tr.disabled = 'disabled';
		var tdMenuItem = doc.createElement('TD');
		tdMenuItem.style.paddingRight = 2;
		tdMenuItem.style.paddingLeft = 3;
		tdMenuItem.style.height = 3;
		tdMenuItem.colspan = 4;
		tr.appendChild(tdMenuItem);
		var tblPadding = doc.createElement('TABLE');
		tblPadding.cellSpacing = 0;
		tblPadding.cellPadding = 0;
		tblPadding.border = 0;
		tblPadding.style.width = '100%';
		var trPadding = doc.createElement('TR');
		var tdPadding = doc.createElement('TD');
		tdPadding.style.height = 1;
		tdPadding.style.backgroundColor = 'gray';
		trPadding.appendChild(tdPadding);
		tblPadding.appendChild(trPadding);
		tdMenuItem.appendChild(tblPadding);
	}
	return tr;
};

MenuItem.prototype.Disable = function()
{
	if ( this.m_Menu.m_Popup )
	{
		var miElmt = this.m_Menu.m_Popup.document.getElementById(this.m_Id);
		miElmt.disabled = true;
	}
	this.m_Disabled = true;
};

MenuItem.prototype.Enable = function()
{
	if ( this.m_Menu.m_Popup )
	{
		var miElmt = this.m_Menu.m_Popup.document.getElementById(this.m_Id);
		miElmt.disabled = false;
	}
	this.m_Disabled = false;
};

MenuItem.prototype.SetBorderColor = function(miHtml, width, borderColor)
{
	var borderAttribute = 'solid ' + width + 'px ' + borderColor;
	for( var i=1 ; i < miHtml.cells.length-1 ; ++i )
	{
		miHtml.cells(i).style.borderTop = borderAttribute
		miHtml.cells(i).style.borderBottom = borderAttribute;
	}
	borderAttribute = 'solid 1px ' + borderColor;
	if ( borderColor == this.m_Menu.Attribute('NormalMenuBackColor') )
	{
		miHtml.cells(1).style.borderLeft = 'solid 1px '
			+ this.m_Menu.Attribute('MenuItemStartColor');
	}
	else
	{
		miHtml.cells(1).style.borderLeft = borderAttribute;
	}
	miHtml.cells(3).style.borderTop = borderAttribute;
	miHtml.cells(3).style.borderBottom = borderAttribute;
	miHtml.cells(4).style.borderRight = borderAttribute;
};