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
		
		if(u_id.equals("tigero456") && u_pw.equals("1qwe2asdzx")){
			response.sendRedirect("reponseLogin_success.jsp");
		}
		else{
			response.sendRedirect("reponseLogin_failure.jsp");
		}
	%>

</body>
</html>