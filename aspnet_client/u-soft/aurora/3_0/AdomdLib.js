/***********************************************************
AdomdLib JScript Code Library

Author: lizhi@hit.edu.cn
Company: http://www.u-soft.com.cn
Copyright: U-Soft Co., Ltd. © All rights reserved.
Version: 1.0
Created: 2005.03.10 17:44
Updated: 2005.03.10 18:35

History:
	1. The code created at 2005.03.10
	
**********************************************************/

var MAX_CHILDREN_FORBIDDEN = Number.MAX_VALUE;
var MAX_CHILDREN_WARNING = Number.MAX_VALUE;

var AnalysisStatus =
{
	Column	:	0,
	Row			:	1,
	Slicer		:	2,
	Background : 3,
	Hidden		:	4,

	SerializeName : function(status)
	{
		status = parseInt(status, 10);
		switch(status)
		{
			case this.Row : return 'Rows';
			case this.Column : return 'Columns';
			case this.Slicer : return 'Slicer';
			case this.Background : return 'Background';
			case this.Hidden : return 'Hidden';
			default : return 'stupid';
		}
	},
	
	DisplayName : function(status)
	{
		status = parseInt(status, 10);
		switch(status)
		{
			case this.Row : return L_Row;
			case this.Column : return L_Column;
			case this.Slicer : return L_Slicer;
			case this.Background : return L_Background;
			case this.Hidden : return L_Hidden;
			default : return 'stupid';
		}
	}
};

DimensionType = 
{
	Accounts : 'Accounts', // Describes a dimension that contains an accounts structure with parent-child relationships. 
	BillOfMaterials : 'BillOfMaterials', // Describes a dimension that represents a material/component breakdown. The parent-child relationship implies a parent composed of its children. 
	Channel : 'Channel', // Describes a dimension that contains information about a distribution channel.  
	Currency : 'Currency', // Describes a dimension that contains currency information. 
	Customers : 'Customers', // Describes a dimension that contains customer information. The lowest level represents individual customers. 
	Geography : 'Geography', // Describes a dimension that contains a geographic hierarchy.  
	Measure : 'Measure', // Describes a dimension that contains measures. 
	Organization : 'Organization', // Describes a dimension that represents the reporting structure of an organization. 
	Other : 'Other', // Describes a dimension of the default dimension type, which is used for dimensions that are not time dimensions or measure dimensions.  
	Products : 'Products', // Describes a dimension that contains product information. The lowest level represents individual products. 
	Promotion : 'Promotion', // Describes a dimension that contains information about marketing and advertising promotions. 
	Quantitative : 'Quantitative', // Describes a dimension that contains quantitative elements (for example, income level, number of children, and so on).  
	Rates : 'Rates', // Describes a dimension that contains different types of rates (for example, buy, sell, discounted. and so on).  
	Scenario : 'Scenario', // Describes a dimension that contains different business scenarios. 
	Time : 'Time', // Indicates that a dimension refers to time (for example, year, month, week, day, and so on). 
	Unknown : 'Unknown', // Describes a dimension with an unknown or unspecified type. 
	Utiliy : 'Utiliy' // Describes a dimension that contains only calculated members. This type of dimension is usually used for data visualization techniques.
};

