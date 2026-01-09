<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원가입</title>
</head>
<body>

<h3>회원가입</h3>
<form name="member" method="post" action="/memberWrite">
   <table>
	   	<tr>
	   		<td>아이디</td>
	   		<td><input type="text" name="m_id" id="m_id"></td>
	   	</tr>
	   	<tr>
	   		<td>비밀번호</td>
	   		<td><input type="password" name="m_password" id="m_password"></td>
	   	</tr>
	   	<tr>
	   		<td>이름</td>
	   		<td><input type="text" name="m_name" id="m_name"></td>
	   	</tr>
	   	<tr>
	   		<td>성별</td>
	   		<td><input type="radio" name="m_gender" id="m_gender" value="남">남
	   			<input type="radio" name="m_gender" id="m_gender" value="여">여
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>생년월일</td>
	   		<td><input type="text" name="m_birth" id="m_birth"></td>
	   	</tr>
	   	<tr>
	   		<td>이메일</td>
	   		<td><input type="text" name="m_email" id="m_email"></td>
	   	</tr>
	   	<tr>
	   		<td>전화</td>
	   		<td><input type="number" name="m_tel" id="m_tel"></td>
	   	</tr>
	   	<tr>
	   		<td>권한</td>
	   		<td><input type="radio" name="m_auth" id="m_auth" value="ADMIN">관리자
	   			<input type="radio" name="m_auth" id="m_auth" value="USER">회원
	   		</td>
	   	</tr>
   </table>
   
   <input type="submit" value="등록">
   <input type="reset" value="다시 쓰기">
</body>
</html>