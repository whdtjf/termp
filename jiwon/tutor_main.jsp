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
    <form action="./" method="post">
    <select name="select_lecture">
        <option value=""> 과목선택</option>
    <%
    String id=(String)pageContext.getSession().getAttribute("TutorID");
    List temp = new ArrayList();
    List lectures= new ArrayList();

    Connection conn = ConnectionContext.getConnection();
    Statement stmt = conn.createStatement();
    Statement stmt1 = conn.createStatement();

    ResultSet rs = stmt.executeQuery("SELECT * FROM lecture_info WHERE Tutor_num='"+id+"'");
    while(rs.next()){
        temp.add(rs.getString("Lecture"));
    }

    for(int i=0; i<temp.size(); i++){
        if(!lectures.contains(temp.get(i))){
            lectures.add(temp.get(i));
        }
    }

    for(int j=0; j<lectures.size(); j++){
        String temp_lecture=(String)lectures.get(j);
        %>
            <option value="<%=temp_lecture%>"><%=temp_lecture%></option>

        <%
    }
    
    
%>
</select>
    <input type="submit" value="과목조회">
 </form>

</body>

</html>

