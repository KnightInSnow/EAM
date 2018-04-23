function GetAbisSystemPath()
{
	var url = document.location.toString();
	// if UseUri to store session id
	var abisUrl = url.match(/^https?:\/\/([^\/]+\/){2}\([^\/]+\)\//ig);
	if(abisUrl)
	{
		return abisUrl[0];
	}
	var abis = url.match(/^https?:\/\/([^\/]+\/){2}/ig);
	if ( abis )
	{
		return abis[0];
	}
	else
	{
		if ( DEBUG_MODE )
		{
			return 'http://localhost/ABIS/';
		}
		else
		{
			alert(L_CannotGetAbisSystemPath);
		}
	}
}

function GetErrorMessage(rawError)
{
	var m = rawError.match(/<!--\s*Message\s*=\s*"([^"]+)"\s*-->/i);
	if ( m && m.length > 1 )
	{
		return m[1];
	}
	else
	{
		m = rawError.match(/<[^>]*name=\"objError\"[^>]*>/im);
		if ( m )
		{
			m = m[0].match(/title=\"(.*)\"/im);
			if ( m && m.length > 1 )
			{
				return m[1];
			}
		}
		return '';
	}
}

function GetDimensionIcon(dimensionType, hierarchyType)
{
	switch(dimensionType)
	{
		case DimensionType.Measure : return 'Measure';
		case DimensionType.Time : return 'TimeDimension';
		default :
		{
			if ( hierarchyType == HierarchyType.AttributeHierarchy )
			{
				return 'AttributeDimension';
			}
			else
			{
				return 'Dimension';
			}
		} 
	}
}

function GetHierarchyIcon(hierarchyType, dimensionType)
{
	if ( dimensionType == DimensionType.Time )
	{
		switch(hierarcyType)
		{
			case HierarchyType.AttributeHierarchy : return 'TimeAttributeHierarchy';
			case HierarchyType.ParentChildHierarchy : return 'ParentChildHierarchy';
			// case HierarchyType.UserHierarchy :
			default : return 'TimeHierarchy';
		}
	}
	else
	{
		switch(hierarcyType)
		{
			case HierarchyType.AttributeHierarchy : return 'AttributeHierarchy';
			case HierarchyType.ParentChildHierarchy : return 'ParentChildHierarchy';
			// case HierarchyType.UserHierarchy :
			default : return 'Hierarchy';
		}
	}
}

function GetMemberIcon(dimensionType, memberType, isDefault)
{
	var iconPrefix = '';
	if ( isDefault )
	{
		iconPrefix = 'D-';
	}
	switch(dimensionType)
	{
		case DimensionType.Measure :
		{
			if ( memberType == MemberType.Formula )
			{
				return 'CalculateMeasure';
			}
			else
			{	
				if ( isDefault )
 					return iconPrefix + 'MeasureMember';
				else
					return "MeasureGrouping";
			}
		}
		case DimensionType.Time :
		{
			if ( memberType == MemberType.Formula )
			{
				return 'CalculateTime';
			}
			else
			{
				return iconPrefix + 'TimeMember';
			}
		}
		default :
		{
			if ( memberType == MemberType.Formula )
			{
				return 'CalculateMember';
			}
			else
			{
				return iconPrefix + 'Member';
			}
		}
	}
}