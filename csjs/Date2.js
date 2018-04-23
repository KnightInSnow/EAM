<!--
function fillstring(str)
		{
			if(str.length==1)
			{
				str = "0" + str; 
			}
			return(str);
		}
		function quickseldate(type)
		{
			var begintime,endtime;
			var oneminute = 60*1000;
			var onehour   = 60*oneminute;
			var oneday    = 24*onehour;
			var oneweek   = 7*oneday;
			
			var todayDate = new Date();
			var date = todayDate.getDate();
			var month= todayDate.getMonth() +1;
			var year= todayDate.getYear();
			var day = todayDate.getDay();
			if(navigator.appName == "Netscape")
			{
				year = 1900 + year;
			}

			//-->
						
			if(type=="day")
			{
				begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
				endtime = begintime;
			}
			else if(type=="week")
			{
				var daytoMon = day-1;
				if(day==0) 
					daytoMon = 6;
				
				todayDate.setTime(todayDate.getTime()-daytoMon*oneday);
				date = todayDate.getDate();
				month= todayDate.getMonth() +1;
				year= todayDate.getYear();
				day = todayDate.getDay();
				
				begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
				
				todayDate.setTime(todayDate.getTime()+6*oneday);
				
				date = todayDate.getDate();
				month= todayDate.getMonth() +1;
				year= todayDate.getYear();
				
				endtime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
			}
			else if(type=="month")
			{
				var dateto1 = date-1;
				
				todayDate.setTime(todayDate.getTime()-dateto1*oneday);
				date = todayDate.getDate();
				month= todayDate.getMonth() +1;
				year= todayDate.getYear();
				day = todayDate.getDay();
				
				begintime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());
				
				todayDate.setMonth(month);
				todayDate.setTime(todayDate.getTime()-oneday);
				
				date = todayDate.getDate();
				month= todayDate.getMonth() +1;
				year= todayDate.getYear();
				
				endtime = year.toString() + "-" + fillstring(month.toString()) + "-" + fillstring(date.toString());

			}

			document.getElementById("txtbegintime").value = begintime;
			document.getElementById("txtendtime").value = endtime;
		
		}
		function checkdutytime(source,arguments)
		{
			var ondutytime,offdutytime;
			var begindate,enddate;
			ondutytime = document.getElementById('tbx_OnDutyTime').value;
			offdutytime = document.getElementById('tbx_OffDutyTime').value;
			begindate = Date.parse('1/1/1900 '+ondutytime);
			enddate = Date.parse('1/1/1900 '+offdutytime);
			if(enddate<begindate)
				arguments.IsValid = false;
			else
				arguments.IsValid = true;
		}
		function checkdutydate()
		{
			var begindate,enddate;
			begindate = document.getElementById('txtbegintime').value;
			enddate = document.getElementById('txtendtime').value;
			if(begindate.replace(' ','')=='' || enddate.replace(' ','')=='')
			{
				alert('日期不能为空');
				return false;
			}
			else
			{
				if(begindate>enddate)
				{
					alert('开始时间不能大于结束时间');
					return false
				}
			}
			return true;
		}
//-->