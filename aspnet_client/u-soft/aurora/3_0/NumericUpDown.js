/***********************************************************
NumericUpDown class created by JScript

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 1.0
Created: 2005.08.21 12:51
Last Updated: 2005.09.11 16:02

History:
	1. The code created at 2005.08.21
	2. Basic functions was completed. [2005.08.21]
	3. Fix bug: Replace selected content occur limit overflow. [2005.09.11]

***********************************************************/

function NumericUpDown() {}

function NumericUpDown.Initialize(control, value)
{
	var input = control.all.tags('INPUT')[0];
	input.onkeydown = function()
	{
		NumericUpDown.OnKeyDown(this);
	};
	input.onkeyup = function()
	{
		NumericUpDown.OnKeyUp(this);
	};
	input.onkeypress = function()
	{
		return NumericUpDown.OnKeyPress(this);
	};
	input.onmousewheel = function()
	{
		var evt = input.document.parentWindow.event;
		var value = parseInt(input.value, 10);
		if ( isNaN(value) )
		{
			input.value = '0';
			return;
		}
		if ( evt.wheelDelta >= 120 )
		{
			NumericUpDown.DoUp(input);
		}
		else if ( event.wheelDelta <= -120 )
		{
			NumericUpDown.DoDown(input);
		}
	};
	input.onblur = function()
	{
		if ( this.value.length == 0 )
		{
			this.value = this.MinValue;
		}
		else
		{
			NumericUpDown.SetValue(FindParentElement(this, 'SPAN'), this.value);
		}
	};
	input.onpaste = function()
	{
		return false;
	};
	input.style.imeMode = 'disabled';
	
	if ( !value === false )
	{
		input.value = parseInt(value, 10);
	}

	var minValue = parseInt(control.MinValue, 10);
	var maxValue = parseInt(control.MaxValue, 10);
	var scaleValue = parseInt(control.ScaleValue, 10);
	input.MinValue = isNaN(minValue) ? Number.MIN_VALUE : minValue;
	input.MaxValue = isNaN(maxValue) ? Number.MAX_VALUE : maxValue;
	input.ScaleValue = isNaN(scaleValue) ? 1 : scaleValue;
	
	var tr = FindChildElement(control, 'TR');
	var up = tr.cells(1).children(0);
	var down = tr.cells(1).children(1);
	up.onmousedown = function()
	{
		NumericUpDown.UpArrowMouseDown(this);
	};
	up.onmouseup = function()
	{
		NumericUpDown.UpArrowMouseUp(this);
	};
	down.onmousedown = function()
	{
		NumericUpDown.DownArrowMouseDown(this);
	};
	down.onmouseup = function()
	{
		NumericUpDown.DownArrowMouseUp(this);
	};
	if ( control.disabled )
	{
		this.Disable(control);
	}
}

function NumericUpDown.OnKeyDown(input)
{
	var evt = input.document.parentWindow.event;
	var value = parseInt(input.value, 10);
	if ( isNaN(value) && input.value )
	{
		input.value = '';
		evt.bubbleCancel = true;
		evt.returnValue = false;
		return;
	}
	switch(evt.keyCode)
	{
		case 38 :
		{
			this.DoUp(input);
			break;
		}
		case 40 :
		{
			this.DoDown(input);
			break;
		}
	}
}

function NumericUpDown.OnKeyUp(input)
{
	var evt = input.document.parentWindow.event;
	var value = parseInt(input.value, 10);
	if ( isNaN(value) && !input.value )
	{
		input.value = '';
		evt.bubbleCancel = true;
		evt.returnValue = false;
		return;
	}
	if ( input.value != value )
	{
		input.value = value;
	}
	if ( value > input.MaxValue || value < input.MinValue )
	{
		input.runtimeStyle.color = 'red';
	}
	else
	{
		input.runtimeStyle.color = '';
	}
}

function NumericUpDown.OnKeyPress(elmt)
{
	var sltn = document.selection.createRange();
	var selectedText = sltn.text;
	var char = String.fromCharCode(event.keyCode);
	var srcRange = elmt.createTextRange();
	sltn.setEndPoint("StartToStart", srcRange);
	var startPart = sltn.text;
	if ( selectedText )
	{
		startPart = sltn.text.substr(0, sltn.text.length-selectedText.length);
	}
	var num = startPart + char + srcRange.text.substr(sltn.text.length);
	if ( /^\d*$/.test(num) && ( num.length == 1 
	|| ( num.length > 1 && num.charAt(0) != 0 ) ) )
	{
		num = parseInt(num, 10);
		// event.returnValue = (elmt.MaxValue >= num && elmt.MinValue <= num);
		event.returnValue = elmt.MaxValue >= num;
	}
	else
	{
		event.returnValue = false;
	}
	return event.returnValue;
}

