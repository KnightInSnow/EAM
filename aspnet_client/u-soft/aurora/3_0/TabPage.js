/* **********************************************************
TabPage Class created by JScript

Author: lizhi[at]hit.edu.cn
Version: 2.0
Created: 2006.05.26 00:35
Updated: N/A

History:
	1. The first version of code created in 2006.05.26
	2. The basic feature code complete. [2006.05.28]
********************************************************** */

function HybridAlphaColor(original, mask, maskAlpha)
{
	if ( original.charAt(0) != '#' || mask.charAt(0) != '#' )
	{
		throw new Error('You must provide color formated as "#xxx" or "#xxxxxx".');
	}
	var originalR, originalG, originalB;
	var iColor = parseInt(original.substr(1), 16);
	if ( original.length == 4 )
	{
		originalR = (iColor & 0xf00) >> 8;
		originalG = (iColor & 0x0f0) >> 4;
		originalB = (iColor & 0x00f);
	}
	else
	{
		originalR = (iColor & 0xff0000) >> 16;
		originalG = (iColor & 0x00ff00) >> 8;
		originalB = (iColor & 0x0000ff);
	}
	var maskR, maskG, maskB;
	iColor = parseInt(mask.substr(1), 16);
	if ( mask.length == 4 )
	{
		maskR = (iColor & 0xf00) >> 8;
		maskG = (iColor & 0x0f0) >> 4;
		maskB = (iColor & 0x00f);
	}
	else
	{
		maskR = (iColor & 0xff0000) >> 16;
		maskG = (iColor & 0x00ff00) >> 8;
		maskB = (iColor & 0x0000ff);
	}
	maskAlpha -= Math.floor(maskAlpha);
	var originalAlpha = 1.0 - maskAlpha;
	var hybridR = parseInt(originalR*originalAlpha + maskR*maskAlpha, 10);
	var hybridG = parseInt(originalG*originalAlpha + maskG*maskAlpha, 10);
	var hybridB = parseInt(originalB*originalAlpha + maskB*maskAlpha, 10);
	var strColor = ((hybridR << 16) | (hybridG << 8) | hybridB).toString(16);
	return '#000000'.substr(0, 7-strColor.length) + strColor;
}

////////////////////////////////////////////////////////////////

function TabPage() {}

function TabPage.OnClick(tab)
{
	var srcElmt = event.srcElement;
	if ( srcElmt != tab )
	{
		var activatedTab = tab;
		if ( srcElmt.tagName == 'TD' && srcElmt.ActType == "PreviousPart" )
		{
			activatedTab = tab.previousSibling;
		}
		TabPage.ActivateTab(activatedTab);
	}
}

function TabPage.OnMouseOver(elmt)
{
	var tab = TabPage.FindTab(elmt);
	if ( tab && !BooleanHelper.Compare(tab.IsActive, true) )
	{
		TabPage.HiliteTab(tab);
	}
}

function TabPage.OnMouseOut(elmt)
{
	var tab = TabPage.FindTab(elmt);
	if ( tab && !BooleanHelper.Compare(tab.IsActive, true) )
	{
		TabPage.ResumeTab(tab);
	}
}

