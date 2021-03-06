/***********************************************************
CollectionBase class created by JScript

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 1.0
Created: 2005.01.24 18:57
Updated: 2005.01.25 14:55

History:
	1. The code created at 2005.01.24
	2. The raff version was completed. [2005.01.25]

***********************************************************/

function CollectionBase()
{
	this.m_InnerArray = [];
	this.m_Count = 0;

	this.toString = function()
	{
		return '[class CollectionBase]';
	};
}

CollectionBase.prototype.Clear = function()
{
	this.m_InnerArray.splice(0, this.m_Count);
	this.m_Count = 0;
};

CollectionBase.prototype.Clone = function()
{
	var cb = new CollectionBase();
	cb.m_InnerArray = this.m_InnerArray.slice(0);
	cb.m_Count = this.m_Count;
	return cb;
};

CollectionBase.prototype.Items = function(index)
{
	return this.m_InnerArray[index];
};

CollectionBase.prototype.Add = function(item)
{
	this.Insert(item);
};

CollectionBase.prototype.Contains = function(item)
{
	return (this.IndexOf(item) != -1);
};

CollectionBase.prototype.IndexOf = function(item)
{
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		if ( this.m_InnerArray[i] == item )
		{
			return i;
		}
	}
	return -1;
};

CollectionBase.prototype.LastIndexOf = function(item)
{
	for ( var i=this.m_Count-1 ; i >= 0 ; --i )
	{
		if ( this.m_InnerArray[i] == item )
		{
			return i;
		}
	}
	return -1;
};

CollectionBase.prototype.Insert = function(item)
{
	this.InsertAt(item, this.m_Count);
};

CollectionBase.prototype.InsertAt = function(item, index)
{
	if ( item && typeof(index) != 'undefined' )
	{
		this.m_InnerArray.splice(index, 0, item);
		this.m_Count++;
	}
};

CollectionBase.prototype.Remove = function(item)
{
	for ( var i=0 ; i < this.m_Count ; ++i )
	{
		if ( this.m_InnerArray[i] == item )
		{
			this.RemoveAt(i);
			break;
		}
	}
};

CollectionBase.prototype.RemoveAt = function(index)
{
	if ( this.m_InnerArray[index] )
	{
		delete this.m_InnerArray[index];
		this.m_InnerArray.splice(index, 1);
		this.m_Count--;
	}
};

CollectionBase.prototype.Swap = function(itemA, itemB)
{
	var iPsnA = this.IndexOf(itemA);
	var iPsnB = this.IndexOf(itemB);
	
	if ( iPsnA != -1 && iPsnB != -1 )
	{
		this.m_InnerArray[iPsnA] = itemB;
		this.m_InnerArray[iPsnB] = itmeA;
	}	
};

CollectionBase.prototype.Sort = function(sortCallback)
{
	if ( sortCallback )
	{
		this.m_InnerArray.sort(sortCallback);
	}
	else
	{
		this.m_InnerArray.sort();
	}
};

CollectionBase.prototype.Reverse = function()
{
	this.m_InnerArray.reverse();
};