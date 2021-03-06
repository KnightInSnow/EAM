function Calendar() {}

Calendar.m_ActivePicker = null;
Calendar.m_CurrentDate = null;
Calendar.m_IsRendered = false;
Calendar.m_Calendar = null;

function Calendar.Attributes() {}

Calendar.Attributes.m_IsCloseOnClick = true
Calendar.Attributes.m_IsSynchPicker = false

function Calendar.Styles() {}

Calendar.Styles.m_OuterBorderColor = '#222222';
Calendar.Styles.m_InnerBorderColor = '#C0C0C0';
Calendar.Styles.m_NormalForeColor = 'black';
Calendar.Styles.m_NormalBackColor = 'white';
Calendar.Styles.m_DateForeColor = 'blue';
Calendar.Styles.m_DateBackColor = '#728DB7';
Calendar.Styles.m_ActiveForeColor = '';
Calendar.Styles.m_ActiveBackColor = '#728DB7';
Calendar.Styles.m_HolidayForeColor = 'red';
Calendar.Styles.m_HolidayBackColor = '#EFF3FF';
Calendar.Styles.m_WeekForeColor = 'black';
Calendar.Styles.m_WeekBackColor = '#EBF1ED';

function Calendar.Initialize(picker)
{
	if ( picker && picker.tagName == 'INPUT' )
	{
		this.m_ActivePicker = picker;
	}
	this.ParseDate(picker.value);
	if ( !this.m_IsRendered )
	{
		this.Render();
		this.m_IsRendered = true;
	}
	this.ApplyCurrentDate();
	this.ShowCalendar();
}

function Calendar.ShowCalendar()
{
	this.m_Calendar.show(0, 0, 1, 1);
	var calendar = this.m_Calendar.document.body.children(0);
	var h = calendar.clientHeight + 2;
	calendar.width = calendar.rows(2).clientHeight*7;
//	Edit 2 to 50
	var w = calendar.clientWidth + 90;
	var x = 0;
	var y = this.m_ActivePicker.offsetHeight;
	this.HideSelects(calendar);
	this.m_Calendar.show(x, y, w, h, this.m_ActivePicker);
}

function Calendar.ParseDate(dateString)
{
	this.m_CurrentDate = null;
	if ( dateString )
	{
		var pattern = /^[^\d]*([\d]{2,4})[^\d](\d{1,2})[^\d](\d{1,2})[^\d]*$/;
		var parts = dateString.match(pattern);
		if ( parts && parts.length == 4 )
		{
			try
			{
				this.m_CurrentDate = new Date(parts[1], parts[2]-1, parts[3]);
			}
			catch(e){}		
		}
	}
	if ( !this.m_CurrentDate )
	{
		this.m_CurrentDate = new Date();
	}
	return this.m_CurrentDate;
}

