/***********************************************************
ListView class created by JScript

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. ? All rights reserved.
Version: 2.0
Created: 2005.08.09 0:12
Last Updated: 2005.08.13 1:57

History:
	1. The code created at 2005.08.09
	2. All functions were implemented. [2005.08.13]
	3. Fix call ListView.Dispose before which Shown bug. [2005.10.19]

***********************************************************/

function ListStyles()
{
	this.m_ActiveForeColor = 'blue';
	this.m_ActiveBackColor = '#ffffe1';
	this.m_NormalForeColor = 'windowtext';
	this.m_NormalBackColor = 'window';
	this.m_SelectedForeColor = 'highlighttext';
	this.m_SelectedBackColor = 'highlight';
	this.m_CheckedForeColor = 'green';
	this.m_CheckedBackColor = 'window';
	
	this.m_BorderColor = 'gray';
	this.m_AlternateForeColor = 'black';
	this.m_AlternateBackColor = '#F4F4F4';

	this.toString = function()
	{
		return '[class ListStyles]';
	};
}

////////////////////////////////////////////////////////////////////

function ListAttributes()
{
	this.m_CellPadding = 0;
	this.m_HasCheckBox = true;
	this.m_CheckBoxWidth = 21;
	this.m_IsAlternate = true;

	this.toString = function()
	{
		return '[class ListAttributes]';
	};
}

////////////////////////////////////////////////////////////////////

function ListView(attributes, styles)
{
	this.m_Column = new ListColumn();
	this.m_Column.m_List = this;
	this.m_Rows = new RowCollection();
	this.m_Rows.m_List = this;
	this.m_Checkeds = new CollectionBase();
	this.m_Selecteds = new CollectionBase();
	this.m_Attributes = attributes;
	this.m_Styles = styles;
	if ( !attributes ) this.m_Attributes = new ListAttributes();
	if ( !styles ) this.m_Styles = new ListStyles();
	this.m_Element = null;
	
	this.toString = function()
	{
		return '[class ListView]';
	};
}

ListView.prototype.Attribute = function(key)
{
	if ( key.indexOf('m_') != 0 )
	{
		key = 'm_' + key;
	}
	return this.m_Attributes[key];
}

ListView.prototype.Style = function(key)
{
	if ( key.indexOf('m_') !=0 )
	{
		key = 'm_' + key;
	}
	return this.m_Styles[key];
}

ListView.prototype.Render = function(doc)
{
	var tbl = doc.createElement('TABLE');
	this.m_Element = tbl;
	tbl.Object = this;

	tbl.runtimeStyle.width = '100%';
	tbl.runtimeStyle.height = '100%';
	var borderColor = this.Style('BorderColor');
	tbl.runtimeStyle.border = 'solid 1px ' + borderColor;
	tbl.runtimeStyle.borderCollapse = 'collapse';
	tbl.border = 1;
	tbl.borderColor = borderColor;
	tbl.cellSpacing = 0;
	tbl.cellPadding = 0;
	
	tbl.onresize = function()
	{
		ListView.SynchToInnerPanel(this);
	};
	tbl.onkeydown = function()
	{
		var gridPanel = FindChildElement(this.rows(1), 'DIV');
		ListView.DataViewKeyDown(gridPanel.children(0));
	};
	tbl.onselectstart = function()
	{
		return false;
	};
	
	var tbody = doc.createElement('TBODY');
	var tr = doc.createElement('TR');
	tr.runtimeStyle.height = 20;
	var column = doc.createElement('TD');
	column.runtimeStyle.verticalAlign = 'top';
	var columnPanel = doc.createElement('DIV');
	columnPanel.onscroll = function()
	{
		ListView.SynchToMainPanel(this);
	};
	columnPanel.className = 'NoneScroll';
	columnPanel.runtimeStyle.position = 'absolute';
	columnPanel.runtimeStyle.overflowX = 'hidden';
	columnPanel.runtimeStyle.overflowY = 'scroll';
	columnPanel.appendChild(this.m_Column.Render(doc));
	column.appendChild(columnPanel);
	tr.appendChild(column);
	tbody.appendChild(tr);
	tbl.appendChild(tbody);
	
	tr = doc.createElement('TR');
	var grid = doc.createElement('TD');
	grid.vAlign = 'top';
	var gridPanel = doc.createElement('DIV');
	gridPanel.runtimeStyle.position = 'absolute';
	gridPanel.runtimeStyle.overflow = 'auto';
	gridPanel.runtimeStyle.height = '100%';
	grid.appendChild(gridPanel);
	
	gridPanel.onscroll = function()
	{
		ListView.SynchToHeaderPanel(this);
	};
	gridPanel.onkeydown = function()
	{
		ListView.DataViewKeyDown(this);
	};

	gridPanel.appendChild(this.m_Rows.Render(doc));
	tr.appendChild(grid);
	tbody.appendChild(tr);
	return tbl;
};

