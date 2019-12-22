<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="test/html;charset="UTF-8">

	<%
		String yearj = request.getParameter("yearf");
		String monthj = request.getParameter("monthf");
		int y,m;
		if(yearj==null&& monthj==null)
		{
			y=0;
			m=0;
		}
		else
		{
			y = Integer.parseInt(yearj);
			m = Integer.parseInt(monthj);
		}
	%>
	<SCRIPT LANGUAGE="JavaScript">
	
	var now = new Date();
	var year=now.getYear();
	var month=now.getMonth();
	var montha = month +1;
	var yeart=<%=y%>;
	var montht=<%=m%>;
	var now2 = new Date(yeart,montht-1,1,0,0,0,0);
	if(yeart!=0)
	{
		year=now2.getYear();
		month=now2.getMonth();
	}
	
	
	
		function change1() {
			if(month==0)
			{
				year--;
				month=11;
			}
			else
			{
				month--;
			}
			form.yearf.value = ""+(year+1900);
			form.monthf.value = ""+(month+1);
			parent.frames[1].location.reload();
		}
		function change2() {
			if(month==11)
			{
				year++;
				month=0;
			}
			else
			{
				month++;
			}
			form.yearf.value = ""+(year+1900);
			form.monthf.value = ""+(month+1);
			parent.frames[1].location.reload();
		}
		function change3() {
			form.monthf.value = (form.monthf.value);
			parent.frames[1].location.reload();
		}
	
	</SCRIPT>
	
<title>checkboxform </title>
</head>
<body>
	<FORM NAME="form" action="but.jsp">
    	<Input type="submit" NAME="prev" VALUE="prev" onClick="change1()">
   	    <Input type="number" NAME="yearf" VALUE="0">
   	    <Input type="number" NAME="monthf" VALUE="0">
   	    <Input type="submit" NAME="search" VALUE="search" onClick="change3()" >
    	<Input type="submit" NAME="next" VALUE="next" onClick="change2()">
	</FORM>
	
	<SCRIPT LANGUAGE="JavaScript">
	form.yearf.value = ""+(year+1900);
	form.monthf.value = ""+(month+1);
	</SCRIPT>

</body>
</html>