function TabPage.HiliteTab(tab)
{
	if ( tab && tab.ActType == 'Tab' )
	{
		var tabTopper = tab.rows(0).cells(1);
		tabTopper.style.borderBottomColor = tab.BorderHoverColor;
		var tabMiddle = tab.rows(1).cells(0);
		tabMiddle.style.backgroundColor = tab.BackActiveStartColor;

		var tabPage = this.FindTabPage(tab);
		if ( !this.IsPreviousTabAcitve(tab) )
		{
			var pixels = tab.rows(0).cells(0).childNodes;
			for ( var i=0 ; i < pixels.length ; ++i )
			{
				if ( pixels[i].tagName != 'DIV' )
				{
					pixels[i].style.visibility = 'hidden';
				}
			}
		}
		var corners = tab.rows(0).cells(0).all.tags('DIV');
		for ( var i=0 ; i < corners.length ; ++i )
		{
			if ( !BooleanHelper.Compare(corners[i].IsActive, true) && corners[i].ActType != 'PreviousPart' )
			{
				this.SetCornerColors(corners[i], tab.BorderHoverColor, tab.BackActiveStartColor, tabPage.BackColor);
			}
		}
		if ( this.IsLastTab(tab) )
		{
			var pixels = tab.rows(0).cells(2).childNodes;
			for ( var i=0 ; i < pixels.length ; ++i )
			{
				if ( pixels[i].tagName != 'DIV' )
				{
					pixels[i].style.visibility = 'hidden';
				}
			}
			var corner = tab.rows(0).cells(2).all.tags('DIV')[0];
			if ( !BooleanHelper.Compare(corners.IsActive, true) )
			{
				this.SetCornerColors(corner, tab.BorderHoverColor, tab.BackActiveStartColor, tabPage.BackColor);
			}
		}
		else
		{
			var nextTab = tab.nextSibling;
			var corners = nextTab.rows(0).cells(0).all.tags('DIV');
			for ( var i=0 ; i < corners.length ; ++i )
			{
				if ( corners[i].ActType == 'PreviousPart' )
				{
					this.SetCornerColors(corners[i], tab.BorderHoverColor, tab.BackActiveStartColor, tabPage.BackColor);
				}
			}
		}
	}
}

function TabPage.ResumeTab(tab)
{
	if ( tab && tab.ActType == 'Tab' )
	{
		var tabTopper = tab.rows(0).cells(1);
		tabTopper.style.borderBottomColor = tab.borderColor;
		var tabMiddle = tab.rows(1).cells(0);
		tabMiddle.style.backgroundColor = tab.BackStartColor;

		var tabPage = this.FindTabPage(tab);
		var corners = tab.rows(0).cells(0).all.tags('DIV');
		for ( var i=0 ; i < corners.length ; ++i )
		{
			if ( !BooleanHelper.Compare(corners[i].IsActive, true) && corners[i].ActType != 'PreviousPart' )
			{
				this.SetCornerColors(corners[i], tab.borderColor, tab.BackStartColor, tabPage.BackColor);
			}
		}
		if ( this.IsLastTab(tab) )
		{
			var corner = tab.rows(0).cells(2).all.tags('DIV')[0];
			if ( !BooleanHelper.Compare(corners.IsActive, true) )
			{
				this.SetCornerColors(corner, tab.borderColor, tab.BackStartColor, tabPage.BackColor);
			}
		}
		else
		{
			var nextTab = tab.nextSibling;
			var corners = nextTab.rows(0).cells(0).all.tags('DIV');
			for ( var i=0 ; i < corners.length ; ++i )
			{
				if ( corners[i].ActType == 'PreviousPart' )
				{
					this.SetCornerColors(corners[i], tab.borderColor, tab.BackStartColor, tabPage.BackColor);
				}
			}
		}
	}
}

function TabPage.SetCornerColors(corner, borderColor, innerColor, outerColor)
{
	var pixels = corner.all.tags('SPAN');
	var isTop = BooleanHelper.Compare(corner.IsTop, true);
	var isLeft = BooleanHelper.Compare(corner.IsLeft, true);
	this.SetPixelAttributes(pixels[0], 1, 1, HybridAlphaColor(borderColor, innerColor, 0.30));
	this.SetPixelAttributes(pixels[1], (isTop ? 0 : 2), (isLeft ? 0 : 2), outerColor);
	var alphaColor50 = HybridAlphaColor(borderColor, outerColor, 0.50);
	this.SetPixelAttributes(pixels[2], (isTop ? 0 : 2), 1, alphaColor50);
	this.SetPixelAttributes(pixels[3], 1, (isLeft ? 0 : 2), alphaColor50);
	var alphaColor17 = HybridAlphaColor(borderColor, outerColor, 0.17);
	this.SetPixelAttributes(pixels[4], (isTop ? 0 : 2), (isLeft ? 2 : 0), alphaColor17);
	this.SetPixelAttributes(pixels[5], (isTop ? 2 : 0), (isLeft ? 0 : 2), alphaColor17);
	var alphaColor75 = HybridAlphaColor(borderColor, innerColor, 0.75);
	this.SetPixelAttributes(pixels[6], 1, (isLeft ? 2 : 0), alphaColor75);
	this.SetPixelAttributes(pixels[7], (isTop ? 2: 0), 1, alphaColor75);
	this.SetPixelAttributes(pixels[8], (isTop ? 2 : 0), (isLeft ? 2 : 0), innerColor);
	corner.style.visibility = 'visible';
}

