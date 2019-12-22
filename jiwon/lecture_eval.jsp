<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lab.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <form action="./lecture_eval.jsp" method="post" onsubmit="submitComplete()">
    <select name="select_lecture">
        <option value=""> 과목선택</option>
<%
        String id=(String)pageContext.getSession().getAttribute("StudentID");
        List Sub_names= new ArrayList();
        
        Connection conn = ConnectionContext.getConnection();
        Statement stmt = conn.createStatement();
        Statement stmt1 = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT Sub_name FROM Sugang2019 WHERE Hakbun='"+id+"'");

            while(rs.next()){
                Sub_names.add(rs.getString("Sub_name"));
            }

        for(int i=0; i<Sub_names.size(); i++){
            String subjcet=(String)Sub_names.get(i);
             %>
            <option value="<%=subjcet%>"><%=subjcet%></option>

             <%
        }
        
%>
</select>
    </br>
    </br>
    <input type="text" name="lecture_eval_text">
    <input type="submit" value="강의평가제출">
 </form>
 <%
    String lecture=request.getParameter("select_lecture");
    String lecture_eval_text=request.getParameter("lecture_eval_text");

    stmt1.executeUpdate("UPDATE lecture_info SET Comment='"+lecture_eval_text+"' WHERE Stu_num='"+id+"' AND Lecture='"+lecture+"'");
 
 %>
</body>
<script>
function submitComplete(){
    alert("제출완료!!");
    location.href="./student_main.jsp";
}
</script>
</html>