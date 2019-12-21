<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lab.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<jsp:forward page="./tutor_main.jsp">
<jsp:param name="lectureName" value="" />
</jsp:forward>

<%
  if(session.isNew()) {    //session이 처음으로 생성된 것인지 확인
	out.println("<a href=tutor_login.html>처음부터</a>");
  	
  } else { //한번 더 접속하면 session.isNew()는 false를 반환하고 else문이 돌아간다
        String id=request.getParameter("tutor_num");
        String pw=request.getParameter("pw");
        String lecture=request.getParameter("lecture");

        request.setParameter(lectureName,lecture); //다시!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        
        Connection conn = ConnectionContext.getConnection();
        Statement stmt = conn.createStatement();
      Statement stmt1 = conn.createStatement();
      ResultSet rs = stmt.executeQuery("SELECT count(*) AS recordCount FROM login WHERE Stu_num='"+id+"'");
      ResultSet rs2;

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
                   session.setAttribute("TutorID", id);  // 로그인 성공을 나타내는 특정속성 설정
                   
                   %>
                   <script>
                   
                   location.href="./tutor_main.jsp";
                   </script>
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
  }
%>
