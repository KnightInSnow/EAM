/***********************************************************
EventHandler class created by JScript

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 1.2
Created: 2005.02.23 15:17
Last Updated: 2005.04.11 11:22

History:
	1. The code created at 2005.02.23
	2. Basic function was completed. [2005.02.23]
	3. Cancel the singleton support. [2005.04.11]

***********************************************************/

function EventHandler(sender, action, callback)
{
	if ( typeof(sender) != 'object' )
	{
		throw new Error('The first parameter of EventHandler request object "sender".');
	}
	if ( typeof(action) != 'string' )
	{
		throw new Error('The second parameter of EventHandler request string "action".');
	}
	if ( typeof(callback) != 'function' )
	{
		throw new Error('The thrid parameter of EventHandler request function "callback".');
	}

	this.Extends(CollectionBase);
	this.m_EventHandlers = this.m_InnerArray;

	this.m_Action = action;	
	this.m_Sender = sender;
	this.m_EventArgs = null;
	this.AttachHandler(callback);

	this.toString = function()
	{
		return '[class EventHandler]';
	};
}

EventHandler.prototype.Execute = function(eventArgs)
{
	this.m_EventArgs = eventArgs;
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		var callback = this.Items(i);
		if ( typeof(callback) == 'function' )
		{
			return callback(this.m_Sender, this.m_EventArgs);
		}
	}
};

EventHandler.prototype.AttachHandler = function(handler)
{
	this.Add(handler);
};

EventHandler.prototype.DetachHandler = function(handler)
{
	this.Remove(handler);
};