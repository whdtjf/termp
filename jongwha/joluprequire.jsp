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
	<table>
		<tr>
			<td>과목명</td>
			<td>이수구분</td>
			<td>취득 여부</td>
		</tr>

		<%
			Connection conn = ConnectionContext.getConnection();
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT subject, Major FROM Subinf WHERE Major='major_required'");
			ResultSet rs2 = pstmt.executeQuery();

			int hakbun = 2013122148;

			while (rs2.next()) {
				String major = rs2.getString("Major");
				String subject = rs2.getString("subject");
				boolean sign = false;
				String year = "Sugang";

				for (int i = hakbun / 1000000; i < 2020; i++) {
					year = "Sugang" + Integer.toString(i);
					pstmt = conn.prepareStatement("SELECT Sub_name FROM " + year + " WHERE Hakbun=?");
					pstmt.setInt(1, 2013122148);
					ResultSet rs = pstmt.executeQuery();
					while (rs.next() && sign != true) {
						if (subject.equals(rs.getString("Sub_name"))) {
							sign = true;
						}
					}
				}
		%>
		<tr>
			<td><%=subject%></td>
			<td><%=major%></td>
			<td><%=sign%></td>
		</tr>
		<%
			}
		%>

	</table>

</body>
</html>