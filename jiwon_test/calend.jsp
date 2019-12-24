<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<SCRIPT LANGUAGE="JavaScript">
	var now = new Date(); 
    var year = now.getFullYear();
    var month = now.getMonth() + 1;
    var date = now.getDate();
    var day = "";
   	var yearget = parent.frames[0].document.form.yearf.value;
   	var monthget = parent.frames[0].document.form.monthf.value;
    var start = new Date(yearget,monthget-1,1,0,0,0,0);
    
    switch(now.getDay())
    {
	  	case 0 : day = "일요일";             break;
	  	case 1 : day = "월요일";             break;
	  	case 2 : day = "화요일";             break;
	  	case 3 : day = "수요일";             break;
	  	case 4 : day = "목요일";             break;
	  	case 5 : day = "금요일";             break;
	  	case 6 : day = "토요일";             break;  

    }
    var str = ""+now.getYear()+" "+now.getMonth()+" "+now.getDate()+" "+day;
   
    
    function cal()
    {
    	return start.getDay();
    }
    function isend(ending)
    {
    	var temday = new Date(year,month,ending+7,0,0,0,0);
    	var ret=0;
    	if(ending+7>temday.getDate()) ret=temday.getDate();
    	
    	return ret;
    }
    function  chs(val)
    {
    	
    	//parent.frames[2].document.write(val.value);
    	//setCookie('day', val.value);
    	//setCookie('month', monthget);
    	//setCookie('year', val.yearget);
    	document.cookie = 'year' + '=' + yearget + ';'
    	document.cookie = 'month' + '=' + monthget + ';'
    	document.cookie = 'day' + '=' + val.value + ';'
    	parent.frames[2].location.reload();

    }
</SCRIPT>




<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
<tr>		
	<td width="120" align="center" bgcolor="yellow">
	<b>SUN</b></td>	
	<td width="120" align="center" bgcolor="yellow">
	<b>MON</b></td>
	<td width="120" align="center" bgcolor="yellow">
	<b>TUE</b></td>
	<td width="120" align="center" bgcolor="yellow">
	<b>WEN</b></td>
	<td width="120" align="center" bgcolor="yellow">
	<b>TUR</b></td>
	<td width="120" align="center" bgcolor="yellow">
	<b>FRI</b></td>
	<td width="120" align="center" bgcolor="yellow">
	<b>SAT</b></td>
	
</tr>
<form name = "form" action="calend.jsp">
<script language="JavaScript">
var minus = cal();
var ending;
var endv=7-minus;
ending = endv;
var temd = 0;

for (st = 0 - minus ; st <ending ; st++)
{
	if((st+minus)%7==0) document.write("<tr>");
	
	if(st>=0)
	{
		document.write("<td width=\"120\" height=\"50\" bgcolor=\"green\">");
		var strt = "<input type=\"image\" name=\"images\" value="+(st+1)+" onClick=\"chs(this)\">";
		document.write(strt);
		
		document.write("</td>");
	}
	else
	{
		document.write("<td width=\"120\" height=\"50\" align=\"center\" bgcolor=\"blue\">");
	}
	
	if((st+minus)%7==6) 
	{
		document.write("</tr>");
		temd=isend(ending);
		
		if(temd==0) 
		{
			ending=ending+7;
			
		}
		else
		{
			ending=ending+7-temd;
		}
	}
}
for (st = 0; st <temd ; st++)
{
	document.write("<td width=\"120\" height=\"50\" align=\"center\" bgcolor=\"blue\">");
}
</script>
</table>
</form>
</body>
</html>
