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
	<table border="1">
		<tr>
			<td> 이름 </td>
			<td> 전화번호 </td>
			<td> 메모 </td>
			<%
			String u_name = request.getParameter("userNAME");
			String u_number = request.getParameter("userNUMBER");
			String u_memo = request.getParameter("userMEMO");
			
			Statement sm = conn.createStatement();
			ResultSet rs = sm.executeQuery("SELECT * FROM regist");
				while(rs.next()){
			%>
			<tr>
				<td><%=rs.getString("name") %></td>
				<td><%=rs.getString("number") %></td>
				<td><%=rs.getString("memo") %></td>
			</tr>
			<%
			}
			%>
		</tr>
	</table>	
	
				<form action="reponseLogin_seccess.jsp" method="post" >
					<td><input type="submit" value=" 돌아가기" ></td>
					<tr height="30">
				</form>
</body>
</html>	