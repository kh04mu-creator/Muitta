<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 업데이트</title>
</head>
<body>
<form name="member" method="post" action="/memberUpdate">
   <table>
	   	<tr>
	   		<td>아이디</td>
	   		<td>${medit.m_id}</td>
	   	</tr>
	   	<tr>
	   		<td>비밀번호</td>
	   		<td><input type="password" name="m_password" id="m_password"></td>
	   	</tr>
	   	<tr>
	   		<td>비밀번호 확인</td>
	   		<td><input type="password" name="m_password2" id="m_password2"></td>
	   	</tr>
	   	<tr>
	   		<td>이름</td>
	   		<td><input type="text" name="m_name" value="${medit.m_name}" id="m_name"></td>
	   	</tr>
	   	<tr>
	   		<td>성별</td>
	   		<td><input type="radio" name="m_gender" id="m_gender" value="남">남
	   			<input type="radio" name="m_gender" id="m_gender" value="여">여
	   		</td>
	   	</tr>
	   	<tr>
	   		<td>생년월일</td>
	   		<td><input type="number" name="m_birth" value="${medit.m_birth}" id="m_birth"></td>
	   	</tr>
	   	<tr>
	   		<td>이메일</td>
	   		<td><input type="text" name="m_email" value="${medit.m_email}" id="m_email"></td>
	   	</tr>
	   	<tr>
	   		<td>연락처</td>
	   		<td><input type="number" name="m_tel" value="${medit.m_tel}" id="m_tel"></td>
	   	</tr>
   </table>
   
   <input type="submit" value="등록">
   <input type="reset" value="다시 쓰기">
</body>
</html>