function TabPage.SetPixelAttributes(pixel, x, y, color, width, height)
{
	pixel.style.top = x;
	pixel.style.left = y;
	pixel.style.backgroundColor = color;
	if ( width )
	{
		pixel.style.width = width;
	}
	if ( height )
	{
		pixel.style.height = height;
	}
}

function TabPage.FindTab(elmt)
{
	var tab = FindParentElement(elmt, 'TABLE');
	if ( tab && tab.ActType == 'Tab' )
	{
		return tab;
	}
}

function TabPage.ActivateTab(tab)
{
	if ( tab && tab.ActType == 'Tab' && !BooleanHelper.Parse(tab.IsActive) )
	{
		var tabPage = this.FindTabPage(tab);
		this.Inactivate(tabPage);
		var tabTopper = tab.rows(0).cells(1);
		tabTopper.style.borderTopColor = tab.BorderHoverColor;
		tabTopper.style.backgroundColor = tab.BackActiveStartColor;
		tabTopper.style.borderBottomColor = tab.BackActiveStartColor;
		var tabMiddle = tab.rows(1).cells(0);
		tabMiddle.style.backgroundColor = tab.BackActiveEndColor;
		var offset = 1;
		if ( this.IsFirstTab(tab) )
		{
			offset = 0;
			tab.rows(2).cells(offset).style.width = '0px';
			tab.rows(2).cells(offset).style.borderLeftColor = tab.BorderActiveColor;
		}
		else
		{
			tab.rows(2).cells(offset-1).style.borderRightColor = tab.BorderActiveColor;
		}
		for ( var i=0 ; i < 3 ; ++i )
		{
			var td = tab.rows(2).cells(offset+i);
			td.style.backgroundColor = tab.BackActiveEndColor;
			td.style.borderBottomColor = tab.BackActiveEndColor;
			td.style.filter = '';
		}
		tab.rows(2).cells(offset).style.borderBottomColor = tab.BorderActiveColor;
		tab.rows(2).cells(offset+2).children(0).style.top = '-2px';
		tab.rows(2).cells(offset+2).children(0).style.color = tab.ForeActiveColor;
		tab.rows(2).cells(offset+1).style.borderLeftWidth = '0px';

		if ( this.IsLastTab(tab) )
		{
			tab.rows(2).cells(4).style.filter ='';
			tab.rows(2).cells(4).style.borderRightWidth = '0px';
			tab.rows(2).cells(4).style.backgroundColor = tab.BackActiveEndColor;
			tab.rows(2).cells(4).style.borderBottomColor = tab.BackActiveEndColor;
			
			tab.rows(2).cells(5).style.width = '1px';
			tab.rows(2).cells(5).style.backgroundColor = tab.BackActiveEndColor;
			tab.rows(2).cells(5).style.borderBottomColor = tab.BackActiveEndColor;
			tab.rows(2).cells(5).style.borderRight = '1px solid ' + tab.BorderActiveColor;
		}
		else
		{
			var prevPart = tab.nextSibling;
			prevPart.rows(2).cells(0).style.filter ='';
			prevPart.rows(2).cells(0).style.borderRightWidth = '0px';
			prevPart.rows(2).cells(0).style.backgroundColor = tab.BackActiveEndColor;
			prevPart.rows(2).cells(0).style.borderBottomColor = tab.BackActiveEndColor;
			
			prevPart.rows(2).cells(1).style.backgroundColor = tab.BackActiveEndColor;
			prevPart.rows(2).cells(1).style.borderBottomColor = tab.BackActiveEndColor;
			prevPart.rows(2).cells(1).style.borderLeftWidth = '0px';
			prevPart.rows(2).cells(2).style.borderLeftColor = tab.BorderActiveColor;
			prevPart.rows(2).cells(2).style.width = '1px';
		}
		tab.IsActive = true;
		tabPage.ActiveTabId = tab.ServerId;
		this.SynchronizeActiveTabId(tab);
		this.SynchronizePanelStatus(tab);
		
		if ( true || !this.IsPreviousTabAcitve(tab) )
		{
			var spans = [];
			var pixels = tab.rows(0).cells(0).childNodes;
			for ( var i=0 ; i < pixels.length ; ++i )
			{
				if ( pixels[i].tagName != 'DIV' )
				{
					spans.push(pixels[i]);
					pixels[i].style.visibility = 'visible';
				}
			}
			var isFirst = this.IsFirstTab(tab);
			this.SetPixelAttributes(spans[0], 0, (isFirst ? 3 : 5), tab.BorderHoverColor, 1, 1);
			this.SetPixelAttributes(spans[1], 1, (isFirst ? 3 : 5), tab.BackActiveStartColor, 2, 2);
			this.SetPixelAttributes(spans[2], 3, (isFirst ? 1 : 3), tab.BackActiveEndColor, 4, 2);
			this.SetPixelAttributes(spans[3], 3, (isFirst ? 0 : 2), tab.BorderActiveColor, 1, 2);
			spans[3].style.zIndex = 1;
		}
		var corners = tab.rows(0).cells(0).all.tags('DIV');
		for ( var i=0 ; i < corners.length ; ++i )
		{
			if ( !BooleanHelper.Compare(corners[i].IsActive, true) && corners[i].ActType != 'PreviousPart' )
			{
				this.SetCornerColors(corners[i], tab.BorderHoverColor, tab.BackActiveStartColor, tabPage.BackColor);
				corners[i].style.top = 0;
				corners[i].style.left = this.IsFirstTab(tab) ? 0 : 2;
				corners[i].style.zIndex = 1;
				corners[i].IsActive = true;
			}
		}
		if ( this.IsLastTab(tab) )
		{
			var spans = [];
			var pixels = tab.rows(0).cells(2).childNodes;
			for ( var i=0 ; i < pixels.length ; ++i )
			{
				if ( pixels[i].tagName != 'DIV' )
				{
					spans.push(pixels[i]);
					pixels[i].style.visibility = 'visible';
				}
			}
			this.SetPixelAttributes(spans[0], 0, 0, tab.BorderHoverColor, 2, 1);
			this.SetPixelAttributes(spans[1], 1, 0, tab.BackActiveStartColor, 2, 2);
			this.SetPixelAttributes(spans[2], 3, 0, tab.BackActiveEndColor, 4, 2);
			this.SetPixelAttributes(spans[3], 3, 4, tab.BorderActiveColor, 1, 2);
			var corner = tab.rows(0).cells(2).all.tags('DIV')[0];
			this.SetCornerColors(corner, tab.BorderHoverColor, tab.BackActiveStartColor, tabPage.BackColor);
			corner.style.top = 0;
			corner.style.left = 2;
		}
		else
		{
			var nextTab = tab.nextSibling;
			var spans = [];
			var pixels = nextTab.rows(0).cells(0).childNodes;
			for ( var i=0 ; i < pixels.length ; ++i )
			{
				if ( pixels[i].tagName != 'DIV' )
				{
					spans.push(pixels[i]);
					pixels[i].style.visibility = 'visible';
				}
			}
			this.SetPixelAttributes(spans[0], 0, 0, tab.BorderHoverColor, 2, 1);
			this.SetPixelAttributes(spans[1], 1, 0, tab.BackActiveStartColor, 2, 2);
			this.SetPixelAttributes(spans[2], 3, 0, tab.BackActiveEndColor, 4, 2);
			this.SetPixelAttributes(spans[3], 3, 4, tab.BorderActiveColor, 1, 2);
			spans[3].style.zIndex = 1;
			var corners = nextTab.rows(0).cells(0).all.tags('DIV');
			for ( var i=0 ; i < corners.length ; ++i )
			{
				if ( corners[i].ActType == 'PreviousPart' )
				{
					this.SetCornerColors(corners[i], tab.BorderHoverColor, tab.BackActiveStartColor, tabPage.BackColor);
					corners[i].style.top = 0;
					corners[i].style.left = 2;
					corners[i].style.zIndex = 1;
				}
			}
		}
	}
}

