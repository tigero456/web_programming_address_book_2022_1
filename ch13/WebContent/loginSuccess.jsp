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
	<title> 관리자 로그인 </title>
</head>
<body>
	Home > 관리자 로그인
	<hr>
	<%
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "dbrrns198!@&";
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String u_id = request.getParameter("uID");
		String u_pw = request.getParameter("uPW");
		String check_id, check_pw, manager, name;
		System.out.println(u_id);

		Class.forName("com.mysql.jdbc.Driver");
		
		// conn 생성
		conn = DriverManager.getConnection(url, username, password);
		
		pstmt = conn.prepareStatement("select * from members where id =?");
		pstmt.setString(1, u_id);
		
		rs = pstmt.executeQuery();
		
		rs.next();
		check_id=rs.getString("id");
		check_pw=rs.getString("passwd");
		manager=rs.getString("manager");
		name=rs.getString("name");
		
		if(u_id.equals(check_id) && u_pw.equals(check_pw) && manager.equals("1")){
			session.setAttribute("mId", u_id);
			session.setAttribute("mName", name);
			session.setAttribute("mManage", manager);
			
			out.println("새로운 세션 생성 성공 ! <br>");
			out.println("관리자 [ " + u_id + " ]님이 입장하였습니다. <p>");
			response.sendRedirect("membersList.jsp");
		}
		else if(u_id.equals(check_id) && u_pw.equals(check_pw) && manager.equals("0")){
			response.sendRedirect("reponseLogin_seccess.jsp?uID="+u_id);
		}
		else{
			response.sendRedirect("loginErr.jsp");
		}
	%>
	<table border="0">
		<tr>
			<td>
				<form action="membersList.jsp" method="post" >
					<input type="submit" value=" ◀ 등록 회원 관리하기 " >
				</form>
			</td>
			<td>
				<form action="login.jsp" method="post" >
					<input type="submit" value=" 로그 아웃 ▶" >
				</form>
			</td>
	</table>  		
</body>
</html>