ListView.prototype.Dispose = function()
{
	if ( this.m_Element )
	{
		if ( this.m_Column )
		{
			this.m_Column.Dispose();
			this.m_Column = null;
		}
		var rowCount = this.m_Rows.m_Count;
		for ( var i=0 ; i < rowCount ; ++i )
		{
			this.m_Rows.Items(i).Dispose();
			delete this.m_Rows.m_InnerArray[i];
		}
		this.m_Element.clearAttributes();
		this.m_Element = null;
		this.Dispose = null;
	}
};

ListView.prototype.SetColumn = function(column)
{
	if ( column )
	{
		this.m_Column = column;
		this.m_Column.m_List = this;
	}
}

ListView.prototype.SetRows = function(rows)
{
	if ( rows )
	{
		this.m_Rows = rows;
		this.m_Rows.m_List = this;
	}
};

ListView.prototype.Show = function(container)
{
	container.appendChild(this.Render(container.document));
	if ( container.tagName == 'TD' )
	{
		container.runtimeStyle.verticalAlign = 'top';
	}
	container.children(0).fireEvent('onresize');
};

ListView.prototype.GetSelected = function()
{
	var tbl = this.m_Element;
	var tblGrid = FindChildElement(tbl.rows(1), 'TABLE');
	return tblGrid.selectedRow;
};

ListView.prototype.GetChecked = function()
{
	var tbl = this.m_Element;
	var tblGrid = FindChildElement(tbl.rows(1), 'TABLE');
	var checkeds = [];
	if ( tblGrid )
	{
		for ( var i=0 ; i < tblGrid.rows.length ; ++i )
		{
			var row = tblGrid.rows(i);
			if ( row.isChecked )
			{
				checkeds.push(row);
			}
		}
	}
	return checkeds;
};

////////////////////////////////////////////////////////////////////

function ListColumn()
{
	this.Extends(CollectionBase);
	this.m_Cells = this.m_InnerArray;
	
	this.m_List = null;
	this.m_Element = null;
	
	this.Add = function(cell)
	{
		this.base.Add.Call(this, cell);
		cell.m_Column = this;
	};
	
	this.toString = function()
	{
		return '[class ListColumn]';
	};
}

ListColumn.prototype.Attribute = function(key)
{
	if ( key.indexOf('m_') != 0 )
	{
		key = 'm_' + key;
	}
	return this.m_List.m_Attributes[key];
};

