<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	int yearg=0;
	int monthg=0;
	int dayg=0;
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
	out.println("wtf4");
	Cookie[] cookies = request.getCookies();
	if(cookies != null && cookies.length > 0)
	{
		for(int i = 0; i < cookies.length; i++)
		{
			if(cookies[i].getName().equals("day"))
			{
				dayg=Integer.parseInt(cookies[i].getValue());
			}
			if(cookies[i].getName().equals("month"))
			{
				monthg=Integer.parseInt(cookies[i].getValue());
			}
			if(cookies[i].getName().equals("year"))
			{
				yearg=Integer.parseInt(cookies[i].getValue());
			}
		}
	}
	if(yearg!=0&&monthg!=0&&dayg!=0)
		out.println(" "+yearg +" "+monthg+" "+dayg);
 %>
</body>
</html>
