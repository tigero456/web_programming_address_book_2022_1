<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file = "dbConn.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title> 연락처 삭제 </title>
	<script type="text/javascript">	
		function checkFun() 
		{
			var f = document.user_info;
			if(f.userNAME.value.length < 2 || f.userNAME.value.length > 16)
			{
				alert("이름");
				f.userNAME.focus();
				return false;
			}
			else if(f.userNUMBER.value.length < 6)
			{
				alert("전화번호");
				f.userNUMBER.focus();
				return false;
			}	
			else return true;
		}		
	</script>
</head>
<body>
<table border="0">
	<tr>
		<td>
		<form action="deleteDB.jsp" name="user_info" 
			method="post" onsubmit="return checkFun()">
			<fieldset style="width:230px">
				<legend> 연락처 삭제 </legend><p>
	
				<table>
				<td>이름   <input type="text"  placeholder="이름 입력" name="userNAME" maxlength="100"></td>
				<tr height="30">
		
				<td>전화번호   <input type="text"  placeholder="전화번호 입력" name="userNUMBER" maxlength="100"></td>
				<tr height="30">
				
				<td><input type="submit" value=" 삭제 "></td>
				<td><input type="submit" value=" 취소 "></td>
			
				</table>
			</fieldset>
		</form>
		</td>
	</tr>
</table>
</body>
</html>