ListColumn.prototype.Render = function(doc)
{
	var tblColumn = doc.createElement('TABLE');
	this.m_Element = tblColumn;
	tblColumn.Object = this;
	
	tblColumn.runtimeStyle.borderCollapse = 'collapse';
	// tblColumn.runtimeStyle.width = '100%';
	tblColumn.runtimeStyle.tableLayout = 'fixed';
	tblColumn.runtimeStyle.overflow = 'hidden';
	tblColumn.runtimeStyle.textOverflow = 'ellipsis';
	tblColumn.runtimeStyle.borderBottom = 'none';
	tblColumn.runtimeStyle.borderRight = 'none';
	tblColumn.cellPadding = this.Attribute('CellPadding');
	tblColumn.cellSpacing = 0;
	tblColumn.border = 1;
	
	tblColumn.onresize = function()
	{
		ListView.SynchHeightToHeader(this);
	};

	var tbody = doc.createElement('TBODY');
	var group = doc.createElement('COLGROUP');
	if ( this.Attribute('HasCheckBox') )
	{
		var col = doc.createElement('COL');
		col.isFixed = true;
		col.width = this.Attribute('CheckBoxWidth');
		group.appendChild(col);
	}
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var col = doc.createElement('COL');
		col.width = this.m_Cells[i].m_Width;
		group.appendChild(col);
	}
	group.appendChild(doc.createElement('COL'));
	tblColumn.appendChild(group);
	tblColumn.appendChild(tbody);
	
	var tr = doc.createElement('TR');
	tbody.appendChild(tr);
	this.m_Element = tr;
	tr.Object = this;
	if ( this.Attribute('HasCheckBox') )
	{
		var chkb = doc.createElement('INPUT');
		chkb.type = 'checkbox';
		chkb.hideFocus = true;
		chkb.onclick = function()
		{
			ListView.SignCheckStatus(this);
		};
		var td = doc.createElement('TD');
		td.appendChild(chkb);
		tr.appendChild(td);
	}
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		tr.appendChild(this.m_Cells[i].Render(doc));
	}
	tr.appendChild((new ColumnCell('')).Render(doc));
	return tblColumn;
};

ListColumn.prototype.Dispose = function(doc)
{
	var columnCount = this.m_Count;
	for ( var i=0 ; i < columnCount ; ++i )
	{
		this.m_Cells[i].Dispose();
		delete this.m_Cells[i];
	}
	this.m_Element.clearAttributes();
	this.m_Element = null;
};

////////////////////////////////////////////////////////////////////

function ColumnCell(text, width)
{
	this.Extends(CellBase, text);
	
	this.m_Text = text;
	this.m_Column = null;
	this.m_Width = width;
	
	this.toString = function()
	{
		return '[class ColumnCell]';
	};
}

ColumnCell.prototype.Render = function(doc)
{
	var cell = this.base.Render.Call(this, doc);
	cell.Context.runtimeStyle.cursor = 'default';
	cell.Context.runtimeStyle.fontWeight = 'bold';
	cell.ActType = 'ColumnCell';
	cell.ondblclick = function()
	{
		ListView.HeaderDoubleClick(this);
	};
	cell.onmousemove = function()
	{
		ListView.ResizeColumnSize(this);
	};
	cell.onmousedown = function()
	{
		ListView.HeaderMoveDown(this);
	};
	cell.onmouseup = function()
	{
		ListView.HeaderMoveUp(this);
	};
	return cell;
};

////////////////////////////////////////////////////////////////////

function RowCollection()
{
	this.Extends(CollectionBase);
	
	this.m_List = null;
	this.m_Element = null;
	
	this.Add = function(row)
	{
		this.base.Add.Call(this, row);
		row.m_Rows = this;
	};
	
	this.toString = function()
	{
		return '[class RowCollection]';
	};
}

RowCollection.prototype.Attribute = function(key)
{
	if ( key.indexOf('m_') != 0 )
	{
		key = 'm_' + key;
	}
	return this.m_List.m_Attributes[key];
}

RowCollection.prototype.Style = function(key)
{
	if ( key.indexOf('m_') !=0 )
	{
		key = 'm_' + key;
	}
	return this.m_List.m_Styles[key];
}