function NumericUpDown.UpArrowMouseDown(elmt)
{
	if ( !elmt.disabled )
	{
		elmt.runtimeStyle.backgroundColor = '#ABC1F4';
		var tr = FindParentElement(elmt, 'TR');
		var input = FindChildElement(tr, 'INPUT');
		var value = parseInt(input.value, 10);
		if ( isNaN(value) )
		{
			input.value = '0';
			return;
		}
		this.DoUp(input);
	}
}

function NumericUpDown.UpArrowMouseUp(elmt)
{
	if ( !elmt.disabled )
	{
		elmt.runtimeStyle.backgroundColor = '';
	}
}

function NumericUpDown.DownArrowMouseDown(elmt)
{
	if ( !elmt.disabled )
	{
		elmt.runtimeStyle.backgroundColor = '#ABC1F4';
		var tr = FindParentElement(elmt, 'TR');
		var input = FindChildElement(tr, 'INPUT');
		var value = parseInt(input.value, 10);
		if ( isNaN(value) )
		{
			input.value = '0';
			return;
		}
		this.DoDown(input);
	}
}

function NumericUpDown.DoUp(input)
{
	if ( input.value < input.MaxValue )
	{
		var value = parseInt(input.value, 10);
		if ( !isNaN(value) )
		{
			input.value = parseInt(input.value, 10) + input.ScaleValue;
		}
		else
		{
			input.value = 0;
		}
	}
	this.SetValue(FindParentElement(input, 'SPAN'), input.value);
}

function NumericUpDown.DoDown(input)
{
	if ( input.value > input.MinValue )
	{
		var value = parseInt(input.value, 10);
		if ( !isNaN(value) )
		{
			input.value = parseInt(input.value, 10) - input.ScaleValue;
		}
		else
		{
			input.value = 0;
		}
	}
	this.SetValue(FindParentElement(input, 'SPAN'), input.value);
}

function NumericUpDown.DownArrowMouseUp(elmt)
{
	if ( !elmt.disabled )
	{
		elmt.runtimeStyle.backgroundColor = '';
	}
}

function NumericUpDown.GetValue(control)
{
	var input = FindChildElement(control, 'INPUT');
	if ( input.value.length > 0 )
	{
		return parseInt(input.value, 10);
	}
	else
	{
		return 0;
	}
}

function NumericUpDown.SetValue(control, value)
{
	var input = FindChildElement(control, 'INPUT');
	input.value = value = Math.min(Math.max(input.MinValue, value), input.MaxValue);
	if ( value > input.MaxValue || value < input.MinValue )
	{
		input.runtimeStyle.color = 'red';
	}
	else
	{
		input.runtimeStyle.color = '';
	}
}

function NumericUpDown.Disable(control)
{
	var border = '#C0C0C0';
	var background = '#D4D4D4';
	this.SetColors(control, border, background);
	var imgs = control.all.tags('IMG');
	for ( var i=0 ; i < imgs.length ; ++i )
	{
		imgs[i].runtimeStyle.filter = 'gray(1)';
	}
	var input = control.all.tags('INPUT')[0];
	input.readOnly = true;
	
	for ( var i=0 ; i < control.all.length ; ++i )
	{
		control.all[i].disabled = true;
	}
	control.disabled = true;
}

function NumericUpDown.Enable(control)
{
	this.SetColors(control, '', '');
	var imgs = control.all.tags('IMG');
	for ( var i=0 ; i < imgs.length ; ++i )
	{
		imgs[i].runtimeStyle.filter = '';
	}
	var input = control.all.tags('INPUT')[0];
	input.readOnly = false;
	
	for ( var i=0 ; i < control.all.length ; ++i )
	{
		control.all[i].disabled = false;
	}
	control.disabled = false;
}

function NumericUpDown.SetColors(control, border, background)
{
	var spans = control.all.tags('SPAN');
	for ( var i=0 ; i < spans.length ; ++i )
	{
		spans[i].runtimeStyle.borderColor = border;
		spans[i].runtimeStyle.backgroundColor = background;
	}
	control.runtimeStyle.borderColor = border; 
}