function Calendar.Render()
{
	var dc = document.createElement;
	var tbl = dc('TABLE');
	tbl.border = 1;
	tbl.borderColor = this.Styles.m_InnerBorderColor;
	tbl.cellSpacing = 0;
	tbl.cellPadding = 0;	
	tbl.style.cursor = 'default';
	tbl.style.borderCollapse = 'collapse';
	tbl.style.width = '100%';
	tbl.style.font = '14px Arial';
	tbl.style.border = 'solid 1px ' + this.Styles.m_OuterBorderColor;
	
	var tbody = dc('TBODY');
	tbl.appendChild(tbody);
	var trDate = dc('TR');
	tbody.appendChild(trDate);
	var tdPrevious = dc('TD');
	tdPrevious.align = 'center';
	tdPrevious.style.height = '22px';
	trDate.appendChild(tdPrevious);
	tdPrevious.innerText = 3;
	tdPrevious.ActType = 'PrevMonth';
	tdPrevious.title = L_PrevMonth;
	tdPrevious.style.cursor = 'default';	
	tdPrevious.style.fontFamily = 'webdings';
	
	var tdYear = dc('TD');
	tdYear.colSpan = 3;
	tdYear.align = 'center';
	trDate.appendChild(tdYear);
	tdYear.innerHTML = '2005' + L_Year;
	tdYear.style.cursor = 'hand';
	tdYear.ActType = 'SelectYear';
	tdYear.style.borderRight = 'none';
	
	var tdMonth = dc('TD');
	tdMonth.colSpan = 2;
	tdMonth.align = 'center';
	trDate.appendChild(tdMonth);
	tdMonth.innerHTML = '08' + L_Month;
	tdMonth.ActType = 'SelectMonth';
	tdMonth.style.cursor = 'hand';
	tdMonth.style.borderLeft = 'none';
	
	var tdNext = dc('TD');
	trDate.appendChild(tdNext);
	tdNext.innerText = 4;
	tdNext.align = 'center';
	tdNext.style.cursor = 'default';
	tdNext.ActType = 'NextMonth';
	tdNext.title = L_NextMonth;
	tdNext.style.fontFamily = 'webdings';
	
	var trWeek = dc('TR');
	trWeek.style.cursor = 'default';
	tbody.appendChild(trWeek);
	trWeek.style.color = '#FFF';
	trWeek.style.backgroundColor = '#728DB7';

//	trWeek.style.color = this.Styles.m_WeekForeColor;
//	trWeek.style.backgroundColor = this.Styles.m_WeekBackColor;
	for ( var i=0 ; i < 7 ; ++i )
	{
		var tdWeek = dc('TD');
		tdWeek.align = 'center';
		tdWeek.style.height = '22px';
		trWeek.appendChild(tdWeek);
	}
	trWeek.cells(0).innerHTML = L_Sunday;
	trWeek.cells(0).title = L_SundayTip;
	trWeek.cells(1).innerHTML = L_Monday;
	trWeek.cells(1).title = L_MondayTip;
	trWeek.cells(2).innerHTML = L_Tuesday;
	trWeek.cells(2).title = L_TuesdayTip;
	trWeek.cells(3).innerHTML = L_Wednesday;
	trWeek.cells(3).title = L_WednesdayTip;
	trWeek.cells(4).innerHTML = L_Thursday;
	trWeek.cells(4).title = L_TuesdayTip;
	trWeek.cells(5).innerHTML = L_Friday;
	trWeek.cells(5).title = L_FridayTip;
	trWeek.cells(6).innerHTML = L_Saturday;
	trWeek.cells(6).title = L_SaturdayTip;

	for ( var m=0 ; m < 6 ; ++m )
	{
		var tr = dc('TR');
		for ( var n=0 ; n < 7 ; ++n )
		{
			var td = dc('TD');
			td.style.height = '22px';
			td.align = 'center';
			tr.appendChild(td);
		}
		tbody.appendChild(tr);
	}
	
	var tr = dc('TR');
	var td = dc('TD');
	td.colSpan = 7;
	td.style.height = '28px';
	td.style.padding = '0 3px 0 3px';
	tr.appendChild(td);
	tbody.appendChild(tr);
	var tblButtons = dc('TABLE');
	tblButtons.border = 0;
	tblButtons.cellSpacing = 0;
	tblButtons.cellPadding = 0;
	tblButtons.width = '100%';
	td.appendChild(tblButtons);
	
	var buttonHeight = '21px';
	var horizontalPadding = 2;
	var tbody2 = dc('TBODY');
	tblButtons.appendChild(tbody2);
	var trButtons = dc('TR');
	tbody2.appendChild(trButtons);
	var tdBackward = dc('TD');
	var btnYearBack = dc('BUTTON');
	btnYearBack.style.height = buttonHeight;
	btnYearBack.style.paddingLeft = horizontalPadding;
	btnYearBack.style.paddingRight = horizontalPadding;
	btnYearBack.style.borderStyle = 'groove';
	btnYearBack.style.font = '12px Arial';	
	btnYearBack.innerText = '<<';
	btnYearBack.style.backgroundColor = '#DDE3ED';
	btnYearBack.ActType = 'PrevYear';
	btnYearBack.title = L_PrevYear;
	tdBackward.appendChild(btnYearBack);
	var btnMonthBack = dc('BUTTON');
	btnMonthBack.style.height = buttonHeight;
	btnMonthBack.style.paddingLeft = horizontalPadding;
	btnMonthBack.style.paddingRight = horizontalPadding;
	btnMonthBack.style.borderStyle = 'groove';
	btnMonthBack.style.font = '12px Arial';
	btnMonthBack.innerText = '<';
	btnMonthBack.style.backgroundColor = '#DDE3ED';
	btnMonthBack.ActType = 'PrevMonth';
	btnMonthBack.title = L_PrevMonth;
	tdBackward.appendChild(btnMonthBack);
	trButtons.appendChild(tdBackward);
	
	var tdToday = dc('TD');
	tdToday.align = 'center';
	var btnToday = dc('BUTTON');
	btnToday.style.height = buttonHeight;
	btnToday.style.borderStyle = 'groove';
	btnToday.style.font = '12px Arial';
	btnToday.innerText = L_Today;
	btnToday.style.backgroundColor = '#DDE3ED';
	btnToday.ActType = 'Today';
	tdToday.appendChild(btnToday);
	trButtons.appendChild(tdToday);
	
	var tdForeward = dc('TD');
	tdForeward.align = 'right';
	var btnMonthFore = dc('BUTTON');
	btnMonthFore.style.height = buttonHeight;
	btnMonthFore.style.paddingLeft = horizontalPadding;
	btnMonthFore.style.paddingRight = horizontalPadding;
	btnMonthFore.style.borderStyle = 'groove';
	btnMonthFore.style.font = '12px Arial';
	btnMonthFore.innerText = '>';
	btnMonthFore.style.backgroundColor = '#DDE3ED';
	btnMonthFore.ActType = 'NextMonth';
	btnMonthFore.title = L_NextMonth;
	tdForeward.appendChild(btnMonthFore);
	var btnYearFore = dc('BUTTON');
	btnYearFore.style.height = buttonHeight;
	btnYearFore.style.paddingLeft = horizontalPadding;
	btnYearFore.style.paddingRight = horizontalPadding;
	btnYearFore.style.borderStyle = 'groove';
	btnYearFore.style.font = '12px Arial';
	btnYearFore.innerText = '>>';
    btnYearFore.style.backgroundColor = '#DDE3ED';
	btnYearFore.ActType = 'NextYear';
	btnYearFore.title = L_NextYear;
	tdForeward.appendChild(btnYearFore);
	trButtons.appendChild(tdForeward);
	
	if ( !this.m_Calendar )
	{
		this.m_Calendar = window.createPopup();
	}
	this.m_Calendar.document.body.innerHTML = tbl.outerHTML;
	var calendar = this.m_Calendar.document.body.children(0);
	calendar.parentElement.onselectstart = function()
	{
		return false;
	};
	calendar.onclick = function()
	{
		Calendar.OnClick(this);
	};
	calendar.onmouseover = function()
	{
		Calendar.OnMouseOver(this);
	};
	calendar.onmouseout = function()
	{
		Calendar.OnMouseOut(this);
	};
}

