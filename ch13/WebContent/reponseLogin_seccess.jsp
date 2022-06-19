<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 로그인 성공 </title>
</head>
<body>
	<hr>
	<%
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "dbrrns198!@&";
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String u_id = request.getParameter("uID");
		String manager;
	
		Class.forName("com.mysql.jdbc.Driver");
		
		// conn 생성
		conn = DriverManager.getConnection(url, username, password);
		
		pstmt = conn.prepareStatement("select * from members where id =?");
		pstmt.setString(1, u_id);
			
		rs = pstmt.executeQuery();
		
		rs.next();

%>
<div id="logout">
[<%=u_id %>]님 환영합니다.<br>
</div>
		
<%--
		manager=rs.getString("manager");
		
		session.setAttribute("uManage", manager);
--%>
<table border="0">
		<tr>
			<td>
				<fieldset style="width:260px">
				<legend> 메인 메뉴 </legend><p>
		
				<table>
				<form action="number_rigist.jsp" method="post" >
					<td><input type="submit" value=" 연락처 등록 ▶" ></td>
					<tr height="30">
				</form>
				<form action="number_delete.jsp" method="post" >
					<td><input type="submit" value=" 연락처 삭제 ▶" ></td>
					<tr height="30">
				</form>
				<form action="search.jsp" method="post" >
					<td><input type="submit" value=" 연락처 검색 ▶" ></td>
					<tr height="30">
				</form>
				<form action="numberList.jsp" method="post" >
					<td><input type="submit" value=" 연락처 보기 ▶" ></td>
					<tr height="30">
				</form>
				<form action="login.jsp" method="post" >
					<td><input type="submit" value=" 로그 아웃 ▶" ></td>
					<tr height="30">
				</form>
				</table>
				
				</fieldset>
			</td>
	</table>  		
</body>
</html>