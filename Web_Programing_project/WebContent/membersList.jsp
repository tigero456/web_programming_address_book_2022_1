<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String u_id = request.getParameter("userID");
	String u_pw = request.getParameter("userPW");
	String u_mail = request.getParameter("userMAIL");

	String driverName="com.mysql.jdbc.Driver";			//com.mysql.jdbc.Driver 클래스를 파라미터로 전달하기 위한 변수 대입
	String url = "jdbc:mysql://localhost:3306/odbo";	//odbo 데이터베이스의 URL 주소를 파라미터로 전달하기 위한 변수 대입
	String username = "root";
	String password = "dbrrns198!@&";
	Connection conn = null;								//커넥션 변수로 사용한 conn 변수를 null 값으로 초기화

	Class.forName(driverName);
	conn = DriverManager.getConnection(url, username, password);
	
	Statement sm = conn.createStatement();
	ResultSet rs = sm.executeQuery("select id, email, signuptime from members");
	
	String str = "";
	int count = 1;
	
	while(rs.next()){
		str += count + " : " + rs.getString("id") + " / " + rs.getString("email") + " / " + rs.getString("signuptime") + "<br>";
		count++;
	}
	out.print("Home > 회원 가입 명단 <hr>");
	out.print(str);
	
	rs.close();
	sm.close();
	conn.close();
%>