function Calendar.Format(format, date)
{
	if ( !date )
	{
		date = this.m_CurrentDate;
	}
	if ( date )
	{
		var output = format;	
		var year = date.getFullYear();
		if ( output.indexOf('yyyy') != -1 )
		{
			output = output.replace('yyyy', year.toString(10));
		}
		if ( output.indexOf('yy') != -1 )
		{
			output = output.replace('yy', year.toString(10).substr(2, 2))
		}
		var month = date.getMonth()+1;
		if ( output.indexOf('MM') != -1 )
		{
			var strMonth = '0' + month.toString(10);
			output = output.replace('MM', strMonth.substr(strMonth.length-2, 2));
		}
		if ( output.indexOf('M') != -1 )
		{
			output = output.replace('M', month);
		}
		var day = date.getDate();
		if ( output.indexOf('dd') != -1 )
		{
			var strDay = '0' + day.toString(10);
			output = output.replace('dd', strDay.substr(strDay.length-2, 2));
		}
		if ( output.indexOf('d') != -1 )
		{
			output = output.replace('d', day);
		}
		return output;
	}
}

function Calendar.SetPickerDate()
{
	var formated = this.Format('yyyy-MM-dd');
	if ( this.m_ActivePicker.value != formated )
	{
		this.m_ActivePicker.value = formated;
		this.m_ActivePicker.Date = this.m_CurrentDate;
	}
}

function Calendar.ClearRuntimeStyle()
{
	if ( this.m_Calendar )
	{
		var elements = this.m_Calendar.document.all;
		for ( var i=0 ; i < elements.length ; ++i )
		{
			elements[i].runtimeStyle.color = '';
			elements[i].runtimeStyle.backgroundColor = '';
		}
	}
}