RowCollection.prototype.Render = function(doc)
{
	var tblGrid = doc.createElement('TABLE');
	this.m_Element = tblGrid;
	tblGrid.Object = this;

	tblGrid.runtimeStyle.borderCollapse = 'collapse';
	// tblGrid.runtimeStyle.width = '100%';
	tblGrid.runtimeStyle.tableLayout = 'fixed';
	tblGrid.runtimeStyle.overflow = 'hidden';
	tblGrid.runtimeStyle.textOverflow = 'ellipsis';
	tblGrid.runtimeStyle.borderBottom = 'none';
	tblGrid.runtimeStyle.borderRight = 'none';
	tblGrid.border = 1;
	tblGrid.cellSpacing = 0;
	tblGrid.cellPadding = this.Attribute('CellPadding');

	var tbodyGrid = doc.createElement('TBODY');
	
	var colgroup = doc.createElement('COLGROUP');
	if ( this.Attribute('HasCheckBox') )
	{
		var col = doc.createElement('COL');
		col.width = this.Attribute('CheckBoxWidth');
		colgroup.appendChild(col);
	}
	for ( var i=0 ; i < this.m_List.m_Column.m_Count ; ++i )
	{
		var col = doc.createElement('COL');
		col.width = this.m_List.m_Column.Items(i).m_Width;
		colgroup.appendChild(col);
	}
	colgroup.appendChild(doc.createElement('COL'));
	tblGrid.appendChild(colgroup);

	var alternateForeColor = this.Style('AlternateForeColor');
	var alternateBackColor = this.Style('AlternateBackColor');
	var isAlternate = this.Attribute('IsAlternate');
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var row = this.Items(i);
		var elmtRow = row.Render(doc);
		
		if ( isAlternate && parseInt(i/2, 10)*2 == i )
		{
			elmtRow.style.color = alternateForeColor;
			elmtRow.style.backgroundColor = alternateBackColor;
		}
		tbodyGrid.appendChild(elmtRow);
	}
	tblGrid.appendChild(tbodyGrid);
	return tblGrid;
};

RowCollection.prototype.Dispose = function()
{
	if ( this.m_Element )
	{
		this.m_Element.clearAttributes;
		this.m_Element = null;
	}
};

////////////////////////////////////////////////////////////////////

function ListRow()
{
	this.Extends(CollectionBase);
	this.m_Cells = this.m_InnerArray;
	
	this.m_Rows = null;
	this.m_Element = null;
	this.m_UserData = null;
	
	this.toString = function()
	{
		return '[class ListRow]';
	};
}

ListRow.prototype.Style = function(key)
{
	if ( key.indexOf('m_') != 0 )
	{
		key = 'm_' + key;
	}
	return this.m_Rows.m_List.m_Styles[key];
};

ListRow.prototype.Attribute = function(key)
{
	if ( key.indexOf('m_') != 0 )
	{
		key = 'm_' + key;
	}
	return this.m_Rows.m_List.m_Attributes[key];
};

ListRow.prototype.SetUserData = function(key, data)
{
	if ( !this.m_UserData )
	{
		this.m_UserData = {};
	}
	this.m_UserData[key] = data;
};

ListRow.prototype.GetUserData = function(key)
{
	if ( this.m_UserData )
	{
		return this.m_UserData[key];
	}
	return null;
};

ListRow.prototype.Render = function(doc)
{
	var tr = doc.createElement('TR');
	this.m_Element = tr;
	tr.Object = this;

	if ( this.Attribute('HasCheckBox') )
	{
		var chkb = doc.createElement('INPUT');
		chkb.type = 'checkbox';
		chkb.hideFocus = true;
		chkb.onclick = function()
		{
			ListView.CheckRow(this);
			event.cancelBubble = true;
			// event.returnValue = false;
		};
		var td = doc.createElement('TD');
		td.appendChild(chkb);
		tr.appendChild(td);
	}
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var cell = this.m_Cells[i];
		tr.appendChild(cell.Render(doc));
		tr.onmouseover = function()
		{
			ListView.RowMouseOver(this);
		};
		tr.onmouseout = function()
		{
			ListView.RowMouseOut(this);
		};
		tr.onclick = function()
		{
			ListView.RowClick(this);
		};
		// oncontextmenu="return false;"
	}
	tr.appendChild(doc.createElement('TD'));
	return tr;
};

