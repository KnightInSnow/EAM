/***********************************************************
CommonLib JScript Code Library

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 1.2
Created: 2004.11.30 22:27
Updated: 2006.02.22 11:07

History:
	1. Extend Array object, created at 2004.11.30
	2. Add StringHelper, implement StringToArray & ArrayToString methods. [2004.12.09]
	3. Implement IsEmpty, QuotEscape and QuotUnescape methods. [2004.12.10]
	4. Add GetDocumentPath() method. [2004.12.20]
	5. Add ShowMnemonics() method. [2005.01.13]
	6. Attach a prototype method to Object. [2005.02.02]
	7. Reattach Extends method to Function. [2005.02.18]
	8. Add GarbageCollector class. [2005.02.18]
	9. Attach 'Call' method to Function. [2005.02.23]
	10. Attach 'AttachEvent' metod to Object. [2005.02.25]
	11. Add __typeof__ method which used to get user type. [2005.02.28]
	12. Add StringHelper.Format Method. [2005.03.04]
	13. Add ObjectHelper static class. [2006.02.22]
	14. Add BooleanHelper static class. [2006.05.30]
	
**********************************************************/

var DEBUG_MODE = false;

var DIALOG_OPTIONS = 'dialogWidth:{0}px; dialogHeight:{1}px; help:no; resizable:no; scroll:no; status:no; center: yes;';

// Extend for prebuild Array object
Array.prototype.contains = function(obj)
{
	for ( var i=0 ; i < this.length ; ++i )
	{
		if ( this[i] == obj )
		{
			return true;
		}
	}
	return false;
};

Array.prototype.remove = function(obj)
{
	for ( var i=0 ; i < this.length ; ++i )
	{
		if ( this[i] == obj )
		{
			if ( i > this.length/2 )
			{
				for ( var j=i ; j < this.length-1 ; ++j )
				{
					this[j] = this[j+1];
				}
				this.pop();
			}
			else
			{
				for ( var j=i ; j > 0 ; --j )
				{
					this[j] = this[j-1];
				}
				this.shift();
			}
			break;
		}
	}
};

Array.prototype.clear = function()
{
	this.length = 0;
};

// StringHelper Static Class
StringHelper = function()
{
};