function TabPage.SynchronizeActiveTabId(tab)
{
	if ( tab && tab.ActType == 'Tab' )
	{
		var walkTab = tab
		while( walkTab.nextSibling && (walkTab = walkTab.nextSibling) );
		var input = walkTab.all.tags('INPUT')[0];
		input.value = tab.Index;
	}
}

function TabPage.Inactivate(tabPage)
{
	if ( tabPage && tabPage.ActType == 'TabPage' )
	{
		var tabContainer = tabPage.rows(0).cells(0).childNodes(0);
		for ( var i=0 ; i < tabContainer.childNodes.length ; ++i )
		{
			if ( tabContainer.childNodes[i].ServerId == tabPage.ActiveTabId )
			{
				this.InactivateTab(tabContainer.childNodes[i]);
				break;
			}
		}
	}
}

function TabPage.InactivateTab(tab)
{
	if ( tab && tab.ActType == 'Tab' )
	{
		var tabPage = this.FindTabPage(tab);
		var tabTopper = tab.rows(0).cells(1);
		tabTopper.style.borderTopColor = tabPage.BackColor;
		tabTopper.style.backgroundColor = tabPage.BackColor;
		tabTopper.style.borderBottomColor = tab.borderColor; // @_@
		var tabMiddle = tab.rows(1).cells(0);
		tabMiddle.style.backgroundColor = tab.BackStartColor;
		
		var filterString = StringHelper.Format('progid:DXImageTransform.Microsoft.'
			+ 'Gradient(GradientType=0, StartColorStr={0}, EndColorStr={1})',
			tab.BackStartColor, tab.BackEndColor);

		var offset = 1;
		if ( this.IsFirstTab(tab) )
		{
			offset = 0;
			tab.rows(2).cells(offset).style.width = '1px';
			tab.rows(2).cells(offset).style.borderLeftColor = tabPage.BackColor;
		}
		else
		{
			tab.rows(2).cells(offset-1).style.borderRightColor = tab.borderColor;
		}
		for ( var i=0 ; i < 3 ; ++i )
		{
			var td = tab.rows(2).cells(offset+i);
			td.style.borderBottomColor = tab.BorderActiveColor;
			td.style.filter = filterString;
		}
		tab.rows(2).cells(offset).style.filter = '';
		tab.rows(2).cells(offset).style.backgroundColor = tabPage.BackColor;
		tab.rows(2).cells(offset+2).children(0).style.top = '0px';
		tab.rows(2).cells(offset+2).children(0).style.color = tab.ForeColor;
		tab.rows(2).cells(offset+1).style.borderLeft = 'solid 1px ' + tab.borderColor;

		if ( this.IsLastTab(tab) )
		{
			tab.rows(2).cells(4).style.filter = filterString;
			tab.rows(2).cells(4).style.borderRight = 'solid 1px ' + tab.borderColor;
			tab.rows(2).cells(4).style.borderBottom = 'solid 1px ' + tab.BorderActiveColor;
			
			tab.rows(2).cells(5).style.width = '1px';
			tab.rows(2).cells(5).style.borderBottom = 'solid 1px ' + tab.BorderActiveColor;
			tab.rows(2).cells(5).style.backgroundColor = tabPage.BackColor;
			tab.rows(2).cells(5).style.borderRight = '0px solid ' + tab.BorderActiveColor;
		}
		else
		{
			var prevPart = tab.nextSibling;
			prevPart.rows(2).cells(0).style.filter = filterString;
			prevPart.rows(2).cells(0).style.borderRightWidth = '2px';
			prevPart.rows(2).cells(0).style.borderRight = 'solid 1px ' + tab.borderColor;
			prevPart.rows(2).cells(0).style.borderBottom = 'solid 1px ' + tab.BorderActiveColor;
			
			prevPart.rows(2).cells(1).style.backgroundColor = tabPage.BackColor;
			prevPart.rows(2).cells(1).style.borderBottom = 'solid 1px ' + tab.BorderActiveColor;
			prevPart.rows(2).cells(2).style.borderLeftColor = tab.borderColor;
			prevPart.rows(2).cells(2).style.width = '2px';
		}
		tab.IsActive = false;
		tabPage.ActiveTabId = null;
		this.SynchronizePanelStatus(tab);
		
		if ( true || !this.IsPreviousTabAcitve(tab) )
		{
			var pixels = tab.rows(0).cells(0).childNodes;
			for ( var i=0 ; i < pixels.length ; ++i )
			{
				if ( pixels[i].tagName != 'DIV' )
				{
					pixels[i].style.visibility = 'hidden';
				}
			}
		}
		var corners = tab.rows(0).cells(0).all.tags('DIV');
		for ( var i=0 ; i < corners.length ; ++i )
		{
			if ( BooleanHelper.Compare(corners[i].IsActive, true) && corners[i].ActType != 'PreviousPart' )
			{
				this.SetCornerColors(corners[i], tab.borderColor, tab.BackStartColor, tabPage.BackColor);
				corners[i].style.top = 2;
				corners[i].style.left = this.IsFirstTab(tab) ? 2 : 4;
				corners[i].style.zIndex = 0;
				corners[i].IsActive = false;
			}
		}
		if ( this.IsLastTab(tab) )
		{
			var pixels = tab.rows(0).cells(2).childNodes;
			for ( var i=0 ; i < pixels.length ; ++i )
			{
				if ( pixels[i].tagName != 'DIV' )
				{
					pixels[i].style.visibility = 'hidden';
				}
			}
			var corner = tab.rows(0).cells(2).all.tags('DIV')[0];
			this.SetCornerColors(corner, tab.borderColor, tab.BackStartColor, tabPage.BackColor);
			corner.style.top = 2;
			corner.style.left = 0;
		}
		else
		{
			var nextTab = tab.nextSibling;
			var pixels = nextTab.rows(0).cells(0).childNodes;
			for ( var i=0 ; i < pixels.length ; ++i )
			{
				if ( pixels[i].tagName != 'DIV' )
				{
					pixels[i].style.visibility = 'hidden';
				}
			}
			var corners = nextTab.rows(0).cells(0).all.tags('DIV');
			for ( var i=0 ; i < corners.length ; ++i )
			{
				if ( corners[i].ActType == 'PreviousPart' )
				{
					this.SetCornerColors(corners[i], tab.borderColor, tab.BackStartColor, tabPage.BackColor);
					corners[i].style.top = 2;
					corners[i].style.left = 0;
					corners[i].style.zIndex = 0;
				}
			}
		}
	}
}

