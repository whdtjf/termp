<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table boarder=1>
	<tr>
		<td>항목</td>
		<td>졸업 조건</td>
		<td>현 상황</td>
		<td>필요한 양</td>
	</tr>
	<tr>
		<td>이수 학점</td>
		<td>130</td>
		<% String temp = session.getAttribute("credits").toString();
			int credits = Integer.parseInt(temp);
			temp = session.getAttribute("major_credits").toString();
			int major_credits = Integer.parseInt(temp);
		%>
		<td><%= credits %></td>
		<td><%= 130 - credits %></td>
	</tr>
	<tr>
		<td>전공 이수 학점</td>
		<td>60</td>
		<td><%= major_credits %></td>
		<td><%= 60 - major_credits %></td>
	</tr>
</table>
</body>
</html>