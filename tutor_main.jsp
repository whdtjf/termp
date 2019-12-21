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
    String lectureName=request.getAttribute("lectureName");
    System.out.println("lectureName");
    %>
  

</body>

</html>

    Connection conn=ConnectionContext.getConnection();
    Statement stmt=conn.createStatement();
    ResultSet rs=stmt.executeQuery("SELECT * FROM lecture_info WHERE Lecture=''");