ListRow.prototype.Dispose = function()
{
	var cellCount = this.m_Count;
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		this.m_Cells[i].Dispose();
		delete this.m_Cells[i];
	}
	this.m_Element.clearAttributes();
	this.m_Element = null;
};

////////////////////////////////////////////////////////////////////

function CellBase(text)
{
	this.m_Text = text;
	this.m_IsHtml = false;
	this.m_Icon = null;
	this.m_ToolTip = null;
	this.m_Element = null;

	this.toString = function()
	{
		return '[class CellBase]';
	};
}

CellBase.prototype.Render = function(doc)
{
	var td = doc.createElement('TD');
	this.m_Element = td;
	td.Object = this;

	if ( this.m_Icon )
	{
		var img = doc.createElement('IMG');
		img.src = this.m_Icon;
		img.align = 'absMiddle';
		td.appendChild(img);
		td.Icon = img;
	}
	var span = doc.createElement('SPAN');
	span.runtimeStyle.cursor = 'default';
	td.runtimeStyle.textIndent = 2;
	td.noWrap = 'noWrap';
	td.appendChild(span);
	td.Context = span;
	if ( this.m_IsHtml )
	{
		span.innerHTML = this.m_Text;
	}
	else
	{
		span.innerText = this.m_Text;
	}
	if ( this.m_ToolTip )
	{
		td.title = this.m_ToolTip;
	}
	return td;
};

CellBase.prototype.Dispose = function()
{
	if ( this.m_Element )
	{
		this.m_Element.clearAttributes();
		this.m_Element = null;
	}
};

////////////////////////////////////////////////////////////////////

function ListCell(text)
{
	this.Extends(CellBase, text);

	this.toString()
	{
		return '[class ListCell]';
	};
}

ListCell.prototype.Render = function(doc)
{
	var cell = this.base.Render.Call(this, doc);
	return cell;
};

////////////////////////////////////////////////////////////////////


// Static Methods ////////////////////////////////////////////////////

ListView.m_IsCellsSynch = false;

function ListView.SynchToInnerPanel(elmt)
{
	var headerFrame = elmt.rows(0).cells(0);
	var mainFrame = elmt.rows(1).cells(0);
	var headerPanel = headerFrame.childNodes(0);
	var mainPanel = mainFrame.childNodes(0);
	headerPanel.runtimeStyle.width = mainFrame.clientWidth;
	headerPanel.children(0).runtimeStyle.width = headerPanel.clientWidth;
	mainPanel.runtimeStyle.width = mainFrame.clientWidth;
	mainPanel.children(0).runtimeStyle.width = mainPanel.clientWidth;
	if ( this.IsVerticalOverflow(mainPanel) )
	{
		headerPanel.runtimeStyle.overflowY = 'scroll';
	}
	else
	{
		headerPanel.runtimeStyle.overflowY = 'hidden';
	}
	this.SynchCellsWidth(headerPanel.childNodes(0), mainPanel.childNodes(0));
	this.m_IsCellsSynch = true;
	headerPanel.childNodes(0).fireEvent('onresize');
}

function ListView.SynchCellsWidth(headerTable, mainTable)
{
	if ( mainTable.rows.length == 0 )
	{
		headerTable.parentElement.runtimeStyle.overflowY = 'hidden';
		return;
	}
	var headerGroup = headerTable.children[0];
	var mainGroup = mainTable.children[0];
	var synchCount = mainTable.rows(0).cells.length-1;
	for ( var i=0 ; i < synchCount ; ++i )
	{
		headerWidth = headerGroup.children(i).offsetWidth;
		mainGroup.children(i).width = headerWidth;
		var headerCell = headerTable.rows(0).cells(i);

		this.SwapCellToolTip(headerCell);
		var rowCount = mainTable.rows.length;
		for ( var j=0 ; j < rowCount ; ++j )
		{
			var cell = mainTable.rows(j).cells(i);
			if ( cell )
			{
				this.SwapCellToolTip(cell);
			}
		}
	}
}

