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
	
	if("name".equals(field)){
		String sql=("select name from regist where name like ?");
		PreparedStatement namee=conn.prepareStatement(sql);
		namee.setString(1, "%" + test + "%");
		rs=namee.executeQuery();
		
		while(rs.next()){
			System.out.println(rs.getString("name"));
		}
	}
	else if("number".equals(field)){
		String sql=("select number from regist where number like ?");
		PreparedStatement numberr=conn.prepareStatement(sql);
		numberr.setString(1, "%" + test + "%");
		rs=numberr.executeQuery();
		
		while(rs.next()){
			System.out.println(rs.getString("number"));
		}
	}
	
	%>
	<form action = "search.jsp" method = "post">
		<select name="f">
			<option value="name">이름</option>
			<option value="number">전화번호</option>
		</select>
		<tr>
		<td><input type="text" class="form-control"
			placeholder="검색어 입력" name="searchText" maxlength="100"></td>
		<td><button id="rdoBtn" type="submit" class="btn btn-success">검색</button></td>
	</tr>
	</form>
	
				<form action="reponseLogin_seccess.jsp" method="post" >
					<td><input type="submit" value=" 돌아가기" ></td>
					<tr height="30">
				</form>
	
</body>
</html>