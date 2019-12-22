<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="calculator.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.Calendar"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		int hakbun = 2013122201;
		String subject = "JAVA"; // 강의 제목
		int hour = 13; // 강의시간
		int dotw = 4; // 강의 요일 1:일요일 
		String content = "lecture";		// 내용
		String dow = "";
		
		if (dotw == 2) {
			dow = "MON";
		} else if (dotw == 3) {
			dow = "TUE";
		} else if (dotw == 4) {
			dow = "WED";
		} else if (dotw == 5) {
			dow = "THU";
		} else if (dotw == 6) {
			dow = "FRI";
		} else if (dotw == 7) {
			dow = "SAT";
		} else if (dotw == 1) {
			dow = "SUN";
		}

		Calendar cal = Calendar.getInstance();
		cal.set(2019, 8, 1);
		int start_dow = cal.get(Calendar.DAY_OF_WEEK);

		Connection conn = ConnectionContext.getConnection();
		PreparedStatement pstmt = conn.prepareStatement(
				"INSERT INTO GP(Hakbun, gp_name) VALUES(?, ?)");
		pstmt.setInt(1, hakbun);
		pstmt.setString(2, subject);
		pstmt.executeUpdate();
		pstmt.close();

		for (int i = 8; i < 11; i++) {
			for (int j = 1; j < 32; j++) {
				if (i != 9 && j == 31) {
					break;
				}
				cal.set(2019, i, j);
				if (cal.get(Calendar.DAY_OF_WEEK) == dotw) {
					pstmt = conn.prepareStatement(
							"INSERT INTO Schedule(Hakbun, gp_name, Year, month, Day, Hour, Contents, Dotw) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");
					
					pstmt.setInt(1, hakbun);
					pstmt.setString(2, subject);
					pstmt.setInt(3, 2019);
					pstmt.setInt(4, i + 1);
					pstmt.setInt(5, j);
					pstmt.setInt(6, hour);
					pstmt.setString(7, content);
					pstmt.setString(8, dow);
					pstmt.executeUpdate();
					pstmt.close();
				}
			}

		}
	%>
</body>
</html>