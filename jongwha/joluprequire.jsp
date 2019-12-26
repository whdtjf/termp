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

			String hakbun = "2013122148";
			//hakbun = (String)session.getAttribute("StudentID");

			while (rs2.next()) {
				String major = rs2.getString("Major");
				String subject = rs2.getString("subject");
				boolean sign = false;
				String year = "Sugang";

				for (int i = Integer.parseInt(hakbun) / 1000000; i < 2020; i++) {
					year = "Sugang" + Integer.toString(i);
					pstmt = conn.prepareStatement("SELECT Sub_name FROM " + year + " WHERE Hakbun=?");
					pstmt.setString(1, hakbun);
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
		<%
			pstmt = conn.prepareStatement("SELECT subject, Major FROM Subinf WHERE Major='general_required'");
			ResultSet rs3 = pstmt.executeQuery();

			while (rs3.next()) {
				String major2 = rs3.getString("Major");
				String subject2 = rs3.getString("subject");
				boolean sign2 = false;
				String year = "Sugang";

				for (int i = Integer.parseInt(hakbun) / 1000000; i < 2020; i++) {
					year = "Sugang" + Integer.toString(i);
					pstmt = conn.prepareStatement("SELECT Sub_name FROM " + year + " WHERE Hakbun=?");
					pstmt.setString(1, hakbun);
					ResultSet rs4 = pstmt.executeQuery();
					while (rs4.next() && sign2 != true) {
						if (subject2.equals(rs4.getString("Sub_name"))) {
							sign2 = true;
						}
					}
				}
		%>
		<tr>
			<td><%=subject2%></td>
			<td><%=major2%></td>
			<td><%=sign2%></td>
		</tr>
		<%
			}
		%>
	</table>

</body>
</html>