StringHelper.CheckName = function(str)
{
	var regex = /[\\\/\*\?\$<>\|:;,&#+=@\"]+/g;
	if ( regex.test(str) )
	{
		return true;
	}
};

StringHelper.GetByteLength = function(str)
{
	return str.replace(/[^\x00-\xff]/g, '--').length;
};

StringHelper.ArrayToString = function()
{
	if ( arguments.length == 0 )
	{
		throw new Error('Must have parameters for call me.');
	}
	var args = arguments;
	if ( args.length == 1 && __typeof__(args[0]) == 'Array' )
	{
		args = arguments[0];
		if ( args.length == 0 )
		{
			return '';
		}
	}
	var strLengthLine = '';
	var strStringLine = '';
	for ( var i=0 ; i < args.length ; i++ )
	{
		var str = '' + args[i];
		strLengthLine += ':' + str.length;
		strStringLine += str;
	}
	return strStringLine + '$' + strLengthLine.substring(1);
};

StringHelper.StringToArray = function(strStringLine)
{
	if ( strStringLine == undefined )
	{
		throw new Error(L_NullArgumentsException);
	}
	var index = strStringLine.lastIndexOf('$');
	if ( index == -1 )
	{
		if ( strStringLine.length == 0 )
		{
			return [];
		}
		else
		{
			var result = new Array(1);
			result[0] = strStringLine;
			return result;
		}
	}
	var strLengthLine = strStringLine.substring(index+1);
	var aryLength = strLengthLine.split(':');
	var list = new Array(aryLength.length);
	var start = 0;
	for ( var i=0 ; i < list.length ; ++i )
	{
		var length = parseInt(aryLength[i]);
		list[i] = strStringLine.substr(start, length);
		start += length;
	}
	return list;
};

StringHelper.ObjectToString = function(obj)
{
	var keys = ObjectHelper.GetExpandoKeys(obj);
	var ary = [];
	for ( var i=0 ; i < keys.length ; ++i )
	{
		var key = keys[i];
		var value = obj[key];
		if ( typeof value == 'undefined' )
		{
			continue;
		}
		ary.push(key);
		if ( value === null || value === true || value === false )
		{
			value = '([{' + value + '}])';
		}
		ary.push(value);
	}
	return this.ArrayToString(ary);
}

StringHelper.StringToObject = function(str)
{
	var obj = {};
	var ary = this.StringToArray(str);
	if ( ary.length%2 == 0 )
	{
		for ( var i=0 ; i < ary.length ; ++i )
		{
			var key = ary[i];
			var value = ary[++i];
			if ( value.length == 10 || value.length == 11 )
			{
				switch(value)
				{
					case '([{null}])' :	value = null; break;
					case '([{true}])' :	value = true; break;
					case '([{false}])' :	value = false; break;
				}
			}
			obj[key] = value;
		}
	}
	return obj;
};

StringHelper.IsEmpty = function(str)
{
	if ( !str || !str.length )
	{
		return true;
	}
	return str.length == 0;
};

StringHelper.HtmlEncode = function(original)
{
	if ( !document.htmlEncoder )
	{
		document.htmlEncoder = document.createElement('SPAN');
	}
	document.htmlEncoder.innerText = original;
	return document.htmlEncoder.innerHTML;
};

StringHelper.QuotEscape = function(original)
{
	return original.replace(/%/g, '%25').replace(/"/g, '%22').replace(/'/g, '%27');
};

StringHelper.QuotUnescpe = function(escaped)
{
	return escaped.replace(/%27/g, "'").replace(/%22/g, '"').replace(/%25/g, '%');
};

StringHelper.Trim = function(str)
{
	if ( str )
	{
		return str.replace(/(^\s*)|(\s*$)/g, '');
	}
	else
	{
		return str;
	}
};

StringHelper.StartTrim = function(str)
{
	if ( str )
	{
		return str.replace(/(^\s*)/g, '');
	}
	else
	{
		return str;
	}
};

StringHelper.EndTrim = function(str)
{
	if ( str )
	{
		return str.replace(/(\s*$)/g, '');
	}
	else
	{
		return str;
	}
};

StringHelper.ShowMnemonics = function(str)
{
	if ( str )
	{
		var psn = str.indexOf('&');
		if ( psn == -1 || psn == str.length-1 )
		{
			return str;
		}
		return str.substr(0, psn)+'<u>'+str.charAt(psn+1)+'</u>'+str.substr(psn+2);
	}
	else
	{
		return str;
	}
};

// StringHelper.Format('{0}, {2}, {1}', 'abc', 'def', 'ghi');
// return "abc, ghi, def".
StringHelper.Format = function(format)
{
	if ( arguments.length == 0 )
	{
		return '';
	}
	if ( arguments.length == 1 )
	{
		return String(format);
	}

	var i, strOutput = '';
	for ( i=0 ; i < format.length-1 ; )
	{
		if ( format.charAt(i) == '{' && format.charAt(i+1) != '{' )
		{
			var index = 0, indexStart = i+1, j = indexStart;
			for ( ; j <= format.length-2 ; ++j )
			{
				var ch = format.charAt(j);
				if ( ch < '0' || ch > '9' ) break;
			}
			if ( j > indexStart )
			{
				if ( format.charAt(j) == '}' && format.charAt(j+1) != '}' )
				{
					for ( var k=j-1 ; k >= indexStart ; k-- )
					{
						index += (format.charCodeAt(k)-48)*Math.pow(10, j-1-k);
					}
					var swapArg = arguments[index+1];
					if ( swapArg == null )
					{
						swapArg == '';
					}
					strOutput += swapArg;
					i += j-indexStart+2;
					continue;
				}
			}
			strOutput += format.charAt(i);
			i++;
		}
		else
		{
			if ( ( format.charAt(i) == '{' && format.charAt(i+1) == '{' )
				|| ( format.charAt(i) == '}' && format.charAt(i+1) == '}' ) )
			{
				i++;
			}
			strOutput += format.charAt(i);
			i++;
		}
	}
	strOutput += format.substr(i);
	return strOutput;
};

StringHelper.QuoteJScript = function(value)
{
	if ( StringHelper.IsEmpty(value) )
	{
		return '';
	}
	var strbQuoted = '';
	var i, position;
	i = position = 0;
	var QUOTED_CHARS= "\t\n\f\r\"'\\";
	var QUOTED_STRINGS = 
		["\\t", "\\n", "\\f", "\\r", '\\"', "\\'", "\\\\"];
	for ( ; i < value.length; ++i )
	{
		var ch = value.charAt(i);
		var index = QUOTED_CHARS.indexOf(ch);
		if ( index >= 0 )
		{
			if ( i-position >= 1 )
			{
				strbQuoted += value.substr(position, i-position);
			}
			strbQuoted += QUOTED_STRINGS[index];
			position = i + 1;
		}
	}
	if ( !strbQuoted )
	{
		return value;
	}
	if ( i-position >= 1 )
	{
		strbQuoted += value.substr(position, i-position);
	}
	return strbQuoted;
};

//////////////////////////////////////////////////////////////////////

// ObjectHelper static class
ObjectHelper = function()
{
};

ObjectHelper.GetExpandoKeys = function(obj)
{
	var keys = [];
	var __obj = new obj.constructor();
	for ( var key in obj )
	{
		if ( obj[key] != __obj[key] )
		{
			keys.push(key);
		}
	}
	return keys;
};

ObjectHelper.CreateObject = function()
{
	return new Object();
};

//////////////////////////////////////////////////////////////////////

Object.prototype.Extends = function(BaseClass)
{
	if ( arguments.length >= 6 )
	{
		throw new Error(L_Only5ParametersSupport);
	}
	var base;
	if ( arguments.length > 1 )
	{
		var arg01 = arguments[1];
		var arg02 = arguments[2];
		var arg03 = arguments[3];
		var arg04 = arguments[4];
		base = new BaseClass(arg01, arg02, arg03, arg04);
	}
	else
	{
		base = new BaseClass();
	}
	for ( var key in base )
	{
		if ( !this[key] )
		{
			this[key] = base[key];
			if ( typeof(base[key]) != 'function' && key != 'base' )
			{
				delete base[key];
			}
		}
	}
	this.base = base;
	// base.inherit = this;
};

Object.prototype.AttachEvent = function(eventName, eventHandler)
{
	if ( typeof(eventName) != 'string' || typeof(eventHandler) != 'function' )
	{
		return new Error(L_ErrorParametersType);
	}
	if ( eventName[0] != 'e' || eventName[1] != '_' )
	{
		eventName = 'e_' + eventName;
	}
	var evt = this[eventName];
	if ( typeof(evt) != 'undefined' )
	{
		if ( __typeof__(evt) == 'EventHandler' )
		{
			evt.AttachHandler(eventHandler);
		}
		else
		{
			this[eventName] = new EventHandler(this, eventName, eventHandler);
		}
	}
};

Object.prototype.GetExpandoKeys = function()
{
	var keys = [];
	var obj = new this.constructor();
	for ( var key in this )
	{
		if ( this[key] !== obj[key] )
		{
			keys.push(key);
		}
	}
	return keys;
};

//////////////////////////////////////////////////////////////////////

function BooleanHelper() {}

function BooleanHelper.Compare(valueA, valueB)
{
	return this.Parse(valueA) == this.Parse(valueB);
}

function BooleanHelper.Parse(objValue)
{
	if ( objValue instanceof Boolean )
	{
		return objValue;
	}
	else
	{
		var strValue = new String(objValue).toLowerCase();
		return strValue == 'true';
	}
}

//////////////////////////////////////////////////////////////////////

Function.prototype.Call = function(that)
{
	if ( arguments.length < 1 )
	{
		throw new Error(L_MustHaveOneParameter);
	}
	var thatBase = that;
	do
	{
		for ( var key in thatBase )
		{
			if ( thatBase[key] == arguments.callee.caller )
			{
				var target = thatBase;
				while(target[key] == target.base[key])
				{
					target = target.base;
				}
				if ( arguments.length == 1 )
				{
					return target.base[key].call(that);
				}
				else
				{
					var args = [];
					for ( var i=1 ; i < arguments.length ; ++i )
					{
						args.push(arguments[i]);
					}
					return target.base[key].apply(that, args);
				}
			}
		}
	}
	while ( thatBase = thatBase.base )
};

//////////////////////////////////////////////////////////////////////

function FindChildElement(element, tagName)
{
	var isFounded = false;
	var elements = element;
	var result = element;
	if ( element.tagName == tagName )
	{
		return element;
	}
	while(!isFounded && elements != null && result != null && result.tagName != tagName)
	{
		elements = elements.childNodes;
		for( var i=0 ; elements != null && i < elements.length ; i++ )
		{
			result = elements.item(i);
			var result2 = FindChildElement(result, tagName);
			if ( result == null || result2 == null )
			{
				continue;
			}
			if ( result.tagName == tagName || result2.tagName == tagName )
			{
				if ( result2.tagName == tagName )
				{
					result = result2;
				}
				isFounded = true;
				break;
			}
		}
	}
	if ( isFounded )
	{
		return result;
	}
	else
	{
		return null;
	}
}

function FindParentElement(element, tagName)
{
	while(element != null && element.tagName != tagName )
	{
		element = element.parentElement;
	}
	if ( element != null && element.tagName == tagName )
	{
		return element;
	}
	return null;
}

function FindParentElementEx(element, tagName)
{
	if ( element && element.tagName )
	{
		if ( element.tagName == tagName )
		{
			return element;
		}
		else
		{
			return FindParentElement(element, tagName);
		}
	}
	return null;
}

function GetAbsoluteLocation(element)
{
	if ( arguments.length != 1 || element == null )
	{
		return null;
	}
	var offsetTop = element.offsetTop;
	var offsetLeft = element.offsetLeft;
	var offsetWidth = element.offsetWidth;
	var offsetHeight = element.offsetHeight;
	while( element = element.offsetParent )
	{
		offsetTop += element.offsetTop;
		offsetLeft += element.offsetLeft;
	}
	return { absoluteTop: offsetTop, absoluteLeft: offsetLeft,
		offsetWidth: offsetWidth, offsetHeight: offsetHeight };
}

function GetAbsoluteLocationEx(element)
{
	if ( arguments.length != 1 || element == null )
	{
		return null;
	}
	var elmt = element;
	var offsetTop = elmt.offsetTop;
	var offsetLeft = elmt.offsetLeft;
	var offsetWidth = elmt.offsetWidth;
	var offsetHeight = elmt.offsetHeight;
	var firstAbsolute = null;
	while( elmt = elmt.offsetParent )
	{
		if ( !firstAbsolute && ( elmt.style.position == 'absolute' || elmt.style.position == 'relative' 
			|| ( elmt.style.overflow != 'visible' && elmt.style.overflow != '' ) ) )
		{
			break;
		}
		offsetTop += elmt.offsetTop;
		offsetLeft += elmt.offsetLeft;
	}
	return { absoluteTop: offsetTop, absoluteLeft: offsetLeft,
		offsetWidth: offsetWidth, offsetHeight: offsetHeight,
		absoluteBottom: offsetTop+offsetHeight, 
		absoluteRight: offsetLeft + offsetWidth };
}

// 鍒ゆ柇element鏄笉鏄粰瀹氱被鍨媡agName鐨凥tml Element
function IsElement(element, tagName)
{
	if ( element == null || tagName == null )
	{
		return false;
	}
	if ( typeof(element.tagName) == 'undefined' )
	{
		return false;
	}
	return element.tagName == tagName;
}

function IsUserType(element, type)
{
	if ( !element || !type )
	{
		return false;
	}
	if ( typeof(type) != 'string' || !element.comment )
	{
		return false;
	}
	type = type.toLowerCase();
	if ( element.comment.toLowerCase() != type )
	{
		return false;
	}
	return true;
}

function GetDocumentPath(doc)
{
	var url = doc.location.href;
	var psn = url.lastIndexOf('/');
	if ( psn != -1 )
	{
		return url.substr(0, psn+1);
	}
}

function GetElement(elmtId)
{
	var element = document.getElementById(elmtId);
	if ( element == null )
	{
		alert("Unable to locate element: " + elmtId);
	}
	return element;
}

function ShowToolTipHelp(elmt, vertical, horizontal, width, height)
{
	var span = ShowToolTipHelp.Content;
	var popup = ShowToolTipHelp.Popup;
	if ( !span )
	{
		popup = window.createPopup();
		popup.document.body.style.fontFamily = 'tahoma';
		popup.document.body.style.fontSize = '11pt';
		var doc = popup.document;
		span = doc.createElement('SPAN');
		doc.body.appendChild(span);
		doc.body.style.color = 'windowtext';
		doc.body.style.backgroundColor = 'window';
		span.style.border = 'solid 1px windowtext';
		span.style.padding = '3px';
		span.style.width = width || 263;
		if ( width || height )
		{
			ShowToolTipHelp.Content = null;
			ShowToolTipHelp.Popup = null;
		}
	}
	if ( vertical == undefined ) vertical = true;
	if ( horizontal == undefined ) horizontal = true;
	span.innerHTML = elmt.tooltip;
	popup.show(0, 0, 1, 1);
	var x, y, offset=3;
	x = offset;
	y = elmt.offsetHeight + offset;
	if ( !horizontal )
	{
		x = - span.offsetWidth + elmt.offsetWidth - offset;
	}
	if ( !vertical )
	{
		y = - span.offsetHeight - offset;
	}
	popup.show(x, y, span.offsetWidth, span.offsetHeight, elmt);
}

///////////////////////////////////////////////////////////////////

function __typeof__(objClass)
{
	if ( objClass != undefined && objClass.constructor )
	{
		var strFun = objClass.constructor.toString();
		var className = strFun.substr(0, strFun.indexOf('('));
		className = className.replace('function', '');
		className = className.replace(/(^\s*)|(\s*$)/ig, '')
		return className ? className : 'Anonymous';
	}
	return typeof(objClass);
}

function __Debug__(error, data)
{
	if ( arguments.length < 2 )
	{
		alert('The arguments length is less than 2.');
		return;
	}
	if ( DEBUG_MODE )
	{
		var winopen = window.open();
		if ( winopen )
		{
			winopen.document.write('number: ' + (error.number & 0xFFFF) + '<br />');
			winopen.document.write('name: ' + error.name + '<br />');
			winopen.document.write('line: ' + error.line + '<br />');
			winopen.document.write('message: ' + error.message + '<br />');
			winopen.document.write('description: ' + error.description + '<br />');
			winopen.document.write('URL: ' + document.location + '<br />');
			winopen.document.write('<br><b>Debug data:</b><br><hr>\r\n\r\n');
			winopen.document.write(data);
			winopen.document.write('\r\n\r\n<hr size=1><a href="view-source:' + document.location + '">View Source</a>');
			winopen.document.close();
		}
	}
	else
	{
		var errorInfo = null;
		var m = data.match(/<!--\s*Message\s*=\s*"([^"]+)"\s*-->/i);
		if ( m && m.length > 1 )
		{
			errorInfo = m[1];
		}
		else
		{
			var span = document.createElement('SPAN');
			span.innerHTML = data;
			errorInfo = span.innerText;
		}
		alert(errorInfo || 'Unknown Error.');
		return errorInfo;
	}
}

///////////////////////////////////////////////////////////////////

function FileNameCheck(name, illegalChars)
{
	if ( !illegalChars )
	{
		illegalChars = '\\/<>:*?"|&';
	}
	var illegals = [];
	for ( var i=0 ; i < name.length ; ++i )
	{
		var index = illegalChars.indexOf(name.charAt(i));
		if ( index != -1 )
		{
			var illegalChar = illegalChars.charAt(index);
			if ( !illegals.contains(illegalChar) )
			{
				illegals.push(illegalChars.charAt(index));
			}
		}
	}
	if ( illegals.length > 0 )
	{
		return illegals.join(', ');
	}
	// if ok, nothing was returned.
}

///////////////////////////////////////////////////////////////////

function SetCookie(key, value)
{
	var argv = SetCookie.arguments;
	var argc = SetCookie.arguments.length;
	var expires = (2 < argc) ? argv[2] : null;
	var path = (3 < argc) ? argv[3] : null;
	var domain = (4 < argc) ? argv[4] : null;
	var secure = (5 < argc) ? argv[5] : false;
	document.cookie = key + '=' + escape (value)
		+ ((expires == null) ? '' : ('; expires=' + expires.toGMTString()))
		+ ((path == null) ? '' : ('; path=' + path))
		+ ((domain == null) ? '' : ('; domain=' + domain))
		+ ((secure == true) ? '; secure' : '');
}

function GetCookie(key)
{
	var arg = key + '=';
	var alen = arg.length;
	var clen = document.cookie.length;
	var i = 0;
	while( i < clen )
	{
		var j = i + alen;
		if (document.cookie.substring(i, j) == arg)
		{
			var offset = j;
			var endstr = document.cookie.indexOf (';', offset);
			if (endstr == -1)
			{
				endstr = document.cookie.length;
			}
			return unescape(document.cookie.substring(offset, endstr));
		}
		i = document.cookie.indexOf(' ', i) + 1;
		if ( i==0 ) break;
	}
	return null;
}

function SaveUserData(objPersistent, key, name, value)
{
	objPersistent.setAttribute(name, value);
	objPersistent.save(key);
}

function LoadUserData(objPersistent, key, name)
{
	objPersistent.load(key);
	return objPersistent.getAttribute(name);
}

///////////////////////////////////////////////////////////////////

function AjaxExecute(type, data)
{
	var url = document.location.toString();
	var m = url.match(/^https?:\/\/([^\/]+\/){2}\([^\/]+\)\//ig);
	if(!m)
	{
		m = url.match(/^https?:\/\/([^\/]+\/){2}/ig);
	}
	if ( m )
	{
		var ajaxUrl = m[0] + 'AjaxAccessor.aspx?' + new Date().getTime();
		if ( data[0] == '&' || data[0] == '?' )
		{
			data = data.substr(1);
		}
		var postData = 'Type=' + (type ? type : 'default') + '&' + data;
		return __XmlHttpPool__.PostRemoteDataEx(ajaxUrl, postData);
	}
	else
	{
		alert('Can\'t get URL of current page in AjaxExecute method.');
	}
}

///////////////////////////////////////////////////////////////////

function GarbageCollector()
{
	this.Extends(CollectionBase);
}

GarbageCollector.prototype.ForceGC = function()
{
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var obj = this.m_InnerArray[i];
		if ( obj && obj.Dispose )
		{
			obj.Dispose();
			obj.Dispose = null;
		}
	}
	// CollectGarbage();
}

function $(elementId)
{
	if ( typeof elementId == 'string' )
	{
		return document.getElementById(elementId);
	}
	return elementId;
}

function SwapImage(img, imgA, imgB)
{
	if ( img && img.tagName == 'IMG' )
	{
		var images = new Array(imgA, imgB);
		for ( var i=0 ; i < images.length ; ++i )
		{
			var psn = images[i].lastIndexOf('.');
			if ( psn != -1 )
			{
				images[i] = images[i].substr(0, psn);
			}
		}
		var m = img.src.match(/^(.+?)([^\/\.]+)(.\w{3})$/);
		if ( m )
		{
			var image = m[2];
			if ( image == images[0] || image == images[1] || images[0] == images[1] )
			{
				var index = 0;
				if ( image == images[index] )
				{
					index = 1;
				}
				img.src = m[1] + images[index] + m[3];
			}
		}
	}
}
