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
<%!
public void inputdb(int hakbun, String subject, int hour, int dotw) throws Exception{
		
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
		}
	%>
</head>
<body>
	<%
		Connection conn = ConnectionContext.getConnection();
		PreparedStatement pstmt = conn.prepareStatement("CREATE TABLE Subinf(subject char(20), Major char(20))");
		pstmt.executeUpdate();

		pstmt = conn.prepareStatement("INSERT INTO Subinf(subject, Major) VALUES(?, ?)");
		pstmt.setString(1, "C_PROGRAM");
		pstmt.setString(2, "major_required");
		pstmt.executeUpdate();
		pstmt.setString(1, "CIRCUIT");
		pstmt.executeUpdate();
		pstmt.setString(1, "CIRCUIT2");
		pstmt.executeUpdate();
		pstmt.setString(1, "ITSW");
		pstmt.setString(2, "major_elective");
		pstmt.executeUpdate();
		pstmt.setString(1, "JAVA");
		pstmt.executeUpdate();
		pstmt.setString(1, "DATA_ST");
		pstmt.executeUpdate();
		pstmt.setString(1, "VLSI");
		pstmt.executeUpdate();
		pstmt.setString(1, "OPTICS");
		pstmt.executeUpdate();
		pstmt.setString(1, "PHYSICS");
		pstmt.setString(2, "general_required");
		pstmt.executeUpdate();
		pstmt.setString(1, "ENGLISH");
		pstmt.executeUpdate();
		pstmt.setString(1, "MATH");
		pstmt.executeUpdate();
		pstmt.setString(1, "CHEMISTRY");
		pstmt.setString(2, "general_elective");
		pstmt.executeUpdate();
	
		PreparedStatement pstmt = conn.prepareStatement("INSERT INTO Sugang2019(Hakbun, Sub_name) VALUES('2013122148', ?)");
		pstmt.setString(1, "ITSW");
		pstmt.executeUpdate();
		pstmt.setString(1, "OPTICS");
		pstmt.executeUpdate();
		pstmt.setString(1, "VLSI");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO Sugang2018(Hakbun, Sub_name) VALUES('2013122148', ?)");
		pstmt.setString(1, "JAVA");
		pstmt.executeUpdate();
		pstmt.setString(1, "DATA_ST");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO Sugang2014(Hakbun, Sub_name) VALUES('2013122148', ?)");
		pstmt.setString(1, "C_PROGRAM");
		pstmt.executeUpdate();
		pstmt.setString(1, "CIRCUIT");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO Sugang2013(Hakbun, Sub_name) VALUES('2013122148', ?)");
		pstmt.setString(1, "PHYSICS");
		pstmt.executeUpdate();
		pstmt.setString(1, "MATH");
		pstmt.executeUpdate();

		pstmt = conn.prepareStatement("CREATE TABLE ITSW(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE JAVA(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE DATA_ST(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE C_PROGRAM(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE CIRCUIT(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE VLSI(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE OPTICS(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE PHYSICS(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE MATH(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE CHEMISTRY(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE ENGLISH(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("CREATE TABLE CIRCUIT2(Hakbun char(20), Year char(10), Grade char(10))");
		pstmt.executeUpdate();

		pstmt = conn.prepareStatement("INSERT INTO ITSW(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2019");
		pstmt.setString(2, "A+");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO OPTICS(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2019");
		pstmt.setString(2, "A0");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO VLSI(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2019");
		pstmt.setString(2, "B+");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO JAVA(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2018");
		pstmt.setString(2, "A+");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO DATA_ST(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2018");
		pstmt.setString(2, "B0");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO C_PROGRAM(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2014");
		pstmt.setString(2, "A+");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO CIRCUIT(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2014");
		pstmt.setString(2, "D0");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO PHYSICS(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2013");
		pstmt.setString(2, "C+");
		pstmt.executeUpdate();
		pstmt = conn.prepareStatement("INSERT INTO MATH(Hakbun, Year, Grade) VALUES('2013122148', ?, ?)");
		pstmt.setString(1, "2019");
		pstmt.setString(2, "C0");
		pstmt.executeUpdate();
		
		for(int i = 2013122148; i < 2013122158; i++) {
			inputdb(i, "ITSW", 9, 6);
		}
		for(int i = 2013122148; i < 2013122154; i++) {
			inputdb(i, "VLSI", 15, 3);
		}
		for(int i = 2013122148; i < 2013122152; i++) {
			inputdb(i, "OPTICS", 13, 5);
		}
		
		inputdb(2013122149, "DATA_ST", 17, 2);
		inputdb(2013122150, "DATA_ST", 17, 2);
		inputdb(2013122151, "JAVA", 13, 4);
		inputdb(2013122149, "JAVA", 13, 4);
		inputdb(2013122152, "MATH", 14, 5);
		
	%>
</body>
</html>