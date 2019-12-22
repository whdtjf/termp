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
    String lecture=(String)pageContext.getSession().getAttribute("lecture_info");
    Connection conn = ConnectionContext.getConnection();
    Statement stmt = conn.createStatement();
    Statement stmt1 = conn.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM lecture_info WHERE Lecture='"+lecture+"'");
    ResultSet rs2;

      while(rs.next()){
         int recordCount = rs.getInt("recordCount");
         if (recordCount < 1) {  //login User with ID
    %>

         <script>
           alert("해당 강의가 존재하지 않습니다!");
          </script>
    <%
         }
         else{
             break;
         }
      }
    %>
    <table border="1" align="left">
        <tr>
            <td>닉네임</td>
            <td>교수명</td>
            <td>년도</td>
            <td>추천점수</td>
            <td>코맨트</td>
        </tr>
    
    <%
    rs2=stmt1.executeQuery("SELECT * FROM lecture_info WHERE Lecture='"+lecture+"'");
    while(rs2.next()){
        String Nickname=rs2.getString("Nickname");
        String TutorName=rs2.getString("TutorName");
        String Year=rs2.getString("Year");
        String Recommend=rs2.getString("Recommend");
        String Comment=rs2.getString("Comment");
        %>

        <tr>
            <td><%= Nickname %></td>
            <td><%= TutorName %></td>
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