function ListView.SwapCellToolTip(cell)
{
	if ( cell.clientWidth < cell.scrollWidth )
	{
		if ( cell.title && cell.title != cell.innerText )
		{
			cell.oldTitle = cell.title;
		}
		cell.title = cell.innerText;
		cell.runtimeStyle.cursor = 'default';
	}
	else
	{
		if ( cell.oldTitle )
		{
			cell.title = cell.oldTitle;
		}
		else
		{
			cell.title = '';
			cell.runtimeStyle.cursor = '';
		}
	}
}

function ListView.SynchToHeaderPanel(elmt)
{
	var container = FindParentElement(elmt, 'TABLE');
	var headerFrame = container.rows(0).cells(0);
	var headerPanel = headerFrame.childNodes(0);
	headerPanel.scrollLeft = elmt.scrollLeft;
}

function ListView.SynchToMainPanel(elmt)
{
	var container = FindParentElement(elmt, 'TABLE');
	var mainFrame = container.rows(1).cells(0);
	var mainPanel = mainFrame.childNodes(0);
	mainPanel.scrollLeft = elmt.scrollLeft;
}

function ListView.SynchHeightToHeader(elmt)
{
	var headerPanel = elmt.parentElement;
	var headerCell = headerPanel.parentElement;
	headerCell.runtimeStyle.height = elmt.offsetHeight;
	headerPanel.runtimeStyle.height = elmt.offsetHeight;
}

function ListView.IsHorizontalOverflow(elmt)
{
	return elmt.clientWidth < elmt.scrollWidth;
}

function ListView.IsVerticalOverflow(elmt)
{
	return elmt.clientHeight < elmt.scrollHeight;
}

function ListView.ResizeColumnSize(elmt)
{
	var evt = elmt.document.parentWindow.event;
	var columnCount = elmt.parentElement.cells.length;
	var headerTable = FindParentElement(elmt, 'TABLE');
	var cellIndex = elmt.cellIndex;
	var col = headerTable.childNodes(0).children(cellIndex);
	var srcElmt = evt.srcElement;
	if ( srcElmt === elmt && evt.button == 0 && ( ( evt.offsetX < 2 && cellIndex !=0 && !col.previousSibling.isFixed )
		|| ( elmt.clientWidth-evt.offsetX < 2 && cellIndex != columnCount-1 && !col.isFixed ) ) )
	{
		elmt.runtimeStyle.cursor = 'col-resize';
		elmt.canResize = true; 
		if ( evt.offsetX < 2 )
		{
			elmt.target = elmt.previousSibling ? elmt.previousSibling : elmt;
		}
		else
		{
			elmt.target = elmt;
		}
		elmt.target.minX = -elmt.target.clientWidth;
	}
	else
	{
		if ( evt.button == 0 )
		{
			elmt.runtimeStyle.cursor = '';
			elmt.canResize = false;
		}
	}
	if ( evt.button == 1 && elmt.dragged )
	{
		var delta = evt.x - elmt.startX;
		status = delta; 
		if ( delta > elmt.target.minX )
		{
			var cellIndex = elmt.target.cellIndex;
			var table = FindParentElement(elmt, 'TABLE');
			var col = table.childNodes(0).children(cellIndex);
			col.width = Math.max(1, parseInt(col.oldWidth) + delta);

			var container = FindParentElement(table.parentElement, 'TABLE');
			var mainTable = FindChildElement(container.rows(1).cells(0), 'TABLE'); 
			this.SynchCellsWidth(table, mainTable);
		}
	}
}

function ListView.HeaderDoubleClick(elmt)
{
	if ( elmt.target && elmt.canResize )
	{
		var headerWidth = elmt.target.childNodes[0].offsetWidth + 2;
		// status = headerWidth;
		var cellIndex = elmt.target.cellIndex;
		var table = FindParentElement(elmt, 'TABLE');
		var col = table.childNodes(0).children(cellIndex);
		var textIndent = 2 * 2;
		col.width = headerWidth + textIndent;

		var container = FindParentElement(table.parentElement, 'TABLE');
		var mainTable = FindChildElement(container.rows(1).cells(0), 'TABLE'); 
		this.SynchCellsWidth(table, mainTable);
	}
}

