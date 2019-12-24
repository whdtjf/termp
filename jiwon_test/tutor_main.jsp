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
    <form action="./tutor_main.jsp" method="post">
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

<%
    String lecture=request.getParameter("select_lecture");
    

%>
    <table border="1" align="left">
        <tr>
            <td>닉네임</td>
            <td>년도</td>
            <td>추천점수</td>
            <td>코맨트</td>
        </tr>
    
    <%
    ResultSet rs2=stmt1.executeQuery("SELECT * FROM lecture_info WHERE Lecture='"+lecture+"' AND Tutor_num='"+id+"'");
    while(rs2.next()){
        String Nickname=rs2.getString("Nickname");
        String Year=rs2.getString("Year");
        String Recommend=rs2.getString("Recommend");
        String Comment=rs2.getString("Comment");
        %>

        <tr>
            <td><%= Nickname %></td>
            <td><%= Year %></td>
            <td><%= Recommend %></td>
            <td><%= Comment %></td>
        </tr>

        <%

        

    }
    
    %>
    </table>

</body>

</html>

