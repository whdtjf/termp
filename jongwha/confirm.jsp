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
String subject = "CIRCUIT";
String dow = request.getParameter("dow");
int j = 0;
if (dow.equals("SUN")) {
	j = 0;
} else if (dow.equals("MON")) {
	j = 1;
} else if (dow.equals("TUE")) {
	j = 2;
} else if (dow.equals("WED")) {
	j = 3;
} else if (dow.equals("THU")) {
	j = 4;
} else if (dow.equals("FRI")) {
	j = 5;
} else if (dow.equals("SAT")) {
	j = 6;
}
int hour = Integer.parseInt(request.getParameter("time"));
Calendar cal = Calendar.getInstance();
int month = cal.get(Calendar.MONTH);

int today_dow = cal.get(Calendar.DAY_OF_WEEK);
int start_week = cal.get(Calendar.DATE) - today_dow + 1;


Connection conn = ConnectionContext.getConnection();
PreparedStatement pstmt = conn.prepareStatement(
		"SELECT Hakbun FROM GP WHERE gp_name=?;");
pstmt.setString(1, subject);
ResultSet rs = pstmt.executeQuery();

while(rs.next()) {
	int hakbun = rs.getInt("Hakbun");
	pstmt = conn.prepareStatement(
			"INSERT INTO Schedule(Hakbun, gp_name, Year, month, Day, Hour, Contents, Dotw) VALUES(?, ?, ?, ?, ?, ?, ?, ?)");

	pstmt.setInt(1, hakbun);
	pstmt.setString(2, subject);
	pstmt.setInt(3, 2019);
	pstmt.setInt(4, month);
	pstmt.setInt(5, start_week + j);
	pstmt.setInt(6, hour);
	pstmt.setString(7, "lecture");
	pstmt.setString(8, dow);
	pstmt.executeUpdate();
	pstmt.close();
}
rs.close();

%>
<jsp:forward page="timetable.jsp" />

</body>
</html>