function ListView.HeaderMoveDown(elmt)
{
	var evt = elmt.document.parentWindow.event;
	var srcElmt = evt.srcElement;
	if ( srcElmt != elmt )
	{
		return;
	}
	if ( elmt.canResize )
	{
		elmt.setCapture(false);
		elmt.startX = evt.x;
		elmt.dragged = true;
		var table = FindParentElement(elmt, 'TABLE');
		var cellIndex = elmt.target.cellIndex; 
		var col = table.childNodes(0).children(cellIndex);
		col.oldWidth = col.width;
	}
}

function ListView.HeaderMoveUp(elmt)
{
	var evt = elmt.document.parentWindow.event;
	if ( elmt.canResize )
	{
		document.releaseCapture();
		elmt.startX = NaN;
		elmt.dragged = false;
	}
}

function ListView.RowMouseOver(elmt)
{
	if ( !elmt.isSelected )
	{
		with(elmt.runtimeStyle)
		{
			var row = elmt.Object;
			color = row.Style('ActiveForeColor');
			backgroundColor = row.Style('ActiveBackColor');
		}
	}
}

function ListView.RowMouseOut(elmt)
{
	if ( !elmt.isSelected )
	{
		with(elmt.runtimeStyle)
		{
			if ( elmt.isChecked )
			{
				var row = elmt.Object;
				color = row.Style('CheckedForeColor');
				// backgroundColor = row.Style('CheckedBackColor');
				backgroundColor = '';
			}
			else
			{
				color = '';
				backgroundColor = '';
			}
		}
	}
}

function ListView.RowClick(elmt)
{
	elmt.isSelected = true;
	with(elmt.runtimeStyle)
	{
		var row = elmt.Object;
		color = row.Style('SelectedForeColor');
		var backColor = row.Style('SelectedBackColor');
		backgroundColor = backColor;
		for ( var i=0 ; i < elmt.cells.length ; ++i )
		{
			var cell = elmt.cells(i);
			cell.runtimeStyle.borderRightColor = backColor;
		}
	}
	var table = FindParentElement(elmt, 'TABLE');
	if ( table.selectedRow && table.selectedRow != elmt )
	{
		table.selectedRow.isSelected = false;
		with(table.selectedRow.runtimeStyle)
		{
			if ( table.selectedRow.isChecked )
			{
				var row = table.selectedRow.Object;
				color = row.Style('CheckedForeColor');
				// backgroundColor = row.Style('CheckedBackColor');
				backgroundColor = '';
			}
			else
			{
				color = '';
				backgroundColor = '';
			}
			for ( var i=0 ; i < table.selectedRow.cells.length ; ++i )
			{
				var cell = table.selectedRow.cells(i);
				cell.runtimeStyle.borderRightColor = '';
			}
		}
	}
	table.selectedRow = elmt;

	var mainGrid = table.parentElement;
	var gridTop = mainGrid.getBoundingClientRect().top;
	var gridHeight = mainGrid.clientHeight;
	var rowTop = elmt.getBoundingClientRect().top;
	var rowHeight = elmt.clientHeight;

	if ( gridHeight > rowHeight )
	{
		var curScrollTop = parseInt(mainGrid.scrollTop);
		if ( gridTop > rowTop )
		{
			mainGrid.scrollTop = curScrollTop - (gridTop-rowTop);
		}
		else
		{
			if ( gridTop+gridHeight < rowTop+rowHeight )
			{
				var offset = (rowTop+rowHeight) - (gridTop+gridHeight);
				mainGrid.scrollTop = curScrollTop + offset + 1;
			}
		}
	}
}

