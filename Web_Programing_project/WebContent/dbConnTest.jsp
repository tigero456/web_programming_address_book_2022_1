<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> JDBC 커넥션 테스트</title>
</head>
<body>
	<%
		//1. 변수 4개 선언
		String driverName="com.mysql.jdbc.Driver";			//com.mysql.jdbc.Driver 클래스를 파라미터로 전달하기 위한 변수 대입
		String url = "jdbc:mysql://localhost:3306/odbo";	//odbo 데이터베이스의 URL 주소를 파라미터로 전달하기 위한 변수 대입
		String username = "root";
		String password = "dbrrns198!@&";
		Connection conn = null;								//커넥션 변수로 사용한 conn 변수를 null 값으로 초기화
		try{
			//2. 드라이버 로딩
			Class.forName(driverName);						//MySQL 드라이버를 메모리에 올리기 위해 13행에서 선언한 변수를 Class.forName()메소드의 파라미터로 사용
			//3. 연동
			conn = DriverManager.getConnection(url, username, password);	//14~16행의 변수를 DriverManager.getConnection() 메소드의 파라미터로 사용해 conn 객체 생성
			//4. 사용
			out.println(">> 연결 성공 : " + conn);
		} catch(ClassNotFoundException e){
			out.println(">> 연결 실패 : 드라이버 복사 필요!");
		} catch(SQLException e){
			out.println(">> 연결 실패 : SQL 명령문 확인 필요!");
		} finally{
			//5. 닫기
			try{
				if(conn != null)
					conn.close();
			} catch(SQLException e){
				;
			}
		}
	%>
</body>
</html>