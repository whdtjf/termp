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
<SCRIPT LANGUAGE="JavaScript">
	function chkjolup() {
		window.open("localhost:8080/ITSW/termproject/jolup.jsp");
	}
</SCRIPT> 
	<P>누적학기 성적입니다.
	<table border=1>
		<tr>
			<td>년도</td>
			<!-- 이수구분 -->
			<td>취득 학점</td>
			<td>평점 합</td>
			<td>평점 평균</td>
		</tr>
		<%
			int hakbun = 2013122148;
			double total_grade = 0;
			String grade;
			int credits = 0;
			int major_credits = 0;
			Connection conn = ConnectionContext.getConnection();
			String year = "Sugang";

			for (int i = hakbun / 1000000; i < 2020; i++) {
				double year_total_grade = 0;
				int year_credits = 0;
				year = "Sugang" + Integer.toString(i);
				PreparedStatement pstmt = conn.prepareStatement("SELECT Sub_name FROM " + year + " WHERE Hakbun=?");
				pstmt.setInt(1, 2013122148);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					year_credits++;
					String subject = rs.getString("Sub_name");
					pstmt = conn.prepareStatement("SELECT Grade FROM " + subject + " WHERE Hakbun=?");
					pstmt.setInt(1, 2013122148);
					ResultSet rs2 = pstmt.executeQuery();
					rs2.next();
					grade = rs2.getString("Grade");
					if (grade.equals("A+")) {
						year_total_grade = year_total_grade + 4.5;
					} else if (grade.equals("A0")) {
						year_total_grade = year_total_grade + 4.0;
					} else if (grade.equals("B+")) {
						year_total_grade = year_total_grade + 3.5;
					} else if (grade.equals("B0")) {
						year_total_grade = year_total_grade + 3.0;
					} else if (grade.equals("C+")) {
						year_total_grade = year_total_grade + 2.5;
					} else if (grade.equals("C0")) {
						year_total_grade = year_total_grade + 2.0;
					} else if (grade.equals("D+")) {
						year_total_grade = year_total_grade + 1.5;
					} else if (grade.equals("D0")) {
						year_total_grade = year_total_grade + 1.0;
					}
					pstmt = conn.prepareStatement("SELECT Major FROM Subinf WHERE subject=?");
					pstmt.setString(1, subject);
					rs2 = pstmt.executeQuery();
					rs2.next();
					String major = rs2.getString("Major");
					String major_type = "?";
					if(major.equals("major_required")) {
						major_credits++;
					} else if(major.equals("major_elective")) {
						major_credits++;
					}
					rs2.close();
				}

				credits = credits + year_credits;
				total_grade = total_grade + year_total_grade;
				if (year_credits != 0) {
		%>
		<tr>
			<td><a href=<%="hakjum.jsp?year=" + Integer.toString(i)%>><%=Integer.toString(i) + "년"%></a></td>
			<td><%=year_credits%></td>
			<td><%=year_total_grade%></td>
			<td><%=String.format("%.2f", year_total_grade / year_credits)%></td>
		</tr>
		<%
			}
				rs.close();
				pstmt.close();
				session.setAttribute("credits", credits);
				session.setAttribute("total_grade", total_grade);
				session.setAttribute("major_credits",major_credits);
			}
		%>
	</table>
	<br>
	<br>
	<br>
	<table>
		<tr>
			<td>총 취득학점</td>
			<td>총 평점합</td>
			<td>총 평점평균</td>
		</tr>
		<tr>
			<td><%=credits%></td>
			<td><%=total_grade%></td>
			<td><%=String.format("%.2f", total_grade / credits)%></td>
		</tr>
	</table><br>
	<input type ="button" name="btn1" value="졸업정보확인" onClick="chkjolup()">
</body>
</html>