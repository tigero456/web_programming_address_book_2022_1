<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> Members List </title>
</head>
<body>
	Home > 등록 회원 관리
	<hr>
	<%
		if(session.getAttribute("uManage") =="0"){
			response.sendRedirect("loginErr.jsp");
		}
	%>
	<table border="1">
		<tr>
			<td> ID </td>
			<td> 이름 </td>
			<td> 비밀번호 </td>
			<td> 관리자 여부 </td>
			<%
			String u_id = request.getParameter("userID");
			String u_pw = request.getParameter("userPW");
			String u_mail = request.getParameter("userMAIL");
			String manager = request.getParameter("userMANAGER");
			String name = request.getParameter("userNAME");

			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery("SELECT * FROM members");
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("id") %></td>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("passwd") %></td>
				<td><%=rs.getString("manager") %></td>
			</tr>
			<%
			}
			%>
		</tr>
	</table>
	<table border="0">
		<tr> 
			<td>
				<form action="logout.jsp" method="post" >
					<input type="submit" value=" 로그 아웃 ▶" >
				</form>
			</td>
		</tr>
	</table>  		
</body>
</html>	