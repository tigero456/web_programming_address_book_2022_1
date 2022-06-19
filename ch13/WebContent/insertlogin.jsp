<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>

<% 
	String u_name = request.getParameter("userNAME");
	String u_number = request.getParameter("userNUMBER");
	String u_memo = request.getParameter("userMEMO");
	
	String sql = "INSERT INTO regist(name, number, memo) VALUES";
	sql += "('" + u_name + "','" + u_number + "','" + u_memo + "')";

	Statement sm = conn.createStatement();
	
	int count = sm.executeUpdate(sql);
	if(count == 1){
		response.sendRedirect("reponseLogin_seccess.jsp");
	}else{
		out.println("등록 실패!");
		response.sendRedirect("reponseLogin_seccess.jsp");
	}
	sm.close();
	conn.close();	
%>