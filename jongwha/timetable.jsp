<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="calculator.ConnectionContext"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border=1 align='center'>
		<tr>
			<TD WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'>\</TD>
			<TD WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'>일</TD>
			<TD WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'>월</TD>
			<TD WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'>화</TD>
			<TD WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'>수</TD>
			<TD WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'>목</TD>
			<TD WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'>금</TD>
			<TD WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'>토</TD>
		</tr>
		<%
			int hakbun = 2013122148;
			String subject = "ITSW";
			int sugangsaeng = 0;
			int[][] count = new int[12][7];
			Connection conn = ConnectionContext.getConnection();
			PreparedStatement pstmt = conn.prepareStatement("SELECT Hakbun FROM GP WHERE gp_name=?");
			pstmt.setString(1, subject);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				sugangsaeng++;
				hakbun = rs.getInt("Hakbun");
				pstmt = conn.prepareStatement("SELECT Dotw, Hour FROM Schedule WHERE Hakbun=?");
				pstmt.setInt(1, hakbun);
				ResultSet rs2 = pstmt.executeQuery();
				while (rs2.next()) {
					String dotw = rs2.getString("Dotw");
					int dot = -1;
					if (dotw.equals("SUN")) {
						dot = 0;
					} else if (dotw.equals("MON")) {
						dot = 1;
					} else if (dotw.equals("TUE")) {
						dot = 2;
					} else if (dotw.equals("WED")) {
						dot = 3;
					} else if (dotw.equals("THU")) {
						dot = 4;
					} else if (dotw.equals("FRI")) {
						dot = 5;
					} else if (dotw.equals("SAT")) {
						dot = 6;
					}
					int hour = rs2.getInt("Hour") - 9;

					count[hour][dot]++;
				}

			}

			for (int i = 0; i < 12; i++) {
		%>
		<tr>
			<td><%=i + 9 + "시"%></td>
			<%
				for (int j = 0; j < 7; j++) {
						if (count[i][j] == 0) {
			%>
			<td WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center'></td>
			<%
				} else {
			%>
			<td WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center'><%=count[i][j]%></td>
			<%
				}
			%>



			<%
				}
			%>
		</tr>
		<%
			}
		%>
	</table>


</body>
</html>