function Calendar.ApplyCurrentDate()
{
	this.ClearRuntimeStyle()
	var calendar = this.m_Calendar.document.body.children(0);
	var curDate = this.m_CurrentDate;
	calendar.rows(0).cells(1).innerText = curDate.getFullYear() + L_Year;
	calendar.rows(0).cells(2).innerText = L_Months[curDate.getMonth()] + L_Month;
	var startMonth = new Date(curDate.getFullYear(), curDate.getMonth(), 1);
	var startDay = startMonth.getDay();
	
	var prevMonth = startMonth;
	for ( var i=0 ; i < startDay ; ++i )
	{
		var index = startDay-i-1;
		prevMonth = new Date(prevMonth.getTime()-1);
		var cell = calendar.rows(2).cells(index);
		var date = prevMonth.getDate();
		prevMonth = new Date(prevMonth.getFullYear(), prevMonth.getMonth(), date);
		cell.Date = prevMonth;
		cell.innerText = date;
		if ( index==0 || index==6 )
		{
			cell.style.color = this.Styles.m_HolidayForeColor;
			cell.style.backgroundColor = this.Styles.m_HolidayBackColor;
		}
		else
		{
			cell.style.color = this.Styles.m_NormalForeColor;
			cell.style.backgroundColor = this.Styles.m_NormalBackColor;
		}
		cell.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=20)';
	}
	var index;
	var dateCount = 0;
	var nextMonth = new Date(startMonth.getFullYear(), startMonth.getMonth(), 32);
	var endMonth = new Date(nextMonth.getFullYear(), nextMonth.getMonth(), 1);
	endMonth = new Date(endMonth.getTime()-1);
	for ( var j=0 ; j <= endMonth.getDate() ; ++j )
	{
		index = j+startDay;
		var cell = calendar.rows(2+parseInt(index/7, 10)).cells(index%7);
		cell.innerText = ++dateCount;
		cell.Date = new Date(curDate.getFullYear(), curDate.getMonth(), dateCount);
		if ( index%7==0 || index%7 == 6 )
		{
			cell.style.color = this.Styles.m_HolidayForeColor;
			cell.style.backgroundColor = this.Styles.m_HolidayBackColor;
		}
		else
		{
			cell.style.color = this.Styles.m_NormalForeColor;
			cell.style.backgroundColor = this.Styles.m_NormalBackColor;
		}
		if ( j+1 == curDate.getDate() )
		{
			cell.style.color = this.Styles.m_DateForeColor;
			cell.style.backgroundColor = this.Styles.m_DateBackColor;
		}
		cell.style.filter = '';
	}
	
	dateCount = 0;
	for ( var k=index ; k < 6*7 ; ++k )
	{
		var cell = calendar.rows(2+parseInt(k/7, 10)).cells(k%7);
		cell.innerText = ++dateCount;
		cell.Date = new Date(nextMonth.getFullYear(), nextMonth.getMonth(), dateCount);
		if ( k%7==0 || k%7 == 6 )
		{
			cell.style.color = this.Styles.m_HolidayForeColor;
			cell.style.backgroundColor = this.Styles.m_HolidayBackColor;
		}
		else
		{
			cell.style.color = this.Styles.m_NormalForeColor;
			cell.style.backgroundColor = this.Styles.m_NormalBackColor;
		}
		cell.style.filter = 'progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=20)';
	}
}

function Calendar.HideSelects(elmt)
{
	var row0 = elmt.document.body.children(0).rows(0);
	if ( row0.cells(1).List )
	{
		row0.cells(1).List.style.visibility = 'hidden';
	}
	if ( row0.cells(2).List )
	{
		row0.cells(2).List.style.visibility = 'hidden';
	}
}

