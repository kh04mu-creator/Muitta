<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인(loginForm)</title>
</head>
<body>
<h1>로그인</h1>
	<form name="loginForm" method="post" action="#">
	<table>
		<tr>
			<td>아이디 : </td>
			<td><input type="text" name="j_username"></td>
		</tr>
		<tr>
			<td>비밀번호 : </td>
			<td><input type="password" name="j_password"></td>
		</tr>
		<tr>
			<td colspan="2">&nbsp;</td>
		</tr>
	</table>
		<button type="submit" onclick="location.href='/loginForm'">로그인</button>
		<button type="button" onclick="location.href='/guest/m_writeForm'">회원가입</button>
	
	</form>		
</body>
</html>