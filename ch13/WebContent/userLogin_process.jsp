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
<title> response Redirection </title>
</head>
<body>
	Home > 리다이렉션
	<hr>
	<%
		request.setCharacterEncoding("utf-8");
		String u_id = request.getParameter("id");
		String u_pw = request.getParameter("passwd");
		String url = "jdbc:mysql://localhost:3306/odbo";
		String username = "root";
		String password = "dbrrns198!@&";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		//String sql = "select * from members where id = '"+u_id+"' and passwd = '"+u_pw+"'";
		String sql = "select * from members where id = ? and passwd = ?";
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			
			// conn 생성
			conn = DriverManager.getConnection(url, username, password);
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_id);
			pstmt.setString(2, u_pw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				u_id = rs.getString("id");
				
				session.setAttribute("uManager", u_id);
				
				response.sendRedirect("reponseLogin_seccess.jsp");
			}
			else{
				response.sendRedirect("reponseLogin_failure.jsp");
			}
		} catch(Exception e){
			e.printStackTrace();
			response.sendRedirect("reponseLoginform.jsp");
		} finally{
			try{
				if(pstmt != null) pstmt.close();
				if(rs != null) rs.close();
			} catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
//		if(u_id.equals("tigero456") && u_pw.equals("1qwe2asdzx")){
//			response.sendRedirect("reponseLogin_success.jsp");
//		}
//		else{
//			response.sendRedirect("reponseLogin_failure.jsp");
//		}
	%>

</body>
</html>