function TabPage.SynchronizePanelStatus(tab)
{
	if ( tab && tab.ActType == 'Tab' )
	{
		var tabPage = this.FindTabPage(tab);
		if ( tabPage )
		{
			var panelContainer = tabPage.rows(1).cells(0);
			for ( var i=0 ; i < panelContainer.childNodes.length ; ++i )
			{
				var panel = panelContainer.childNodes[i];
				if ( panel.ServerId == tab.ServerId )
				{
					if ( BooleanHelper.Compare(tab.IsActive, true) )
					{
						panel.style.display = 'block';
					}
					else
					{
						panel.style.display = 'none';
					}
				}
			}
		}
		else
		{
			throw new Error('Cannot find associated panel.');
		}
	}
}

function TabPage.FindTabPage(elmt)
{
	var tabContainer = FindParentElement(elmt, 'DIV');
	if ( tabContainer )
	{
		var tabPage = FindParentElement(tabContainer, 'TABLE');
		if ( tabPage && tabPage.ActType == 'TabPage' )
		{
			return tabPage;
		}
	}
}

function TabPage.IsFirstTab(tab)
{
	return !tab.previousSibling;
}

function TabPage.IsLastTab(tab)
{
	return !tab.nextSibling.nextSibling;
}

function TabPage.IsPreviousTabAcitve(tab)
{
	if ( this.IsFirstTab(tab) )
	{
		return false;
	}
	else
	{
		var prevTab = tab.previousSibling;
		return BooleanHelper.Compare(prevTab.IsActive, true);
	}
}