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

	<table border=1>
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
			
			Calendar cal = Calendar.getInstance();
			int today_dow = cal.get(Calendar.DAY_OF_WEEK);
			int start_week = cal.get(Calendar.DATE) - today_dow + 1;
			
			while (rs.next()) {
				sugangsaeng++;
				hakbun = rs.getInt("Hakbun");
				pstmt = conn.prepareStatement("SELECT Dotw, Hour FROM Schedule WHERE Hakbun=? AND Day>=? AND Day <=? AND Month=?");
				pstmt.setInt(1, hakbun);
				pstmt.setInt(2, start_week);
				pstmt.setInt(3, start_week + 6);
				pstmt.setInt(4, cal.get(Calendar.MONTH));
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
			<td WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='skyblue'></td>
			<%
				} else {
					if(count[i][j] <= sugangsaeng * 0.25) {%>
						<td WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='green'><%=count[i][j]%></td>
					<%	
					} else if(count[i][j] <= sugangsaeng * 0.5) {%>
					<td WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='yellow'><%=count[i][j]%></td>
				<%	
						
					} else{%>
					<td WIDTH=100 HEIGHT=30 VALIGN=MIDDLE align='center' bgcolor='red'><%=count[i][j]%></td>
					<%
					}
				}
				}
			%>
		</tr>
		<%
			}
		%>
	</table>
	<SCRIPT LANGUAGE="JavaScript">
	function confirm() {
		for(k = 0; k < 7; k++) {
			if(form.dow.options[k].selected){
				
			}	
		}
		for(k = 0; k < 12; k++) {
			if(form.time.options[k].selected){
			}	
		}
	}
	</SCRIPT> 
총 수강생 : <%= sugangsaeng %>명<br>
<form action="confirm.jsp" method="get" name="form">
요일 : 
<select name="dow" size="1">
	<option value="MON">MON
	<option value="TUE">TUE
	<option value="WED">WED
	<option value="THU">THU
	<option value="FRI">FRI
	<option value="SAT">SAT
	<option value="SUN">SUN
</select>
시간 : 
<select name="time" size="1">
	<option value="9">9
	<option value="10">10
	<option value="11">11
	<option value="12">12
	<option value="13">13
	<option value="14">14
	<option value="15">15
	<option value="16">16
	<option value="17">17
	<option value="18">18
	<option value="19">19
	<option value="20">20
</select>
<input type="submit" name="subbtn" value="확정">
</form>

</body>
</html>