function Calendar.OnClick(elmt)
{
	if ( elmt )
	{
		this.HideSelects(elmt);
		var evt = elmt.document.parentWindow.event;
		var srcElmt = evt.srcElement;
		if ( srcElmt && srcElmt.Date )
		{
			this.m_CurrentDate = srcElmt.Date;
			this.ApplyCurrentDate();
			this.SetPickerDate();
			if ( this.Attributes.m_IsCloseOnClick )
			{
				this.m_Calendar.hide();
			}
		}
		else if ( srcElmt && srcElmt.ActType )
		{
			var curDate = this.m_CurrentDate;
			switch(srcElmt.ActType)
			{
				case 'PrevMonth' :
				{
					this.m_CurrentDate = new Date(curDate.getFullYear(),
						curDate.getMonth()-1, curDate.getDate());
					break;
				}
				case 'NextMonth' :
				{
					this.m_CurrentDate = new Date(curDate.getFullYear(),
						curDate.getMonth()+1, curDate.getDate());
					break;
				}
				case 'PrevYear' :
				{
					this.m_CurrentDate = new Date(curDate.getFullYear()-1,
						curDate.getMonth(), curDate.getDate());
					break;
				}
				case 'NextYear' :
				{
					this.m_CurrentDate = new Date(curDate.getFullYear()+1,
						curDate.getMonth(), curDate.getDate());
					break;
				}
				case 'SelectYear' :
				{
					var start = Math.min(1999, curDate.getFullYear());
					var end = Math.max(2010, curDate.getFullYear());
					if ( end - start > 500 )
					{
						if ( start < 1600 )
						{
							end = start + 500;
						}
						else
						{
							start = end - 500;
						}
					}
					srcElmt.List = this.GenerateList(start, end, L_Year);
					srcElmt.document.body.appendChild(srcElmt.List);
					var list = srcElmt.List;
					var rect = GetAbsoluteLocation(srcElmt);
					list.ActType = 'YearPicker';
					list.style.top = rect.absoluteTop-1;
					list.style.left = rect.absoluteLeft;
					list.style.width = srcElmt.offsetWidth;
					list.style.visibility = 'visible';
					list.selectedIndex = curDate.getFullYear()-start;
					// list.style.clip = 'rect(0px, 1px, 20px, 30px)';
					break;
				}
				case 'SelectMonth' :
				{
					if ( !srcElmt.List )
					{
						srcElmt.List = this.GenerateMonthList(L_Month);
						srcElmt.document.body.appendChild(srcElmt.List);
						srcElmt.List.ActType = 'MonthPicker';
					}
					var list = srcElmt.List;
					var rect = GetAbsoluteLocation(srcElmt);
					list.style.top = rect.absoluteTop-1;
					list.style.left = rect.absoluteLeft;
					list.style.width = srcElmt.offsetWidth;
					list.style.visibility = 'visible';
					list.selectedIndex = curDate.getMonth();
					// list.style.clip = 'rect(0px, 1px, 20px, 30px)';
					break;
				}
				case 'Today' :
				{
					this.m_CurrentDate = new Date();
					break;
				}
			}
			this.ApplyCurrentDate();
			if ( this.Attributes.m_IsSynchPicker )
			{
				this.SetPickerDate();
			}
		}		
	}
}

function Calendar.GenerateList(start, end, unit)
{
	var dc = this.m_Calendar.document.createElement;
	var slt = dc('SELECT');
	slt.style.position = 'absolute';
	var count = 0;
	for ( var i=start ; i <= end ; ++i )
	{
		var option = dc('OPTION');
		option.value = i;
		option.text = i + unit;
		slt.options.add(option);
		count++;
	}
	slt.onchange = function()
	{
		Calendar.OnChange(this);
	};
	return slt;
}

function Calendar.GenerateMonthList(unit)
{
	var dc = this.m_Calendar.document.createElement;
	var slt = dc('SELECT');
	slt.style.position = 'absolute';
	var count = 0;
	for ( var i=1 ; i <= L_Months.length ; ++i )
	{
		var option = dc('OPTION');
		option.value = i;
		option.text = L_Months[i-1] + unit;
		slt.options.add(option);
		count++;
	}
	slt.onchange = function()
	{
		Calendar.OnChange(this);
	};
	return slt;
}

function Calendar.OnMouseOver(elmt)
{
	if ( elmt )
	{
		var evt = elmt.document.parentWindow.event;
		var srcElmt = evt.srcElement;
		if ( srcElmt && srcElmt.Date )
		{
			srcElmt.runtimeStyle.backgroundColor = this.Styles.m_ActiveBackColor;
		}
	}
}

function Calendar.OnMouseOut(elmt)
{
	if ( elmt )
	{
		var evt = elmt.document.parentWindow.event;
		var srcElmt = evt.srcElement;
		if ( srcElmt && srcElmt.Date )
		{
			srcElmt.runtimeStyle.backgroundColor = '';
		}
	}
}

function Calendar.OnChange(list)
{
	var curDate = this.m_CurrentDate;
	if ( list.ActType == 'YearPicker' )
	{
		var year = parseInt(list.options[list.selectedIndex].value, 10);
		this.m_CurrentDate = new Date(year, curDate.getMonth(), curDate.getDate());
	}
	else if ( list.ActType == 'MonthPicker' )
	{
		var month = parseInt(list.options[list.selectedIndex].value, 10)-1;
		this.m_CurrentDate = new Date(curDate.getFullYear(), month, curDate.getDate());
	}
	this.ApplyCurrentDate();
}