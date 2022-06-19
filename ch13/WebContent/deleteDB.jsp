<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>

<% 
	ResultSet rs=null;

	String u_name = request.getParameter("userNAME");
	String u_number = request.getParameter("userNUMBER");

	String sql = "DELETE FROM regist WHERE number=? and name=?";
	PreparedStatement idd=conn.prepareStatement(sql);
	idd.setString(1, u_name);
	idd.setString(2, u_number);

	rs=idd.executeQuery();

	while(rs.next()){
		System.out.println(rs.getString("name"));
	}
	int count = idd.executeUpdate();
	
	if(count == 1){
		response.sendRedirect("deleteErr.jsp");
	}else{
		response.sendRedirect("reponseLogin_seccess.jsp");
	}
	idd.close();
	conn.close();
%>