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
     <select name="tutor_select">
        <option value="">담당교수</option>
        <option value="19950101">한정희 교수</option>
        <option value="19960101">이재환 교수</option>
        <option value="19970101">안준선 교수</option>
    </select>
    </br>
    닉네임을 입력하세요(익명) : <input type="text" name="Nickname">
    </br>
        <select name="recommend">
        <option value=""> 추천점수</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
    </select>
    </br>
    강의평가를 해주세요 : <input type="text" name="lecture_eval_text">
    <input type="submit" value="강의평가제출">
 </form>
 <%
    String lecture=request.getParameter("select_lecture");
    String tutor_select=request.getParameter("tutor_select");
    String Nickname=request.getParameter("Nickname");
    String recommend=request.getParameter("recommend");
    String lecture_eval_text=request.getParameter("lecture_eval_text");
    stmt1.executeUpdate("INSERT INTO lecture_info (NickName, Lecture, Year, Recommend, Comment, Tutor_num, Stu_num) VALUES('"+Nickname+"', '"+lecture+"', '2019', '"+recommend+"', '"+lecture_eval_text+"', '"+tutor_select+"', '"+id+"')");

 
 %>
</body>
<script>
function submitComplete(){
    alert("제출완료!!");
    location.href="./student_main.jsp";
}
</script>
</html>