var LevelType = 
{
	Account : 'Account', // Indicates that a level exists within an account dimension.  
	All : 'All', // Indicates the top (All) level of a dimension (the one that precalculates all the members of all lower levels). 
	BomResource : 'BomResource', // Indicates that a level is part of a bill of materials dimension. 
	Calculated : 'Calculated', // Indicates that a level is calculated. 
	Channel : 'Channel', // Indicates that a level exists within a distribution channel dimension. 
	Company : 'Company', // Indicates that a level contains information about a company.  
	CurrencyDestination : 'CurrencyDestination', // Indicates that a level contains information about the resulting currency after a foreign exchange conversion.  
	CurrencySource : 'CurrencySource', // Indicates that a level contains information about the starting currency before a foreign exchange conversion.  
	Customer : 'Customer', // Indicates that a level contains information about an individual customer.  
	CustomerGroup : 'CustomerGroup', // Indicates that a level contains information about a customer group.  
	CustomerHousehold : 'CustomerHousehold', // Indicates that a level contains information about an entire household. 
	GeoCity : 'GeoCity', // Indicates that a level refers to a city name. 
	GeoContinent : 'GeoContinent', // Indicates that a level refers to a continent name. 
	GeoCountry : 'GeoCountry', // Indicates that a level refers to a country or region name. 
	GeoCounty : 'GeoCounty', // Indicates that a level refers to a county name. 
	GeoPoint : 'GeoPoint', // Indicates that a level refers to a location type that does not fit into the other geographic categories. 
	GeoPostalCode : 'GeoPastalCode', // Indicates that a level refers to a postal code. 
	GeoRegion : 'GeoRegion', // Indicates that a level refers to a custom-defined region. 
	GeoStateOrProvince : 'GeoStateOrProvince', //Indicates that a level refers to a state or province name.  
	OrgUnit : 'OrgUnit', // Indicates that a level refers to the name of a unit within a larger organization.  
	Person : 'Person', // Indicates that a level refers to an individual within a larger organization. 
	Product : 'Product', // Indicates that a level refers to an individual product. 
	ProductGroup : 'ProductGroup', // Indicates that a level refers to a product group. 
	Promotion : 'Promotion', // Indicates that a level refers to a promotion. 
	Quantitative : 'Quantitative', // Indicates that a level refers to a quantitative member within a quantitative dimension.  
	Regular : 'Regular', // Indicates that the level is not related to time. 
	Representative : 'Representative', // Indicates that a level refers to a sales representative.  
	Reserved1 : 'Reserved1', // Reserved for future use. 
	Scenario : 'Scenario', // Indicates that a level refers to a scenario.  
	Time : 'Time', // Indicates that the level is related to time. 
	TimeDays : 'TimeDays', // Indicates that a level refers to days. It must be used in a dimension whose type is Time. 
	TimeHalfYears : 'TimeHalfYears', // Indicates that a level refers to half-years. It must be used in a dimension whose type is Time. 
	TimeHours : 'TimeHours', // Indicates that a level refers to hours. It must be used in a dimension whose type is Time.  
	TimeMinutes : 'TimeMinutes', // Indicates that a level refers to minutes. It must be used in a dimension whose type is Time. 
	TimeMonths : 'TimeMonths', // Indicates that a level refers to months. It must be used in a dimension whose type is Time. 
	TimeQuarters : 'TimeQuarters', // Indicates that a level refers to (calendar) quarters. It must be used in a dimension whose type is Time. 
	TimeSeconds : 'TimeSeconds', // Indicates that a level refers to seconds. It must be used in a dimension whose type is Time. 
	TimeUndefined : 'TimeUndefined', // Indicates that a level refers to an indeterminate or nonstandard measurement of time. It must be used in a dimension whose type is Time. 
	TimeWeeks : 'TimeWeeks', // Indicates that a level refers to weeks. It must be used in a dimension whose type is Time. 
	TimeYears : 'TimeYears', // Indicates that a level refers to years. It must be used in a dimension whose type is Time.  
	Utility : 'Utility' // Indicates that a level exists in a utility dimension.  
};

var MemberType = 
{
	All : 'All', // The member is an All member. 
	Formula : 'Formula', // The member is a calculated member or calculated measure. 
	Measure : 'Measure', // The member is a measure. 
	Regular : 'Regular', // The member is a regular member. 
	Unknown : 'Unknown' // The member type is unknown. 
};

var HierarchyType = 
{
	Unknown : 'Unknown',
	UserHierarchy : 'UserHierarchy',
	AttributeHierarchy : 'AttributeHierarchy',
	ParentChildHierarchy : 'ParentChildHierarchy'
};

function GetCaption(uniqueName)
{
	if ( uniqueName && uniqueName.length )
	{
		var startIndex = 1;
		var m = uniqueName.match(/[^\]]\]\.&?\[/gm);
		if ( m )
		{
			startIndex = m.lastIndex;
		}
		var caption = uniqueName.substring(startIndex, uniqueName.length-1);
		return caption.replace(/\]\]/gm, ']') || L_Untitled;
	}
	return uniqueName;
}