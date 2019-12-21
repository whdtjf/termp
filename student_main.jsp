<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="lab.ConnectionContext" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<html>
<head>
<meta charset="UTF-8">
<title>로그인 처리</title>
    <style type="text/css">
        body {
            margin-left: 0px;
            margin-top: 0px;
            margin-right: 0px;
            margin-bottom: 0px;
        }


        #center {
            position: absolute;
            top: 50%;
            left: 50%;
            width: 300px;
            height: 200px;
            overflow: hidden;
            background-color: white;
            margin-top: -150px;
            margin-left: -100px;
        }
    </style>
</head>
<body>
        로그인에 성공했습니다. <br/><br/>
        <div id="center">
        <input type="button" name="check_grade" value="나의성적" onclick="checkGrade()">
        <input type="button" name="schedule" value="나의일정" onclick="mySchedule()">
        <input type="button" name="lecture_evaluation" value="강의평가하기" onclick="lecture_eval()">
        </div>
                          
</body>
<script>
function checkGrade(){
    location.href="./checkGrade.jsp"  
}
function mySchedule(){
    location.href="./mySchedule.jsp"    
}
function lecture_eval(){
    location.href="./lecture_eval.jsp"    
}

</script>
</html>