<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lab.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>





<%
        String id=request.getParameter("tutor_num");
        String pw=request.getParameter("pw");

        
        Connection conn = ConnectionContext.getConnection();
        Statement stmt = conn.createStatement();
      Statement stmt1 = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM login WHERE Stu_num='"+id+"'");
      ResultSet rs2;
%>

<% 
      while(rs.next()){
         int recordCount = rs.getInt("recordCount");
         if (recordCount != 1) {  //login User with ID
    %>

         <script>
           alert("교수 ID가 존재하지 않습니다!");
          </script>
    <%
         }
         else{
             break;
         }
      }

      rs2=stmt1.executeQuery("SELECT * FROM login WHERE Stu_num='"+id+"'");

        while(rs2.next()){ //login table을 쭉 읽으면서 해당 id의 table을 찾는다
        	 if(rs2.getString("Stu_num").equals(id) && rs2.getString("Password").equals(pw)){ //id && pw 로그인 성공시
                   pageContext.getSession().setAttribute("TutorID", id);  // 로그인 성공을 나타내는 특정속성 설정
                   response.sendRedirect("./tutor_main.jsp");
                   %>

         <%
             }  
             else{
    %>
         <script>
           alert("패스워드가 일치하지 않습니다!");
          </script>
    <%           
             }
        }
  
%>