function ListView.DataViewKeyDown(elmt)
{
	var keyCode = event.keyCode;
	var bHandled = false;
	switch(keyCode)
	{
		case 27 : // Esc
		{
			if ( elmt.selectedRow )
			{
				elmt.selectedRow.isSelected = false;
				with(elmt.selectedRow.runtimeStyle)
				{
					color = '';
					backgroundColor = '';
					for ( var i=0 ; i < elmt.selectedRow.cells.length ; ++i )
					{
						var cell = elmt.selectedRow.cells(i);
						cell.runtimeStyle.borderRightColor = '';
					}
				}
				elmt.selectedRow = null;
				bHandled = true;
			}
			break;
		}
		case 32 : // Space
		{
			if ( elmt.selectedRow )
			{
				var row = elmt.selectedRow;
				var chkb = FindChildElement(row.cells(0), 'INPUT');
				if ( chkb )
				{
					chkb.checked = !chkb.checked;
					this.CheckRow(chkb);
					bHandled = true;
				}
			}
			break;
		}
		case 38 : // Up
		case 40 : // Down
		{
			if ( elmt.selectedRow )
			{
				var row = elmt.selectedRow;
				var newRow = null;
				if ( keyCode == 38 && row.previousSibling )
				{
					newRow = row.previousSibling;
				}
				if ( keyCode == 40 && row.nextSibling )
				{
					newRow = row.nextSibling;
				}
				if ( newRow )
				{
					this.RowClick(newRow);
					bHandled = true;
				}
			}
			break;
		}
	}
	if ( bHandled )
	{
		event.cancelBubble = true;
		event.returnValue = false;
	}
}

function ListView.CheckRow(chkb, isChekced)
{
	// status = chkb.checked;
	if ( isChekced == undefined )
	{
		chkb.checked = chkb.checked;
	}
	else
	{
		chkb.checked = isChekced;
	}
	var checkedRow = FindParentElement(chkb, 'TR');
	checkedRow.isChecked = chkb.checked;
	if ( !checkedRow.isSelected )
	{
		with(checkedRow.runtimeStyle)
		{
			if ( chkb.checked )
			{
				var row = checkedRow.Object;
				color = row.Style('CheckedForeColor');
				// backgroundColor = row.Style('CheckedBackColor');
			}
			else
			{
				color = '';
				backgroundColor = '';
			}
		}
	}
	// call by onclick event
	if ( isChekced == undefined )
	{
		var bAllChecked = true;
		var bAllUnchecked = false;
		var tblGrid = FindParentElement(checkedRow, 'TABLE');
		for ( var i=0 ; i < tblGrid.rows.length ; ++i )
		{
			var checked = tblGrid.rows(i).isChecked == true;
			bAllChecked &= checked;
			bAllUnchecked |= checked;
		}
		var tbl = FindParentElement(tblGrid.parentElement, 'TABLE');
		var tblColumn = FindChildElement(tbl.rows(0), 'TABLE');
		var chkbAll = tblColumn.rows(0).cells(0).children(0);
		chkbAll.checked = true;
		chkbAll.indeterminate = false;
		if ( bAllChecked )
		{
			chkbAll.checked = bAllChecked;
		}
		else if ( !bAllUnchecked )
		{
			chkbAll.checked = bAllUnchecked;
		}
		else
		{
			chkbAll.indeterminate = true;
		}
	}
}

function ListView.SignCheckStatus(chkb)
{
	var colPanel = FindParentElement(chkb, 'DIV');
	var tbl = FindParentElement(colPanel, 'TABLE');
	var tblGrid = FindChildElement(tbl.rows(1), 'TABLE');
	for ( var i=0 ; i < tblGrid.rows.length ; ++i )
	{
		var chkbCell = tblGrid.rows(i).cells(0);
		var chkbs = chkbCell.all.tags('INPUT');
		if ( chkbs.length == 1 && chkbs[0].type == 'checkbox' )
		{
			this.CheckRow(chkbs[0], chkb.checked);
		}
	}
}