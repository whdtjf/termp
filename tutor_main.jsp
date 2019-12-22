<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lab.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>Tutor 메인화면</title>
</head>
<body>
    <%
    String id=(String)pageContext.getSession().getAttribute("TutorID");
    System.out.println(id);
    String lecture=(String)pageContext.getSession().getAttribute("lecture_info");
    System.out.println(lecture);


    %>
  

</body>

</html>

