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
<body></body>
<P>누적학기 성적입니다.
<table border=1>
	<tr>
		<td>순위</td>
		<!-- 이수구분 -->
		<td>학번</td>
		<td>평점 합</td>
	</tr>
	<%
			String hakbun = "";
			//hakbun = (String)session.getAttribute("StudentID");

			double total_grade = 0;
			String grade;
			
			
			Connection conn = ConnectionContext.getConnection();
			String year = "Sugang";
			PreparedStatement pstmt = conn.prepareStatement("SELECT Stu_num FROM login WHERE Grade>0");
			ResultSet rs3 = pstmt.executeQuery();
			//int a = 0;
			while(rs3.next()) {
				total_grade = 0;
			hakbun = rs3.getString("Stu_num");
			for (int i = Integer.parseInt(hakbun) / 1000000; i < 2020; i++) {
				double year_total_grade = 0;
				year = "Sugang" + Integer.toString(i);
				pstmt = conn.prepareStatement("SELECT Sub_name FROM " + year + " WHERE Hakbun=?");
				pstmt.setString(1, hakbun);
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String subject = rs.getString("Sub_name");
					pstmt = conn.prepareStatement("SELECT Grade FROM " + subject + " WHERE Hakbun=?");
					pstmt.setString(1, hakbun);
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
					
					rs2.close();
				}
				
				total_grade = total_grade + year_total_grade;
				//a++;
				
				
				
				//ResultSet rs4 = pstmt.executeQuery();
				
				rs.close();
				pstmt.close();
			}
			pstmt = conn.prepareStatement("UPDATE login SET Result=? WHERE Stu_num=?;");
			pstmt.setDouble(1, total_grade);
			pstmt.setString(2, hakbun);
			pstmt.executeUpdate();
			
			}
			pstmt = conn.prepareStatement("select Stu_num, Result from login where Grade>0 order by Result Desc;");
			
			ResultSet rs5 =pstmt.executeQuery();
			int j = 1;
			while(rs5.next()) {
				
			
		%>
		
	<tr>
		<td><%= j %></td>
		<td><%= rs5.getString("Stu_num") %></td>
		<td><%= rs5.getDouble("Result") %></td>
	</tr>
	<%j++;
	} %>
</table>

</body>
</html>