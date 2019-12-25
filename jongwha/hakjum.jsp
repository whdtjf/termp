<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="calculator.ConnectionContext"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적확인</title>
</head>
<body>
	<%
		String get_year = request.getParameter("year");
	%>
	<P><%=get_year%>
		성적입니다.
	<table border=1>
		<tr>
			<td>과목</td>
			<td>이수구분</td>
			<td>성적</td>
			<td>학점</td>
		</tr>
		<%
			String hakbun = "2013122148";
			//hakbun = (String)session.getAttribute("StudentID");

			double total_grade = 0;
			String grade;
			int credits = 0;
			Connection conn = ConnectionContext.getConnection();
			//Statement stmt = conn.createStatement();
			//ResultSet rs = stmt.executeQuery("SELECT Sub_name FROM Sugang2019 WHERE Hakbun=?");
			//
			String year = "Sugang2019";
			PreparedStatement pstmt = conn
					.prepareStatement("SELECT Sub_name FROM Sugang" + get_year + " WHERE Hakbun=?");
			//pstmt.setString(1, "Sugang2019");
			pstmt.setString(1, hakbun);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				credits++;
				String subject = rs.getString("Sub_name");
				pstmt = conn.prepareStatement("SELECT Grade FROM " + subject + " WHERE Hakbun=?");
				//pstmt.setString(1, subject);
				pstmt.setString(1, hakbun);
				ResultSet rs2 = pstmt.executeQuery();
				rs2.next();
				grade = rs2.getString("Grade");
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
				pstmt = conn.prepareStatement("SELECT Major FROM Subinf WHERE subject=?");
				pstmt.setString(1, subject);
				rs2 = pstmt.executeQuery();
				rs2.next();
				String major = rs2.getString("Major");
				String major_type = "?";
				if (major.equals("major_required")) {
					major_type = "전공필수";
				} else if (major.equals("major_elective")) {
					major_type = "전공선택";
				} else if (major.equals("general_elective")) {
					major_type = "교양선택";
				} else if (major.equals("general_required")) {
					major_type = "교양필수";
				}
		%>
		<tr>
			<td><%=subject%></td>
			<td><%=major_type%></td>
			<td><%=grade%></td>
			<td>1</td>
		</tr>
		<%
			rs2.close();
			}

			rs.close();
			pstmt.close();
		%>
	</table>
	<br>
	<br>
	<br>
	<table>
		<tr>
			<td>취득학점</td>
			<td>평점합</td>
			<td>평점평균</td>
		</tr>
		<tr>
			<td><%=credits%></td>
			<td><%=total_grade%></td>
			<td><%=String.format("%.2f", total_grade / credits)%></td>
		</tr>
	</table>
</body>
</html>

