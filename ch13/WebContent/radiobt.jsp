<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 검색 </title>
</head>
<body>
	<%
	String field = request.getParameter("f");
	String test = request.getParameter("searchText");
	ResultSet rs=null;

	System.out.println(field);
	System.out.println(test);
	
	if("id".equals(field)){
		String sql=("select id from members where id like ?");
		PreparedStatement idd=conn.prepareStatement(sql);
		idd.setString(1, "%" + test + "%");
		rs=idd.executeQuery();
		
		while(rs.next()){
			System.out.println(rs.getString("id"));
		}
	}
	else if("name".equals(field)){
		String sql=("select name from members where name like ?");
		PreparedStatement idd=conn.prepareStatement(sql);
		idd.setString(1, "%" + test + "%");
		rs=idd.executeQuery();
		
		while(rs.next()){
			System.out.println(rs.getString("name"));
		}
	}
	else if("address".equals(field)){
		String sql=("select email from members where email like ?");
		PreparedStatement idd=conn.prepareStatement(sql);
		idd.setString(1, "%" + test + "%");
		rs=idd.executeQuery();
		
		while(rs.next()){
			System.out.println(rs.getString("email"));
		}
	}
	
	%>
	<form action = "radiobt.jsp" method = "post">
		<select name="f">
			<option value="id">아이디</option>
			<option value="name">이름</option>
			<option value="address">주소</option>
		</select>
		<tr>
		<td><input type="text" class="form-control"
			placeholder="검색어 입력" name="searchText" maxlength="100"></td>
		<td><button id="rdoBtn" type="submit" class="btn btn-success">검색</button></td>
	</tr>
	</form>
		
	
</body>
</html>