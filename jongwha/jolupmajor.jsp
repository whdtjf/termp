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
			<td>년도</td>
			<td>과목명</td>
			<td>이수구분</td>
			<td>학점</td>
			<td>등급</td>
		</tr>
		<%
			String hakbun = "2013122148";
			//hakbun = (String)session.getAttribute("StudentID");

			double total_grade = 0;
			String grade;
			int credits = 0;
			Connection conn = ConnectionContext.getConnection();
			String year = "Sugang";

			for (int i = Integer.parseInt(hakbun) / 1000000; i < 2020; i++) {

				year = "Sugang" + Integer.toString(i);
				PreparedStatement pstmt = conn.prepareStatement("SELECT i.subject, i.Major FROM Subinf AS i JOIN "
						+ year + " AS s ON s.Sub_name=i.subject WHERE s.Hakbun=?;");
				pstmt.setString(1, hakbun);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String subject = rs.getString("i.subject");
					String major = rs.getString("i.Major");

					pstmt = conn.prepareStatement("SELECT Grade, Year FROM " + subject + " WHERE Hakbun=?");
					pstmt.setString(1, hakbun);
					ResultSet rs2 = pstmt.executeQuery();
					rs2.next();
					grade = rs2.getString("Grade");
					year = rs2.getString("Year");

					if (grade.equals("A+")) {
						total_grade = total_grade + 4.5;
					} else if (grade.equals("A0")) {
						total_grade = total_grade + 4.0;
					} else if (grade.equals("B+")) {
						total_grade = total_grade + 3.5;
					} else if (grade.equals("B0")) {
						total_grade = total_grade + 3.0;
					} else if (grade.equals("C+")) {
						total_grade = total_grade + 2.5;
					} else if (grade.equals("C0")) {
						total_grade = total_grade + 2.0;
					} else if (grade.equals("D+")) {
						total_grade = total_grade + 1.5;
					} else if (grade.equals("D0")) {
						total_grade = total_grade + 1.0;
					}

					if (major.equals("major_required") || major.equals("major_elective")) {
						credits++;
		%>
		<tr>
			<td><%=year%></td>
			<td><%=subject%></td>
			<td><%=major%></td>
			<td>1</td>
			<td><%=grade%></td>
			<%
				}

					}
					rs.close();
					pstmt.close();
				}
			%><br>
			<br>
			<table>
				<tr>
					<td>전공취득학점</td>
					<td>전공평점합</td>
					<td>전공평점평균</td>
				</tr>
				<tr>
					<td><%=credits%></td>
					<td><%=total_grade%></td>
					<td><%=String.format("%.2f", total_grade / credits)%></td>
				</tr>
			</table>
</body>
</html>